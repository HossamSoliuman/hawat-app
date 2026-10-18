// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Sale _$SaleFromJson(Map<String, dynamic> json) => _Sale(
  id: (json['id'] as num).toInt(),
  invoiceNumber: json['invoice_number'] as String,
  status: json['status'] as String?,
  trip: json['trip'] == null
      ? null
      : TripNumberRef.fromJson(json['trip'] as Map<String, dynamic>),
  customer: json['customer'] == null
      ? null
      : PersonRef.fromJson(json['customer'] as Map<String, dynamic>),
  paymentMethod: json['payment_method'] == null
      ? null
      : IdName.fromJson(json['payment_method'] as Map<String, dynamic>),
  paymentStatus: json['payment_status'] == null
      ? null
      : IdName.fromJson(json['payment_status'] as Map<String, dynamic>),
  subtotal: (json['subtotal'] as num?)?.toDouble() ?? 0,
  discount: (json['discount'] as num?)?.toDouble() ?? 0,
  total: (json['total'] as num?)?.toDouble() ?? 0,
  paidAmount: (json['paid_amount'] as num?)?.toDouble() ?? 0,
  remaining: (json['remaining'] as num?)?.toDouble() ?? 0,
  itemsCount: (json['items_count'] as num?)?.toInt(),
  totalKg: (json['total_kg'] as num?)?.toDouble(),
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => SaleItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <SaleItem>[],
  invoiceUrl: json['invoice_url'] as String?,
  soldAt: json['sold_at'] == null
      ? null
      : DateTime.parse(json['sold_at'] as String),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$SaleToJson(_Sale instance) => <String, dynamic>{
  'id': instance.id,
  'invoice_number': instance.invoiceNumber,
  'status': instance.status,
  'trip': instance.trip?.toJson(),
  'customer': instance.customer?.toJson(),
  'payment_method': instance.paymentMethod?.toJson(),
  'payment_status': instance.paymentStatus?.toJson(),
  'subtotal': instance.subtotal,
  'discount': instance.discount,
  'total': instance.total,
  'paid_amount': instance.paidAmount,
  'remaining': instance.remaining,
  'items_count': instance.itemsCount,
  'total_kg': instance.totalKg,
  'items': instance.items.map((e) => e.toJson()).toList(),
  'invoice_url': instance.invoiceUrl,
  'sold_at': instance.soldAt?.toIso8601String(),
  'notes': instance.notes,
};

_SaleItem _$SaleItemFromJson(Map<String, dynamic> json) => _SaleItem(
  id: (json['id'] as num).toInt(),
  species: json['species'] == null
      ? null
      : SpeciesRef.fromJson(json['species'] as Map<String, dynamic>),
  weightKg: (json['weight_kg'] as num?)?.toDouble() ?? 0,
  pricePerKg: (json['price_per_kg'] as num?)?.toDouble() ?? 0,
  total: (json['total'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$SaleItemToJson(_SaleItem instance) => <String, dynamic>{
  'id': instance.id,
  'species': instance.species?.toJson(),
  'weight_kg': instance.weightKg,
  'price_per_kg': instance.pricePerKg,
  'total': instance.total,
};

_Consignment _$ConsignmentFromJson(Map<String, dynamic> json) => _Consignment(
  id: (json['id'] as num).toInt(),
  consignmentNumber: json['consignment_number'] as String,
  status: json['status'] as String?,
  dalal: json['dalal'] == null
      ? null
      : PersonRef.fromJson(json['dalal'] as Map<String, dynamic>),
  trip: json['trip'] == null
      ? null
      : TripNumberRef.fromJson(json['trip'] as Map<String, dynamic>),
  totalKg: (json['total_kg'] as num?)?.toDouble() ?? 0,
  sentAt: json['sent_at'] == null
      ? null
      : DateTime.parse(json['sent_at'] as String),
);

Map<String, dynamic> _$ConsignmentToJson(_Consignment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'consignment_number': instance.consignmentNumber,
      'status': instance.status,
      'dalal': instance.dalal?.toJson(),
      'trip': instance.trip?.toJson(),
      'total_kg': instance.totalKg,
      'sent_at': instance.sentAt?.toIso8601String(),
    };
