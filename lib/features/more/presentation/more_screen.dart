import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/auth/session.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/avatar.dart';
import '../../../core/widgets/hud_card.dart';
import '../../../core/widgets/section_head.dart';
import '../../notifications/data/notifications_providers.dart';
import 'account_actions.dart';

/// المزيد: section headings with rows, no captions. Each phase adds its
/// tiles here as they ship (fleet and the other contacts come with M4).
class MoreScreen extends ConsumerWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final user = ref.watch(currentUserProvider);
    final unread = ref.watch(unreadCountProvider).value ?? 0;

    return Scaffold(
      appBar: AppBar(title: Text(l.moreTitle)),
      body: ListView(
        padding: const EdgeInsets.all(Hud.gutter),
        children: [
          if (user != null)
            HudCard(
              onTap: () => context.push(Routes.profile),
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  HudAvatar(name: user.name, url: user.avatarUrl, size: 48),
                  const SizedBox(width: 14),
                  Expanded(child: Text(user.name, style: text.titleMedium)),
                  Icon(Icons.chevron_right, color: c.muted),
                ],
              ),
            ),
          const SizedBox(height: Hud.gap),
          SectionHead(title: l.groupStockCatch, icon: Icons.set_meal_outlined),
          const SizedBox(height: 8),
          HudCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                MenuRow(
                  icon: Icons.inventory_2_outlined,
                  label: l.stockScreenTitle,
                  onTap: () => context.push(Routes.stock),
                ),
                MenuRow(
                  icon: Icons.swap_vert,
                  label: l.movementsTitle,
                  onTap: () => context.push(Routes.stockMovements()),
                ),
                MenuRow(
                  icon: Icons.list_alt_outlined,
                  label: l.catchLogTitle,
                  onTap: () => context.push(Routes.catchLog),
                ),
                MenuRow(
                  icon: Icons.local_shipping_outlined,
                  label: l.consignmentsTitle,
                  onTap: () => context.push(Routes.consignments),
                ),
              ],
            ),
          ),
          const SizedBox(height: Hud.gap),
          SectionHead(title: l.groupContacts, icon: Icons.groups_outlined),
          const SizedBox(height: 8),
          HudCard(
            padding: EdgeInsets.zero,
            child: MenuRow(
              icon: Icons.storefront_outlined,
              label: l.dalalsTitle,
              onTap: () => context.push(Routes.dalals),
            ),
          ),
          const SizedBox(height: Hud.gap),
          SectionHead(title: l.groupAccount, icon: Icons.person_outline),
          const SizedBox(height: 8),
          AccountActions(
            leading: [
              MenuRow(icon: Icons.person_outline, label: l.profileTitle, onTap: () => context.push(Routes.profile)),
              MenuRow(
                icon: Icons.notifications_outlined,
                label: l.notificationsTitle,
                onTap: () => context.push(Routes.notifications),
                trailing: unread > 0
                    ? Container(
                        margin: const EdgeInsetsDirectional.only(end: 6),
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        color: c.danger,
                        child: Text('$unread', style: text.labelSmall?.copyWith(color: Colors.white)),
                      )
                    : null,
              ),
            ],
          ),
          const SizedBox(height: Hud.gutter),
          Center(child: AppVersionLabel(style: text.bodySmall)),
        ],
      ),
    );
  }
}
