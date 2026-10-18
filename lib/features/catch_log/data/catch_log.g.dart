// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catch_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CatchLogEntry _$CatchLogEntryFromJson(Map<String, dynamic> json) => _CatchLogEntry(
  id: (json['id'] as num).toInt(),
  species: json['species'] == null ? null : SpeciesRef.fromJson(json['species'] as Map<String, dynamic>),
  trip: json['trip'] == null ? null : CatchLogTrip.fromJson(json['trip'] as Map<String, dynamic>),
  captainKg: (json['captain_kg'] as num?)?.toDouble(),
  countedKg: (json['counted_kg'] as num?)?.toDouble(),
  captainNotes: json['captain_notes'] as String?,
  counterNotes: json['counter_notes'] as String?,
  verified: json['verified'] as bool? ?? false,
  recordedAt: json['recorded_at'] == null ? null : DateTime.parse(json['recorded_at'] as String),
);

Map<String, dynamic> _$CatchLogEntryToJson(_CatchLogEntry instance) => <String, dynamic>{
  'id': instance.id,
  'species': instance.species?.toJson(),
  'trip': instance.trip?.toJson(),
  'captain_kg': instance.captainKg,
  'counted_kg': instance.countedKg,
  'captain_notes': instance.captainNotes,
  'counter_notes': instance.counterNotes,
  'verified': instance.verified,
  'recorded_at': instance.recordedAt?.toIso8601String(),
};

_CatchLogTrip _$CatchLogTripFromJson(Map<String, dynamic> json) => _CatchLogTrip(
  id: (json['id'] as num).toInt(),
  tripNumber: json['trip_number'] as String,
  status: json['status'] as String?,
  appStatus: json['app_status'] as String?,
  boat: json['boat'] as String?,
  captain: json['captain'] as String?,
  returnTime: json['return_time'] == null ? null : DateTime.parse(json['return_time'] as String),
);

Map<String, dynamic> _$CatchLogTripToJson(_CatchLogTrip instance) => <String, dynamic>{
  'id': instance.id,
  'trip_number': instance.tripNumber,
  'status': instance.status,
  'app_status': instance.appStatus,
  'boat': instance.boat,
  'captain': instance.captain,
  'return_time': instance.returnTime?.toIso8601String(),
};

_CatchLogSummary _$CatchLogSummaryFromJson(Map<String, dynamic> json) => _CatchLogSummary(
  totals: json['totals'] == null
      ? const CatchLogTotals()
      : CatchLogTotals.fromJson(json['totals'] as Map<String, dynamic>),
  bySpecies:
      (json['by_species'] as List<dynamic>?)?.map((e) => SpeciesCatch.fromJson(e as Map<String, dynamic>)).toList() ??
      const <SpeciesCatch>[],
);

Map<String, dynamic> _$CatchLogSummaryToJson(_CatchLogSummary instance) => <String, dynamic>{
  'totals': instance.totals.toJson(),
  'by_species': instance.bySpecies.map((e) => e.toJson()).toList(),
};

_CatchLogTotals _$CatchLogTotalsFromJson(Map<String, dynamic> json) => _CatchLogTotals(
  captainKg: (json['captain_kg'] as num?)?.toDouble() ?? 0,
  countedKg: (json['counted_kg'] as num?)?.toDouble() ?? 0,
  species: (json['species'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CatchLogTotalsToJson(_CatchLogTotals instance) => <String, dynamic>{
  'captain_kg': instance.captainKg,
  'counted_kg': instance.countedKg,
  'species': instance.species,
};

_SpeciesCatch _$SpeciesCatchFromJson(Map<String, dynamic> json) => _SpeciesCatch(
  speciesId: (json['species_id'] as num).toInt(),
  species: json['species'] as String,
  nameSci: json['name_sci'] as String?,
  trips: (json['trips'] as num?)?.toInt() ?? 0,
  captainKg: (json['captain_kg'] as num?)?.toDouble() ?? 0,
  countedKg: (json['counted_kg'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$SpeciesCatchToJson(_SpeciesCatch instance) => <String, dynamic>{
  'species_id': instance.speciesId,
  'species': instance.species,
  'name_sci': instance.nameSci,
  'trips': instance.trips,
  'captain_kg': instance.captainKg,
  'counted_kg': instance.countedKg,
};
