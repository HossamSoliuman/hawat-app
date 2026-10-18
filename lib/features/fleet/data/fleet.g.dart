// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fleet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Boat _$BoatFromJson(Map<String, dynamic> json) => _Boat(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  boatNumber: json['boat_number'] as String?,
  status: json['status'] as String?,
  port: json['port'] == null ? null : IdName.fromJson(json['port'] as Map<String, dynamic>),
  captain: json['captain'] == null ? null : PersonRef.fromJson(json['captain'] as Map<String, dynamic>),
  crewCount: (json['crew_count'] as num?)?.toInt() ?? 0,
  license: json['license'] == null ? null : BoatLicense.fromJson(json['license'] as Map<String, dynamic>),
  setup: json['setup'] == null ? null : BoatSetup.fromJson(json['setup'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BoatToJson(_Boat instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'boat_number': instance.boatNumber,
  'status': instance.status,
  'port': instance.port?.toJson(),
  'captain': instance.captain?.toJson(),
  'crew_count': instance.crewCount,
  'license': instance.license?.toJson(),
  'setup': instance.setup?.toJson(),
};

_BoatLicense _$BoatLicenseFromJson(Map<String, dynamic> json) => _BoatLicense(
  number: json['number'] as String?,
  expiry: json['expiry'] == null ? null : DateTime.parse(json['expiry'] as String),
);

Map<String, dynamic> _$BoatLicenseToJson(_BoatLicense instance) => <String, dynamic>{
  'number': instance.number,
  'expiry': instance.expiry?.toIso8601String(),
};

_BoatSetup _$BoatSetupFromJson(Map<String, dynamic> json) => _BoatSetup(
  ready: json['ready'] as bool? ?? true,
  missing:
      (json['missing'] as List<dynamic>?)?.map((e) => SetupItem.fromJson(e as Map<String, dynamic>)).toList() ??
      const <SetupItem>[],
  warnings:
      (json['warnings'] as List<dynamic>?)?.map((e) => SetupItem.fromJson(e as Map<String, dynamic>)).toList() ??
      const <SetupItem>[],
);

Map<String, dynamic> _$BoatSetupToJson(_BoatSetup instance) => <String, dynamic>{
  'ready': instance.ready,
  'missing': instance.missing.map((e) => e.toJson()).toList(),
  'warnings': instance.warnings.map((e) => e.toJson()).toList(),
};

_SetupItem _$SetupItemFromJson(Map<String, dynamic> json) =>
    _SetupItem(key: json['key'] as String, label: json['label'] as String);

Map<String, dynamic> _$SetupItemToJson(_SetupItem instance) => <String, dynamic>{
  'key': instance.key,
  'label': instance.label,
};

_Captain _$CaptainFromJson(Map<String, dynamic> json) => _Captain(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  phone: json['phone'] as String?,
  status: json['status'] as String?,
  boat: json['boat'] == null ? null : IdName.fromJson(json['boat'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CaptainToJson(_Captain instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
  'status': instance.status,
  'boat': instance.boat?.toJson(),
};
