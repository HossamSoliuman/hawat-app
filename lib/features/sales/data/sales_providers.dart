import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/page.dart';
import '../../../core/providers.dart';
import 'sale.dart';

part 'sales_providers.g.dart';

class SalesQuery {
  const SalesQuery({this.unpaidOnly = false, this.search = ''});

  final bool unpaidOnly;
  final String search;

  @override
  bool operator ==(Object other) => other is SalesQuery && other.unpaidOnly == unpaidOnly && other.search == search;

  @override
  int get hashCode => Object.hash(unpaidOnly, search);
}

/// `GET /owner/sales`: newest first, optionally only the invoices with money still due.
@riverpod
class SalesList extends _$SalesList {
  @override
  Future<PagedList<Sale>> build(SalesQuery query) async => PagedList.first(await _fetch(1));

  Future<PageResult<Sale>> _fetch(int page) async {
    final json = await ref.read(apiClientProvider).get(
      '/owner/sales',
      query: {'unpaid': query.unpaidOnly ? true : null, 'search': query.search.trim(), 'page': page, 'per_page': perPage},
    );
    return PageResult.fromJson(json, Sale.fromJson);
  }

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null) return;
    await loadNextPage(current, _fetch, (next) {
      if (ref.mounted) state = AsyncData(next);
    });
  }
}

@riverpod
Future<Sale> saleDetail(Ref ref, int id) async {
  final json = await ref.read(apiClientProvider).get('/owner/sales/$id');
  return Sale.fromJson((json['data'] as Map).cast<String, dynamic>());
}
