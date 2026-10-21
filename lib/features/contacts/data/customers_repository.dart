import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/api_client.dart';
import '../../../core/api/page.dart';
import '../../../core/api/resource_repository.dart';
import '../../../core/providers.dart';
import 'customer.dart';

part 'customers_repository.g.dart';

/// `/owner/customers`, `/owner/vendors`, `/owner/employees`: the owner's contacts.
class CustomersRepository extends ResourceRepository<Customer> {
  CustomersRepository(ApiClient api) : super(api, '/owner/customers', Customer.fromJson);

  static const active = 'نشط';

  /// Active customers by name, for the sale form. Owners keep a short list; 100 covers it.
  Future<List<Customer>> active100() async => (await list(query: {'status': active}, pageSize: 100)).items;

  /// "زبون جديد" from the sale form: a name and, if known, a phone.
  Future<Customer> quickCreate({required String name, String? phone, required String idempotencyKey}) =>
      create({'name': name.trim(), if (phone?.isNotEmpty ?? false) 'phone': phone}, idempotencyKey: idempotencyKey);
}

@Riverpod(keepAlive: true)
CustomersRepository customersRepository(Ref ref) => CustomersRepository(ref.watch(apiClientProvider));

@Riverpod(keepAlive: true)
ResourceRepository<Vendor> vendorsRepository(Ref ref) =>
    ResourceRepository(ref.watch(apiClientProvider), '/owner/vendors', Vendor.fromJson);

@Riverpod(keepAlive: true)
ResourceRepository<Employee> employeesRepository(Ref ref) =>
    ResourceRepository(ref.watch(apiClientProvider), '/owner/employees', Employee.fromJson);

@riverpod
Future<List<Customer>> activeCustomers(Ref ref) => ref.read(customersRepositoryProvider).active100();

@riverpod
class CustomersList extends _$CustomersList {
  @override
  Future<PagedList<Customer>> build({String search = ''}) async => PagedList.first(await _fetch(1));

  Future<PageResult<Customer>> _fetch(int page) =>
      ref.read(customersRepositoryProvider).list(query: {'search': search}, page: page);

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null) return;
    await loadNextPage(current, _fetch, (next) {
      if (ref.mounted) state = AsyncData(next);
    });
  }
}

@riverpod
class VendorsList extends _$VendorsList {
  @override
  Future<PagedList<Vendor>> build({String search = ''}) async => PagedList.first(await _fetch(1));

  Future<PageResult<Vendor>> _fetch(int page) =>
      ref.read(vendorsRepositoryProvider).list(query: {'search': search}, page: page);

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null) return;
    await loadNextPage(current, _fetch, (next) {
      if (ref.mounted) state = AsyncData(next);
    });
  }
}

@riverpod
class EmployeesList extends _$EmployeesList {
  @override
  Future<PagedList<Employee>> build({String search = ''}) async => PagedList.first(await _fetch(1));

  Future<PageResult<Employee>> _fetch(int page) =>
      ref.read(employeesRepositoryProvider).list(query: {'search': search}, page: page);

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null) return;
    await loadNextPage(current, _fetch, (next) {
      if (ref.mounted) state = AsyncData(next);
    });
  }
}

@riverpod
Future<Customer> customerDetail(Ref ref, int id) => ref.read(customersRepositoryProvider).get(id);

@riverpod
Future<Vendor> vendorDetail(Ref ref, int id) => ref.read(vendorsRepositoryProvider).get(id);

@riverpod
Future<Employee> employeeDetail(Ref ref, int id) => ref.read(employeesRepositoryProvider).get(id);

/// Contact writes; each reloads its list (and the sale form's customers).
@Riverpod(keepAlive: true)
ContactActions contactActions(Ref ref) => ContactActions(ref);

class ContactActions {
  ContactActions(this._ref);

  final Ref _ref;

  Future<Customer> saveCustomer(int? id, Json body, {required String idempotencyKey}) async {
    final customer = await _save(_ref.read(customersRepositoryProvider), id, body, idempotencyKey);
    _customersChanged();
    return customer;
  }

  Future<void> deleteCustomer(int id) async {
    await _ref.read(customersRepositoryProvider).delete(id);
    _customersChanged();
  }

  Future<Vendor> saveVendor(int? id, Json body, {required String idempotencyKey}) async {
    final vendor = await _save(_ref.read(vendorsRepositoryProvider), id, body, idempotencyKey);
    _ref
      ..invalidate(vendorsListProvider)
      ..invalidate(vendorDetailProvider);
    return vendor;
  }

  Future<void> deleteVendor(int id) async {
    await _ref.read(vendorsRepositoryProvider).delete(id);
    _ref.invalidate(vendorsListProvider);
  }

  Future<Employee> saveEmployee(int? id, Json body, {required String idempotencyKey}) async {
    final employee = await _save(_ref.read(employeesRepositoryProvider), id, body, idempotencyKey);
    _ref
      ..invalidate(employeesListProvider)
      ..invalidate(employeeDetailProvider);
    return employee;
  }

  Future<void> deleteEmployee(int id) async {
    await _ref.read(employeesRepositoryProvider).delete(id);
    _ref.invalidate(employeesListProvider);
  }

  static Future<T> _save<T>(ResourceRepository<T> repo, int? id, Json body, String idempotencyKey) =>
      id == null ? repo.create(body, idempotencyKey: idempotencyKey) : repo.update(id, body);

  void _customersChanged() {
    _ref
      ..invalidate(customersListProvider)
      ..invalidate(customerDetailProvider)
      ..invalidate(activeCustomersProvider);
  }
}
