import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_notification.freezed.dart';
part 'app_notification.g.dart';

@freezed
abstract class AppNotification with _$AppNotification {
  const AppNotification._();

  const factory AppNotification({
    required int id,
    NotificationType? type,
    @Default('') String title,
    @Default('') String body,
    NotificationTrip? trip,
    @Default(<String, dynamic>{}) Map<String, dynamic> payload,
    @Default(false) bool read,
    DateTime? createdAt,
  }) = _AppNotification;

  factory AppNotification.fromJson(Map<String, dynamic> json) => _$AppNotificationFromJson(json);

  int? get tripId => trip?.id ?? _int(payload['trip_id']);

  String? get target => payload['target'] as String?;

  int? get saleId => _int(payload['sale_id']);

  static int? _int(Object? value) => switch (value) {
    final int v => v,
    final String v => int.tryParse(v),
    _ => null,
  };
}

@freezed
abstract class NotificationType with _$NotificationType {
  const factory NotificationType({int? id, String? name, String? icon}) = _NotificationType;

  factory NotificationType.fromJson(Map<String, dynamic> json) => _$NotificationTypeFromJson(json);
}

@freezed
abstract class NotificationTrip with _$NotificationTrip {
  const factory NotificationTrip({required int id, String? tripNumber, String? status, String? appStatus}) =
      _NotificationTrip;

  factory NotificationTrip.fromJson(Map<String, dynamic> json) => _$NotificationTripFromJson(json);
}
