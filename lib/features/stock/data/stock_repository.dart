import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/api_client.dart';
import '../../../core/api/page.dart';
import '../../../core/providers.dart';
import 'stock.dart';

part 'stock_repository.g.dart';

/// `/owner/stock`: what the owner holds by species, and the ledger behind it.
class StockRepository {
  const StockRepository(this._api);

  final ApiClient _api;

  Future<List<StockLine>> stock() async {
    final json = await _api.get('/owner/stock');
    return [for (final row in (json['data'] as List).cast<Map>()) StockLine.fromJson(row.cast<String, dynamic>())];
  }

  Future<PageResult<StockMovement>> movements({int? speciesId, int page = 1}) async {
    final json = await _api.get(
      '/owner/stock/movements',
      query: {'species_id': speciesId, 'page': page, 'per_page': perPage},
    );
    return PageResult.fromJson(json, StockMovement.fromJson);
  }
}

@Riverpod(keepAlive: true)
StockRepository stockRepository(Ref ref) => StockRepository(ref.watch(apiClientProvider));

/// الأسماك المتوفرة, heaviest first.
@riverpod
Future<List<StockLine>> stock(Ref ref) async {
  final lines = await ref.read(stockRepositoryProvider).stock();
  return [...lines]..sort((a, b) => b.weightKg.compareTo(a.weightKg));
}

/// حركات الصنف, newest first; one species or all of them.
@riverpod
class StockMovements extends _$StockMovements {
  @override
  Future<PagedList<StockMovement>> build(int? speciesId) async => PagedList.first(await _fetch(1));

  Future<PageResult<StockMovement>> _fetch(int page) =>
      ref.read(stockRepositoryProvider).movements(speciesId: speciesId, page: page);

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null) return;
    await loadNextPage(current, _fetch, (next) {
      if (ref.mounted) state = AsyncData(next);
    });
  }
}
