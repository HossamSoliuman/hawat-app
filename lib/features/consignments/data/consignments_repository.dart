import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/api_client.dart';
import '../../../core/api/page.dart';
import '../../../core/providers.dart';
import 'consignment.dart';

part 'consignments_repository.g.dart';

/// `/owner/consignments/*`: catch sent to dalals.
class ConsignmentsRepository {
  const ConsignmentsRepository(this._api);

  final ApiClient _api;

  Future<PageResult<Consignment>> list({int? tripId, int page = 1, int pageSize = perPage}) async {
    final json = await _api.get('/owner/consignments', query: {'trip_id': tripId, 'page': page, 'per_page': pageSize});
    return PageResult.fromJson(json, Consignment.fromJson);
  }

  Future<Consignment> get(int id) async => _consignment(await _api.get('/owner/consignments/$id'));

  Future<Consignment> create(ConsignmentInput input, {required String idempotencyKey}) async =>
      _consignment(await _api.post('/owner/consignments', data: input.toJson(), idempotencyKey: idempotencyKey));

  static Consignment _consignment(Json json) => Consignment.fromJson((json['data'] as Map).cast<String, dynamic>());
}

@Riverpod(keepAlive: true)
ConsignmentsRepository consignmentsRepository(Ref ref) => ConsignmentsRepository(ref.watch(apiClientProvider));

/// Every consignment, newest first.
@riverpod
class ConsignmentsList extends _$ConsignmentsList {
  @override
  Future<PagedList<Consignment>> build() async => PagedList.first(await _fetch(1));

  Future<PageResult<Consignment>> _fetch(int page) => ref.read(consignmentsRepositoryProvider).list(page: page);

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null) return;
    await loadNextPage(current, _fetch, (next) {
      if (ref.mounted) state = AsyncData(next);
    });
  }
}

@riverpod
class ConsignmentDetail extends _$ConsignmentDetail {
  @override
  Future<Consignment> build(int id) => ref.read(consignmentsRepositoryProvider).get(id);

  void replace(Consignment consignment) => state = AsyncData(consignment);
}
