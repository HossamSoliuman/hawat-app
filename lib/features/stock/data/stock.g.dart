// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StockLine _$StockLineFromJson(Map<String, dynamic> json) => _StockLine(
  speciesId: (json['species_id'] as num).toInt(),
  species: json['species'] as String?,
  nameSci: json['name_sci'] as String?,
  weightKg: (json['weight_kg'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$StockLineToJson(_StockLine instance) =>
    <String, dynamic>{
      'species_id': instance.speciesId,
      'species': instance.species,
      'name_sci': instance.nameSci,
      'weight_kg': instance.weightKg,
    };

_StockMovement _$StockMovementFromJson(Map<String, dynamic> json) =>
    _StockMovement(
      id: (json['id'] as num).toInt(),
      species: json['species'] as String?,
      tripNumber: json['trip_number'] as String?,
      type: json['type'] as String?,
      weightKg: (json['weight_kg'] as num?)?.toDouble() ?? 0,
      balanceAfter: (json['balance_after'] as num?)?.toDouble() ?? 0,
      user: json['user'] as String?,
      notes: json['notes'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$StockMovementToJson(_StockMovement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'species': instance.species,
      'trip_number': instance.tripNumber,
      'type': instance.type,
      'weight_kg': instance.weightKg,
      'balance_after': instance.balanceAfter,
      'user': instance.user,
      'notes': instance.notes,
      'created_at': instance.createdAt?.toIso8601String(),
    };
