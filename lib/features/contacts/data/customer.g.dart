// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Customer _$CustomerFromJson(Map<String, dynamic> json) => _Customer(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  type: json['type'] == null
      ? null
      : IdName.fromJson(json['type'] as Map<String, dynamic>),
  notes: json['notes'] as String?,
  status: json['status'] as String?,
  salesCount: (json['sales_count'] as num?)?.toInt() ?? 0,
  salesTotal: (json['sales_total'] as num?)?.toDouble(),
);

Map<String, dynamic> _$CustomerToJson(_Customer instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
  'email': instance.email,
  'type': instance.type?.toJson(),
  'notes': instance.notes,
  'status': instance.status,
  'sales_count': instance.salesCount,
  'sales_total': instance.salesTotal,
};

_Vendor _$VendorFromJson(Map<String, dynamic> json) => _Vendor(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  notes: json['notes'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$VendorToJson(_Vendor instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
  'email': instance.email,
  'notes': instance.notes,
  'status': instance.status,
};

_Employee _$EmployeeFromJson(Map<String, dynamic> json) => _Employee(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  idNumber: json['id_number'] as String?,
  nationality: json['nationality'] as String?,
  jobTitle: json['job_title'] == null
      ? null
      : IdName.fromJson(json['job_title'] as Map<String, dynamic>),
  notes: json['notes'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$EmployeeToJson(_Employee instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
  'email': instance.email,
  'id_number': instance.idNumber,
  'nationality': instance.nationality,
  'job_title': instance.jobTitle?.toJson(),
  'notes': instance.notes,
  'status': instance.status,
};
