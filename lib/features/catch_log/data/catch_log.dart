import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/models/refs.dart';

part 'catch_log.freezed.dart';
part 'catch_log.g.dart';

@freezed
abstract class CatchLogEntry with _$CatchLogEntry {
  const factory CatchLogEntry({
    required int id,
    SpeciesRef? species,
    CatchLogTrip? trip,
    double? captainKg,
    double? countedKg,
    String? captainNotes,
    String? counterNotes,
    @Default(false) bool verified,
    DateTime? recordedAt,
  }) = _CatchLogEntry;

  factory CatchLogEntry.fromJson(Map<String, dynamic> json) => _$CatchLogEntryFromJson(json);
}

@freezed
abstract class CatchLogTrip with _$CatchLogTrip {
  const factory CatchLogTrip({
    required int id,
    required String tripNumber,
    String? status,
    String? appStatus,
    String? boat,
    String? captain,
    DateTime? returnTime,
  }) = _CatchLogTrip;

  factory CatchLogTrip.fromJson(Map<String, dynamic> json) => _$CatchLogTripFromJson(json);
}

@freezed
abstract class CatchLogSummary with _$CatchLogSummary {
  const factory CatchLogSummary({
    @Default(CatchLogTotals()) CatchLogTotals totals,
    @Default(<SpeciesCatch>[]) List<SpeciesCatch> bySpecies,
  }) = _CatchLogSummary;

  factory CatchLogSummary.fromJson(Map<String, dynamic> json) => _$CatchLogSummaryFromJson(json);
}

@freezed
abstract class CatchLogTotals with _$CatchLogTotals {
  const factory CatchLogTotals({@Default(0) double captainKg, @Default(0) double countedKg, @Default(0) int species}) =
      _CatchLogTotals;

  factory CatchLogTotals.fromJson(Map<String, dynamic> json) => _$CatchLogTotalsFromJson(json);
}

@freezed
abstract class SpeciesCatch with _$SpeciesCatch {
  const factory SpeciesCatch({
    required int speciesId,
    required String species,
    String? nameSci,
    @Default(0) int trips,
    @Default(0) double captainKg,
    @Default(0) double countedKg,
  }) = _SpeciesCatch;

  factory SpeciesCatch.fromJson(Map<String, dynamic> json) => _$SpeciesCatchFromJson(json);
}
