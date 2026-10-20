import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/page.dart';
import '../../consignments/data/consignment.dart';
import '../../home/data/dashboard_providers.dart';
import '../../sales/data/sale.dart';
import 'trip.dart';
import 'trips_repository.dart';

part 'trips_providers.g.dart';

/// What a trips tab shows: its stage, the search and the boat filter.
class TripsQuery {
  const TripsQuery({required this.stage, this.search = '', this.boatId});

  final TripStage stage;
  final String search;
  final int? boatId;

  @override
  bool operator ==(Object other) =>
      other is TripsQuery && other.stage == stage && other.search == search && other.boatId == boatId;

  @override
  int get hashCode => Object.hash(stage, search, boatId);
}

@riverpod
class TripsList extends _$TripsList {
  @override
  Future<PagedList<Trip>> build(TripsQuery query) async => PagedList.first(await _fetch(1));

  Future<PageResult<Trip>> _fetch(int page) => ref
      .read(tripsRepositoryProvider)
      .list(stage: query.stage, search: query.search.trim(), boatId: query.boatId, page: page);

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null) return;
    await loadNextPage(current, _fetch, (next) {
      if (ref.mounted) state = AsyncData(next);
    });
  }
}

/// One trip with its catch lines and what is still available to sell.
@riverpod
class TripDetail extends _$TripDetail {
  @override
  Future<Trip> build(int id) => ref.read(tripsRepositoryProvider).get(id);

  void replace(Trip trip) => state = AsyncData(trip);
}

/// The sales and consignments of one trip, once its catch is on sale.
@riverpod
Future<(List<Sale>, List<Consignment>)> tripSales(Ref ref, int tripId) async {
  final repo = ref.read(tripsRepositoryProvider);
  final sales = repo.salesOf(tripId);
  final consignments = repo.consignmentsOf(tripId);
  return (await sales, await consignments);
}

/// Trip actions from any screen (home, list, trip screen). Each one updates
/// the open trip screen with the server's answer and reloads the lists and
/// the home, so counts never disagree.
@Riverpod(keepAlive: true)
TripActions tripActions(Ref ref) => TripActions(ref);

class TripActions {
  TripActions(this._ref);

  final Ref _ref;

  TripsRepository get _repo => _ref.read(tripsRepositoryProvider);

  Future<Trip> create(TripInput input, {required String idempotencyKey}) async =>
      _apply(await _repo.create(input, idempotencyKey: idempotencyKey));

  Future<Trip> update(int id, TripInput input) async => _apply(await _repo.update(id, input));

  Future<Trip> start(int id, {required String idempotencyKey}) async =>
      _apply(await _repo.start(id, idempotencyKey: idempotencyKey));

  Future<Trip> cancel(int id, String reason, {required String idempotencyKey}) async =>
      _apply(await _repo.cancel(id, reason, idempotencyKey: idempotencyKey));

  Future<Trip> submitCatch(int id, List<CatchLineInput> lines, {required String idempotencyKey}) async =>
      _apply(await _repo.submitCatch(id, lines, idempotencyKey: idempotencyKey));

  Trip _apply(Trip trip) {
    final detail = tripDetailProvider(trip.id);
    if (_ref.exists(detail)) {
      // Actions return the trip without the detail-only lines; reload those.
      _ref.invalidate(detail);
    }
    _ref.invalidate(tripsListProvider);
    refreshHome(_ref);
    return trip;
  }
}
