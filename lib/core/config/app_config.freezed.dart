// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppConfig {

 String get minVersion; String get latestVersion; String? get storeUrl; bool get smsEnabled; String? get supportPhone; String? get supportWhatsapp; String? get joinUrl; String? get privacyUrl; String? get termsUrl;
/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppConfigCopyWith<AppConfig> get copyWith => _$AppConfigCopyWithImpl<AppConfig>(this as AppConfig, _$identity);

  /// Serializes this AppConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AppConfig;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppConfig&&(identical(other.minVersion, _this.minVersion) || other.minVersion == _this.minVersion)&&(identical(other.latestVersion, _this.latestVersion) || other.latestVersion == _this.latestVersion)&&(identical(other.storeUrl, _this.storeUrl) || other.storeUrl == _this.storeUrl)&&(identical(other.smsEnabled, _this.smsEnabled) || other.smsEnabled == _this.smsEnabled)&&(identical(other.supportPhone, _this.supportPhone) || other.supportPhone == _this.supportPhone)&&(identical(other.supportWhatsapp, _this.supportWhatsapp) || other.supportWhatsapp == _this.supportWhatsapp)&&(identical(other.joinUrl, _this.joinUrl) || other.joinUrl == _this.joinUrl)&&(identical(other.privacyUrl, _this.privacyUrl) || other.privacyUrl == _this.privacyUrl)&&(identical(other.termsUrl, _this.termsUrl) || other.termsUrl == _this.termsUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AppConfig;
  return Object.hash(runtimeType,_this.minVersion,_this.latestVersion,_this.storeUrl,_this.smsEnabled,_this.supportPhone,_this.supportWhatsapp,_this.joinUrl,_this.privacyUrl,_this.termsUrl);
}

@override
String toString() {
  final _this = this as AppConfig;
  return 'AppConfig(minVersion: ${_this.minVersion}, latestVersion: ${_this.latestVersion}, storeUrl: ${_this.storeUrl}, smsEnabled: ${_this.smsEnabled}, supportPhone: ${_this.supportPhone}, supportWhatsapp: ${_this.supportWhatsapp}, joinUrl: ${_this.joinUrl}, privacyUrl: ${_this.privacyUrl}, termsUrl: ${_this.termsUrl})';
}


}

/// @nodoc
abstract mixin class $AppConfigCopyWith<$Res>  {
  factory $AppConfigCopyWith(AppConfig value, $Res Function(AppConfig) _then) = _$AppConfigCopyWithImpl;
@useResult
$Res call({
 String minVersion, String latestVersion, String? storeUrl, bool smsEnabled, String? supportPhone, String? supportWhatsapp, String? joinUrl, String? privacyUrl, String? termsUrl
});




}
/// @nodoc
class _$AppConfigCopyWithImpl<$Res>
    implements $AppConfigCopyWith<$Res> {
  _$AppConfigCopyWithImpl(this._self, this._then);

  final AppConfig _self;
  final $Res Function(AppConfig) _then;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minVersion = null,Object? latestVersion = null,Object? storeUrl = freezed,Object? smsEnabled = null,Object? supportPhone = freezed,Object? supportWhatsapp = freezed,Object? joinUrl = freezed,Object? privacyUrl = freezed,Object? termsUrl = freezed,}) {
  return _then(AppConfig(
minVersion: null == minVersion ? _self.minVersion : minVersion // ignore: cast_nullable_to_non_nullable
as String,latestVersion: null == latestVersion ? _self.latestVersion : latestVersion // ignore: cast_nullable_to_non_nullable
as String,storeUrl: freezed == storeUrl ? _self.storeUrl : storeUrl // ignore: cast_nullable_to_non_nullable
as String?,smsEnabled: null == smsEnabled ? _self.smsEnabled : smsEnabled // ignore: cast_nullable_to_non_nullable
as bool,supportPhone: freezed == supportPhone ? _self.supportPhone : supportPhone // ignore: cast_nullable_to_non_nullable
as String?,supportWhatsapp: freezed == supportWhatsapp ? _self.supportWhatsapp : supportWhatsapp // ignore: cast_nullable_to_non_nullable
as String?,joinUrl: freezed == joinUrl ? _self.joinUrl : joinUrl // ignore: cast_nullable_to_non_nullable
as String?,privacyUrl: freezed == privacyUrl ? _self.privacyUrl : privacyUrl // ignore: cast_nullable_to_non_nullable
as String?,termsUrl: freezed == termsUrl ? _self.termsUrl : termsUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppConfig].
extension AppConfigPatterns on AppConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppConfig value)  $default,){
final _that = this;
switch (_that) {
case _AppConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppConfig value)?  $default,){
final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String minVersion,  String latestVersion,  String? storeUrl,  bool smsEnabled,  String? supportPhone,  String? supportWhatsapp,  String? joinUrl,  String? privacyUrl,  String? termsUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that.minVersion,_that.latestVersion,_that.storeUrl,_that.smsEnabled,_that.supportPhone,_that.supportWhatsapp,_that.joinUrl,_that.privacyUrl,_that.termsUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String minVersion,  String latestVersion,  String? storeUrl,  bool smsEnabled,  String? supportPhone,  String? supportWhatsapp,  String? joinUrl,  String? privacyUrl,  String? termsUrl)  $default,) {final _that = this;
switch (_that) {
case _AppConfig():
return $default(_that.minVersion,_that.latestVersion,_that.storeUrl,_that.smsEnabled,_that.supportPhone,_that.supportWhatsapp,_that.joinUrl,_that.privacyUrl,_that.termsUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String minVersion,  String latestVersion,  String? storeUrl,  bool smsEnabled,  String? supportPhone,  String? supportWhatsapp,  String? joinUrl,  String? privacyUrl,  String? termsUrl)?  $default,) {final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that.minVersion,_that.latestVersion,_that.storeUrl,_that.smsEnabled,_that.supportPhone,_that.supportWhatsapp,_that.joinUrl,_that.privacyUrl,_that.termsUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppConfig extends AppConfig {
  const _AppConfig({this.minVersion = '1.0.0', this.latestVersion = '1.0.0', this.storeUrl, this.smsEnabled = false, this.supportPhone, this.supportWhatsapp, this.joinUrl, this.privacyUrl, this.termsUrl}): super._();
  factory _AppConfig.fromJson(Map<String, dynamic> json) => _$AppConfigFromJson(json);

@override@JsonKey() final  String minVersion;
@override@JsonKey() final  String latestVersion;
@override final  String? storeUrl;
@override@JsonKey() final  bool smsEnabled;
@override final  String? supportPhone;
@override final  String? supportWhatsapp;
@override final  String? joinUrl;
@override final  String? privacyUrl;
@override final  String? termsUrl;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppConfigCopyWith<_AppConfig> get copyWith => __$AppConfigCopyWithImpl<_AppConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppConfigToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppConfig&&(identical(other.minVersion, minVersion) || other.minVersion == minVersion)&&(identical(other.latestVersion, latestVersion) || other.latestVersion == latestVersion)&&(identical(other.storeUrl, storeUrl) || other.storeUrl == storeUrl)&&(identical(other.smsEnabled, smsEnabled) || other.smsEnabled == smsEnabled)&&(identical(other.supportPhone, supportPhone) || other.supportPhone == supportPhone)&&(identical(other.supportWhatsapp, supportWhatsapp) || other.supportWhatsapp == supportWhatsapp)&&(identical(other.joinUrl, joinUrl) || other.joinUrl == joinUrl)&&(identical(other.privacyUrl, privacyUrl) || other.privacyUrl == privacyUrl)&&(identical(other.termsUrl, termsUrl) || other.termsUrl == termsUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,minVersion,latestVersion,storeUrl,smsEnabled,supportPhone,supportWhatsapp,joinUrl,privacyUrl,termsUrl);
}

@override
String toString() {
    return 'AppConfig(minVersion: $minVersion, latestVersion: $latestVersion, storeUrl: $storeUrl, smsEnabled: $smsEnabled, supportPhone: $supportPhone, supportWhatsapp: $supportWhatsapp, joinUrl: $joinUrl, privacyUrl: $privacyUrl, termsUrl: $termsUrl)';
}


}

/// @nodoc
abstract mixin class _$AppConfigCopyWith<$Res> implements $AppConfigCopyWith<$Res> {
  factory _$AppConfigCopyWith(_AppConfig value, $Res Function(_AppConfig) _then) = __$AppConfigCopyWithImpl;
@override @useResult
$Res call({
 String minVersion, String latestVersion, String? storeUrl, bool smsEnabled, String? supportPhone, String? supportWhatsapp, String? joinUrl, String? privacyUrl, String? termsUrl
});




}
/// @nodoc
class __$AppConfigCopyWithImpl<$Res>
    implements _$AppConfigCopyWith<$Res> {
  __$AppConfigCopyWithImpl(this._self, this._then);

  final _AppConfig _self;
  final $Res Function(_AppConfig) _then;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minVersion = null,Object? latestVersion = null,Object? storeUrl = freezed,Object? smsEnabled = null,Object? supportPhone = freezed,Object? supportWhatsapp = freezed,Object? joinUrl = freezed,Object? privacyUrl = freezed,Object? termsUrl = freezed,}) {
  return _then(_AppConfig(
minVersion: null == minVersion ? _self.minVersion : minVersion // ignore: cast_nullable_to_non_nullable
as String,latestVersion: null == latestVersion ? _self.latestVersion : latestVersion // ignore: cast_nullable_to_non_nullable
as String,storeUrl: freezed == storeUrl ? _self.storeUrl : storeUrl // ignore: cast_nullable_to_non_nullable
as String?,smsEnabled: null == smsEnabled ? _self.smsEnabled : smsEnabled // ignore: cast_nullable_to_non_nullable
as bool,supportPhone: freezed == supportPhone ? _self.supportPhone : supportPhone // ignore: cast_nullable_to_non_nullable
as String?,supportWhatsapp: freezed == supportWhatsapp ? _self.supportWhatsapp : supportWhatsapp // ignore: cast_nullable_to_non_nullable
as String?,joinUrl: freezed == joinUrl ? _self.joinUrl : joinUrl // ignore: cast_nullable_to_non_nullable
as String?,privacyUrl: freezed == privacyUrl ? _self.privacyUrl : privacyUrl // ignore: cast_nullable_to_non_nullable
as String?,termsUrl: freezed == termsUrl ? _self.termsUrl : termsUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
