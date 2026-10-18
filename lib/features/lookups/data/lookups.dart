import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/models/refs.dart';

part 'lookups.freezed.dart';
part 'lookups.g.dart';

/// `GET /lookups`: every reference list in one response, cached on the device.
@freezed
abstract class Lookups with _$Lookups {
  const factory Lookups({
    @Default(<Species>[]) List<Species> species,
    @Default(<Port>[]) List<Port> ports,
    @Default(<IdName>[]) List<IdName> gearTypes,
    @Default(<IdName>[]) List<IdName> tripTypes,
    @Default(<IdName>[]) List<IdName> paymentMethods,
  }) = _Lookups;

  factory Lookups.fromJson(Map<String, dynamic> json) => _$LookupsFromJson(json);
}

@freezed
abstract class Species with _$Species {
  const factory Species({required int id, required String name, String? nameSci, String? category}) = _Species;

  factory Species.fromJson(Map<String, dynamic> json) => _$SpeciesFromJson(json);
}

@freezed
abstract class Port with _$Port {
  const factory Port({required int id, required String name, PortGovernorate? governorate}) = _Port;

  factory Port.fromJson(Map<String, dynamic> json) => _$PortFromJson(json);
}

@freezed
abstract class PortGovernorate with _$PortGovernorate {
  const factory PortGovernorate({int? id, String? name, String? region}) = _PortGovernorate;

  factory PortGovernorate.fromJson(Map<String, dynamic> json) => _$PortGovernorateFromJson(json);
}
