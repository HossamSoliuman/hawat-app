// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppConfig _$AppConfigFromJson(Map<String, dynamic> json) => _AppConfig(
  minVersion: json['min_version'] as String? ?? '1.0.0',
  latestVersion: json['latest_version'] as String? ?? '1.0.0',
  storeUrl: json['store_url'] as String?,
  smsEnabled: json['sms_enabled'] as bool? ?? false,
  supportPhone: json['support_phone'] as String?,
  supportWhatsapp: json['support_whatsapp'] as String?,
  joinUrl: json['join_url'] as String?,
  privacyUrl: json['privacy_url'] as String?,
  termsUrl: json['terms_url'] as String?,
);

Map<String, dynamic> _$AppConfigToJson(_AppConfig instance) =>
    <String, dynamic>{
      'min_version': instance.minVersion,
      'latest_version': instance.latestVersion,
      'store_url': instance.storeUrl,
      'sms_enabled': instance.smsEnabled,
      'support_phone': instance.supportPhone,
      'support_whatsapp': instance.supportWhatsapp,
      'join_url': instance.joinUrl,
      'privacy_url': instance.privacyUrl,
      'terms_url': instance.termsUrl,
    };
