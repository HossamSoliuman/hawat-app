import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/models/refs.dart';

part 'fleet.freezed.dart';
part 'fleet.g.dart';

/// A boat as the trip form needs it: its captain, port, crew, licence and setup.
@freezed
abstract class Boat with _$Boat {
  const Boat._();

  const factory Boat({
    required int id,
    required String name,
    String? boatNumber,
    String? status,
    IdName? port,
    PersonRef? captain,
    @Default(0) int crewCount,
    BoatLicense? license,
    BoatSetup? setup,
  }) = _Boat;

  factory Boat.fromJson(Map<String, dynamic> json) => _$BoatFromJson(json);

  bool get isActive => status == null || status == 'نشط';
}

@freezed
abstract class BoatLicense with _$BoatLicense {
  const factory BoatLicense({String? number, DateTime? expiry}) = _BoatLicense;

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

/// A captain record (`/owner/captains`): a fisher without an account.
@freezed
abstract class Captain with _$Captain {
  const Captain._();

  const factory Captain({required int id, required String name, String? phone, String? status, IdName? boat}) =
      _Captain;

  factory Captain.fromJson(Map<String, dynamic> json) => _$CaptainFromJson(json);

  bool get isActive => status == null || status == 'نشط';
}
