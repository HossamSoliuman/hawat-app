import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/models/refs.dart';

part 'sale.freezed.dart';
part 'sale.g.dart';

/// Whether an invoice is collected, read from the server's own amounts.
enum PaymentState { paid, partial, unpaid }

@freezed
abstract class Sale with _$Sale {
  const Sale._();

  const factory Sale({
    required int id,
    required String invoiceNumber,
    String? status,
    TripNumberRef? trip,
    PersonRef? customer,
    IdName? paymentMethod,
    IdName? paymentStatus,
    @Default(0) double subtotal,
    @Default(0) double discount,
    @Default(0) double total,
    @Default(0) double paidAmount,
    @Default(0) double remaining,
    int? itemsCount,
    double? totalKg,
    @Default(<SaleItem>[]) List<SaleItem> items,
    String? invoiceUrl,
    DateTime? soldAt,
    String? notes,
  }) = _Sale;

  factory Sale.fromJson(Map<String, dynamic> json) => _$SaleFromJson(json);

  PaymentState get paymentState {
    if (remaining <= 0.004) return PaymentState.paid;
    return paidAmount > 0 ? PaymentState.partial : PaymentState.unpaid;
  }
}

@freezed
abstract class SaleItem with _$SaleItem {
  const factory SaleItem({
    required int id,
    SpeciesRef? species,
    @Default(0) double weightKg,
    @Default(0) double pricePerKg,
    @Default(0) double total,
  }) = _SaleItem;

  factory SaleItem.fromJson(Map<String, dynamic> json) => _$SaleItemFromJson(json);
}

/// `totals` of `GET /owner/sales`: every invoice matching the filters, not one page.
@freezed
abstract class SalesTotals with _$SalesTotals {
  const factory SalesTotals({@Default(0) int count, @Default(0) double total, @Default(0) double remaining}) =
      _SalesTotals;

  factory SalesTotals.fromJson(Map<String, dynamic> json) => _$SalesTotalsFromJson(json);
}

/// The body of `POST /owner/sales`. Lines of one species may carry different prices.
@freezed
abstract class SaleInput with _$SaleInput {
  const factory SaleInput({
    required int tripId,
    int? customerId,
    int? paymentMethodId,
    double? discount,

    /// Null = paid in full.
    double? paidAmount,
    String? notes,
    required List<SaleLineInput> items,
  }) = _SaleInput;
}

@freezed
abstract class SaleLineInput with _$SaleLineInput {
  const factory SaleLineInput({required int speciesId, required double weightKg, required double pricePerKg}) =
      _SaleLineInput;
}

extension SaleInputJson on SaleInput {
  Map<String, dynamic> toJson() => {
    'trip_id': tripId,
    'customer_id': customerId,
    'payment_method_id': paymentMethodId,
    if (discount != null && discount! > 0) 'discount': discount,
    'paid_amount': ?paidAmount,
    if (notes?.trim().isNotEmpty ?? false) 'notes': notes!.trim(),
    'items': [
      for (final line in items)
        {'species_id': line.speciesId, 'weight_kg': line.weightKg, 'price_per_kg': line.pricePerKg},
    ],
  };
}
