// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppNotification {

 int get id; NotificationType? get type; String get title; String get body; NotificationTrip? get trip; Map<String, dynamic> get payload; bool get read; DateTime? get createdAt;
/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppNotificationCopyWith<AppNotification> get copyWith => _$AppNotificationCopyWithImpl<AppNotification>(this as AppNotification, _$identity);

  /// Serializes this AppNotification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AppNotification;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppNotification&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.body, _this.body) || other.body == _this.body)&&(identical(other.trip, _this.trip) || other.trip == _this.trip)&&const DeepCollectionEquality().equals(other.payload, _this.payload)&&(identical(other.read, _this.read) || other.read == _this.read)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AppNotification;
  return Object.hash(runtimeType,_this.id,_this.type,_this.title,_this.body,_this.trip,const DeepCollectionEquality().hash(_this.payload),_this.read,_this.createdAt);
}

@override
String toString() {
  final _this = this as AppNotification;
  return 'AppNotification(id: ${_this.id}, type: ${_this.type}, title: ${_this.title}, body: ${_this.body}, trip: ${_this.trip}, payload: ${_this.payload}, read: ${_this.read}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $AppNotificationCopyWith<$Res>  {
  factory $AppNotificationCopyWith(AppNotification value, $Res Function(AppNotification) _then) = _$AppNotificationCopyWithImpl;
@useResult
$Res call({
 int id, NotificationType? type, String title, String body, NotificationTrip? trip, Map<String, dynamic> payload, bool read, DateTime? createdAt
});


$NotificationTypeCopyWith<$Res>? get type;$NotificationTripCopyWith<$Res>? get trip;

}
/// @nodoc
class _$AppNotificationCopyWithImpl<$Res>
    implements $AppNotificationCopyWith<$Res> {
  _$AppNotificationCopyWithImpl(this._self, this._then);

  final AppNotification _self;
  final $Res Function(AppNotification) _then;

/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = freezed,Object? title = null,Object? body = null,Object? trip = freezed,Object? payload = null,Object? read = null,Object? createdAt = freezed,}) {
  return _then(AppNotification(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotificationType?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,trip: freezed == trip ? _self.trip : trip // ignore: cast_nullable_to_non_nullable
as NotificationTrip?,payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,read: null == read ? _self.read : read // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationTypeCopyWith<$Res>? get type {
    if (_self.type == null) {
    return null;
  }

  return $NotificationTypeCopyWith<$Res>(_self.type!, (value) {
    return _then(_self.copyWith(type: value));
  });
}/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationTripCopyWith<$Res>? get trip {
    if (_self.trip == null) {
    return null;
  }

  return $NotificationTripCopyWith<$Res>(_self.trip!, (value) {
    return _then(_self.copyWith(trip: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppNotification].
extension AppNotificationPatterns on AppNotification {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppNotification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppNotification() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppNotification value)  $default,){
final _that = this;
switch (_that) {
case _AppNotification():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppNotification value)?  $default,){
final _that = this;
switch (_that) {
case _AppNotification() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  NotificationType? type,  String title,  String body,  NotificationTrip? trip,  Map<String, dynamic> payload,  bool read,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppNotification() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.body,_that.trip,_that.payload,_that.read,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  NotificationType? type,  String title,  String body,  NotificationTrip? trip,  Map<String, dynamic> payload,  bool read,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _AppNotification():
return $default(_that.id,_that.type,_that.title,_that.body,_that.trip,_that.payload,_that.read,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  NotificationType? type,  String title,  String body,  NotificationTrip? trip,  Map<String, dynamic> payload,  bool read,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _AppNotification() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.body,_that.trip,_that.payload,_that.read,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppNotification extends AppNotification {
  const _AppNotification({required this.id, this.type, this.title = '', this.body = '', this.trip,  Map<String, dynamic> payload = const <String, dynamic>{}, this.read = false, this.createdAt}): _payload = payload,super._();
  factory _AppNotification.fromJson(Map<String, dynamic> json) => _$AppNotificationFromJson(json);

@override final  int id;
@override final  NotificationType? type;
@override@JsonKey() final  String title;
@override@JsonKey() final  String body;
@override final  NotificationTrip? trip;
 final  Map<String, dynamic> _payload;
@override@JsonKey() Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}

@override@JsonKey() final  bool read;
@override final  DateTime? createdAt;

/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppNotificationCopyWith<_AppNotification> get copyWith => __$AppNotificationCopyWithImpl<_AppNotification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppNotificationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppNotification&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.trip, trip) || other.trip == trip)&&const DeepCollectionEquality().equals(other.payload, _payload)&&(identical(other.read, read) || other.read == read)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,type,title,body,trip,const DeepCollectionEquality().hash(_payload),read,createdAt);
}

@override
String toString() {
    return 'AppNotification(id: $id, type: $type, title: $title, body: $body, trip: $trip, payload: $payload, read: $read, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AppNotificationCopyWith<$Res> implements $AppNotificationCopyWith<$Res> {
  factory _$AppNotificationCopyWith(_AppNotification value, $Res Function(_AppNotification) _then) = __$AppNotificationCopyWithImpl;
@override @useResult
$Res call({
 int id, NotificationType? type, String title, String body, NotificationTrip? trip, Map<String, dynamic> payload, bool read, DateTime? createdAt
});


@override $NotificationTypeCopyWith<$Res>? get type;@override $NotificationTripCopyWith<$Res>? get trip;

}
/// @nodoc
class __$AppNotificationCopyWithImpl<$Res>
    implements _$AppNotificationCopyWith<$Res> {
  __$AppNotificationCopyWithImpl(this._self, this._then);

  final _AppNotification _self;
  final $Res Function(_AppNotification) _then;

/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = freezed,Object? title = null,Object? body = null,Object? trip = freezed,Object? payload = null,Object? read = null,Object? createdAt = freezed,}) {
  return _then(_AppNotification(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotificationType?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,trip: freezed == trip ? _self.trip : trip // ignore: cast_nullable_to_non_nullable
as NotificationTrip?,payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,read: null == read ? _self.read : read // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationTypeCopyWith<$Res>? get type {
    if (_self.type == null) {
    return null;
  }

  return $NotificationTypeCopyWith<$Res>(_self.type!, (value) {
    return _then(_self.copyWith(type: value));
  });
}/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationTripCopyWith<$Res>? get trip {
    if (_self.trip == null) {
    return null;
  }

  return $NotificationTripCopyWith<$Res>(_self.trip!, (value) {
    return _then(_self.copyWith(trip: value));
  });
}
}


/// @nodoc
mixin _$NotificationType {

 int? get id; String? get name; String? get icon;
/// Create a copy of NotificationType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationTypeCopyWith<NotificationType> get copyWith => _$NotificationTypeCopyWithImpl<NotificationType>(this as NotificationType, _$identity);

  /// Serializes this NotificationType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NotificationType;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationType&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.icon, _this.icon) || other.icon == _this.icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NotificationType;
  return Object.hash(runtimeType,_this.id,_this.name,_this.icon);
}

@override
String toString() {
  final _this = this as NotificationType;
  return 'NotificationType(id: ${_this.id}, name: ${_this.name}, icon: ${_this.icon})';
}


}

/// @nodoc
abstract mixin class $NotificationTypeCopyWith<$Res>  {
  factory $NotificationTypeCopyWith(NotificationType value, $Res Function(NotificationType) _then) = _$NotificationTypeCopyWithImpl;
@useResult
$Res call({
 int? id, String? name, String? icon
});




}
/// @nodoc
class _$NotificationTypeCopyWithImpl<$Res>
    implements $NotificationTypeCopyWith<$Res> {
  _$NotificationTypeCopyWithImpl(this._self, this._then);

  final NotificationType _self;
  final $Res Function(NotificationType) _then;

/// Create a copy of NotificationType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? icon = freezed,}) {
  return _then(NotificationType(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationType].
extension NotificationTypePatterns on NotificationType {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationType value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationType() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationType value)  $default,){
final _that = this;
switch (_that) {
case _NotificationType():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationType value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationType() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? name,  String? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationType() when $default != null:
return $default(_that.id,_that.name,_that.icon);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? name,  String? icon)  $default,) {final _that = this;
switch (_that) {
case _NotificationType():
return $default(_that.id,_that.name,_that.icon);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? name,  String? icon)?  $default,) {final _that = this;
switch (_that) {
case _NotificationType() when $default != null:
return $default(_that.id,_that.name,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationType implements NotificationType {
  const _NotificationType({this.id, this.name, this.icon});
  factory _NotificationType.fromJson(Map<String, dynamic> json) => _$NotificationTypeFromJson(json);

@override final  int? id;
@override final  String? name;
@override final  String? icon;

/// Create a copy of NotificationType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationTypeCopyWith<_NotificationType> get copyWith => __$NotificationTypeCopyWithImpl<_NotificationType>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationTypeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationType&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,icon);
}

@override
String toString() {
    return 'NotificationType(id: $id, name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$NotificationTypeCopyWith<$Res> implements $NotificationTypeCopyWith<$Res> {
  factory _$NotificationTypeCopyWith(_NotificationType value, $Res Function(_NotificationType) _then) = __$NotificationTypeCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name, String? icon
});




}
/// @nodoc
class __$NotificationTypeCopyWithImpl<$Res>
    implements _$NotificationTypeCopyWith<$Res> {
  __$NotificationTypeCopyWithImpl(this._self, this._then);

  final _NotificationType _self;
  final $Res Function(_NotificationType) _then;

/// Create a copy of NotificationType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? icon = freezed,}) {
  return _then(_NotificationType(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$NotificationTrip {

 int get id; String? get tripNumber; String? get status; String? get appStatus;
/// Create a copy of NotificationTrip
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationTripCopyWith<NotificationTrip> get copyWith => _$NotificationTripCopyWithImpl<NotificationTrip>(this as NotificationTrip, _$identity);

  /// Serializes this NotificationTrip to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NotificationTrip;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationTrip&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.tripNumber, _this.tripNumber) || other.tripNumber == _this.tripNumber)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.appStatus, _this.appStatus) || other.appStatus == _this.appStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NotificationTrip;
  return Object.hash(runtimeType,_this.id,_this.tripNumber,_this.status,_this.appStatus);
}

@override
String toString() {
  final _this = this as NotificationTrip;
  return 'NotificationTrip(id: ${_this.id}, tripNumber: ${_this.tripNumber}, status: ${_this.status}, appStatus: ${_this.appStatus})';
}


}

/// @nodoc
abstract mixin class $NotificationTripCopyWith<$Res>  {
  factory $NotificationTripCopyWith(NotificationTrip value, $Res Function(NotificationTrip) _then) = _$NotificationTripCopyWithImpl;
@useResult
$Res call({
 int id, String? tripNumber, String? status, String? appStatus
});




}
/// @nodoc
class _$NotificationTripCopyWithImpl<$Res>
    implements $NotificationTripCopyWith<$Res> {
  _$NotificationTripCopyWithImpl(this._self, this._then);

  final NotificationTrip _self;
  final $Res Function(NotificationTrip) _then;

/// Create a copy of NotificationTrip
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tripNumber = freezed,Object? status = freezed,Object? appStatus = freezed,}) {
  return _then(NotificationTrip(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tripNumber: freezed == tripNumber ? _self.tripNumber : tripNumber // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,appStatus: freezed == appStatus ? _self.appStatus : appStatus // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationTrip].
extension NotificationTripPatterns on NotificationTrip {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationTrip value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationTrip() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationTrip value)  $default,){
final _that = this;
switch (_that) {
case _NotificationTrip():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationTrip value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationTrip() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? tripNumber,  String? status,  String? appStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationTrip() when $default != null:
return $default(_that.id,_that.tripNumber,_that.status,_that.appStatus);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? tripNumber,  String? status,  String? appStatus)  $default,) {final _that = this;
switch (_that) {
case _NotificationTrip():
return $default(_that.id,_that.tripNumber,_that.status,_that.appStatus);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? tripNumber,  String? status,  String? appStatus)?  $default,) {final _that = this;
switch (_that) {
case _NotificationTrip() when $default != null:
return $default(_that.id,_that.tripNumber,_that.status,_that.appStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationTrip implements NotificationTrip {
  const _NotificationTrip({required this.id, this.tripNumber, this.status, this.appStatus});
  factory _NotificationTrip.fromJson(Map<String, dynamic> json) => _$NotificationTripFromJson(json);

@override final  int id;
@override final  String? tripNumber;
@override final  String? status;
@override final  String? appStatus;

/// Create a copy of NotificationTrip
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationTripCopyWith<_NotificationTrip> get copyWith => __$NotificationTripCopyWithImpl<_NotificationTrip>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationTripToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationTrip&&(identical(other.id, id) || other.id == id)&&(identical(other.tripNumber, tripNumber) || other.tripNumber == tripNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.appStatus, appStatus) || other.appStatus == appStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,tripNumber,status,appStatus);
}

@override
String toString() {
    return 'NotificationTrip(id: $id, tripNumber: $tripNumber, status: $status, appStatus: $appStatus)';
}


}

/// @nodoc
abstract mixin class _$NotificationTripCopyWith<$Res> implements $NotificationTripCopyWith<$Res> {
  factory _$NotificationTripCopyWith(_NotificationTrip value, $Res Function(_NotificationTrip) _then) = __$NotificationTripCopyWithImpl;
@override @useResult
$Res call({
 int id, String? tripNumber, String? status, String? appStatus
});




}
/// @nodoc
class __$NotificationTripCopyWithImpl<$Res>
    implements _$NotificationTripCopyWith<$Res> {
  __$NotificationTripCopyWithImpl(this._self, this._then);

  final _NotificationTrip _self;
  final $Res Function(_NotificationTrip) _then;

/// Create a copy of NotificationTrip
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tripNumber = freezed,Object? status = freezed,Object? appStatus = freezed,}) {
  return _then(_NotificationTrip(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tripNumber: freezed == tripNumber ? _self.tripNumber : tripNumber // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,appStatus: freezed == appStatus ? _self.appStatus : appStatus // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
