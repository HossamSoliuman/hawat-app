import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/format/format.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/actions.dart';
import '../../../core/widgets/states.dart';
import '../data/app_notification.dart';
import '../data/notifications_providers.dart';

/// الإشعارات: new ones first, then the earlier ones. A tap marks it read and
/// opens what it is about (a trip or an invoice); others stay on the list.
class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final state = ref.watch(notificationsListProvider);
    final hasUnread = state.value?.unread.isNotEmpty ?? false;

    return Scaffold(
      appBar: AppBar(
        title: Text(l.notificationsTitle),
        actions: [
          if (hasUnread)
            TextButton(
              onPressed: () async {
                try {
                  await ref.read(notificationsListProvider.notifier).markAllRead();
                } on ApiException catch (e) {
                  if (context.mounted) showSnack(context, e.userMessage(l), error: true);
                }
              },
              child: Text(l.markAllRead),
            ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(notificationsListProvider.future),
        child: state.when(
          skipLoadingOnReload: true,
          loading: () => const Skeleton(child: Padding(padding: EdgeInsets.all(Hud.gutter), child: SkeletonBox(height: 300))),
          error: (e, _) => ListView(children: [ErrorState(error: e, onRetry: () => ref.invalidate(notificationsListProvider))]),
          data: (data) {
            if (data.unread.isEmpty && data.earlier.isEmpty) {
              return ListView(children: [EmptyState(icon: Icons.notifications_none, title: l.noNotifications)]);
            }
            return NotificationListener<ScrollNotification>(
              onNotification: (n) {
                if (n.metrics.extentAfter < 400) ref.read(notificationsListProvider.notifier).loadMore();
                return false;
              },
              child: ListView(
                children: [
                  if (data.unread.isNotEmpty) ...[
                    _SectionLabel(label: l.unreadSection),
                    for (final n in data.unread) _NotificationTile(notification: n),
                  ],
                  if (data.earlier.items.isNotEmpty) ...[
                    _SectionLabel(label: l.earlierSection),
                    for (final n in data.earlier.items) _NotificationTile(notification: n),
                  ],
                  LoadMoreFooter(
                    loading: data.earlier.loadingMore,
                    error: data.earlier.loadMoreError,
                    onRetry: () => ref.read(notificationsListProvider.notifier).loadMore(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(Hud.gutter, 16, Hud.gutter, 8),
    child: Text(label, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: HawatColors.of(context).muted)),
  );
}

class _NotificationTile extends ConsumerWidget {
  const _NotificationTile({required this.notification});

  final AppNotification notification;

  /// Where a notification leads. Targets of screens this version doesn't have
  /// (stock, dalals, partnerships, dalal invoices) stay on the list.
  String? _route() {
    if (notification.tripId != null) return Routes.trip(notification.tripId!);
    if (notification.target == 'sale' && notification.saleId != null) return Routes.sale(notification.saleId!);
    return null;
  }

  IconData _icon() => switch (notification.type?.name) {
    'اكتمل العد' => Icons.fact_check_outlined,
    'الرحلة قيد التنفيذ' => Icons.sailing_outlined,
    'تم إلغاء الرحلة' => Icons.cancel_outlined,
    'تم إرسال المخرجات' => Icons.scale_outlined,
    'بيع من مصيدك' => Icons.receipt_long_outlined,
    'دفعة من الدلال' => Icons.payments_outlined,
    _ => Icons.notifications_outlined,
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final unread = !notification.read;
    final route = _route();

    return Material(
      color: unread ? Color.alphaBlend(c.primary.withValues(alpha: .06), c.panel) : c.panel,
      child: InkWell(
        onTap: () {
          ref.read(notificationsListProvider.notifier).markRead(notification);
          if (route != null) context.push(route);
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(Hud.gutter, 12, Hud.gutter, 12),
          decoration: BoxDecoration(
            border: BorderDirectional(
              bottom: BorderSide(color: c.hair),
              start: BorderSide(color: unread ? c.primary : Colors.transparent, width: 3),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(_icon(), size: 22, color: unread ? c.primary : c.muted),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            Fmt.isolateCodes(notification.title),
                            style: text.bodyLarge?.copyWith(fontWeight: unread ? FontWeight.w700 : FontWeight.w600),
                          ),
                        ),
                        if (notification.createdAt != null)
                          Text(l.when(notification.createdAt!), style: text.labelSmall?.copyWith(color: c.muted)),
                      ],
                    ),
                    if (notification.body.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(Fmt.isolateCodes(notification.body), style: text.bodyMedium?.copyWith(color: c.muted, height: 1.5)),
                    ],
                  ],
                ),
              ),
              if (route != null) ...[const SizedBox(width: 6), Icon(Icons.chevron_right, color: c.muted, size: 20)],
            ],
          ),
        ),
      ),
    );
  }
}
