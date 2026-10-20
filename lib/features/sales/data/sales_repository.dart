import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/api_client.dart';
import '../../../core/api/page.dart';
import '../../../core/providers.dart';
import 'sale.dart';

part 'sales_repository.g.dart';

/// What the sales list shows: unpaid only, a search, and a period.
class SalesQuery {
  const SalesQuery({this.unpaidOnly = false, this.search = '', this.from, this.to});

  final bool unpaidOnly;
  final String search;
  final DateTime? from;
  final DateTime? to;

  @override
  bool operator ==(Object other) =>
      other is SalesQuery &&
      other.unpaidOnly == unpaidOnly &&
      other.search == search &&
      other.from == from &&
      other.to == to;

  @override
  int get hashCode => Object.hash(unpaidOnly, search, from, to);
}

/// `/owner/sales/*`: the invoices, selling a trip's catch, and collecting what is due.
class SalesRepository {
  const SalesRepository(this._api);

  final ApiClient _api;

  static final _day = DateFormat('yyyy-MM-dd', 'en_US');

  Future<PageResult<Sale>> list(SalesQuery query, {int page = 1}) async {
    final json = await _api.get(
      '/owner/sales',
      query: {
        'unpaid': query.unpaidOnly ? true : null,
        'search': query.search.trim(),
        'from': query.from == null ? null : _day.format(query.from!),
        'to': query.to == null ? null : _day.format(query.to!),
        'page': page,
        'per_page': perPage,
      },
    );
    return PageResult.fromJson(json, Sale.fromJson);
  }

  Future<Sale> get(int id) async => _sale(await _api.get('/owner/sales/$id'));

  Future<Sale> create(SaleInput input, {required String idempotencyKey}) async =>
      _sale(await _api.post('/owner/sales', data: input.toJson(), idempotencyKey: idempotencyKey));

  Future<Sale> collect(int id, double amount, {required String idempotencyKey}) async =>
      _sale(await _api.post('/owner/sales/$id/payments', data: {'amount': amount}, idempotencyKey: idempotencyKey));

  static Sale _sale(Json json) => Sale.fromJson((json['data'] as Map).cast<String, dynamic>());
}

@Riverpod(keepAlive: true)
SalesRepository salesRepository(Ref ref) => SalesRepository(ref.watch(apiClientProvider));
