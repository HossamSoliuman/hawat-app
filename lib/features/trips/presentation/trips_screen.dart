import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/nav_requests.dart';
import '../../../app/router.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/states.dart';
import '../../lookups/data/lookups_repository.dart';
import '../data/trip.dart';
import '../data/trips_providers.dart';
import 'trip_card.dart';
import 'trip_ui.dart';

/// الرحلات: five tabs that never overlap (مجدولة / جارية / للبيع / مباعة /
/// ملغاة), search by trip number and a boat filter.
class TripsScreen extends ConsumerStatefulWidget {
  const TripsScreen({super.key, this.initialStage});

  final TripStage? initialStage;

  @override
  ConsumerState<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends ConsumerState<TripsScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabs = TabController(
    length: TripStage.values.length,
    vsync: this,
    initialIndex: (widget.initialStage ?? TripStage.inProgress).index,
  );
  final _search = TextEditingController();
  Timer? _debounce;
  String _query = '';
  int? _boatId;

  @override
  void didUpdateWidget(TripsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Opened again from the home with another stage: switch tabs.
    if (widget.initialStage != null && widget.initialStage != oldWidget.initialStage) {
      _tabs.animateTo(widget.initialStage!.index);
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _tabs.dispose();
    _search.dispose();
    super.dispose();
  }

  void _onSearch(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      if (mounted) setState(() => _query = value.trim());
    });
  }

  Future<void> _pickBoat() async {
    final l = context.l10n;
    final boats = await ref.read(ownerBoatsProvider.future).catchError((_) => <Never>[]);
    if (!mounted) return;
    final picked = await showModalBottomSheet<({int? id})>(
      context: context,
      isScrollControlled: true,
      builder: (context) => SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * .7),
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: Text(l.allBoats),
                trailing: _boatId == null ? const Icon(Icons.check) : null,
                onTap: () => Navigator.of(context).pop((id: null)),
              ),
              for (final boat in boats)
                ListTile(
                  title: Text(boat.name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (boat.boatNumber != null) Text(boat.boatNumber!, style: Theme.of(context).textTheme.bodySmall),
                      if (_boatId == boat.id) ...[const SizedBox(width: 8), const Icon(Icons.check)],
                    ],
                  ),
                  onTap: () => Navigator.of(context).pop((id: boat.id)),
                ),
            ],
          ),
        ),
      ),
    );
    if (picked != null) setState(() => _boatId = picked.id);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    ref.listen(tripsTabRequestProvider, (_, request) {
      if (request != null) _tabs.animateTo(request.value.index);
    });
    final boatName = _boatId == null
        ? null
        : ref.watch(ownerBoatsProvider).value?.where((b) => b.id == _boatId).firstOrNull?.name;

    return Scaffold(
      appBar: AppBar(
        title: Text(l.tripsTitle),
        shape: const Border(),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64 + 48),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(Hud.gutter, 4, Hud.gutter, 8),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: TextField(
                          controller: _search,
                          onChanged: _onSearch,
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                            hintText: l.searchTripNumber,
                            prefixIcon: const Icon(Icons.search),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                            suffixIcon: _search.text.isEmpty
                                ? null
                                : IconButton(
                                    tooltip: l.clearValue,
                                    icon: const Icon(Icons.close),
                                    onPressed: () {
                                      _search.clear();
                                      _onSearch('');
                                    },
                                  ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      height: 48,
                      child: OutlinedButton.icon(
                        onPressed: _pickBoat,
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          backgroundColor: _boatId == null ? null : c.primary.withValues(alpha: .08),
                          side: BorderSide(color: _boatId == null ? c.border : c.primary),
                        ),
                        icon: const Icon(Icons.directions_boat_outlined, size: 20),
                        label: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 110),
                          child: Text(boatName ?? l.allBoats, overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TabBar(
                controller: _tabs,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                tabs: [for (final stage in TripStage.values) Tab(text: stage.label(l), height: 48)],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabs,
        children: [
          for (final stage in TripStage.values)
            _TripsTab(
              query: TripsQuery(stage: stage, search: _query, boatId: _boatId),
            ),
        ],
      ),
    );
  }
}

class _TripsTab extends ConsumerWidget {
  const _TripsTab({required this.query});

  final TripsQuery query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final provider = tripsListProvider(query);
    final state = ref.watch(provider);

    return RefreshIndicator(
      onRefresh: () => ref.refresh(provider.future),
      child: state.when(
        skipLoadingOnReload: true,
        loading: () => ListView.separated(
          padding: const EdgeInsets.all(Hud.gutter),
          itemCount: 4,
          separatorBuilder: (_, _) => const SizedBox(height: Hud.gap),
          itemBuilder: (_, _) => const Skeleton(child: TripCardSkeleton()),
        ),
        error: (error, _) => ListView(
          children: [ErrorState(error: error, onRetry: () => ref.invalidate(provider))],
        ),
        data: (page) {
          if (page.isEmpty) {
            return ListView(
              children: [
                EmptyState(
                  icon: Icons.sailing_outlined,
                  title: query.search.isNotEmpty ? l.noTripsMatch : query.stage.empty(l),
                  action: query.stage == TripStage.scheduled && query.search.isEmpty ? l.quickNewTrip : null,
                  onAction: () => context.push(Routes.newTrip),
                ),
              ],
            );
          }
          return NotificationListener<ScrollNotification>(
            onNotification: (n) {
              if (n.metrics.extentAfter < 400) ref.read(provider.notifier).loadMore();
              return false;
            },
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(Hud.gutter, Hud.gutter, Hud.gutter, 0),
              itemCount: page.items.length + 1,
              separatorBuilder: (_, _) => const SizedBox(height: Hud.gap),
              itemBuilder: (context, i) {
                if (i == page.items.length) {
                  return LoadMoreFooter(
                    loading: page.loadingMore,
                    error: page.loadMoreError,
                    onRetry: () => ref.read(provider.notifier).loadMore(),
                  );
                }
                final trip = page.items[i];
                return TripCard(trip: trip, onTap: () => context.push(Routes.trip(trip.id)));
              },
            ),
          );
        },
      ),
    );
  }
}
