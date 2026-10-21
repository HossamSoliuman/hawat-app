import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/models/refs.dart';

part 'fleet.freezed.dart';
part 'fleet.g.dart';

/// A boat (`/owner/boats`): identity, specs, licence, its captain and setup.
@freezed
abstract class Boat with _$Boat {
  const Boat._();

  const factory Boat({
    required int id,
    required String name,
    String? nameEn,
    String? boatNumber,
    String? status,
    IdName? port,
    IdName? category,
    IdName? type,
    PersonRef? captain,
    double? lengthM,
    double? widthM,
    String? color,
    String? hullNumber,
    String? bodyType,
    String? engineType,
    String? enginePower,
    String? engineStatus,
    String? callSign,
    String? serialNumber,
    double? capacity,
    @Default(0) int crewCount,
    int? crewCapacity,
    BoatLicense? license,
    DateTime? nextInspectionDate,
    BoatSetup? setup,
    @Default(0) int tripsCount,
    @Default(0) double totalCatchKg,
    int? version,
  }) = _Boat;

  factory Boat.fromJson(Map<String, dynamic> json) => _$BoatFromJson(json);

  bool get isActive => status == null || status == statusActive;

  bool get atSea => status == statusAtSea;

  static const statusActive = 'نشط';
  static const statusAtSea = 'في البحر';

  /// What the owner can pick; في البحر is set by trips alone.
  static const editableStatuses = ['نشط', 'غير نشط', 'صيانة'];

  static const licenseStatuses = ['سارية', 'منتهية', 'قيد التجديد'];
}

@freezed
abstract class BoatLicense with _$BoatLicense {
  const factory BoatLicense({
    String? type,
    String? number,
    String? status,
    String? process,
    String? area,
    DateTime? date,
    DateTime? expiry,
  }) = _BoatLicense;

  factory BoatLicense.fromJson(Map<String, dynamic> json) => _$BoatLicenseFromJson(json);
}

/// `Boat.setup`: what keeps the boat from being ready (advisory, never blocking).
@freezed
abstract class BoatSetup with _$BoatSetup {
  const factory BoatSetup({
    @Default(true) bool ready,
    @Default(<SetupItem>[]) List<SetupItem> missing,
    @Default(<SetupItem>[]) List<SetupItem> warnings,
  }) = _BoatSetup;

  factory BoatSetup.fromJson(Map<String, dynamic> json) => _$BoatSetupFromJson(json);
}

@freezed
abstract class SetupItem with _$SetupItem {
  const factory SetupItem({required String key, required String label}) = _SetupItem;

  factory SetupItem.fromJson(Map<String, dynamic> json) => _$SetupItemFromJson(json);
}

/// Captains and crew are the same record on the server (a fisher without an
/// account); only the path and the crew role differ.
enum FisherKind {
  captain('/owner/captains'),
  crew('/owner/crew');

  const FisherKind(this.path);

  final String path;

  static FisherKind parse(String? value) => value == 'crew' ? crew : captain;
}

/// A captain or crew member (`/owner/captains`, `/owner/crew`).
@freezed
abstract class Fisher with _$Fisher {
  const Fisher._();

  const factory Fisher({
    required int id,
    required String name,
    @Default(false) bool isCaptain,
    String? phone,
    String? email,
    String? avatarUrl,
    String? nationalId,
    String? nationality,
    IdName? idType,
    DateTime? iqamaIssueDate,
    DateTime? iqamaExpiryDate,
    IdName? role,
    IdName? boat,
    IdName? port,
    String? licenseNumber,
    String? licenseStatus,
    DateTime? licenseDate,
    DateTime? licenseExpiry,
    @Default(0) int experienceYears,
    @Default(0) int tripsCount,
    String? status,
    int? version,
  }) = _Fisher;

  factory Fisher.fromJson(Map<String, dynamic> json) => _$FisherFromJson(json);

  bool get isActive => status == null || status == statusActive;

  FisherKind get kind => isCaptain ? FisherKind.captain : FisherKind.crew;

  static const statusActive = 'نشط';
  static const statuses = ['نشط', 'غير نشط'];
}

/// A maintenance record (`/owner/maintenance`). Saved "مكتملة" with a cost,
/// the server posts it as an expense.
@freezed
abstract class Maintenance with _$Maintenance {
  const factory Maintenance({
    required int id,
    IdName? boat,
    IdName? type,
    DateTime? date,
    String? technician,
    double? estimatedCost,
    double? actualCost,
    String? description,
    String? status,
    MaintenanceExpense? expense,
  }) = _Maintenance;

  factory Maintenance.fromJson(Map<String, dynamic> json) => _$MaintenanceFromJson(json);

  static const statuses = ['معلقة', 'مكتملة', 'ملغاة'];
}

@freezed
abstract class MaintenanceExpense with _$MaintenanceExpense {
  const factory MaintenanceExpense({
    required int id,
    String? expenseNumber,
    @Default(0) double total,
    @Default(0) double paidAmount,
  }) = _MaintenanceExpense;

  factory MaintenanceExpense.fromJson(Map<String, dynamic> json) => _$MaintenanceExpenseFromJson(json);
}
