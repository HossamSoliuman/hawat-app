// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookups.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Lookups _$LookupsFromJson(Map<String, dynamic> json) => _Lookups(
  species:
      (json['species'] as List<dynamic>?)
          ?.map((e) => Species.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Species>[],
  ports:
      (json['ports'] as List<dynamic>?)
          ?.map((e) => Port.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Port>[],
  gearTypes:
      (json['gear_types'] as List<dynamic>?)
          ?.map((e) => IdName.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <IdName>[],
  tripTypes:
      (json['trip_types'] as List<dynamic>?)
          ?.map((e) => IdName.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <IdName>[],
  paymentMethods:
      (json['payment_methods'] as List<dynamic>?)
          ?.map((e) => IdName.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <IdName>[],
  boatCategories:
      (json['boat_categories'] as List<dynamic>?)
          ?.map((e) => IdName.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <IdName>[],
  boatTypes:
      (json['boat_types'] as List<dynamic>?)
          ?.map((e) => IdName.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <IdName>[],
  idTypes:
      (json['id_types'] as List<dynamic>?)
          ?.map((e) => IdName.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <IdName>[],
  fisherRoles:
      (json['fisher_roles'] as List<dynamic>?)
          ?.map((e) => IdName.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <IdName>[],
  maintenanceTypes:
      (json['maintenance_types'] as List<dynamic>?)
          ?.map((e) => IdName.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <IdName>[],
  customerTypes:
      (json['customer_types'] as List<dynamic>?)
          ?.map((e) => IdName.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <IdName>[],
  jobTitles:
      (json['job_titles'] as List<dynamic>?)
          ?.map((e) => IdName.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <IdName>[],
);

Map<String, dynamic> _$LookupsToJson(_Lookups instance) => <String, dynamic>{
  'species': instance.species.map((e) => e.toJson()).toList(),
  'ports': instance.ports.map((e) => e.toJson()).toList(),
  'gear_types': instance.gearTypes.map((e) => e.toJson()).toList(),
  'trip_types': instance.tripTypes.map((e) => e.toJson()).toList(),
  'payment_methods': instance.paymentMethods.map((e) => e.toJson()).toList(),
  'boat_categories': instance.boatCategories.map((e) => e.toJson()).toList(),
  'boat_types': instance.boatTypes.map((e) => e.toJson()).toList(),
  'id_types': instance.idTypes.map((e) => e.toJson()).toList(),
  'fisher_roles': instance.fisherRoles.map((e) => e.toJson()).toList(),
  'maintenance_types': instance.maintenanceTypes
      .map((e) => e.toJson())
      .toList(),
  'customer_types': instance.customerTypes.map((e) => e.toJson()).toList(),
  'job_titles': instance.jobTitles.map((e) => e.toJson()).toList(),
};

_Species _$SpeciesFromJson(Map<String, dynamic> json) => _Species(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  nameSci: json['name_sci'] as String?,
  category: json['category'] as String?,
);

Map<String, dynamic> _$SpeciesToJson(_Species instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'name_sci': instance.nameSci,
  'category': instance.category,
};

_Port _$PortFromJson(Map<String, dynamic> json) => _Port(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  governorate: json['governorate'] == null
      ? null
      : PortGovernorate.fromJson(json['governorate'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PortToJson(_Port instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'governorate': instance.governorate?.toJson(),
};

_PortGovernorate _$PortGovernorateFromJson(Map<String, dynamic> json) =>
    _PortGovernorate(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      region: json['region'] as String?,
    );

Map<String, dynamic> _$PortGovernorateToJson(_PortGovernorate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'region': instance.region,
    };
