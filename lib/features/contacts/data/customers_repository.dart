import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/api_client.dart';
import '../../../core/providers.dart';
import 'customer.dart';

part 'customers_repository.g.dart';

/// `/owner/customers`: the buyers the sale form picks from, and a quick add.
class CustomersRepository {
  const CustomersRepository(this._api);

  final ApiClient _api;

  static const active = 'نشط';

  /// Active customers by name. Owners keep a short list; 100 covers it.
  Future<List<Customer>> active100() async {
    final json = await _api.get('/owner/customers', query: {'status': active, 'per_page': 100});
    return [for (final row in (json['data'] as List).cast<Map>()) Customer.fromJson(row.cast<String, dynamic>())];
  }

  Future<Customer> create({required String name, String? phone, required String idempotencyKey}) async {
    final json = await _api.post(
      '/owner/customers',
      data: {'name': name.trim(), if (phone?.isNotEmpty ?? false) 'phone': phone},
      idempotencyKey: idempotencyKey,
    );
    return Customer.fromJson((json['data'] as Map).cast<String, dynamic>());
  }
}

@Riverpod(keepAlive: true)
CustomersRepository customersRepository(Ref ref) => CustomersRepository(ref.watch(apiClientProvider));

@riverpod
Future<List<Customer>> activeCustomers(Ref ref) => ref.read(customersRepositoryProvider).active100();
