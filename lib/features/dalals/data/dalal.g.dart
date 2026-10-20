// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dalal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Dalal _$DalalFromJson(Map<String, dynamic> json) => _Dalal(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  phone: json['phone'] as String?,
  partnership: json['partnership'] == null
      ? null
      : Partnership.fromJson(json['partnership'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DalalToJson(_Dalal instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
  'partnership': instance.partnership?.toJson(),
};

_Partnership _$PartnershipFromJson(Map<String, dynamic> json) => _Partnership(
  id: (json['id'] as num).toInt(),
  commissionPct: (json['commission_pct'] as num?)?.toDouble() ?? 0,
  wagePct: (json['wage_pct'] as num?)?.toDouble() ?? 0,
  message: json['message'] as String?,
  status: json['status'] as String? ?? Partnership.pending,
  statusLabel: json['status_label'] as String?,
  responseNote: json['response_note'] as String?,
  respondedAt: json['responded_at'] == null
      ? null
      : DateTime.parse(json['responded_at'] as String),
);

Map<String, dynamic> _$PartnershipToJson(_Partnership instance) =>
    <String, dynamic>{
      'id': instance.id,
      'commission_pct': instance.commissionPct,
      'wage_pct': instance.wagePct,
      'message': instance.message,
      'status': instance.status,
      'status_label': instance.statusLabel,
      'response_note': instance.responseNote,
      'responded_at': instance.respondedAt?.toIso8601String(),
    };
