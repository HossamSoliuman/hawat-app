import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/nav_requests.dart';
import '../../../app/router.dart';
import '../../../core/auth/session.dart';
import '../../../core/format/format.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/hud_card.dart';
import '../../../core/widgets/ltr_text.dart';
import '../../../core/widgets/section_head.dart';
import '../../../core/widgets/stat_tile.dart';
import '../../../core/widgets/states.dart';
import '../../../core/widgets/step_progress.dart';
import '../../notifications/data/notifications_providers.dart';
import '../../sales/presentation/sale_tile.dart';
import '../../trips/data/trip.dart';
import '../../trips/presentation/trip_actions_ui.dart';
import '../../trips/presentation/trip_ui.dart';
import '../data/dashboard.dart';
import '../data/dashboard_providers.dart';
import 'revenue_chart.dart';

/// الرئيسية: what needs the owner now first, then the numbers. Renders the
/// saved copy at once and refreshes behind it.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final period = ref.watch(homePeriodProvider);
    final provider = dashboardControllerProvider(period);
    final state = ref.watch(provider);
    final data = state.value;

    Future<void> refresh() async {
      ref.invalidate(unreadCountProvider);
      await ref.read(provider.notifier).refresh();
    }

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator(
          onRefresh: refresh,
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: _TopBar()),
              if (data?.refreshError != null)
                SliverToBoxAdapter(
                  child: OfflineBanner(savedAt: data!.savedAt, onRetry: refresh),
                ),
              if (data != null)
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(Hud.gutter, 4, Hud.gutter, Hud.gutter),
                  sliver: SliverList.list(children: _sections(context, data.dashboard, period)),
                )
              else if (state.hasError)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: ErrorState(error: state.error!, onRetry: () => ref.invalidate(provider)),
                )
              else
                const SliverToBoxAdapter(child: _HomeSkeleton()),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _sections(BuildContext context, Dashboard d, DashboardPeriod period) {
    const gap = SizedBox(height: Hud.gap);
    return [
      _NeedsAction(dashboard: d),
      gap,
      _Summary(kpis: d.kpis, period: period),
      gap,
      _Trips(kpis: d.kpis, trips: d.activeTrips),
      gap,
      _Stock(lines: d.stock),
      gap,
      HudCard(
        padding: const EdgeInsets.fromLTRB(14, 8, 14, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHead(title: context.l10n.revenueTitle, icon: Icons.bar_chart),
            const SizedBox(height: 8),
            RevenueChart(points: d.revenueByMonth),
          ],
        ),
      ),
      gap,
      _RecentSales(dashboard: d),
    ];
  }
}

class _TopBar extends ConsumerWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final user = ref.watch(currentUserProvider);
    final unread = ref.watch(unreadCountProvider).value ?? 0;
    final name = Fmt.firstName(user?.name ?? '');
    final greeting = DateTime.now().hour < 12 ? l.greetingMorning(name) : l.greetingEvening(name);

    return Padding(
      padding: const EdgeInsets.fromLTRB(Hud.gutter, 14, Hud.gutter, 12),
      child: Row(
        children: [
          Expanded(
            child: Text(
              greeting,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 21),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 12),
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                tooltip: l.notificationsTitle,
                onPressed: () => context.push(Routes.notifications),
                style: IconButton.styleFrom(
                  backgroundColor: c.panel,
                  side: BorderSide(color: c.border),
                  fixedSize: const Size.square(Hud.minTouch),
                ),
                icon: const Icon(Icons.notifications_outlined, size: 24),
              ),
              if (unread > 0)
                PositionedDirectional(
                  top: -6,
                  end: -6,
                  child: IgnorePointer(
                    child: Container(
                      constraints: const BoxConstraints(minWidth: 22),
                      height: 22,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: c.danger,
                        border: Border.all(color: c.background, width: 2),
                      ),
                      child: Text(
                        unread > 99 ? '99+' : '$unread',
                        style: Theme.of(context).textTheme.labelSmall
                            ?.copyWith(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w800, height: 1),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

/// يحتاج إجراءك: only what has a count — trips to start (each with ابدأ),
/// trips ready to sell, invoices still to collect.
class _NeedsAction extends ConsumerWidget {
  const _NeedsAction({required this.dashboard});

  final Dashboard dashboard;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final items = dashboard.actionItems;
    final scheduled = dashboard.scheduledTrips.take(3).toList();

    return HudCard(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHead(title: l.needsAction, icon: Icons.bolt),
          if (!dashboard.hasPendingActions)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: c.hair)),
              ),
              child: Row(
                children: [
                  const ToneIcon(icon: Icons.task_alt, tone: Tone.success, size: 38, iconSize: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      l.nothingPending,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          if (items.tripsToStart > 0) ...[
            _ActionRow(
              icon: Icons.schedule,
              tone: Tone.primary,
              label: l.actionTripsToStart,
              count: items.tripsToStart,
              onTap: () => openTrips(context, ref, TripStage.scheduled),
            ),
            if (scheduled.isNotEmpty)
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 50, bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (var i = 0; i < scheduled.length; i++) ...[
                      if (i > 0) const SizedBox(height: 8),
                      _ScheduledTripRow(trip: scheduled[i]),
                    ],
                  ],
                ),
              ),
          ],
          if (items.tripsToSell > 0)
            _ActionRow(
              icon: Icons.storefront_outlined,
              tone: Tone.success,
              label: l.actionTripsToSell,
              count: items.tripsToSell,
              onTap: () => openTrips(context, ref, TripStage.forSale),
            ),
          if (items.unpaidSales > 0)
            _ActionRow(
              icon: Icons.request_quote_outlined,
              tone: Tone.warning,
              label: l.actionUnpaid,
              count: items.unpaidSales,
              amount: l.sar(items.unpaidTotal),
              onTap: () => openSales(context, ref, unpaidOnly: true),
            ),
        ],
      ),
    );
  }
}

/// One task: what it is (and how much, for money) at the start, how many at the end.
class _ActionRow extends StatelessWidget {
  const _ActionRow({
    required this.icon,
    required this.tone,
    required this.label,
    required this.count,
    required this.onTap,
    this.amount,
  });

  final IconData icon;
  final Tone tone;
  final String label;
  final int count;
  final String? amount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final color = c.tone(tone);
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 62),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: c.hair)),
        ),
        child: Row(
          children: [
            ToneIcon(icon: icon, tone: tone, size: 38, iconSize: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(label, style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w700)),
                  if (amount != null)
                    Text(amount!, style: text.labelLarge?.copyWith(color: c.toneText(tone), height: 1.4)),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
              constraints: const BoxConstraints(minWidth: 32),
              height: 28,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: color.withValues(alpha: .12),
                border: Border.all(color: color.withValues(alpha: .45)),
              ),
              child: LtrText(
                Fmt.count(count),
                style: text.labelLarge?.copyWith(color: c.toneText(tone), fontWeight: FontWeight.w800, height: 1),
              ),
            ),
            const SizedBox(width: 2),
            Icon(Icons.chevron_right, color: c.muted, size: 22),
          ],
        ),
      ),
    );
  }
}

/// A trip waiting to sail, under its row: boat, then captain and time, and ابدأ.
class _ScheduledTripRow extends ConsumerWidget {
  const _ScheduledTripRow({required this.trip});

  final Trip trip;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final details = [
      trip.captain?.name,
      if (trip.departureTime != null) l.when(trip.departureTime!),
    ].whereType<String>().where((s) => s.isNotEmpty).join(' · ');

    return Material(
      color: c.mutedSurface.withValues(alpha: c.isDark ? .6 : .75),
      shape: BorderDirectional(start: BorderSide(color: c.primary, width: 2)),
      child: InkWell(
        onTap: () => context.push(Routes.trip(trip.id)),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 8, 8),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trip.boat?.name ?? Fmt.ltr(trip.tripNumber),
                      style: text.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      details.isEmpty ? Fmt.ltr(trip.tripNumber) : details,
                      style: text.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              FilledButton.icon(
                onPressed: () => startTripFlow(context, ref, trip),
                style: FilledButton.styleFrom(
                  minimumSize: const Size(80, 40),
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 14, 0),
                ),
                icon: const Icon(Icons.play_arrow_rounded, size: 20),
                label: Text(l.startShort),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The period's money and catch: revenue large, catch and the fleet beside it.
/// The period switch sits on the revenue label it changes.
class _Summary extends StatelessWidget {
  const _Summary({required this.kpis, required this.period});

  final DashboardKpis kpis;
  final DashboardPeriod period;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final rule = c.edgeOf(Tone.primary).withValues(alpha: .35);
    final revenueLabel = switch (period) {
      DashboardPeriod.today => l.statRevenueToday,
      DashboardPeriod.month => l.statRevenueMonth,
      DashboardPeriod.year => l.statRevenueYear,
    };
    final catchLabel = switch (period) {
      DashboardPeriod.today => l.statCatchToday,
      DashboardPeriod.month => l.statCatchMonth,
      DashboardPeriod.year => l.statCatchYear,
    };

    return HudCard(
      color: c.washOf(Tone.primary),
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  revenueLabel,
                  style: text.titleSmall?.copyWith(color: c.muted),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 10),
              _PeriodSwitch(period: period),
            ],
          ),
          const SizedBox(height: 12),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: AlignmentDirectional.centerStart,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                LtrText(Fmt.money(kpis.revenue), style: text.displaySmall?.copyWith(fontSize: 34, height: 1.1)),
                const SizedBox(width: 8),
                Text(l.currencySar, style: text.titleMedium?.copyWith(color: c.muted)),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Divider(color: rule),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: _MiniStat(
                    icon: Icons.set_meal_outlined,
                    label: catchLabel,
                    value: Fmt.kg(kpis.catchKg),
                    unit: l.unitKg,
                  ),
                ),
                VerticalDivider(width: 29, indent: 12, endIndent: 12, color: rule),
                Expanded(
                  child: _MiniStat(
                    icon: Icons.directions_boat_outlined,
                    label: l.statActiveBoats,
                    value: '${kpis.activeBoats} / ${kpis.boats}',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  const _MiniStat({required this.icon, required this.label, required this.value, this.unit});

  final IconData icon;
  final String label;
  final String value;
  final String? unit;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: c.muted),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  label,
                  style: text.labelMedium?.copyWith(color: c.muted),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: AlignmentDirectional.centerStart,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                LtrText(value, style: text.titleLarge?.copyWith(fontSize: 20, height: 1.15)),
                if (unit != null) ...[
                  const SizedBox(width: 5),
                  Text(unit!, style: text.labelMedium?.copyWith(color: c.muted)),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PeriodSwitch extends ConsumerWidget {
  const _PeriodSwitch({required this.period});

  final DashboardPeriod period;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final labels = {
      DashboardPeriod.today: l.periodToday,
      DashboardPeriod.month: l.periodMonth,
      DashboardPeriod.year: l.periodYear,
    };

    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: c.panel,
        border: Border.all(color: c.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final entry in labels.entries)
            Semantics(
              selected: entry.key == period,
              button: true,
              child: InkWell(
                onTap: () => ref.read(homePeriodProvider.notifier).select(entry.key),
                child: AnimatedContainer(
                  duration: Hud.fast,
                  constraints: const BoxConstraints(minHeight: 34, minWidth: 50),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  color: entry.key == period ? c.primary : Colors.transparent,
                  child: Text(
                    entry.value,
                    style: text.labelMedium?.copyWith(
                      color: entry.key == period ? c.onPrimary : c.muted,
                      fontWeight: entry.key == period ? FontWeight.w700 : FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// مسار الرحلات: the four counted stages, then the trips under way with
/// what each one waits for.
class _Trips extends ConsumerWidget {
  const _Trips({required this.kpis, required this.trips});

  final DashboardKpis kpis;
  final List<Trip> trips;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final shown = trips.take(3).toList();

    return HudCard(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHead(
            title: l.pipelineTitle,
            icon: Icons.route_outlined,
            action: shown.isEmpty ? null : l.viewAll,
            onAction: () => openTrips(context, ref, TripStage.inProgress),
          ),
          const SizedBox(height: 6),
          _Pipeline(kpis: kpis),
          const SizedBox(height: 12),
          if (shown.isEmpty)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: c.hair)),
              ),
              child: Row(
                children: [
                  Icon(Icons.sailing_outlined, color: c.muted, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      l.noActiveTrips,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: c.muted),
                    ),
                  ),
                ],
              ),
            ),
          for (final trip in shown) _ActiveTripRow(trip: trip),
        ],
      ),
    );
  }
}

/// Four counted stages; each opens the trips list on its tab. An empty stage fades.
class _Pipeline extends ConsumerWidget {
  const _Pipeline({required this.kpis});

  final DashboardKpis kpis;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final stages = [
      (l.pipeScheduled, kpis.tripsScheduled, Tone.primary, TripStage.scheduled),
      (l.pipeAtSea, kpis.tripsAtSea, Tone.info, TripStage.inProgress),
      (l.pipeCounting, kpis.tripsAwaitingCount, Tone.warning, TripStage.inProgress),
      (l.pipeForSale, kpis.tripsForSale, Tone.success, TripStage.forSale),
    ];

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final (i, (label, count, tone, stage)) in stages.indexed) ...[
            if (i > 0) const SizedBox(width: 6),
            Expanded(
              child: Material(
                color: count > 0 ? c.tone(tone).withValues(alpha: .09) : c.mutedSurface.withValues(alpha: .45),
                shape: Border(top: BorderSide(color: count > 0 ? c.tone(tone) : c.border, width: 3)),
                child: InkWell(
                  onTap: () => openTrips(context, ref, stage),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4, 10, 4, 10),
                    child: Column(
                      children: [
                        LtrText(
                          Fmt.count(count),
                          style: text.headlineSmall?.copyWith(color: count > 0 ? c.foreground : c.muted),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          label,
                          style: text.labelSmall?.copyWith(color: count > 0 ? c.toneText(tone) : c.muted),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// A trip under way: boat and phase, captain and number, its five-step bar
/// in the phase's tone, then the next move (log the catch) or what it waits for.
class _ActiveTripRow extends StatelessWidget {
  const _ActiveTripRow({required this.trip});

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final phase = trip.phase;
    final details = [
      trip.captain?.name,
      Fmt.ltr(trip.tripNumber),
    ].whereType<String>().where((s) => s.isNotEmpty).join(' · ');

    final (String, IconData)? hint = switch (phase) {
      TripPhase.forSale when trip.captainInputKg != null || trip.actualWeightKg != null => (
        '${l.countedLabel} ${l.kg(trip.actualWeightKg ?? trip.captainInputKg!)}',
        Icons.check_circle_outline,
      ),
      TripPhase.awaitingCounter => (
        trip.countingPort == null ? l.waitingCounter : l.waitingCounterAt(trip.countingPort!),
        Icons.hourglass_top_rounded,
      ),
      TripPhase.counting => (l.countingNow, Icons.scale_outlined),
      _ => null,
    };

    return InkWell(
      onTap: () => context.push(Routes.trip(trip.id)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: c.hair)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        trip.boat?.name ?? '—',
                        style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(details, style: text.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: TripPhaseChip(trip: trip, dense: true),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SegmentProgress(current: phase.step, allDone: phase.isFinished, tone: c.tone(phase.tone)),
            if (phase == TripPhase.atSea) ...[
              const SizedBox(height: 10),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: OutlinedButton.icon(
                  onPressed: () => context.push(Routes.submitCatch(trip.id)),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(0, 40),
                    foregroundColor: c.toneText(Tone.primary),
                    side: BorderSide(color: c.primary),
                  ),
                  icon: const Icon(Icons.scale_outlined, size: 18),
                  label: Text(l.quickSubmitCatch),
                ),
              ),
            ] else if (hint != null) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(hint.$2, size: 16, color: c.toneText(phase.tone)),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      hint.$1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: text.labelMedium?.copyWith(color: c.toneText(phase.tone)),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// الأسماك المتوفرة: one line per species, its kg on a bar against the largest.
class _Stock extends StatelessWidget {
  const _Stock({required this.lines});

  final List<StockLine> lines;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final shown = [...lines]..sort((a, b) => b.weightKg.compareTo(a.weightKg));
    final top = shown.take(5).toList();
    final max = top.isEmpty ? 1.0 : top.first.weightKg;

    return HudCard(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHead(
            title: l.stockTitle,
            icon: Icons.set_meal_outlined,
            action: top.isEmpty ? null : l.viewAll,
            onAction: () => context.push(Routes.stock),
          ),
          if (top.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(l.noStock, style: text.bodyMedium?.copyWith(color: c.muted)),
            ),
          for (final line in top)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      line.species ?? '—',
                      style: text.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 4,
                    child: LayoutBuilder(
                      builder: (context, constraints) => Container(
                        height: 8,
                        color: c.mutedSurface,
                        alignment: AlignmentDirectional.centerStart,
                        child: Container(
                          width: constraints.maxWidth * (max <= 0 ? 0 : (line.weightKg / max).clamp(.02, 1)),
                          color: c.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 92,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(l.kg(line.weightKg), style: text.labelLarge),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _RecentSales extends ConsumerWidget {
  const _RecentSales({required this.dashboard});

  final Dashboard dashboard;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final sales = dashboard.recentSales.take(5).toList();
    return HudCard(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHead(
            title: l.recentSalesTitle,
            icon: Icons.receipt_long_outlined,
            action: sales.isEmpty ? null : l.viewAll,
            onAction: () => openSales(context, ref),
          ),
          if (sales.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Text(l.noSalesYet, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: c.muted)),
            ),
          for (var i = 0; i < sales.length; i++)
            SaleTile(sale: sales[i], last: i == sales.length - 1, onTap: () => context.push(Routes.sale(sales[i].id))),
        ],
      ),
    );
  }
}

class _HomeSkeleton extends StatelessWidget {
  const _HomeSkeleton();

  @override
  Widget build(BuildContext context) => const Skeleton(
    child: Padding(
      padding: EdgeInsets.fromLTRB(Hud.gutter, 4, Hud.gutter, Hud.gutter),
      child: Column(
        children: [
          SkeletonBox(height: 150),
          SizedBox(height: Hud.gap),
          SkeletonBox(height: 180),
          SizedBox(height: Hud.gap),
          SkeletonBox(height: 260),
          SizedBox(height: Hud.gap),
          SkeletonBox(height: 170),
        ],
      ),
    ),
  );
}
