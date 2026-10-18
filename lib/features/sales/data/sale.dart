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

@freezed
abstract class Consignment with _$Consignment {
  const factory Consignment({
    required int id,
    required String consignmentNumber,
    String? status,
    PersonRef? dalal,
    TripNumberRef? trip,
    @Default(0) double totalKg,
    DateTime? sentAt,
  }) = _Consignment;

  factory Consignment.fromJson(Map<String, dynamic> json) => _$ConsignmentFromJson(json);
}
