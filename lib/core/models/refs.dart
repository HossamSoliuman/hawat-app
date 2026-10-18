import 'package:freezed_annotation/freezed_annotation.dart';

part 'refs.freezed.dart';
part 'refs.g.dart';

/// `{id, name}` as the API nests ports, types and payment methods.
@freezed
abstract class IdName with _$IdName {
  const factory IdName({int? id, String? name}) = _IdName;

  factory IdName.fromJson(Map<String, dynamic> json) => _$IdNameFromJson(json);
}

/// A person on a record: captain, counter, customer.
@freezed
abstract class PersonRef with _$PersonRef {
  const factory PersonRef({int? id, String? name, String? phone}) = _PersonRef;

  factory PersonRef.fromJson(Map<String, dynamic> json) => _$PersonRefFromJson(json);
}

@freezed
abstract class SpeciesRef with _$SpeciesRef {
  const factory SpeciesRef({required int id, required String name, String? nameSci}) = _SpeciesRef;

  factory SpeciesRef.fromJson(Map<String, dynamic> json) => _$SpeciesRefFromJson(json);
}

@freezed
abstract class TripNumberRef with _$TripNumberRef {
  const factory TripNumberRef({required int id, required String tripNumber}) = _TripNumberRef;

  factory TripNumberRef.fromJson(Map<String, dynamic> json) => _$TripNumberRefFromJson(json);
}
