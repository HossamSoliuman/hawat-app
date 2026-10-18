import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/l10n.dart';
import '../core/theme/tokens.dart';
import '../features/home/data/dashboard_providers.dart';
import '../features/notifications/data/notifications_providers.dart';
import '../features/trips/presentation/quick_actions.dart';

/// The bottom bar: الرئيسية · الرحلات · + · المبيعات · المزيد. The center +
/// opens the quick actions, one tap from anywhere.
class AppShell extends ConsumerStatefulWidget {
  const AppShell({super.key, required this.shell});

  final StatefulNavigationShell shell;

  @override
  ConsumerState<AppShell> createState() => _AppShellState();
}

class _AppShellState extends ConsumerState<AppShell> {
  late final AppLifecycleListener _lifecycle;

  @override
  void initState() {
    super.initState();
    // Push is not live yet, so coming back to the app refreshes what may have
    // changed meanwhile (a count finished, a notification arrived).
    _lifecycle = AppLifecycleListener(onResume: _onResume);
  }

  void _onResume() {
    ref.invalidate(unreadCountProvider);
    refreshHomeFromWidget(ref);
  }

  @override
  void dispose() {
    _lifecycle.dispose();
    super.dispose();
  }

  void _goBranch(int index) {
    HapticFeedback.selectionClick();
    widget.shell.goBranch(index, initialLocation: index == widget.shell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final index = widget.shell.currentIndex;

    return Scaffold(
      body: widget.shell,
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          color: c.panel,
          border: Border(top: BorderSide(color: c.hair)),
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 64,
            child: Row(
              children: [
                _NavItem(
                  icon: Icons.space_dashboard_outlined,
                  activeIcon: Icons.space_dashboard,
                  label: l.navHome,
                  selected: index == 0,
                  onTap: () => _goBranch(0),
                ),
                _NavItem(
                  icon: Icons.sailing_outlined,
                  activeIcon: Icons.sailing,
                  label: l.navTrips,
                  selected: index == 1,
                  onTap: () => _goBranch(1),
                ),
                Expanded(
                  child: Center(
                    child: Semantics(
                      button: true,
                      label: l.navAdd,
                      child: Material(
                        color: c.primary,
                        child: InkWell(
                          onTap: () => showQuickActions(context, ref),
                          child: SizedBox.square(dimension: 48, child: Icon(Icons.add, color: c.onPrimary, size: 28)),
                        ),
                      ),
                    ),
                  ),
                ),
                _NavItem(
                  icon: Icons.receipt_long_outlined,
                  activeIcon: Icons.receipt_long,
                  label: l.navSales,
                  selected: index == 2,
                  onTap: () => _goBranch(2),
                ),
                _NavItem(
                  icon: Icons.grid_view_outlined,
                  activeIcon: Icons.grid_view_rounded,
                  label: l.navMore,
                  selected: index == 3,
                  onTap: () => _goBranch(3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    final color = selected ? c.primary : c.muted;
    return Expanded(
      child: Semantics(
        selected: selected,
        button: true,
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: Hud.fast,
                width: 22,
                height: 2,
                margin: const EdgeInsets.only(bottom: 6),
                color: selected ? c.primary : Colors.transparent,
              ),
              Icon(selected ? activeIcon : icon, color: color, size: 23),
              const SizedBox(height: 3),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelSmall
                    ?.copyWith(color: color, fontWeight: selected ? FontWeight.w700 : FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
