import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/actions.dart';
import '../../../core/widgets/ltr_text.dart';
import '../../../core/widgets/stat_tile.dart';
import '../../../core/widgets/status_chip.dart';
import '../../contacts/presentation/contacts_screens.dart';
import '../../home/data/dashboard_providers.dart';
import '../data/trip.dart';
import '../data/trips_repository.dart';
import 'trip_actions_ui.dart';
import 'trip_ui.dart';

/// The center + of the bottom bar: the day's trip and selling actions, one tap from anywhere.
Future<void> showQuickActions(BuildContext context, WidgetRef ref) {
  return showModalBottomSheet<void>(context: context, builder: (_) => const _QuickActionsSheet());
}

class _QuickActionsSheet extends ConsumerStatefulWidget {
  const _QuickActionsSheet();

  @override
  ConsumerState<_QuickActionsSheet> createState() => _QuickActionsSheetState();
}

class _QuickActionsSheetState extends ConsumerState<_QuickActionsSheet> {
  String? _loading;

  /// Counts from the home as last loaded; the list itself is read fresh on tap.
  ({int scheduled, int atSea, int forSale}) _counts() {
    final dashboard = ref.read(dashboardControllerProvider(ref.read(homePeriodProvider))).value?.dashboard;
    return (
      scheduled: dashboard?.kpis.tripsScheduled ?? 0,
      atSea: dashboard?.kpis.tripsAtSea ?? 0,
      forSale: dashboard?.actionItems.tripsToSell ?? 0,
    );
  }

  Future<void> _pickAndRun({
    required String id,
    required TripStage stage,
    required bool Function(Trip) where,
    required String none,
    required Future<void> Function(Trip) run,
  }) async {
    final l = context.l10n;
    setState(() => _loading = id);
    List<Trip> trips;
    try {
      trips = (await ref.read(tripsRepositoryProvider).list(stage: stage)).items.where(where).toList();
    } on ApiException catch (e) {
      if (mounted) {
        setState(() => _loading = null);
        showSnack(context, e.userMessage(l), error: true);
      }
      return;
    }
    if (!mounted) return;
    setState(() => _loading = null);
    if (trips.isEmpty) {
      showSnack(context, none);
      return;
    }
    final trip = trips.length == 1 ? trips.first : await _pickTrip(trips);
    if (trip == null || !mounted) return;
    Navigator.of(context).pop();
    await run(trip);
  }

  Future<Trip?> _pickTrip(List<Trip> trips) => showModalBottomSheet<Trip>(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      final l = context.l10n;
      final c = HawatColors.of(context);
      final text = Theme.of(context).textTheme;
      return SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * .75),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(Hud.gutter, 0, Hud.gutter, 8),
                child: Text(l.pickTripTitle, style: text.titleMedium),
              ),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (final trip in trips)
                      InkWell(
                        onTap: () => Navigator.of(context).pop(trip),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: Hud.gutter, vertical: 12),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: c.hair)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      boatAndCaptain(trip),
                                      style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(height: 2),
                                    LtrText(trip.tripNumber, style: text.bodySmall),
                                  ],
                                ),
                              ),
                              TripPhaseChip(trip: trip, dense: true),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final counts = _counts();
    final router = GoRouter.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _QuickRow(
              icon: Icons.add_road,
              label: l.quickNewTrip,
              onTap: () {
                Navigator.of(context).pop();
                router.push(Routes.newTrip);
              },
            ),
            _QuickRow(
              icon: Icons.play_arrow_outlined,
              label: l.quickStartTrip,
              count: counts.scheduled,
              loading: _loading == 'start',
              onTap: () => _pickAndRun(
                id: 'start',
                stage: TripStage.scheduled,
                where: (t) => t.canStart,
                none: l.quickNoScheduled,
                run: (trip) async {
                  final rootContext = rootNavigatorKey.currentContext;
                  if (rootContext != null) await startTripFlow(rootContext, ref, trip);
                },
              ),
            ),
            _QuickRow(
              icon: Icons.scale_outlined,
              label: l.quickSubmitCatch,
              count: counts.atSea,
              loading: _loading == 'catch',
              onTap: () => _pickAndRun(
                id: 'catch',
                stage: TripStage.inProgress,
                where: (t) => t.canSubmitCatch,
                none: l.quickNoAtSea,
                run: (trip) async => router.push(Routes.submitCatch(trip.id)),
              ),
            ),
            _QuickRow(
              icon: Icons.point_of_sale_outlined,
              label: l.quickSell,
              count: counts.forSale,
              loading: _loading == 'sell',
              onTap: () => _pickAndRun(
                id: 'sell',
                stage: TripStage.forSale,
                where: (t) => t.canSell,
                none: l.noTripsForSale,
                run: (trip) async => router.push(Routes.newSale(trip.id)),
              ),
            ),
            _QuickRow(
              icon: Icons.local_shipping_outlined,
              label: l.quickConsign,
              loading: _loading == 'consign',
              onTap: () => _pickAndRun(
                id: 'consign',
                stage: TripStage.forSale,
                where: (t) => t.canSell,
                none: l.noTripsForSale,
                run: (trip) async => router.push(Routes.newConsignment(trip.id)),
              ),
            ),
            _QuickRow(
              icon: Icons.person_add_alt_outlined,
              label: l.newCustomer,
              onTap: () {
                Navigator.of(context).pop();
                router.push(Routes.newContact(ContactKind.customer));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickRow extends StatelessWidget {
  const _QuickRow({required this.icon, required this.label, required this.onTap, this.count, this.loading = false});

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final int? count;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    return InkWell(
      onTap: loading ? null : onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 60),
        padding: const EdgeInsets.symmetric(horizontal: Hud.gutter, vertical: 10),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: c.hair)),
        ),
        child: Row(
          children: [
            ToneIcon(icon: icon, size: 36, iconSize: 20),
            const SizedBox(width: 14),
            Expanded(
              child: Text(label, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700)),
            ),
            if (loading)
              const SizedBox.square(dimension: 20, child: CircularProgressIndicator(strokeWidth: 2))
            else ...[
              if (count != null && count! > 0) ...[CountBadge(count: count!), const SizedBox(width: 10)],
              Icon(Icons.chevron_right, color: c.muted),
            ],
          ],
        ),
      ),
    );
  }
}
