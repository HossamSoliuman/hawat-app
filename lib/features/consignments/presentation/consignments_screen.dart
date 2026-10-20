import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/hud_card.dart';
import '../../../core/widgets/ltr_text.dart';
import '../../../core/widgets/states.dart';
import '../data/consignment.dart';
import '../data/consignments_repository.dart';

/// الإرسال للدلال: every consignment, newest first.
class ConsignmentsScreen extends ConsumerWidget {
  const ConsignmentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final state = ref.watch(consignmentsListProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l.consignmentsTitle)),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(consignmentsListProvider.future),
        child: state.when(
          skipLoadingOnReload: true,
          loading: () => const Skeleton(
            child: Padding(padding: EdgeInsets.all(Hud.gutter), child: SkeletonBox(height: 300)),
          ),
          error: (e, _) => ListView(
            children: [ErrorState(error: e, onRetry: () => ref.invalidate(consignmentsListProvider))],
          ),
          data: (page) {
            if (page.isEmpty) {
              return ListView(
                children: [EmptyState(icon: Icons.local_shipping_outlined, title: l.noConsignments)],
              );
            }
            return NotificationListener<ScrollNotification>(
              onNotification: (n) {
                if (n.metrics.extentAfter < 400) ref.read(consignmentsListProvider.notifier).loadMore();
                return false;
              },
              child: ListView(
                padding: const EdgeInsets.all(Hud.gutter),
                children: [
                  HudCard(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                    child: Column(
                      children: [
                        for (var i = 0; i < page.items.length; i++)
                          ConsignmentTile(
                            consignment: page.items[i],
                            last: i == page.items.length - 1,
                            onTap: () => context.push(Routes.consignment(page.items[i].id)),
                          ),
                      ],
                    ),
                  ),
                  LoadMoreFooter(
                    loading: page.loadingMore,
                    error: page.loadMoreError,
                    onRetry: () => ref.read(consignmentsListProvider.notifier).loadMore(),
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

/// A consignment row: the dalal, its number and trip, the kg sent and when.
class ConsignmentTile extends StatelessWidget {
  const ConsignmentTile({super.key, required this.consignment, required this.onTap, this.last = false});

  final Consignment consignment;
  final VoidCallback onTap;
  final bool last;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 11),
        decoration: BoxDecoration(
          border: last ? null : Border(bottom: BorderSide(color: c.hair)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    consignment.dalal?.name ?? '—',
                    style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  LtrText(consignment.consignmentNumber, style: text.bodySmall),
                  if (consignment.trip != null) ...[
                    const SizedBox(height: 2),
                    LtrText(consignment.trip!.tripNumber, style: text.bodySmall),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(l.kg(consignment.totalKg), style: text.labelLarge),
                if (consignment.sentAt != null) ...[
                  const SizedBox(height: 4),
                  Text(l.when(consignment.sentAt!), style: text.bodySmall),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
