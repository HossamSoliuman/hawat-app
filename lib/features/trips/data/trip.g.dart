// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Trip _$TripFromJson(Map<String, dynamic> json) => _Trip(
  id: (json['id'] as num).toInt(),
  tripNumber: json['trip_number'] as String,
  status: json['status'] as String,
  appStatus: json['app_status'] as String?,
  progressStep: (json['progress_step'] as num?)?.toInt() ?? 0,
  saleStatus: json['sale_status'] as String? ?? TripStatus.saleNotStarted,
  canSell: json['can_sell'] as bool? ?? false,
  boat: json['boat'] == null ? null : TripBoat.fromJson(json['boat'] as Map<String, dynamic>),
  captain: json['captain'] == null ? null : PersonRef.fromJson(json['captain'] as Map<String, dynamic>),
  counter: json['counter'] == null ? null : PersonRef.fromJson(json['counter'] as Map<String, dynamic>),
  departurePort: json['departure_port'] == null
      ? null
      : IdName.fromJson(json['departure_port'] as Map<String, dynamic>),
  returnPort: json['return_port'] == null ? null : IdName.fromJson(json['return_port'] as Map<String, dynamic>),
  tripType: json['trip_type'] == null ? null : IdName.fromJson(json['trip_type'] as Map<String, dynamic>),
  crewCount: (json['crew_count'] as num?)?.toInt() ?? 0,
  plannedDays: (json['planned_days'] as num?)?.toInt(),
  gearType: json['gear_type'] as String?,
  licenseNumber: json['license_number'] as String?,
  departureTime: json['departure_time'] == null ? null : DateTime.parse(json['departure_time'] as String),
  startedAt: json['started_at'] == null ? null : DateTime.parse(json['started_at'] as String),
  returnTime: json['return_time'] == null ? null : DateTime.parse(json['return_time'] as String),
  catchSubmittedAt: json['catch_submitted_at'] == null ? null : DateTime.parse(json['catch_submitted_at'] as String),
  receivedAt: json['received_at'] == null ? null : DateTime.parse(json['received_at'] as String),
  countedAt: json['counted_at'] == null ? null : DateTime.parse(json['counted_at'] as String),
  cancelledAt: json['cancelled_at'] == null ? null : DateTime.parse(json['cancelled_at'] as String),
  cancelReason: json['cancel_reason'] as String?,
  durationHours: (json['duration_hours'] as num?)?.toDouble(),
  captainInputKg: (json['captain_input_kg'] as num?)?.toDouble(),
  actualWeightKg: (json['actual_weight_kg'] as num?)?.toDouble(),
  diffKg: (json['diff_kg'] as num?)?.toDouble(),
  approvedKg: (json['approved_kg'] as num?)?.toDouble(),
  notes: json['notes'] as String?,
  catchRecords:
      (json['catch_records'] as List<dynamic>?)?.map((e) => CatchRecord.fromJson(e as Map<String, dynamic>)).toList() ??
      const <CatchRecord>[],
  availableStock:
      (json['available_stock'] as List<dynamic>?)
          ?.map((e) => AvailableLine.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <AvailableLine>[],
  createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$TripToJson(_Trip instance) => <String, dynamic>{
  'id': instance.id,
  'trip_number': instance.tripNumber,
  'status': instance.status,
  'app_status': instance.appStatus,
  'progress_step': instance.progressStep,
  'sale_status': instance.saleStatus,
  'can_sell': instance.canSell,
  'boat': instance.boat?.toJson(),
  'captain': instance.captain?.toJson(),
  'counter': instance.counter?.toJson(),
  'departure_port': instance.departurePort?.toJson(),
  'return_port': instance.returnPort?.toJson(),
  'trip_type': instance.tripType?.toJson(),
  'crew_count': instance.crewCount,
  'planned_days': instance.plannedDays,
  'gear_type': instance.gearType,
  'license_number': instance.licenseNumber,
  'departure_time': instance.departureTime?.toIso8601String(),
  'started_at': instance.startedAt?.toIso8601String(),
  'return_time': instance.returnTime?.toIso8601String(),
  'catch_submitted_at': instance.catchSubmittedAt?.toIso8601String(),
  'received_at': instance.receivedAt?.toIso8601String(),
  'counted_at': instance.countedAt?.toIso8601String(),
  'cancelled_at': instance.cancelledAt?.toIso8601String(),
  'cancel_reason': instance.cancelReason,
  'duration_hours': instance.durationHours,
  'captain_input_kg': instance.captainInputKg,
  'actual_weight_kg': instance.actualWeightKg,
  'diff_kg': instance.diffKg,
  'approved_kg': instance.approvedKg,
  'notes': instance.notes,
  'catch_records': instance.catchRecords.map((e) => e.toJson()).toList(),
  'available_stock': instance.availableStock.map((e) => e.toJson()).toList(),
  'created_at': instance.createdAt?.toIso8601String(),
};

_TripBoat _$TripBoatFromJson(Map<String, dynamic> json) => _TripBoat(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  boatNumber: json['boat_number'] as String?,
);

Map<String, dynamic> _$TripBoatToJson(_TripBoat instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'boat_number': instance.boatNumber,
};

_CatchRecord _$CatchRecordFromJson(Map<String, dynamic> json) => _CatchRecord(
  id: (json['id'] as num).toInt(),
  species: json['species'] == null ? null : SpeciesRef.fromJson(json['species'] as Map<String, dynamic>),
  captainKg: (json['captain_kg'] as num?)?.toDouble(),
  countedKg: (json['counted_kg'] as num?)?.toDouble(),
  quantityKg: (json['quantity_kg'] as num?)?.toDouble() ?? 0,
  captainNotes: json['captain_notes'] as String?,
  counterNotes: json['counter_notes'] as String?,
  verified: json['verified'] as bool? ?? false,
  addedBy: json['added_by'] as String?,
  recordedAt: json['recorded_at'] == null ? null : DateTime.parse(json['recorded_at'] as String),
);

Map<String, dynamic> _$CatchRecordToJson(_CatchRecord instance) => <String, dynamic>{
  'id': instance.id,
  'species': instance.species?.toJson(),
  'captain_kg': instance.captainKg,
  'counted_kg': instance.countedKg,
  'quantity_kg': instance.quantityKg,
  'captain_notes': instance.captainNotes,
  'counter_notes': instance.counterNotes,
  'verified': instance.verified,
  'added_by': instance.addedBy,
  'recorded_at': instance.recordedAt?.toIso8601String(),
};

_AvailableLine _$AvailableLineFromJson(Map<String, dynamic> json) => _AvailableLine(
  speciesId: (json['species_id'] as num).toInt(),
  species: json['species'] as String?,
  availableKg: (json['available_kg'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$AvailableLineToJson(_AvailableLine instance) => <String, dynamic>{
  'species_id': instance.speciesId,
  'species': instance.species,
  'available_kg': instance.availableKg,
};

_CatchLineInput _$CatchLineInputFromJson(Map<String, dynamic> json) => _CatchLineInput(
  speciesId: (json['species_id'] as num).toInt(),
  weightKg: (json['weight_kg'] as num).toDouble(),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$CatchLineInputToJson(_CatchLineInput instance) => <String, dynamic>{
  'species_id': instance.speciesId,
  'weight_kg': instance.weightKg,
  'notes': instance.notes,
};
