import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../consignments/data/consignment.dart';
import '../../consignments/data/consignments_repository.dart';
import '../../contacts/data/customer.dart';
import '../../contacts/data/customers_repository.dart';
import '../../dalals/data/dalal.dart';
import '../../dalals/data/dalals_repository.dart';
import '../../home/data/dashboard_providers.dart';
import '../../stock/data/stock_repository.dart';
import '../../trips/data/trips_providers.dart';
import 'sale.dart';
import 'sales_providers.dart';
import 'sales_repository.dart';

part 'selling_actions.g.dart';

/// Selling from any screen: a sale, a payment, a consignment, a request to a
/// dalal, a new customer. Each one reloads what it changed (the trip, its
/// stock, the lists, the home), so no screen shows an old figure.
@Riverpod(keepAlive: true)
SellingActions sellingActions(Ref ref) => SellingActions(ref);

class SellingActions {
  SellingActions(this._ref);

  final Ref _ref;

  Future<Sale> sell(SaleInput input, {required String idempotencyKey}) async {
    final sale = await _ref.read(salesRepositoryProvider).create(input, idempotencyKey: idempotencyKey);
    _ref.read(saleDetailProvider(sale.id).notifier).replace(sale);
    _stockLeft(input.tripId);
    return sale;
  }

  Future<Sale> collect(int saleId, double amount, {required String idempotencyKey}) async {
    final sale = await _ref.read(salesRepositoryProvider).collect(saleId, amount, idempotencyKey: idempotencyKey);
    if (_ref.exists(saleDetailProvider(saleId))) _ref.read(saleDetailProvider(saleId).notifier).replace(sale);
    _ref.invalidate(salesListProvider);
    if (sale.trip != null) _ref.invalidate(tripSalesProvider(sale.trip!.id));
    refreshHome(_ref);
    return sale;
  }

  Future<Consignment> consign(ConsignmentInput input, {required String idempotencyKey}) async {
    final consignment = await _ref.read(consignmentsRepositoryProvider).create(input, idempotencyKey: idempotencyKey);
    _ref.read(consignmentDetailProvider(consignment.id).notifier).replace(consignment);
    _ref.invalidate(consignmentsListProvider);
    _stockLeft(input.tripId);
    return consignment;
  }

  Future<Partnership> propose(
    int dalalId, {
    required double commissionPct,
    double? wagePct,
    String? message,
    required String idempotencyKey,
  }) async {
    final partnership = await _ref
        .read(dalalsRepositoryProvider)
        .propose(
          dalalId,
          commissionPct: commissionPct,
          wagePct: wagePct,
          message: message,
          idempotencyKey: idempotencyKey,
        );
    _ref.invalidate(dalalsProvider);
    return partnership;
  }

  Future<Customer> addCustomer({required String name, String? phone, required String idempotencyKey}) async {
    final customer = await _ref
        .read(customersRepositoryProvider)
        .create(name: name, phone: phone, idempotencyKey: idempotencyKey);
    _ref.invalidate(activeCustomersProvider);
    return customer;
  }

  /// Catch left the owner's stock: the trip (its available kg, maybe sold
  /// out), its sales, the lists, the stock and the home all move.
  void _stockLeft(int tripId) {
    _ref
      ..invalidate(tripDetailProvider(tripId))
      ..invalidate(tripSalesProvider(tripId))
      ..invalidate(tripsListProvider)
      ..invalidate(salesListProvider)
      ..invalidate(stockProvider)
      ..invalidate(stockMovementsProvider);
    refreshHome(_ref);
  }
}
