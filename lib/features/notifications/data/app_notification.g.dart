// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppNotification _$AppNotificationFromJson(Map<String, dynamic> json) =>
    _AppNotification(
      id: (json['id'] as num).toInt(),
      type: json['type'] == null
          ? null
          : NotificationType.fromJson(json['type'] as Map<String, dynamic>),
      title: json['title'] as String? ?? '',
      body: json['body'] as String? ?? '',
      trip: json['trip'] == null
          ? null
          : NotificationTrip.fromJson(json['trip'] as Map<String, dynamic>),
      payload:
          json['payload'] as Map<String, dynamic>? ?? const <String, dynamic>{},
      read: json['read'] as bool? ?? false,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$AppNotificationToJson(_AppNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type?.toJson(),
      'title': instance.title,
      'body': instance.body,
      'trip': instance.trip?.toJson(),
      'payload': instance.payload,
      'read': instance.read,
      'created_at': instance.createdAt?.toIso8601String(),
    };

_NotificationType _$NotificationTypeFromJson(Map<String, dynamic> json) =>
    _NotificationType(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$NotificationTypeToJson(_NotificationType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };

_NotificationTrip _$NotificationTripFromJson(Map<String, dynamic> json) =>
    _NotificationTrip(
      id: (json['id'] as num).toInt(),
      tripNumber: json['trip_number'] as String?,
      status: json['status'] as String?,
      appStatus: json['app_status'] as String?,
    );

Map<String, dynamic> _$NotificationTripToJson(_NotificationTrip instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trip_number': instance.tripNumber,
      'status': instance.status,
      'app_status': instance.appStatus,
    };
