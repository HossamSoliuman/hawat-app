// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IdName _$IdNameFromJson(Map<String, dynamic> json) =>
    _IdName(id: (json['id'] as num?)?.toInt(), name: json['name'] as String?);

Map<String, dynamic> _$IdNameToJson(_IdName instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};

_PersonRef _$PersonRefFromJson(Map<String, dynamic> json) => _PersonRef(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  phone: json['phone'] as String?,
);

Map<String, dynamic> _$PersonRefToJson(_PersonRef instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
    };

_SpeciesRef _$SpeciesRefFromJson(Map<String, dynamic> json) => _SpeciesRef(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  nameSci: json['name_sci'] as String?,
);

Map<String, dynamic> _$SpeciesRefToJson(_SpeciesRef instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_sci': instance.nameSci,
    };

_TripNumberRef _$TripNumberRefFromJson(Map<String, dynamic> json) =>
    _TripNumberRef(
      id: (json['id'] as num).toInt(),
      tripNumber: json['trip_number'] as String,
    );

Map<String, dynamic> _$TripNumberRefToJson(_TripNumberRef instance) =>
    <String, dynamic>{'id': instance.id, 'trip_number': instance.tripNumber};
