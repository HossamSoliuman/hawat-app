import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/auth/session.dart';
import '../../../core/format/format.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/avatar.dart';
import '../../../core/widgets/hud_card.dart';
import '../../../core/widgets/ltr_text.dart';
import '../../../core/widgets/section_head.dart';
import '../../../core/widgets/stat_tile.dart';
import '../../../core/widgets/states.dart';
import '../../../core/widgets/status_chip.dart';
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
                SliverToBoxAdapter(child: OfflineBanner(savedAt: data!.savedAt, onRetry: refresh)),
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
      _Indicators(dashboard: d, period: period),
      gap,
      _Pipeline(kpis: d.kpis),
      gap,
      _ActiveTrips(trips: d.activeTrips),
      gap,
      _Stock(lines: d.stock),
      gap,
      HudCard(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
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
      padding: const EdgeInsets.fromLTRB(Hud.gutter, 10, 8, 10),
      child: Row(
        children: [
          InkWell(
            onTap: () => context.push(Routes.profile),
            child: HudAvatar(name: user?.name ?? '', url: user?.avatarUrl, size: 42),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              greeting,
              style: Theme.of(context).textTheme.titleLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            tooltip: l.notificationsTitle,
            onPressed: () => context.push(Routes.notifications),
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.notifications_outlined, size: 26),
                if (unread > 0)
                  PositionedDirectional(
                    top: -6,
                    end: -8,
                    child: Container(
                      constraints: const BoxConstraints(minWidth: 18),
                      height: 18,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      alignment: Alignment.center,
                      color: c.danger,
                      child: Text(
                        unread > 99 ? '99+' : '$unread',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.white, fontSize: 10.5, height: 1),
                      ),
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
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHead(title: l.needsAction, icon: Icons.bolt),
          if (!dashboard.hasPendingActions)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Row(
                children: [
                  Icon(Icons.task_alt, color: c.success, size: 22),
                  const SizedBox(width: 10),
                  Text(l.nothingPending, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          if (items.tripsToStart > 0) ...[
            _ActionRow(
              icon: Icons.schedule,
              tone: Tone.primary,
              label: l.actionTripsToStart,
              count: items.tripsToStart,
              onTap: () => context.go(Routes.tripsAt(TripStage.scheduled)),
            ),
            for (final trip in scheduled) _ScheduledTripRow(trip: trip),
          ],
          if (items.tripsToSell > 0)
            _ActionRow(
              icon: Icons.storefront_outlined,
              tone: Tone.success,
              label: l.actionTripsToSell,
              count: items.tripsToSell,
              onTap: () => context.go(Routes.tripsAt(TripStage.forSale)),
            ),
          if (items.unpaidSales > 0)
            _ActionRow(
              icon: Icons.request_quote_outlined,
              tone: Tone.warning,
              label: l.actionUnpaid,
              count: items.unpaidSales,
              amount: l.sar(items.unpaidTotal),
              onTap: () => context.go(Routes.unpaidSales()),
            ),
        ],
      ),
    );
  }
}

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
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 52),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(border: Border(top: BorderSide(color: c.hair))),
        child: Row(
          children: [
            ToneIcon(icon: icon, tone: tone, size: 30, iconSize: 17),
            const SizedBox(width: 12),
            Expanded(child: Text(label, style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w700))),
            if (amount != null) ...[Text(amount!, style: text.labelLarge?.copyWith(color: c.toneText(tone))), const SizedBox(width: 10)],
            CountBadge(count: count, tone: tone),
            const SizedBox(width: 4),
            Icon(Icons.chevron_right, color: c.muted),
          ],
        ),
      ),
    );
  }
}

class _ScheduledTripRow extends ConsumerWidget {
  const _ScheduledTripRow({required this.trip});

  final Trip trip;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final text = Theme.of(context).textTheme;
    return InkWell(
      onTap: () => context.push(Routes.trip(trip.id)),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 42, top: 2, bottom: 8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(boatAndCaptain(trip), style: text.bodyMedium?.copyWith(fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis),
                  Text(
                    trip.departureTime == null ? Fmt.ltr(trip.tripNumber) : l.when(trip.departureTime!),
                    style: text.bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            FilledButton.icon(
              onPressed: () => startTripFlow(context, ref, trip),
              style: FilledButton.styleFrom(minimumSize: const Size(84, 40), padding: const EdgeInsets.symmetric(horizontal: 12)),
              icon: const Icon(Icons.play_arrow, size: 18),
              label: Text(l.startShort),
            ),
          ],
        ),
      ),
    );
  }
}

class _Indicators extends ConsumerWidget {
  const _Indicators({required this.dashboard, required this.period});

  final Dashboard dashboard;
  final DashboardPeriod period;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final k = dashboard.kpis;
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

    Widget pair(Widget a, Widget b) => IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [Expanded(child: a), const SizedBox(width: 10), Expanded(child: b)],
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const ToneIcon(icon: Icons.insights, size: 28, iconSize: 15),
            const SizedBox(width: 10),
            Expanded(
              child: Text(l.indicatorsTitle, style: Theme.of(context).textTheme.titleSmall, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(width: 8),
            _PeriodSwitch(period: period),
          ],
        ),
        const SizedBox(height: 8),
        pair(
          StatTile(label: revenueLabel, value: Fmt.money(k.revenue), unit: l.currencySar, icon: Icons.payments_outlined, tone: Tone.success),
          StatTile(label: catchLabel, value: Fmt.kg(k.catchKg), unit: l.unitKg, icon: Icons.set_meal_outlined),
        ),
        const SizedBox(height: 10),
        pair(
          StatTile(label: l.statActiveBoats, value: '${k.activeBoats} / ${k.boats}', icon: Icons.directions_boat_outlined, tone: Tone.info),
          StatTile(
            label: l.statUnpaid,
            value: Fmt.money(k.unpaid),
            unit: l.currencySar,
            icon: Icons.request_quote_outlined,
            tone: Tone.warning,
            onTap: k.unpaid > 0 ? () => context.go(Routes.unpaidSales()) : null,
          ),
        ),
      ],
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
    final labels = {DashboardPeriod.today: l.periodToday, DashboardPeriod.month: l.periodMonth, DashboardPeriod.year: l.periodYear};

    return Container(
      decoration: BoxDecoration(border: Border.all(color: c.border)),
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
                  constraints: const BoxConstraints(minHeight: 36, minWidth: 52),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  color: entry.key == period ? c.primary : Colors.transparent,
                  child: Text(
                    entry.value,
                    style: text.labelMedium?.copyWith(color: entry.key == period ? c.onPrimary : c.muted),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Four counted stages; each opens the trips list on its tab.
class _Pipeline extends StatelessWidget {
  const _Pipeline({required this.kpis});

  final DashboardKpis kpis;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final stages = [
      (l.pipeScheduled, kpis.tripsScheduled, Tone.muted, TripStage.scheduled),
      (l.pipeAtSea, kpis.tripsAtSea, Tone.info, TripStage.inProgress),
      (l.pipeCounting, kpis.tripsAwaitingCount, Tone.warning, TripStage.inProgress),
      (l.pipeForSale, kpis.tripsForSale, Tone.success, TripStage.forSale),
    ];

    return HudCard(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHead(title: l.pipelineTitle, icon: Icons.route_outlined),
          const SizedBox(height: 8),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var i = 0; i < stages.length; i++) ...[
                  if (i > 0) const SizedBox(width: 6),
                  Expanded(
                    child: InkWell(
                      onTap: () => context.go(Routes.tripsAt(stages[i].$4)),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(6, 10, 6, 10),
                        decoration: BoxDecoration(
                          color: c.tone(stages[i].$3).withValues(alpha: stages[i].$2 > 0 ? .07 : .03),
                          border: Border(top: BorderSide(color: c.tone(stages[i].$3), width: 3)),
                        ),
                        child: Column(
                          children: [
                            LtrText(
                              Fmt.count(stages[i].$2),
                              style: text.headlineSmall?.copyWith(color: stages[i].$2 > 0 ? c.foreground : c.muted),
                            ),
                            const SizedBox(height: 4),
                            Text(stages[i].$1, style: text.labelSmall?.copyWith(color: c.muted), textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActiveTrips extends StatelessWidget {
  const _ActiveTrips({required this.trips});

  final List<Trip> trips;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final width = (MediaQuery.sizeOf(context).width * .8).clamp(260.0, 340.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHead(
          title: l.activeTripsTitle,
          icon: Icons.sailing_outlined,
          action: trips.isEmpty ? null : l.viewAll,
          onAction: () => context.go(Routes.tripsAt(TripStage.inProgress)),
        ),
        const SizedBox(height: 8),
        if (trips.isEmpty)
          HudCard(child: EmptyState(icon: Icons.sailing_outlined, title: l.noActiveTrips, compact: true))
        else
          SizedBox(
            height: 196,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              itemCount: trips.length,
              separatorBuilder: (_, _) => const SizedBox(width: 10),
              itemBuilder: (context, i) => SizedBox(width: width, child: _ActiveTripCard(trip: trips[i])),
            ),
          ),
      ],
    );
  }
}

class _ActiveTripCard extends ConsumerWidget {
  const _ActiveTripCard({required this.trip});

  final Trip trip;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final phase = trip.phase;
    final steps = tripStepLabels(l);

    final Widget next = switch (phase) {
      TripPhase.atSea => OutlinedButton.icon(
        onPressed: () => context.push(Routes.submitCatch(trip.id)),
        style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(44), side: BorderSide(color: c.primary)),
        icon: const Icon(Icons.scale_outlined, size: 18),
        label: Text(l.quickSubmitCatch, overflow: TextOverflow.ellipsis),
      ),
      TripPhase.forSale when trip.captainInputKg != null || trip.actualWeightKg != null => _Hint(
        text: '${l.countedLabel} ${l.kg(trip.actualWeightKg ?? trip.captainInputKg!)}',
        tone: Tone.success,
      ),
      TripPhase.awaitingCounter => _Hint(
        text: trip.countingPort == null ? l.waitingCounter : l.waitingCounterAt(trip.countingPort!),
        tone: Tone.warning,
      ),
      TripPhase.counting => _Hint(text: l.countingNow, tone: Tone.warning),
      _ => const SizedBox.shrink(),
    };

    return HudCard(
      onTap: () => context.push(Routes.trip(trip.id)),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(child: LtrText(trip.tripNumber, style: text.labelMedium?.copyWith(color: c.muted))),
              TripPhaseChip(trip: trip, dense: true),
            ],
          ),
          const SizedBox(height: 8),
          Text(trip.boat?.name ?? '—', style: text.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
          Text(trip.captain?.name ?? '', style: text.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
          const Spacer(),
          SegmentProgress(current: phase.step, allDone: phase.isFinished),
          const SizedBox(height: 6),
          Text(steps[phase.step.clamp(0, steps.length - 1)], style: text.labelSmall?.copyWith(color: c.muted)),
          const SizedBox(height: 10),
          next,
        ],
      ),
    );
  }
}

class _Hint extends StatelessWidget {
  const _Hint({required this.text, required this.tone});

  final String text;
  final Tone tone;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    return Container(
      constraints: const BoxConstraints(minHeight: 44),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      alignment: AlignmentDirectional.centerStart,
      color: c.tone(tone).withValues(alpha: .08),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(color: c.toneText(tone)),
      ),
    );
  }
}

/// الأسماك المتوفرة: kg per species with a bar proportional to the largest.
class _Stock extends StatelessWidget {
  const _Stock({required this.lines});

  final List<StockLine> lines;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final shown = [...lines]..sort((a, b) => b.weightKg.compareTo(a.weightKg));
    final top = shown.take(6).toList();
    final max = top.isEmpty ? 1.0 : top.first.weightKg;

    return HudCard(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHead(title: l.stockTitle, icon: Icons.set_meal_outlined),
          if (top.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(l.noStock, style: text.bodyMedium?.copyWith(color: c.muted)),
            ),
          for (final line in top)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text(line.species ?? '—', style: text.bodyMedium?.copyWith(fontWeight: FontWeight.w600))),
                      Text(l.kg(line.weightKg), style: text.labelLarge),
                    ],
                  ),
                  const SizedBox(height: 6),
                  LayoutBuilder(
                    builder: (context, constraints) => Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Container(
                        height: 6,
                        width: constraints.maxWidth * (max <= 0 ? 0 : (line.weightKg / max).clamp(.02, 1)),
                        color: c.primary,
                      ),
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

class _RecentSales extends StatelessWidget {
  const _RecentSales({required this.dashboard});

  final Dashboard dashboard;

  @override
  Widget build(BuildContext context) {
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
            onAction: () => context.go(Routes.sales),
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
          SkeletonBox(height: 120),
          SizedBox(height: Hud.gap),
          Row(children: [Expanded(child: SkeletonBox(height: 96)), SizedBox(width: 10), Expanded(child: SkeletonBox(height: 96))]),
          SizedBox(height: 10),
          Row(children: [Expanded(child: SkeletonBox(height: 96)), SizedBox(width: 10), Expanded(child: SkeletonBox(height: 96))]),
          SizedBox(height: Hud.gap),
          SkeletonBox(height: 110),
          SizedBox(height: Hud.gap),
          SkeletonBox(height: 190),
        ],
      ),
    ),
  );
}
