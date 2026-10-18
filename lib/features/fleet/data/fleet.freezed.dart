// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fleet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Boat {

 int get id; String get name; String? get boatNumber; String? get status; IdName? get port; PersonRef? get captain; int get crewCount; BoatLicense? get license; BoatSetup? get setup;
/// Create a copy of Boat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoatCopyWith<Boat> get copyWith => _$BoatCopyWithImpl<Boat>(this as Boat, _$identity);

  /// Serializes this Boat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Boat;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Boat&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.boatNumber, _this.boatNumber) || other.boatNumber == _this.boatNumber)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.port, _this.port) || other.port == _this.port)&&(identical(other.captain, _this.captain) || other.captain == _this.captain)&&(identical(other.crewCount, _this.crewCount) || other.crewCount == _this.crewCount)&&(identical(other.license, _this.license) || other.license == _this.license)&&(identical(other.setup, _this.setup) || other.setup == _this.setup));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Boat;
  return Object.hash(runtimeType,_this.id,_this.name,_this.boatNumber,_this.status,_this.port,_this.captain,_this.crewCount,_this.license,_this.setup);
}

@override
String toString() {
  final _this = this as Boat;
  return 'Boat(id: ${_this.id}, name: ${_this.name}, boatNumber: ${_this.boatNumber}, status: ${_this.status}, port: ${_this.port}, captain: ${_this.captain}, crewCount: ${_this.crewCount}, license: ${_this.license}, setup: ${_this.setup})';
}


}

/// @nodoc
abstract mixin class $BoatCopyWith<$Res>  {
  factory $BoatCopyWith(Boat value, $Res Function(Boat) _then) = _$BoatCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? boatNumber, String? status, IdName? port, PersonRef? captain, int crewCount, BoatLicense? license, BoatSetup? setup
});


$IdNameCopyWith<$Res>? get port;$PersonRefCopyWith<$Res>? get captain;$BoatLicenseCopyWith<$Res>? get license;$BoatSetupCopyWith<$Res>? get setup;

}
/// @nodoc
class _$BoatCopyWithImpl<$Res>
    implements $BoatCopyWith<$Res> {
  _$BoatCopyWithImpl(this._self, this._then);

  final Boat _self;
  final $Res Function(Boat) _then;

/// Create a copy of Boat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? boatNumber = freezed,Object? status = freezed,Object? port = freezed,Object? captain = freezed,Object? crewCount = null,Object? license = freezed,Object? setup = freezed,}) {
  return _then(Boat(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,boatNumber: freezed == boatNumber ? _self.boatNumber : boatNumber // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,port: freezed == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as IdName?,captain: freezed == captain ? _self.captain : captain // ignore: cast_nullable_to_non_nullable
as PersonRef?,crewCount: null == crewCount ? _self.crewCount : crewCount // ignore: cast_nullable_to_non_nullable
as int,license: freezed == license ? _self.license : license // ignore: cast_nullable_to_non_nullable
as BoatLicense?,setup: freezed == setup ? _self.setup : setup // ignore: cast_nullable_to_non_nullable
as BoatSetup?,
  ));
}
/// Create a copy of Boat
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res>? get port {
    if (_self.port == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.port!, (value) {
    return _then(_self.copyWith(port: value));
  });
}/// Create a copy of Boat
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonRefCopyWith<$Res>? get captain {
    if (_self.captain == null) {
    return null;
  }

  return $PersonRefCopyWith<$Res>(_self.captain!, (value) {
    return _then(_self.copyWith(captain: value));
  });
}/// Create a copy of Boat
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoatLicenseCopyWith<$Res>? get license {
    if (_self.license == null) {
    return null;
  }

  return $BoatLicenseCopyWith<$Res>(_self.license!, (value) {
    return _then(_self.copyWith(license: value));
  });
}/// Create a copy of Boat
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoatSetupCopyWith<$Res>? get setup {
    if (_self.setup == null) {
    return null;
  }

  return $BoatSetupCopyWith<$Res>(_self.setup!, (value) {
    return _then(_self.copyWith(setup: value));
  });
}
}


/// Adds pattern-matching-related methods to [Boat].
extension BoatPatterns on Boat {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Boat value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Boat() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Boat value)  $default,){
final _that = this;
switch (_that) {
case _Boat():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Boat value)?  $default,){
final _that = this;
switch (_that) {
case _Boat() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? boatNumber,  String? status,  IdName? port,  PersonRef? captain,  int crewCount,  BoatLicense? license,  BoatSetup? setup)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Boat() when $default != null:
return $default(_that.id,_that.name,_that.boatNumber,_that.status,_that.port,_that.captain,_that.crewCount,_that.license,_that.setup);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? boatNumber,  String? status,  IdName? port,  PersonRef? captain,  int crewCount,  BoatLicense? license,  BoatSetup? setup)  $default,) {final _that = this;
switch (_that) {
case _Boat():
return $default(_that.id,_that.name,_that.boatNumber,_that.status,_that.port,_that.captain,_that.crewCount,_that.license,_that.setup);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? boatNumber,  String? status,  IdName? port,  PersonRef? captain,  int crewCount,  BoatLicense? license,  BoatSetup? setup)?  $default,) {final _that = this;
switch (_that) {
case _Boat() when $default != null:
return $default(_that.id,_that.name,_that.boatNumber,_that.status,_that.port,_that.captain,_that.crewCount,_that.license,_that.setup);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Boat extends Boat {
  const _Boat({required this.id, required this.name, this.boatNumber, this.status, this.port, this.captain, this.crewCount = 0, this.license, this.setup}): super._();
  factory _Boat.fromJson(Map<String, dynamic> json) => _$BoatFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? boatNumber;
@override final  String? status;
@override final  IdName? port;
@override final  PersonRef? captain;
@override@JsonKey() final  int crewCount;
@override final  BoatLicense? license;
@override final  BoatSetup? setup;

/// Create a copy of Boat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoatCopyWith<_Boat> get copyWith => __$BoatCopyWithImpl<_Boat>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BoatToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Boat&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.boatNumber, boatNumber) || other.boatNumber == boatNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.port, port) || other.port == port)&&(identical(other.captain, captain) || other.captain == captain)&&(identical(other.crewCount, crewCount) || other.crewCount == crewCount)&&(identical(other.license, license) || other.license == license)&&(identical(other.setup, setup) || other.setup == setup));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,boatNumber,status,port,captain,crewCount,license,setup);
}

@override
String toString() {
    return 'Boat(id: $id, name: $name, boatNumber: $boatNumber, status: $status, port: $port, captain: $captain, crewCount: $crewCount, license: $license, setup: $setup)';
}


}

/// @nodoc
abstract mixin class _$BoatCopyWith<$Res> implements $BoatCopyWith<$Res> {
  factory _$BoatCopyWith(_Boat value, $Res Function(_Boat) _then) = __$BoatCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? boatNumber, String? status, IdName? port, PersonRef? captain, int crewCount, BoatLicense? license, BoatSetup? setup
});


@override $IdNameCopyWith<$Res>? get port;@override $PersonRefCopyWith<$Res>? get captain;@override $BoatLicenseCopyWith<$Res>? get license;@override $BoatSetupCopyWith<$Res>? get setup;

}
/// @nodoc
class __$BoatCopyWithImpl<$Res>
    implements _$BoatCopyWith<$Res> {
  __$BoatCopyWithImpl(this._self, this._then);

  final _Boat _self;
  final $Res Function(_Boat) _then;

/// Create a copy of Boat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? boatNumber = freezed,Object? status = freezed,Object? port = freezed,Object? captain = freezed,Object? crewCount = null,Object? license = freezed,Object? setup = freezed,}) {
  return _then(_Boat(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,boatNumber: freezed == boatNumber ? _self.boatNumber : boatNumber // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,port: freezed == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as IdName?,captain: freezed == captain ? _self.captain : captain // ignore: cast_nullable_to_non_nullable
as PersonRef?,crewCount: null == crewCount ? _self.crewCount : crewCount // ignore: cast_nullable_to_non_nullable
as int,license: freezed == license ? _self.license : license // ignore: cast_nullable_to_non_nullable
as BoatLicense?,setup: freezed == setup ? _self.setup : setup // ignore: cast_nullable_to_non_nullable
as BoatSetup?,
  ));
}

/// Create a copy of Boat
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res>? get port {
    if (_self.port == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.port!, (value) {
    return _then(_self.copyWith(port: value));
  });
}/// Create a copy of Boat
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonRefCopyWith<$Res>? get captain {
    if (_self.captain == null) {
    return null;
  }

  return $PersonRefCopyWith<$Res>(_self.captain!, (value) {
    return _then(_self.copyWith(captain: value));
  });
}/// Create a copy of Boat
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoatLicenseCopyWith<$Res>? get license {
    if (_self.license == null) {
    return null;
  }

  return $BoatLicenseCopyWith<$Res>(_self.license!, (value) {
    return _then(_self.copyWith(license: value));
  });
}/// Create a copy of Boat
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoatSetupCopyWith<$Res>? get setup {
    if (_self.setup == null) {
    return null;
  }

  return $BoatSetupCopyWith<$Res>(_self.setup!, (value) {
    return _then(_self.copyWith(setup: value));
  });
}
}


/// @nodoc
mixin _$BoatLicense {

 String? get number; DateTime? get expiry;
/// Create a copy of BoatLicense
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoatLicenseCopyWith<BoatLicense> get copyWith => _$BoatLicenseCopyWithImpl<BoatLicense>(this as BoatLicense, _$identity);

  /// Serializes this BoatLicense to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BoatLicense;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoatLicense&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.expiry, _this.expiry) || other.expiry == _this.expiry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BoatLicense;
  return Object.hash(runtimeType,_this.number,_this.expiry);
}

@override
String toString() {
  final _this = this as BoatLicense;
  return 'BoatLicense(number: ${_this.number}, expiry: ${_this.expiry})';
}


}

/// @nodoc
abstract mixin class $BoatLicenseCopyWith<$Res>  {
  factory $BoatLicenseCopyWith(BoatLicense value, $Res Function(BoatLicense) _then) = _$BoatLicenseCopyWithImpl;
@useResult
$Res call({
 String? number, DateTime? expiry
});




}
/// @nodoc
class _$BoatLicenseCopyWithImpl<$Res>
    implements $BoatLicenseCopyWith<$Res> {
  _$BoatLicenseCopyWithImpl(this._self, this._then);

  final BoatLicense _self;
  final $Res Function(BoatLicense) _then;

/// Create a copy of BoatLicense
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = freezed,Object? expiry = freezed,}) {
  return _then(BoatLicense(
number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,expiry: freezed == expiry ? _self.expiry : expiry // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [BoatLicense].
extension BoatLicensePatterns on BoatLicense {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BoatLicense value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BoatLicense() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BoatLicense value)  $default,){
final _that = this;
switch (_that) {
case _BoatLicense():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BoatLicense value)?  $default,){
final _that = this;
switch (_that) {
case _BoatLicense() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? number,  DateTime? expiry)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BoatLicense() when $default != null:
return $default(_that.number,_that.expiry);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? number,  DateTime? expiry)  $default,) {final _that = this;
switch (_that) {
case _BoatLicense():
return $default(_that.number,_that.expiry);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? number,  DateTime? expiry)?  $default,) {final _that = this;
switch (_that) {
case _BoatLicense() when $default != null:
return $default(_that.number,_that.expiry);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BoatLicense implements BoatLicense {
  const _BoatLicense({this.number, this.expiry});
  factory _BoatLicense.fromJson(Map<String, dynamic> json) => _$BoatLicenseFromJson(json);

@override final  String? number;
@override final  DateTime? expiry;

/// Create a copy of BoatLicense
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoatLicenseCopyWith<_BoatLicense> get copyWith => __$BoatLicenseCopyWithImpl<_BoatLicense>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BoatLicenseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoatLicense&&(identical(other.number, number) || other.number == number)&&(identical(other.expiry, expiry) || other.expiry == expiry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,number,expiry);
}

@override
String toString() {
    return 'BoatLicense(number: $number, expiry: $expiry)';
}


}

/// @nodoc
abstract mixin class _$BoatLicenseCopyWith<$Res> implements $BoatLicenseCopyWith<$Res> {
  factory _$BoatLicenseCopyWith(_BoatLicense value, $Res Function(_BoatLicense) _then) = __$BoatLicenseCopyWithImpl;
@override @useResult
$Res call({
 String? number, DateTime? expiry
});




}
/// @nodoc
class __$BoatLicenseCopyWithImpl<$Res>
    implements _$BoatLicenseCopyWith<$Res> {
  __$BoatLicenseCopyWithImpl(this._self, this._then);

  final _BoatLicense _self;
  final $Res Function(_BoatLicense) _then;

/// Create a copy of BoatLicense
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = freezed,Object? expiry = freezed,}) {
  return _then(_BoatLicense(
number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,expiry: freezed == expiry ? _self.expiry : expiry // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$BoatSetup {

 bool get ready; List<SetupItem> get missing; List<SetupItem> get warnings;
/// Create a copy of BoatSetup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoatSetupCopyWith<BoatSetup> get copyWith => _$BoatSetupCopyWithImpl<BoatSetup>(this as BoatSetup, _$identity);

  /// Serializes this BoatSetup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BoatSetup;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoatSetup&&(identical(other.ready, _this.ready) || other.ready == _this.ready)&&const DeepCollectionEquality().equals(other.missing, _this.missing)&&const DeepCollectionEquality().equals(other.warnings, _this.warnings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BoatSetup;
  return Object.hash(runtimeType,_this.ready,const DeepCollectionEquality().hash(_this.missing),const DeepCollectionEquality().hash(_this.warnings));
}

@override
String toString() {
  final _this = this as BoatSetup;
  return 'BoatSetup(ready: ${_this.ready}, missing: ${_this.missing}, warnings: ${_this.warnings})';
}


}

/// @nodoc
abstract mixin class $BoatSetupCopyWith<$Res>  {
  factory $BoatSetupCopyWith(BoatSetup value, $Res Function(BoatSetup) _then) = _$BoatSetupCopyWithImpl;
@useResult
$Res call({
 bool ready, List<SetupItem> missing, List<SetupItem> warnings
});




}
/// @nodoc
class _$BoatSetupCopyWithImpl<$Res>
    implements $BoatSetupCopyWith<$Res> {
  _$BoatSetupCopyWithImpl(this._self, this._then);

  final BoatSetup _self;
  final $Res Function(BoatSetup) _then;

/// Create a copy of BoatSetup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ready = null,Object? missing = null,Object? warnings = null,}) {
  return _then(BoatSetup(
ready: null == ready ? _self.ready : ready // ignore: cast_nullable_to_non_nullable
as bool,missing: null == missing ? _self.missing : missing // ignore: cast_nullable_to_non_nullable
as List<SetupItem>,warnings: null == warnings ? _self.warnings : warnings // ignore: cast_nullable_to_non_nullable
as List<SetupItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [BoatSetup].
extension BoatSetupPatterns on BoatSetup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BoatSetup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BoatSetup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BoatSetup value)  $default,){
final _that = this;
switch (_that) {
case _BoatSetup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BoatSetup value)?  $default,){
final _that = this;
switch (_that) {
case _BoatSetup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool ready,  List<SetupItem> missing,  List<SetupItem> warnings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BoatSetup() when $default != null:
return $default(_that.ready,_that.missing,_that.warnings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool ready,  List<SetupItem> missing,  List<SetupItem> warnings)  $default,) {final _that = this;
switch (_that) {
case _BoatSetup():
return $default(_that.ready,_that.missing,_that.warnings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool ready,  List<SetupItem> missing,  List<SetupItem> warnings)?  $default,) {final _that = this;
switch (_that) {
case _BoatSetup() when $default != null:
return $default(_that.ready,_that.missing,_that.warnings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BoatSetup implements BoatSetup {
  const _BoatSetup({this.ready = true,  List<SetupItem> missing = const <SetupItem>[],  List<SetupItem> warnings = const <SetupItem>[]}): _missing = missing,_warnings = warnings;
  factory _BoatSetup.fromJson(Map<String, dynamic> json) => _$BoatSetupFromJson(json);

@override@JsonKey() final  bool ready;
 final  List<SetupItem> _missing;
@override@JsonKey() List<SetupItem> get missing {
  if (_missing is EqualUnmodifiableListView) return _missing;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_missing);
}

 final  List<SetupItem> _warnings;
@override@JsonKey() List<SetupItem> get warnings {
  if (_warnings is EqualUnmodifiableListView) return _warnings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_warnings);
}


/// Create a copy of BoatSetup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoatSetupCopyWith<_BoatSetup> get copyWith => __$BoatSetupCopyWithImpl<_BoatSetup>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BoatSetupToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoatSetup&&(identical(other.ready, ready) || other.ready == ready)&&const DeepCollectionEquality().equals(other.missing, _missing)&&const DeepCollectionEquality().equals(other.warnings, _warnings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,ready,const DeepCollectionEquality().hash(_missing),const DeepCollectionEquality().hash(_warnings));
}

@override
String toString() {
    return 'BoatSetup(ready: $ready, missing: $missing, warnings: $warnings)';
}


}

/// @nodoc
abstract mixin class _$BoatSetupCopyWith<$Res> implements $BoatSetupCopyWith<$Res> {
  factory _$BoatSetupCopyWith(_BoatSetup value, $Res Function(_BoatSetup) _then) = __$BoatSetupCopyWithImpl;
@override @useResult
$Res call({
 bool ready, List<SetupItem> missing, List<SetupItem> warnings
});




}
/// @nodoc
class __$BoatSetupCopyWithImpl<$Res>
    implements _$BoatSetupCopyWith<$Res> {
  __$BoatSetupCopyWithImpl(this._self, this._then);

  final _BoatSetup _self;
  final $Res Function(_BoatSetup) _then;

/// Create a copy of BoatSetup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ready = null,Object? missing = null,Object? warnings = null,}) {
  return _then(_BoatSetup(
ready: null == ready ? _self.ready : ready // ignore: cast_nullable_to_non_nullable
as bool,missing: null == missing ? _self._missing : missing // ignore: cast_nullable_to_non_nullable
as List<SetupItem>,warnings: null == warnings ? _self._warnings : warnings // ignore: cast_nullable_to_non_nullable
as List<SetupItem>,
  ));
}


}


/// @nodoc
mixin _$SetupItem {

 String get key; String get label;
/// Create a copy of SetupItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetupItemCopyWith<SetupItem> get copyWith => _$SetupItemCopyWithImpl<SetupItem>(this as SetupItem, _$identity);

  /// Serializes this SetupItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SetupItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetupItem&&(identical(other.key, _this.key) || other.key == _this.key)&&(identical(other.label, _this.label) || other.label == _this.label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SetupItem;
  return Object.hash(runtimeType,_this.key,_this.label);
}

@override
String toString() {
  final _this = this as SetupItem;
  return 'SetupItem(key: ${_this.key}, label: ${_this.label})';
}


}

/// @nodoc
abstract mixin class $SetupItemCopyWith<$Res>  {
  factory $SetupItemCopyWith(SetupItem value, $Res Function(SetupItem) _then) = _$SetupItemCopyWithImpl;
@useResult
$Res call({
 String key, String label
});




}
/// @nodoc
class _$SetupItemCopyWithImpl<$Res>
    implements $SetupItemCopyWith<$Res> {
  _$SetupItemCopyWithImpl(this._self, this._then);

  final SetupItem _self;
  final $Res Function(SetupItem) _then;

/// Create a copy of SetupItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? label = null,}) {
  return _then(SetupItem(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SetupItem].
extension SetupItemPatterns on SetupItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SetupItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SetupItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SetupItem value)  $default,){
final _that = this;
switch (_that) {
case _SetupItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SetupItem value)?  $default,){
final _that = this;
switch (_that) {
case _SetupItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SetupItem() when $default != null:
return $default(_that.key,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String label)  $default,) {final _that = this;
switch (_that) {
case _SetupItem():
return $default(_that.key,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String label)?  $default,) {final _that = this;
switch (_that) {
case _SetupItem() when $default != null:
return $default(_that.key,_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SetupItem implements SetupItem {
  const _SetupItem({required this.key, required this.label});
  factory _SetupItem.fromJson(Map<String, dynamic> json) => _$SetupItemFromJson(json);

@override final  String key;
@override final  String label;

/// Create a copy of SetupItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetupItemCopyWith<_SetupItem> get copyWith => __$SetupItemCopyWithImpl<_SetupItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetupItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetupItem&&(identical(other.key, key) || other.key == key)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,key,label);
}

@override
String toString() {
    return 'SetupItem(key: $key, label: $label)';
}


}

/// @nodoc
abstract mixin class _$SetupItemCopyWith<$Res> implements $SetupItemCopyWith<$Res> {
  factory _$SetupItemCopyWith(_SetupItem value, $Res Function(_SetupItem) _then) = __$SetupItemCopyWithImpl;
@override @useResult
$Res call({
 String key, String label
});




}
/// @nodoc
class __$SetupItemCopyWithImpl<$Res>
    implements _$SetupItemCopyWith<$Res> {
  __$SetupItemCopyWithImpl(this._self, this._then);

  final _SetupItem _self;
  final $Res Function(_SetupItem) _then;

/// Create a copy of SetupItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? label = null,}) {
  return _then(_SetupItem(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Captain {

 int get id; String get name; String? get phone; String? get status; IdName? get boat;
/// Create a copy of Captain
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CaptainCopyWith<Captain> get copyWith => _$CaptainCopyWithImpl<Captain>(this as Captain, _$identity);

  /// Serializes this Captain to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Captain;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Captain&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.boat, _this.boat) || other.boat == _this.boat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Captain;
  return Object.hash(runtimeType,_this.id,_this.name,_this.phone,_this.status,_this.boat);
}

@override
String toString() {
  final _this = this as Captain;
  return 'Captain(id: ${_this.id}, name: ${_this.name}, phone: ${_this.phone}, status: ${_this.status}, boat: ${_this.boat})';
}


}

/// @nodoc
abstract mixin class $CaptainCopyWith<$Res>  {
  factory $CaptainCopyWith(Captain value, $Res Function(Captain) _then) = _$CaptainCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? phone, String? status, IdName? boat
});


$IdNameCopyWith<$Res>? get boat;

}
/// @nodoc
class _$CaptainCopyWithImpl<$Res>
    implements $CaptainCopyWith<$Res> {
  _$CaptainCopyWithImpl(this._self, this._then);

  final Captain _self;
  final $Res Function(Captain) _then;

/// Create a copy of Captain
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? phone = freezed,Object? status = freezed,Object? boat = freezed,}) {
  return _then(Captain(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,boat: freezed == boat ? _self.boat : boat // ignore: cast_nullable_to_non_nullable
as IdName?,
  ));
}
/// Create a copy of Captain
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res>? get boat {
    if (_self.boat == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.boat!, (value) {
    return _then(_self.copyWith(boat: value));
  });
}
}


/// Adds pattern-matching-related methods to [Captain].
extension CaptainPatterns on Captain {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Captain value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Captain() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Captain value)  $default,){
final _that = this;
switch (_that) {
case _Captain():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Captain value)?  $default,){
final _that = this;
switch (_that) {
case _Captain() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? phone,  String? status,  IdName? boat)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Captain() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.status,_that.boat);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? phone,  String? status,  IdName? boat)  $default,) {final _that = this;
switch (_that) {
case _Captain():
return $default(_that.id,_that.name,_that.phone,_that.status,_that.boat);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? phone,  String? status,  IdName? boat)?  $default,) {final _that = this;
switch (_that) {
case _Captain() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.status,_that.boat);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Captain extends Captain {
  const _Captain({required this.id, required this.name, this.phone, this.status, this.boat}): super._();
  factory _Captain.fromJson(Map<String, dynamic> json) => _$CaptainFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? phone;
@override final  String? status;
@override final  IdName? boat;

/// Create a copy of Captain
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CaptainCopyWith<_Captain> get copyWith => __$CaptainCopyWithImpl<_Captain>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CaptainToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Captain&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.status, status) || other.status == status)&&(identical(other.boat, boat) || other.boat == boat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,phone,status,boat);
}

@override
String toString() {
    return 'Captain(id: $id, name: $name, phone: $phone, status: $status, boat: $boat)';
}


}

/// @nodoc
abstract mixin class _$CaptainCopyWith<$Res> implements $CaptainCopyWith<$Res> {
  factory _$CaptainCopyWith(_Captain value, $Res Function(_Captain) _then) = __$CaptainCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? phone, String? status, IdName? boat
});


@override $IdNameCopyWith<$Res>? get boat;

}
/// @nodoc
class __$CaptainCopyWithImpl<$Res>
    implements _$CaptainCopyWith<$Res> {
  __$CaptainCopyWithImpl(this._self, this._then);

  final _Captain _self;
  final $Res Function(_Captain) _then;

/// Create a copy of Captain
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? phone = freezed,Object? status = freezed,Object? boat = freezed,}) {
  return _then(_Captain(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,boat: freezed == boat ? _self.boat : boat // ignore: cast_nullable_to_non_nullable
as IdName?,
  ));
}

/// Create a copy of Captain
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res>? get boat {
    if (_self.boat == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.boat!, (value) {
    return _then(_self.copyWith(boat: value));
  });
}
}

// dart format on
