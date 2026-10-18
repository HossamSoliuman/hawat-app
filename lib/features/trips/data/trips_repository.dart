import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/api_client.dart';
import '../../../core/api/page.dart';
import '../../../core/providers.dart';
import '../../sales/data/sale.dart';
import 'trip.dart';

part 'trips_repository.g.dart';

/// `/owner/trips/*`: the whole trip cycle, run by the owner.
class TripsRepository {
  const TripsRepository(this._api);

  final ApiClient _api;

  Future<PageResult<Trip>> list({TripStage? stage, String? search, int? boatId, int page = 1}) async {
    final json = await _api.get(
      '/owner/trips',
      query: {'stage': stage?.apiValue, 'search': search, 'boat_id': boatId, 'page': page, 'per_page': perPage},
    );
    return PageResult.fromJson(json, Trip.fromJson);
  }

  Future<Trip> get(int id) async => _trip(await _api.get('/owner/trips/$id'));

  Future<Trip> create(TripInput input, {required String idempotencyKey}) async =>
      _trip(await _api.post('/owner/trips', data: input.toJson(), idempotencyKey: idempotencyKey));

  Future<Trip> update(int id, TripInput input) async => _trip(await _api.put('/owner/trips/$id', data: input.toJson()));

  Future<Trip> start(int id, {required String idempotencyKey}) async =>
      _trip(await _api.post('/owner/trips/$id/start', idempotencyKey: idempotencyKey));

  Future<Trip> cancel(int id, String reason, {required String idempotencyKey}) async =>
      _trip(await _api.post('/owner/trips/$id/cancel', data: {'reason': reason}, idempotencyKey: idempotencyKey));

  Future<Trip> submitCatch(int id, List<CatchLineInput> lines, {required String idempotencyKey}) async => _trip(
    await _api.post(
      '/owner/trips/$id/catch',
      data: {
        'items': [
          for (final line in lines)
            {
              'species_id': line.speciesId,
              'weight_kg': line.weightKg,
              if (line.notes?.trim().isNotEmpty ?? false) 'notes': line.notes!.trim(),
            },
        ],
      },
      idempotencyKey: idempotencyKey,
    ),
  );

  Future<List<Sale>> salesOf(int tripId) async {
    final json = await _api.get('/owner/sales', query: {'trip_id': tripId, 'per_page': 100});
    return PageResult.fromJson(json, Sale.fromJson).items;
  }

  Future<List<Consignment>> consignmentsOf(int tripId) async {
    final json = await _api.get('/owner/consignments', query: {'trip_id': tripId, 'per_page': 100});
    return PageResult.fromJson(json, Consignment.fromJson).items;
  }

  static Trip _trip(Json json) => Trip.fromJson((json['data'] as Map).cast<String, dynamic>());
}

@Riverpod(keepAlive: true)
TripsRepository tripsRepository(Ref ref) => TripsRepository(ref.watch(apiClientProvider));
