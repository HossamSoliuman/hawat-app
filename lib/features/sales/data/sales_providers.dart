import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/page.dart';
import 'sale.dart';
import 'sales_repository.dart';

export 'sales_repository.dart' show SalesQuery;

part 'sales_providers.g.dart';

/// `GET /owner/sales`: newest first, optionally only the invoices with money still due.
@riverpod
class SalesList extends _$SalesList {
  @override
  Future<PagedList<Sale>> build(SalesQuery query) async => PagedList.first(await _fetch(1));

  Future<PageResult<Sale>> _fetch(int page) => ref.read(salesRepositoryProvider).list(query, page: page);

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null) return;
    await loadNextPage(current, _fetch, (next) {
      if (ref.mounted) state = AsyncData(next);
    });
  }
}

/// The totals the server sent with a sales list (every matching invoice).
SalesTotals? salesTotalsOf(PagedList<Sale> list) {
  final totals = list.extra['totals'];
  return totals is Map ? SalesTotals.fromJson(totals.cast<String, dynamic>()) : null;
}

/// One invoice with its lines.
@riverpod
class SaleDetail extends _$SaleDetail {
  @override
  Future<Sale> build(int id) => ref.read(salesRepositoryProvider).get(id);

  void replace(Sale sale) => state = AsyncData(sale);
}
