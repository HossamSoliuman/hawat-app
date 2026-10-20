// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUser _$AppUserFromJson(Map<String, dynamic> json) => _AppUser(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  phone: json['phone'] as String,
  email: json['email'] as String?,
  role: json['role'] == null
      ? null
      : UserRole.fromJson(json['role'] as Map<String, dynamic>),
  active: json['active'] as bool? ?? true,
  avatarUrl: json['avatar_url'] as String?,
);

Map<String, dynamic> _$AppUserToJson(_AppUser instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
  'email': instance.email,
  'role': instance.role?.toJson(),
  'active': instance.active,
  'avatar_url': instance.avatarUrl,
};

_UserRole _$UserRoleFromJson(Map<String, dynamic> json) =>
    _UserRole(key: json['key'] as String, name: json['name'] as String);

Map<String, dynamic> _$UserRoleToJson(_UserRole instance) => <String, dynamic>{
  'key': instance.key,
  'name': instance.name,
};
