import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/format/format.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/hud_card.dart';
import '../../../core/widgets/ltr_text.dart';
import '../../../core/widgets/stat_tile.dart';
import '../../../core/widgets/states.dart';
import '../../lookups/data/lookups_repository.dart';
import '../data/catch_log.dart';
import '../data/catch_log_providers.dart';

/// سجل الصيد: what every trip declared and what was counted, by species or
/// line by line, filtered by boat or captain.
class CatchLogScreen extends ConsumerStatefulWidget {
  const CatchLogScreen({super.key});

  @override
  ConsumerState<CatchLogScreen> createState() => _CatchLogScreenState();
}

class _CatchLogScreenState extends ConsumerState<CatchLogScreen> {
  int? _boatId;
  int? _captainId;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final query = CatchLogQuery(boatId: _boatId, captainId: _captainId);
    final boats = ref.watch(ownerBoatsProvider).value ?? const [];
    final captains = ref.watch(ownerCaptainsProvider).value ?? const [];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l.catchLogTitle),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(64 + 48),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(Hud.gutter, 4, Hud.gutter, 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: SearchSelect<int>(
                          hint: l.allBoats,
                          title: l.fieldBoat,
                          value: _boatId,
                          emptyLabel: l.allBoats,
                          options: [for (final b in boats) SelectOption(value: b.id, label: b.name)],
                          onChanged: (id) => setState(() => _boatId = id),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: SearchSelect<int>(
                          hint: l.allCaptains,
                          title: l.fieldCaptain,
                          value: _captainId,
                          emptyLabel: l.allCaptains,
                          options: [for (final c in captains) SelectOption(value: c.id, label: c.name)],
                          onChanged: (id) => setState(() => _captainId = id),
                        ),
                      ),
                    ],
                  ),
                ),
                TabBar(
                  tabs: [
                    Tab(text: l.tabBySpecies, height: 48),
                    Tab(text: l.tabLines, height: 48),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _Summary(query: query),
            _Entries(query: query),
          ],
        ),
      ),
    );
  }
}

class _Summary extends ConsumerWidget {
  const _Summary({required this.query});

  final CatchLogQuery query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final provider = catchLogSummaryProvider(query);

    return RefreshIndicator(
      onRefresh: () => ref.refresh(provider.future),
      child: ref
          .watch(provider)
          .when(
            skipLoadingOnReload: true,
            loading: () => const Skeleton(
              child: Padding(padding: EdgeInsets.all(Hud.gutter), child: SkeletonBox(height: 300)),
            ),
            error: (e, _) => ListView(
              children: [ErrorState(error: e, onRetry: () => ref.invalidate(provider))],
            ),
            data: (summary) {
              if (summary.bySpecies.isEmpty) {
                return ListView(
                  children: [EmptyState(icon: Icons.set_meal_outlined, title: l.noCatchLog)],
                );
              }
              return ListView(
                padding: const EdgeInsets.all(Hud.gutter),
                children: [
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: StatTile(
                            label: l.totalDeclared,
                            value: Fmt.kg(summary.totals.captainKg),
                            unit: l.unitKg,
                            icon: Icons.scale_outlined,
                            tone: Tone.info,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: StatTile(
                            label: l.totalCounted,
                            value: Fmt.kg(summary.totals.countedKg),
                            unit: l.unitKg,
                            icon: Icons.fact_check_outlined,
                            tone: Tone.success,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: Hud.gap),
                  HudCard(
                    padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
                    child: Column(
                      children: [
                        for (var i = 0; i < summary.bySpecies.length; i++)
                          _SpeciesRow(row: summary.bySpecies[i], last: i == summary.bySpecies.length - 1),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${l.speciesCountLabel}: ${Fmt.count(summary.totals.species)}',
                    style: text.bodySmall?.copyWith(color: c.muted),
                  ),
                ],
              );
            },
          ),
    );
  }
}

class _SpeciesRow extends StatelessWidget {
  const _SpeciesRow({required this.row, required this.last});

  final SpeciesCatch row;
  final bool last;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 11),
      decoration: BoxDecoration(
        border: last ? null : Border(bottom: BorderSide(color: c.hair)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(row.species, style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w700)),
                Text(l.tripsCount(row.trips), style: text.bodySmall),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                row.countedKg > 0 ? l.kg(row.countedKg) : (row.captainKg > 0 ? l.kg(row.captainKg) : '—'),
                style: text.labelLarge,
              ),
              if (row.countedKg > 0 && row.captainKg > 0)
                Text('${l.declaredLabel} ${l.kg(row.captainKg)}', style: text.bodySmall),
              if (row.countedKg <= 0 && row.captainKg > 0) Text(l.declaredLabel, style: text.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}

class _Entries extends ConsumerWidget {
  const _Entries({required this.query});

  final CatchLogQuery query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final provider = catchLogEntriesProvider(query);

    return RefreshIndicator(
      onRefresh: () => ref.refresh(provider.future),
      child: ref
          .watch(provider)
          .when(
            skipLoadingOnReload: true,
            loading: () => const Skeleton(
              child: Padding(padding: EdgeInsets.all(Hud.gutter), child: SkeletonBox(height: 300)),
            ),
            error: (e, _) => ListView(
              children: [ErrorState(error: e, onRetry: () => ref.invalidate(provider))],
            ),
            data: (page) {
              if (page.isEmpty) {
                return ListView(
                  children: [EmptyState(icon: Icons.set_meal_outlined, title: l.noCatchLog)],
                );
              }
              return NotificationListener<ScrollNotification>(
                onNotification: (n) {
                  if (n.metrics.extentAfter < 400) ref.read(provider.notifier).loadMore();
                  return false;
                },
                child: ListView.builder(
                  itemCount: page.items.length + 1,
                  itemBuilder: (context, i) {
                    if (i == page.items.length) {
                      return LoadMoreFooter(
                        loading: page.loadingMore,
                        error: page.loadMoreError,
                        onRetry: () => ref.read(provider.notifier).loadMore(),
                      );
                    }
                    final entry = page.items[i];
                    final trip = entry.trip;
                    return InkWell(
                      onTap: trip == null ? null : () => context.push(Routes.trip(trip.id)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: Hud.gutter, vertical: 12),
                        decoration: BoxDecoration(
                          color: c.panel,
                          border: Border(bottom: BorderSide(color: c.hair)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    entry.species?.name ?? '—',
                                    style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: 2),
                                  Row(
                                    children: [
                                      if (trip != null) LtrText(trip.tripNumber, style: text.bodySmall),
                                      if (trip?.boat != null) ...[
                                        Text('  ·  ', style: text.bodySmall),
                                        Flexible(
                                          child: Text(
                                            trip!.boat!,
                                            style: text.bodySmall,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(l.kg(entry.countedKg ?? entry.captainKg ?? 0), style: text.labelLarge),
                                Text(entry.countedKg != null ? l.countedLabel : l.declaredLabel, style: text.bodySmall),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
    );
  }
}
