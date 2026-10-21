// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fleet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Boat _$BoatFromJson(Map<String, dynamic> json) => _Boat(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  nameEn: json['name_en'] as String?,
  boatNumber: json['boat_number'] as String?,
  status: json['status'] as String?,
  port: json['port'] == null
      ? null
      : IdName.fromJson(json['port'] as Map<String, dynamic>),
  category: json['category'] == null
      ? null
      : IdName.fromJson(json['category'] as Map<String, dynamic>),
  type: json['type'] == null
      ? null
      : IdName.fromJson(json['type'] as Map<String, dynamic>),
  captain: json['captain'] == null
      ? null
      : PersonRef.fromJson(json['captain'] as Map<String, dynamic>),
  lengthM: (json['length_m'] as num?)?.toDouble(),
  widthM: (json['width_m'] as num?)?.toDouble(),
  color: json['color'] as String?,
  hullNumber: json['hull_number'] as String?,
  bodyType: json['body_type'] as String?,
  engineType: json['engine_type'] as String?,
  enginePower: json['engine_power'] as String?,
  engineStatus: json['engine_status'] as String?,
  callSign: json['call_sign'] as String?,
  serialNumber: json['serial_number'] as String?,
  capacity: (json['capacity'] as num?)?.toDouble(),
  crewCount: (json['crew_count'] as num?)?.toInt() ?? 0,
  crewCapacity: (json['crew_capacity'] as num?)?.toInt(),
  license: json['license'] == null
      ? null
      : BoatLicense.fromJson(json['license'] as Map<String, dynamic>),
  nextInspectionDate: json['next_inspection_date'] == null
      ? null
      : DateTime.parse(json['next_inspection_date'] as String),
  setup: json['setup'] == null
      ? null
      : BoatSetup.fromJson(json['setup'] as Map<String, dynamic>),
  tripsCount: (json['trips_count'] as num?)?.toInt() ?? 0,
  totalCatchKg: (json['total_catch_kg'] as num?)?.toDouble() ?? 0,
  version: (json['version'] as num?)?.toInt(),
);

Map<String, dynamic> _$BoatToJson(_Boat instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'name_en': instance.nameEn,
  'boat_number': instance.boatNumber,
  'status': instance.status,
  'port': instance.port?.toJson(),
  'category': instance.category?.toJson(),
  'type': instance.type?.toJson(),
  'captain': instance.captain?.toJson(),
  'length_m': instance.lengthM,
  'width_m': instance.widthM,
  'color': instance.color,
  'hull_number': instance.hullNumber,
  'body_type': instance.bodyType,
  'engine_type': instance.engineType,
  'engine_power': instance.enginePower,
  'engine_status': instance.engineStatus,
  'call_sign': instance.callSign,
  'serial_number': instance.serialNumber,
  'capacity': instance.capacity,
  'crew_count': instance.crewCount,
  'crew_capacity': instance.crewCapacity,
  'license': instance.license?.toJson(),
  'next_inspection_date': instance.nextInspectionDate?.toIso8601String(),
  'setup': instance.setup?.toJson(),
  'trips_count': instance.tripsCount,
  'total_catch_kg': instance.totalCatchKg,
  'version': instance.version,
};

_BoatLicense _$BoatLicenseFromJson(Map<String, dynamic> json) => _BoatLicense(
  type: json['type'] as String?,
  number: json['number'] as String?,
  status: json['status'] as String?,
  process: json['process'] as String?,
  area: json['area'] as String?,
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  expiry: json['expiry'] == null
      ? null
      : DateTime.parse(json['expiry'] as String),
);

Map<String, dynamic> _$BoatLicenseToJson(_BoatLicense instance) =>
    <String, dynamic>{
      'type': instance.type,
      'number': instance.number,
      'status': instance.status,
      'process': instance.process,
      'area': instance.area,
      'date': instance.date?.toIso8601String(),
      'expiry': instance.expiry?.toIso8601String(),
    };

_BoatSetup _$BoatSetupFromJson(Map<String, dynamic> json) => _BoatSetup(
  ready: json['ready'] as bool? ?? true,
  missing:
      (json['missing'] as List<dynamic>?)
          ?.map((e) => SetupItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <SetupItem>[],
  warnings:
      (json['warnings'] as List<dynamic>?)
          ?.map((e) => SetupItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <SetupItem>[],
);

Map<String, dynamic> _$BoatSetupToJson(_BoatSetup instance) =>
    <String, dynamic>{
      'ready': instance.ready,
      'missing': instance.missing.map((e) => e.toJson()).toList(),
      'warnings': instance.warnings.map((e) => e.toJson()).toList(),
    };

_SetupItem _$SetupItemFromJson(Map<String, dynamic> json) =>
    _SetupItem(key: json['key'] as String, label: json['label'] as String);

Map<String, dynamic> _$SetupItemToJson(_SetupItem instance) =>
    <String, dynamic>{'key': instance.key, 'label': instance.label};

_Fisher _$FisherFromJson(Map<String, dynamic> json) => _Fisher(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  isCaptain: json['is_captain'] as bool? ?? false,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  nationalId: json['national_id'] as String?,
  nationality: json['nationality'] as String?,
  idType: json['id_type'] == null
      ? null
      : IdName.fromJson(json['id_type'] as Map<String, dynamic>),
  iqamaIssueDate: json['iqama_issue_date'] == null
      ? null
      : DateTime.parse(json['iqama_issue_date'] as String),
  iqamaExpiryDate: json['iqama_expiry_date'] == null
      ? null
      : DateTime.parse(json['iqama_expiry_date'] as String),
  role: json['role'] == null
      ? null
      : IdName.fromJson(json['role'] as Map<String, dynamic>),
  boat: json['boat'] == null
      ? null
      : IdName.fromJson(json['boat'] as Map<String, dynamic>),
  port: json['port'] == null
      ? null
      : IdName.fromJson(json['port'] as Map<String, dynamic>),
  licenseNumber: json['license_number'] as String?,
  licenseStatus: json['license_status'] as String?,
  licenseDate: json['license_date'] == null
      ? null
      : DateTime.parse(json['license_date'] as String),
  licenseExpiry: json['license_expiry'] == null
      ? null
      : DateTime.parse(json['license_expiry'] as String),
  experienceYears: (json['experience_years'] as num?)?.toInt() ?? 0,
  tripsCount: (json['trips_count'] as num?)?.toInt() ?? 0,
  status: json['status'] as String?,
  version: (json['version'] as num?)?.toInt(),
);

Map<String, dynamic> _$FisherToJson(_Fisher instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'is_captain': instance.isCaptain,
  'phone': instance.phone,
  'email': instance.email,
  'avatar_url': instance.avatarUrl,
  'national_id': instance.nationalId,
  'nationality': instance.nationality,
  'id_type': instance.idType?.toJson(),
  'iqama_issue_date': instance.iqamaIssueDate?.toIso8601String(),
  'iqama_expiry_date': instance.iqamaExpiryDate?.toIso8601String(),
  'role': instance.role?.toJson(),
  'boat': instance.boat?.toJson(),
  'port': instance.port?.toJson(),
  'license_number': instance.licenseNumber,
  'license_status': instance.licenseStatus,
  'license_date': instance.licenseDate?.toIso8601String(),
  'license_expiry': instance.licenseExpiry?.toIso8601String(),
  'experience_years': instance.experienceYears,
  'trips_count': instance.tripsCount,
  'status': instance.status,
  'version': instance.version,
};

_Maintenance _$MaintenanceFromJson(Map<String, dynamic> json) => _Maintenance(
  id: (json['id'] as num).toInt(),
  boat: json['boat'] == null
      ? null
      : IdName.fromJson(json['boat'] as Map<String, dynamic>),
  type: json['type'] == null
      ? null
      : IdName.fromJson(json['type'] as Map<String, dynamic>),
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  technician: json['technician'] as String?,
  estimatedCost: (json['estimated_cost'] as num?)?.toDouble(),
  actualCost: (json['actual_cost'] as num?)?.toDouble(),
  description: json['description'] as String?,
  status: json['status'] as String?,
  expense: json['expense'] == null
      ? null
      : MaintenanceExpense.fromJson(json['expense'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MaintenanceToJson(_Maintenance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'boat': instance.boat?.toJson(),
      'type': instance.type?.toJson(),
      'date': instance.date?.toIso8601String(),
      'technician': instance.technician,
      'estimated_cost': instance.estimatedCost,
      'actual_cost': instance.actualCost,
      'description': instance.description,
      'status': instance.status,
      'expense': instance.expense?.toJson(),
    };

_MaintenanceExpense _$MaintenanceExpenseFromJson(Map<String, dynamic> json) =>
    _MaintenanceExpense(
      id: (json['id'] as num).toInt(),
      expenseNumber: json['expense_number'] as String?,
      total: (json['total'] as num?)?.toDouble() ?? 0,
      paidAmount: (json['paid_amount'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$MaintenanceExpenseToJson(_MaintenanceExpense instance) =>
    <String, dynamic>{
      'id': instance.id,
      'expense_number': instance.expenseNumber,
      'total': instance.total,
      'paid_amount': instance.paidAmount,
    };
