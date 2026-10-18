import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/models/refs.dart';

part 'trip.freezed.dart';
part 'trip.g.dart';

/// Ministry statuses (`Trip.status`) and sale statuses, exactly as the API sends them.
abstract final class TripStatus {
  static const scheduled = 'مجدولة';
  static const atSea = 'في البحر';
  static const returned = 'عادت للميناء';
  static const awaitingCount = 'بانتظار الإحصاء';
  static const counting = 'تحت الإحصاء';
  static const awaitingApproval = 'بانتظار الاعتماد';
  static const approved = 'معتمدة';
  static const cancelled = 'ملغاة';

  static const saleNotStarted = 'لم يبدأ';
  static const saleOpen = 'قيد البيع';
  static const saleDone = 'مباعة';
}

/// Where a trip is in the owner's day, mapped from the ministry status and
/// the sale status. The five-step progress bar and every status chip read it.
enum TripPhase {
  scheduled(0),
  atSea(1),
  awaitingCounter(2),
  counting(3),
  forSale(4),
  sold(4),
  counted(4),
  cancelled(0);

  const TripPhase(this.step);

  /// Index on the 5-step bar: مجدولة → في البحر → بانتظار العداد → جارية العد → جاهزة للبيع.
  final int step;

  static TripPhase of(String status, String saleStatus) => switch (status) {
    TripStatus.scheduled => TripPhase.scheduled,
    TripStatus.atSea => TripPhase.atSea,
    TripStatus.returned || TripStatus.awaitingCount => TripPhase.awaitingCounter,
    TripStatus.counting => TripPhase.counting,
    TripStatus.awaitingApproval || TripStatus.approved => switch (saleStatus) {
      TripStatus.saleOpen => TripPhase.forSale,
      TripStatus.saleDone => TripPhase.sold,
      _ => TripPhase.counted,
    },
    TripStatus.cancelled => TripPhase.cancelled,
    _ => TripPhase.scheduled,
  };
}

/// The list tabs, as the server's `stage` filter: they never overlap.
enum TripStage {
  scheduled('scheduled'),
  inProgress('in_progress'),
  forSale('for_sale'),
  done('done'),
  cancelled('cancelled');

  const TripStage(this.apiValue);

  final String apiValue;

  static TripStage? parse(String? value) => TripStage.values.where((s) => s.apiValue == value).firstOrNull;
}

@freezed
abstract class Trip with _$Trip {
  const Trip._();

  const factory Trip({
    required int id,
    required String tripNumber,
    required String status,
    String? appStatus,
    @Default(0) int progressStep,
    @Default(TripStatus.saleNotStarted) String saleStatus,
    @Default(false) bool canSell,
    TripBoat? boat,
    PersonRef? captain,
    PersonRef? counter,
    IdName? departurePort,
    IdName? returnPort,
    IdName? tripType,
    @Default(0) int crewCount,
    int? plannedDays,
    String? gearType,
    String? licenseNumber,
    DateTime? departureTime,
    DateTime? startedAt,
    DateTime? returnTime,
    DateTime? catchSubmittedAt,
    DateTime? receivedAt,
    DateTime? countedAt,
    DateTime? cancelledAt,
    String? cancelReason,
    double? durationHours,
    double? captainInputKg,
    double? actualWeightKg,
    double? diffKg,
    double? approvedKg,
    String? notes,
    @Default(<CatchRecord>[]) List<CatchRecord> catchRecords,
    @Default(<AvailableLine>[]) List<AvailableLine> availableStock,
    DateTime? createdAt,
  }) = _Trip;

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);

  TripPhase get phase => TripPhase.of(status, saleStatus);

  bool get canStart => status == TripStatus.scheduled;

  bool get canCancel => status == TripStatus.scheduled || status == TripStatus.atSea;

  bool get canSubmitCatch => status == TripStatus.atSea;

  bool get canEdit => status == TripStatus.scheduled;

  /// The port where the counter receives the catch: the return port, else the departure port.
  String? get countingPort => returnPort?.name ?? departurePort?.name;

  /// One line per species, even if an old count recorded a species twice.
  List<AvailableLine> get availableLines {
    final seen = <int>{};
    return [
      for (final line in availableStock)
        if (seen.add(line.speciesId)) line,
    ];
  }

  double get availableKg => availableLines.fold(0, (sum, line) => sum + line.availableKg);
}

@freezed
abstract class TripBoat with _$TripBoat {
  const factory TripBoat({required int id, required String name, String? boatNumber}) = _TripBoat;

  factory TripBoat.fromJson(Map<String, dynamic> json) => _$TripBoatFromJson(json);
}

/// One species line: what was declared before counting (`captainKg`) and what the counter found.
@freezed
abstract class CatchRecord with _$CatchRecord {
  const CatchRecord._();

  const factory CatchRecord({
    required int id,
    SpeciesRef? species,
    double? captainKg,
    double? countedKg,
    @Default(0) double quantityKg,
    String? captainNotes,
    String? counterNotes,
    @Default(false) bool verified,
    String? addedBy,
    DateTime? recordedAt,
  }) = _CatchRecord;

  factory CatchRecord.fromJson(Map<String, dynamic> json) => _$CatchRecordFromJson(json);

  /// What was declared before counting; older records only carry the line weight.
  double get declaredKg => captainKg ?? quantityKg;
}

@freezed
abstract class AvailableLine with _$AvailableLine {
  const factory AvailableLine({required int speciesId, String? species, @Default(0) double availableKg}) =
      _AvailableLine;

  factory AvailableLine.fromJson(Map<String, dynamic> json) => _$AvailableLineFromJson(json);
}

/// The body of `POST /owner/trips` and `PUT /owner/trips/{trip}`.
@freezed
abstract class TripInput with _$TripInput {
  const factory TripInput({
    int? boatId,
    int? captainId,
    int? departurePortId,
    int? returnPortId,
    int? tripTypeId,
    int? crewCount,
    DateTime? departureTime,
    int? plannedDays,
    String? gearType,
    String? licenseNumber,
    String? notes,
  }) = _TripInput;

  factory TripInput.fromTrip(Trip trip) => TripInput(
    boatId: trip.boat?.id,
    captainId: trip.captain?.id,
    departurePortId: trip.departurePort?.id,
    returnPortId: trip.returnPort?.id,
    tripTypeId: trip.tripType?.id,
    crewCount: trip.crewCount,
    departureTime: trip.departureTime,
    plannedDays: trip.plannedDays,
    gearType: trip.gearType,
    licenseNumber: trip.licenseNumber,
    notes: trip.notes,
  );
}

extension TripInputJson on TripInput {
  Map<String, dynamic> toJson() => {
    'boat_id': boatId,
    'captain_id': captainId,
    'departure_port_id': departurePortId,
    'return_port_id': returnPortId,
    'trip_type_id': tripTypeId,
    'crew_count': crewCount,
    // The server stores Riyadh time; send the moment with its offset.
    'departure_time': departureTime?.toUtc().toIso8601String(),
    'planned_days': plannedDays,
    'gear_type': (gearType?.trim().isEmpty ?? true) ? null : gearType!.trim(),
    'license_number': (licenseNumber?.trim().isEmpty ?? true) ? null : licenseNumber!.trim(),
    'notes': (notes?.trim().isEmpty ?? true) ? null : notes!.trim(),
  };
}

/// One line the owner declares when the boat comes back.
@freezed
abstract class CatchLineInput with _$CatchLineInput {
  const factory CatchLineInput({required int speciesId, required double weightKg, String? notes}) = _CatchLineInput;

  factory CatchLineInput.fromJson(Map<String, dynamic> json) => _$CatchLineInputFromJson(json);
}
