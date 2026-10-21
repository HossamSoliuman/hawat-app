import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/l10n.dart';
import '../core/theme/tokens.dart';
import '../features/home/data/dashboard_providers.dart';
import '../features/notifications/data/notifications_providers.dart';
import '../features/trips/presentation/quick_actions.dart';

/// The bottom bar: الرئيسية · الرحلات · + · المبيعات · المزيد. The round +
/// in the middle opens the quick actions, one tap from anywhere.
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
      bottomNavigationBar: Stack(
        children: [
          Positioned.fill(
            top: _BarShape.lift,
            child: CustomPaint(
              painter: _BarShape(fill: c.panel, edge: c.border),
            ),
          ),
          SafeArea(
            top: false,
            child: SizedBox(
              height: _BarShape.lift + _BarShape.height,
              child: Stack(
                children: [
                  Positioned.fill(
                    top: _BarShape.lift,
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
                        const Spacer(),
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
                  Align(
                    alignment: Alignment.topCenter,
                    child: Semantics(
                      button: true,
                      label: l.navAdd,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color.lerp(c.primary, Colors.white, .12)!, c.primary],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: c.primary.withValues(alpha: c.isDark ? .45 : .30),
                              blurRadius: 18,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Material(
                          type: MaterialType.transparency,
                          shape: const CircleBorder(),
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () => showQuickActions(context, ref),
                            child: SizedBox.square(
                              dimension: _BarShape.fab,
                              child: Icon(Icons.add_rounded, color: c.onPrimary, size: 32),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// The bar: rounded top corners and a round notch cut around the + button,
/// which rises [lift] above the bar's edge.
class _BarShape extends CustomPainter {
  const _BarShape({required this.fill, required this.edge});

  static const lift = 10.0;
  static const height = 68.0;
  static const fab = 58.0;
  static const _ring = 6.0;

  final Color fill;
  final Color edge;

  @override
  void paint(Canvas canvas, Size size) {
    // One pixel past the sides and the bottom, so only the top edge is outlined.
    final bar = Path()
      ..addRRect(
        RRect.fromLTRBAndCorners(
          -1,
          0,
          size.width + 1,
          size.height + 1,
          topLeft: const Radius.circular(22),
          topRight: const Radius.circular(22),
        ),
      );
    final notch = Path()
      ..addOval(Rect.fromCircle(center: Offset(size.width / 2, fab / 2 - lift), radius: fab / 2 + _ring));
    final shape = Path.combine(PathOperation.difference, bar, notch);
    canvas
      ..drawPath(shape, Paint()..color = fill)
      ..drawPath(
        shape,
        Paint()
          ..color = edge
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1,
      );
  }

  @override
  bool shouldRepaint(_BarShape oldDelegate) => oldDelegate.fill != fill || oldDelegate.edge != edge;
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
    final color = selected ? c.toneText(Tone.primary) : c.muted;
    return Expanded(
      child: Semantics(
        selected: selected,
        button: true,
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              AnimatedContainer(
                duration: Hud.fast,
                width: 30,
                height: 3,
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: selected ? c.primary : Colors.transparent,
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(3)),
                ),
              ),
              Icon(selected ? activeIcon : icon, color: color, size: 25),
              const SizedBox(height: 4),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelMedium
                    ?.copyWith(color: color, fontWeight: selected ? FontWeight.w800 : FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
