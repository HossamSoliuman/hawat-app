// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consignment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => ConsignmentLine.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ConsignmentLine>[],
  sentAt: json['sent_at'] == null
      ? null
      : DateTime.parse(json['sent_at'] as String),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$ConsignmentToJson(_Consignment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'consignment_number': instance.consignmentNumber,
      'status': instance.status,
      'dalal': instance.dalal?.toJson(),
      'trip': instance.trip?.toJson(),
      'total_kg': instance.totalKg,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'sent_at': instance.sentAt?.toIso8601String(),
      'notes': instance.notes,
    };

_ConsignmentLine _$ConsignmentLineFromJson(Map<String, dynamic> json) =>
    _ConsignmentLine(
      id: (json['id'] as num).toInt(),
      species: json['species'] == null
          ? null
          : IdName.fromJson(json['species'] as Map<String, dynamic>),
      weightKg: (json['weight_kg'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$ConsignmentLineToJson(_ConsignmentLine instance) =>
    <String, dynamic>{
      'id': instance.id,
      'species': instance.species?.toJson(),
      'weight_kg': instance.weightKg,
    };
