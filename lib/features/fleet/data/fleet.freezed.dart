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

 int get id; String get name; String? get nameEn; String? get boatNumber; String? get status; IdName? get port; IdName? get category; IdName? get type; PersonRef? get captain; double? get lengthM; double? get widthM; String? get color; String? get hullNumber; String? get bodyType; String? get engineType; String? get enginePower; String? get engineStatus; String? get callSign; String? get serialNumber; double? get capacity; int get crewCount; int? get crewCapacity; BoatLicense? get license; DateTime? get nextInspectionDate; BoatSetup? get setup; int get tripsCount; double get totalCatchKg; int? get version;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Boat&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.nameEn, _this.nameEn) || other.nameEn == _this.nameEn)&&(identical(other.boatNumber, _this.boatNumber) || other.boatNumber == _this.boatNumber)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.port, _this.port) || other.port == _this.port)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.captain, _this.captain) || other.captain == _this.captain)&&(identical(other.lengthM, _this.lengthM) || other.lengthM == _this.lengthM)&&(identical(other.widthM, _this.widthM) || other.widthM == _this.widthM)&&(identical(other.color, _this.color) || other.color == _this.color)&&(identical(other.hullNumber, _this.hullNumber) || other.hullNumber == _this.hullNumber)&&(identical(other.bodyType, _this.bodyType) || other.bodyType == _this.bodyType)&&(identical(other.engineType, _this.engineType) || other.engineType == _this.engineType)&&(identical(other.enginePower, _this.enginePower) || other.enginePower == _this.enginePower)&&(identical(other.engineStatus, _this.engineStatus) || other.engineStatus == _this.engineStatus)&&(identical(other.callSign, _this.callSign) || other.callSign == _this.callSign)&&(identical(other.serialNumber, _this.serialNumber) || other.serialNumber == _this.serialNumber)&&(identical(other.capacity, _this.capacity) || other.capacity == _this.capacity)&&(identical(other.crewCount, _this.crewCount) || other.crewCount == _this.crewCount)&&(identical(other.crewCapacity, _this.crewCapacity) || other.crewCapacity == _this.crewCapacity)&&(identical(other.license, _this.license) || other.license == _this.license)&&(identical(other.nextInspectionDate, _this.nextInspectionDate) || other.nextInspectionDate == _this.nextInspectionDate)&&(identical(other.setup, _this.setup) || other.setup == _this.setup)&&(identical(other.tripsCount, _this.tripsCount) || other.tripsCount == _this.tripsCount)&&(identical(other.totalCatchKg, _this.totalCatchKg) || other.totalCatchKg == _this.totalCatchKg)&&(identical(other.version, _this.version) || other.version == _this.version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Boat;
  return Object.hashAll([runtimeType,_this.id,_this.name,_this.nameEn,_this.boatNumber,_this.status,_this.port,_this.category,_this.type,_this.captain,_this.lengthM,_this.widthM,_this.color,_this.hullNumber,_this.bodyType,_this.engineType,_this.enginePower,_this.engineStatus,_this.callSign,_this.serialNumber,_this.capacity,_this.crewCount,_this.crewCapacity,_this.license,_this.nextInspectionDate,_this.setup,_this.tripsCount,_this.totalCatchKg,_this.version]);
}

@override
String toString() {
  final _this = this as Boat;
  return 'Boat(id: ${_this.id}, name: ${_this.name}, nameEn: ${_this.nameEn}, boatNumber: ${_this.boatNumber}, status: ${_this.status}, port: ${_this.port}, category: ${_this.category}, type: ${_this.type}, captain: ${_this.captain}, lengthM: ${_this.lengthM}, widthM: ${_this.widthM}, color: ${_this.color}, hullNumber: ${_this.hullNumber}, bodyType: ${_this.bodyType}, engineType: ${_this.engineType}, enginePower: ${_this.enginePower}, engineStatus: ${_this.engineStatus}, callSign: ${_this.callSign}, serialNumber: ${_this.serialNumber}, capacity: ${_this.capacity}, crewCount: ${_this.crewCount}, crewCapacity: ${_this.crewCapacity}, license: ${_this.license}, nextInspectionDate: ${_this.nextInspectionDate}, setup: ${_this.setup}, tripsCount: ${_this.tripsCount}, totalCatchKg: ${_this.totalCatchKg}, version: ${_this.version})';
}


}

/// @nodoc
abstract mixin class $BoatCopyWith<$Res>  {
  factory $BoatCopyWith(Boat value, $Res Function(Boat) _then) = _$BoatCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? nameEn, String? boatNumber, String? status, IdName? port, IdName? category, IdName? type, PersonRef? captain, double? lengthM, double? widthM, String? color, String? hullNumber, String? bodyType, String? engineType, String? enginePower, String? engineStatus, String? callSign, String? serialNumber, double? capacity, int crewCount, int? crewCapacity, BoatLicense? license, DateTime? nextInspectionDate, BoatSetup? setup, int tripsCount, double totalCatchKg, int? version
});


$IdNameCopyWith<$Res>? get port;$IdNameCopyWith<$Res>? get category;$IdNameCopyWith<$Res>? get type;$PersonRefCopyWith<$Res>? get captain;$BoatLicenseCopyWith<$Res>? get license;$BoatSetupCopyWith<$Res>? get setup;

}
/// @nodoc
class _$BoatCopyWithImpl<$Res>
    implements $BoatCopyWith<$Res> {
  _$BoatCopyWithImpl(this._self, this._then);

  final Boat _self;
  final $Res Function(Boat) _then;

/// Create a copy of Boat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? nameEn = freezed,Object? boatNumber = freezed,Object? status = freezed,Object? port = freezed,Object? category = freezed,Object? type = freezed,Object? captain = freezed,Object? lengthM = freezed,Object? widthM = freezed,Object? color = freezed,Object? hullNumber = freezed,Object? bodyType = freezed,Object? engineType = freezed,Object? enginePower = freezed,Object? engineStatus = freezed,Object? callSign = freezed,Object? serialNumber = freezed,Object? capacity = freezed,Object? crewCount = null,Object? crewCapacity = freezed,Object? license = freezed,Object? nextInspectionDate = freezed,Object? setup = freezed,Object? tripsCount = null,Object? totalCatchKg = null,Object? version = freezed,}) {
  return _then(Boat(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameEn: freezed == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String?,boatNumber: freezed == boatNumber ? _self.boatNumber : boatNumber // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,port: freezed == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as IdName?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as IdName?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as IdName?,captain: freezed == captain ? _self.captain : captain // ignore: cast_nullable_to_non_nullable
as PersonRef?,lengthM: freezed == lengthM ? _self.lengthM : lengthM // ignore: cast_nullable_to_non_nullable
as double?,widthM: freezed == widthM ? _self.widthM : widthM // ignore: cast_nullable_to_non_nullable
as double?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,hullNumber: freezed == hullNumber ? _self.hullNumber : hullNumber // ignore: cast_nullable_to_non_nullable
as String?,bodyType: freezed == bodyType ? _self.bodyType : bodyType // ignore: cast_nullable_to_non_nullable
as String?,engineType: freezed == engineType ? _self.engineType : engineType // ignore: cast_nullable_to_non_nullable
as String?,enginePower: freezed == enginePower ? _self.enginePower : enginePower // ignore: cast_nullable_to_non_nullable
as String?,engineStatus: freezed == engineStatus ? _self.engineStatus : engineStatus // ignore: cast_nullable_to_non_nullable
as String?,callSign: freezed == callSign ? _self.callSign : callSign // ignore: cast_nullable_to_non_nullable
as String?,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as double?,crewCount: null == crewCount ? _self.crewCount : crewCount // ignore: cast_nullable_to_non_nullable
as int,crewCapacity: freezed == crewCapacity ? _self.crewCapacity : crewCapacity // ignore: cast_nullable_to_non_nullable
as int?,license: freezed == license ? _self.license : license // ignore: cast_nullable_to_non_nullable
as BoatLicense?,nextInspectionDate: freezed == nextInspectionDate ? _self.nextInspectionDate : nextInspectionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,setup: freezed == setup ? _self.setup : setup // ignore: cast_nullable_to_non_nullable
as BoatSetup?,tripsCount: null == tripsCount ? _self.tripsCount : tripsCount // ignore: cast_nullable_to_non_nullable
as int,totalCatchKg: null == totalCatchKg ? _self.totalCatchKg : totalCatchKg // ignore: cast_nullable_to_non_nullable
as double,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int?,
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
$IdNameCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of Boat
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res>? get type {
    if (_self.type == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.type!, (value) {
    return _then(_self.copyWith(type: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? nameEn,  String? boatNumber,  String? status,  IdName? port,  IdName? category,  IdName? type,  PersonRef? captain,  double? lengthM,  double? widthM,  String? color,  String? hullNumber,  String? bodyType,  String? engineType,  String? enginePower,  String? engineStatus,  String? callSign,  String? serialNumber,  double? capacity,  int crewCount,  int? crewCapacity,  BoatLicense? license,  DateTime? nextInspectionDate,  BoatSetup? setup,  int tripsCount,  double totalCatchKg,  int? version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Boat() when $default != null:
return $default(_that.id,_that.name,_that.nameEn,_that.boatNumber,_that.status,_that.port,_that.category,_that.type,_that.captain,_that.lengthM,_that.widthM,_that.color,_that.hullNumber,_that.bodyType,_that.engineType,_that.enginePower,_that.engineStatus,_that.callSign,_that.serialNumber,_that.capacity,_that.crewCount,_that.crewCapacity,_that.license,_that.nextInspectionDate,_that.setup,_that.tripsCount,_that.totalCatchKg,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? nameEn,  String? boatNumber,  String? status,  IdName? port,  IdName? category,  IdName? type,  PersonRef? captain,  double? lengthM,  double? widthM,  String? color,  String? hullNumber,  String? bodyType,  String? engineType,  String? enginePower,  String? engineStatus,  String? callSign,  String? serialNumber,  double? capacity,  int crewCount,  int? crewCapacity,  BoatLicense? license,  DateTime? nextInspectionDate,  BoatSetup? setup,  int tripsCount,  double totalCatchKg,  int? version)  $default,) {final _that = this;
switch (_that) {
case _Boat():
return $default(_that.id,_that.name,_that.nameEn,_that.boatNumber,_that.status,_that.port,_that.category,_that.type,_that.captain,_that.lengthM,_that.widthM,_that.color,_that.hullNumber,_that.bodyType,_that.engineType,_that.enginePower,_that.engineStatus,_that.callSign,_that.serialNumber,_that.capacity,_that.crewCount,_that.crewCapacity,_that.license,_that.nextInspectionDate,_that.setup,_that.tripsCount,_that.totalCatchKg,_that.version);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? nameEn,  String? boatNumber,  String? status,  IdName? port,  IdName? category,  IdName? type,  PersonRef? captain,  double? lengthM,  double? widthM,  String? color,  String? hullNumber,  String? bodyType,  String? engineType,  String? enginePower,  String? engineStatus,  String? callSign,  String? serialNumber,  double? capacity,  int crewCount,  int? crewCapacity,  BoatLicense? license,  DateTime? nextInspectionDate,  BoatSetup? setup,  int tripsCount,  double totalCatchKg,  int? version)?  $default,) {final _that = this;
switch (_that) {
case _Boat() when $default != null:
return $default(_that.id,_that.name,_that.nameEn,_that.boatNumber,_that.status,_that.port,_that.category,_that.type,_that.captain,_that.lengthM,_that.widthM,_that.color,_that.hullNumber,_that.bodyType,_that.engineType,_that.enginePower,_that.engineStatus,_that.callSign,_that.serialNumber,_that.capacity,_that.crewCount,_that.crewCapacity,_that.license,_that.nextInspectionDate,_that.setup,_that.tripsCount,_that.totalCatchKg,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Boat extends Boat {
  const _Boat({required this.id, required this.name, this.nameEn, this.boatNumber, this.status, this.port, this.category, this.type, this.captain, this.lengthM, this.widthM, this.color, this.hullNumber, this.bodyType, this.engineType, this.enginePower, this.engineStatus, this.callSign, this.serialNumber, this.capacity, this.crewCount = 0, this.crewCapacity, this.license, this.nextInspectionDate, this.setup, this.tripsCount = 0, this.totalCatchKg = 0, this.version}): super._();
  factory _Boat.fromJson(Map<String, dynamic> json) => _$BoatFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? nameEn;
@override final  String? boatNumber;
@override final  String? status;
@override final  IdName? port;
@override final  IdName? category;
@override final  IdName? type;
@override final  PersonRef? captain;
@override final  double? lengthM;
@override final  double? widthM;
@override final  String? color;
@override final  String? hullNumber;
@override final  String? bodyType;
@override final  String? engineType;
@override final  String? enginePower;
@override final  String? engineStatus;
@override final  String? callSign;
@override final  String? serialNumber;
@override final  double? capacity;
@override@JsonKey() final  int crewCount;
@override final  int? crewCapacity;
@override final  BoatLicense? license;
@override final  DateTime? nextInspectionDate;
@override final  BoatSetup? setup;
@override@JsonKey() final  int tripsCount;
@override@JsonKey() final  double totalCatchKg;
@override final  int? version;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Boat&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.boatNumber, boatNumber) || other.boatNumber == boatNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.port, port) || other.port == port)&&(identical(other.category, category) || other.category == category)&&(identical(other.type, type) || other.type == type)&&(identical(other.captain, captain) || other.captain == captain)&&(identical(other.lengthM, lengthM) || other.lengthM == lengthM)&&(identical(other.widthM, widthM) || other.widthM == widthM)&&(identical(other.color, color) || other.color == color)&&(identical(other.hullNumber, hullNumber) || other.hullNumber == hullNumber)&&(identical(other.bodyType, bodyType) || other.bodyType == bodyType)&&(identical(other.engineType, engineType) || other.engineType == engineType)&&(identical(other.enginePower, enginePower) || other.enginePower == enginePower)&&(identical(other.engineStatus, engineStatus) || other.engineStatus == engineStatus)&&(identical(other.callSign, callSign) || other.callSign == callSign)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.crewCount, crewCount) || other.crewCount == crewCount)&&(identical(other.crewCapacity, crewCapacity) || other.crewCapacity == crewCapacity)&&(identical(other.license, license) || other.license == license)&&(identical(other.nextInspectionDate, nextInspectionDate) || other.nextInspectionDate == nextInspectionDate)&&(identical(other.setup, setup) || other.setup == setup)&&(identical(other.tripsCount, tripsCount) || other.tripsCount == tripsCount)&&(identical(other.totalCatchKg, totalCatchKg) || other.totalCatchKg == totalCatchKg)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,name,nameEn,boatNumber,status,port,category,type,captain,lengthM,widthM,color,hullNumber,bodyType,engineType,enginePower,engineStatus,callSign,serialNumber,capacity,crewCount,crewCapacity,license,nextInspectionDate,setup,tripsCount,totalCatchKg,version]);
}

@override
String toString() {
    return 'Boat(id: $id, name: $name, nameEn: $nameEn, boatNumber: $boatNumber, status: $status, port: $port, category: $category, type: $type, captain: $captain, lengthM: $lengthM, widthM: $widthM, color: $color, hullNumber: $hullNumber, bodyType: $bodyType, engineType: $engineType, enginePower: $enginePower, engineStatus: $engineStatus, callSign: $callSign, serialNumber: $serialNumber, capacity: $capacity, crewCount: $crewCount, crewCapacity: $crewCapacity, license: $license, nextInspectionDate: $nextInspectionDate, setup: $setup, tripsCount: $tripsCount, totalCatchKg: $totalCatchKg, version: $version)';
}


}

/// @nodoc
abstract mixin class _$BoatCopyWith<$Res> implements $BoatCopyWith<$Res> {
  factory _$BoatCopyWith(_Boat value, $Res Function(_Boat) _then) = __$BoatCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? nameEn, String? boatNumber, String? status, IdName? port, IdName? category, IdName? type, PersonRef? captain, double? lengthM, double? widthM, String? color, String? hullNumber, String? bodyType, String? engineType, String? enginePower, String? engineStatus, String? callSign, String? serialNumber, double? capacity, int crewCount, int? crewCapacity, BoatLicense? license, DateTime? nextInspectionDate, BoatSetup? setup, int tripsCount, double totalCatchKg, int? version
});


@override $IdNameCopyWith<$Res>? get port;@override $IdNameCopyWith<$Res>? get category;@override $IdNameCopyWith<$Res>? get type;@override $PersonRefCopyWith<$Res>? get captain;@override $BoatLicenseCopyWith<$Res>? get license;@override $BoatSetupCopyWith<$Res>? get setup;

}
/// @nodoc
class __$BoatCopyWithImpl<$Res>
    implements _$BoatCopyWith<$Res> {
  __$BoatCopyWithImpl(this._self, this._then);

  final _Boat _self;
  final $Res Function(_Boat) _then;

/// Create a copy of Boat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? nameEn = freezed,Object? boatNumber = freezed,Object? status = freezed,Object? port = freezed,Object? category = freezed,Object? type = freezed,Object? captain = freezed,Object? lengthM = freezed,Object? widthM = freezed,Object? color = freezed,Object? hullNumber = freezed,Object? bodyType = freezed,Object? engineType = freezed,Object? enginePower = freezed,Object? engineStatus = freezed,Object? callSign = freezed,Object? serialNumber = freezed,Object? capacity = freezed,Object? crewCount = null,Object? crewCapacity = freezed,Object? license = freezed,Object? nextInspectionDate = freezed,Object? setup = freezed,Object? tripsCount = null,Object? totalCatchKg = null,Object? version = freezed,}) {
  return _then(_Boat(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameEn: freezed == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String?,boatNumber: freezed == boatNumber ? _self.boatNumber : boatNumber // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,port: freezed == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as IdName?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as IdName?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as IdName?,captain: freezed == captain ? _self.captain : captain // ignore: cast_nullable_to_non_nullable
as PersonRef?,lengthM: freezed == lengthM ? _self.lengthM : lengthM // ignore: cast_nullable_to_non_nullable
as double?,widthM: freezed == widthM ? _self.widthM : widthM // ignore: cast_nullable_to_non_nullable
as double?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,hullNumber: freezed == hullNumber ? _self.hullNumber : hullNumber // ignore: cast_nullable_to_non_nullable
as String?,bodyType: freezed == bodyType ? _self.bodyType : bodyType // ignore: cast_nullable_to_non_nullable
as String?,engineType: freezed == engineType ? _self.engineType : engineType // ignore: cast_nullable_to_non_nullable
as String?,enginePower: freezed == enginePower ? _self.enginePower : enginePower // ignore: cast_nullable_to_non_nullable
as String?,engineStatus: freezed == engineStatus ? _self.engineStatus : engineStatus // ignore: cast_nullable_to_non_nullable
as String?,callSign: freezed == callSign ? _self.callSign : callSign // ignore: cast_nullable_to_non_nullable
as String?,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as double?,crewCount: null == crewCount ? _self.crewCount : crewCount // ignore: cast_nullable_to_non_nullable
as int,crewCapacity: freezed == crewCapacity ? _self.crewCapacity : crewCapacity // ignore: cast_nullable_to_non_nullable
as int?,license: freezed == license ? _self.license : license // ignore: cast_nullable_to_non_nullable
as BoatLicense?,nextInspectionDate: freezed == nextInspectionDate ? _self.nextInspectionDate : nextInspectionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,setup: freezed == setup ? _self.setup : setup // ignore: cast_nullable_to_non_nullable
as BoatSetup?,tripsCount: null == tripsCount ? _self.tripsCount : tripsCount // ignore: cast_nullable_to_non_nullable
as int,totalCatchKg: null == totalCatchKg ? _self.totalCatchKg : totalCatchKg // ignore: cast_nullable_to_non_nullable
as double,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int?,
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
$IdNameCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of Boat
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res>? get type {
    if (_self.type == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.type!, (value) {
    return _then(_self.copyWith(type: value));
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

 String? get type; String? get number; String? get status; String? get process; String? get area; DateTime? get date; DateTime? get expiry;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoatLicense&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.process, _this.process) || other.process == _this.process)&&(identical(other.area, _this.area) || other.area == _this.area)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.expiry, _this.expiry) || other.expiry == _this.expiry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BoatLicense;
  return Object.hash(runtimeType,_this.type,_this.number,_this.status,_this.process,_this.area,_this.date,_this.expiry);
}

@override
String toString() {
  final _this = this as BoatLicense;
  return 'BoatLicense(type: ${_this.type}, number: ${_this.number}, status: ${_this.status}, process: ${_this.process}, area: ${_this.area}, date: ${_this.date}, expiry: ${_this.expiry})';
}


}

/// @nodoc
abstract mixin class $BoatLicenseCopyWith<$Res>  {
  factory $BoatLicenseCopyWith(BoatLicense value, $Res Function(BoatLicense) _then) = _$BoatLicenseCopyWithImpl;
@useResult
$Res call({
 String? type, String? number, String? status, String? process, String? area, DateTime? date, DateTime? expiry
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
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? number = freezed,Object? status = freezed,Object? process = freezed,Object? area = freezed,Object? date = freezed,Object? expiry = freezed,}) {
  return _then(BoatLicense(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,process: freezed == process ? _self.process : process // ignore: cast_nullable_to_non_nullable
as String?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,expiry: freezed == expiry ? _self.expiry : expiry // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? type,  String? number,  String? status,  String? process,  String? area,  DateTime? date,  DateTime? expiry)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BoatLicense() when $default != null:
return $default(_that.type,_that.number,_that.status,_that.process,_that.area,_that.date,_that.expiry);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? type,  String? number,  String? status,  String? process,  String? area,  DateTime? date,  DateTime? expiry)  $default,) {final _that = this;
switch (_that) {
case _BoatLicense():
return $default(_that.type,_that.number,_that.status,_that.process,_that.area,_that.date,_that.expiry);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? type,  String? number,  String? status,  String? process,  String? area,  DateTime? date,  DateTime? expiry)?  $default,) {final _that = this;
switch (_that) {
case _BoatLicense() when $default != null:
return $default(_that.type,_that.number,_that.status,_that.process,_that.area,_that.date,_that.expiry);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BoatLicense implements BoatLicense {
  const _BoatLicense({this.type, this.number, this.status, this.process, this.area, this.date, this.expiry});
  factory _BoatLicense.fromJson(Map<String, dynamic> json) => _$BoatLicenseFromJson(json);

@override final  String? type;
@override final  String? number;
@override final  String? status;
@override final  String? process;
@override final  String? area;
@override final  DateTime? date;
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoatLicense&&(identical(other.type, type) || other.type == type)&&(identical(other.number, number) || other.number == number)&&(identical(other.status, status) || other.status == status)&&(identical(other.process, process) || other.process == process)&&(identical(other.area, area) || other.area == area)&&(identical(other.date, date) || other.date == date)&&(identical(other.expiry, expiry) || other.expiry == expiry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,number,status,process,area,date,expiry);
}

@override
String toString() {
    return 'BoatLicense(type: $type, number: $number, status: $status, process: $process, area: $area, date: $date, expiry: $expiry)';
}


}

/// @nodoc
abstract mixin class _$BoatLicenseCopyWith<$Res> implements $BoatLicenseCopyWith<$Res> {
  factory _$BoatLicenseCopyWith(_BoatLicense value, $Res Function(_BoatLicense) _then) = __$BoatLicenseCopyWithImpl;
@override @useResult
$Res call({
 String? type, String? number, String? status, String? process, String? area, DateTime? date, DateTime? expiry
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
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? number = freezed,Object? status = freezed,Object? process = freezed,Object? area = freezed,Object? date = freezed,Object? expiry = freezed,}) {
  return _then(_BoatLicense(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,process: freezed == process ? _self.process : process // ignore: cast_nullable_to_non_nullable
as String?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,expiry: freezed == expiry ? _self.expiry : expiry // ignore: cast_nullable_to_non_nullable
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
mixin _$Fisher {

 int get id; String get name; bool get isCaptain; String? get phone; String? get email; String? get avatarUrl; String? get nationalId; String? get nationality; IdName? get idType; DateTime? get iqamaIssueDate; DateTime? get iqamaExpiryDate; IdName? get role; IdName? get boat; IdName? get port; String? get licenseNumber; String? get licenseStatus; DateTime? get licenseDate; DateTime? get licenseExpiry; int get experienceYears; int get tripsCount; String? get status; int? get version;
/// Create a copy of Fisher
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FisherCopyWith<Fisher> get copyWith => _$FisherCopyWithImpl<Fisher>(this as Fisher, _$identity);

  /// Serializes this Fisher to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Fisher;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Fisher&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.isCaptain, _this.isCaptain) || other.isCaptain == _this.isCaptain)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.avatarUrl, _this.avatarUrl) || other.avatarUrl == _this.avatarUrl)&&(identical(other.nationalId, _this.nationalId) || other.nationalId == _this.nationalId)&&(identical(other.nationality, _this.nationality) || other.nationality == _this.nationality)&&(identical(other.idType, _this.idType) || other.idType == _this.idType)&&(identical(other.iqamaIssueDate, _this.iqamaIssueDate) || other.iqamaIssueDate == _this.iqamaIssueDate)&&(identical(other.iqamaExpiryDate, _this.iqamaExpiryDate) || other.iqamaExpiryDate == _this.iqamaExpiryDate)&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.boat, _this.boat) || other.boat == _this.boat)&&(identical(other.port, _this.port) || other.port == _this.port)&&(identical(other.licenseNumber, _this.licenseNumber) || other.licenseNumber == _this.licenseNumber)&&(identical(other.licenseStatus, _this.licenseStatus) || other.licenseStatus == _this.licenseStatus)&&(identical(other.licenseDate, _this.licenseDate) || other.licenseDate == _this.licenseDate)&&(identical(other.licenseExpiry, _this.licenseExpiry) || other.licenseExpiry == _this.licenseExpiry)&&(identical(other.experienceYears, _this.experienceYears) || other.experienceYears == _this.experienceYears)&&(identical(other.tripsCount, _this.tripsCount) || other.tripsCount == _this.tripsCount)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.version, _this.version) || other.version == _this.version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Fisher;
  return Object.hashAll([runtimeType,_this.id,_this.name,_this.isCaptain,_this.phone,_this.email,_this.avatarUrl,_this.nationalId,_this.nationality,_this.idType,_this.iqamaIssueDate,_this.iqamaExpiryDate,_this.role,_this.boat,_this.port,_this.licenseNumber,_this.licenseStatus,_this.licenseDate,_this.licenseExpiry,_this.experienceYears,_this.tripsCount,_this.status,_this.version]);
}

@override
String toString() {
  final _this = this as Fisher;
  return 'Fisher(id: ${_this.id}, name: ${_this.name}, isCaptain: ${_this.isCaptain}, phone: ${_this.phone}, email: ${_this.email}, avatarUrl: ${_this.avatarUrl}, nationalId: ${_this.nationalId}, nationality: ${_this.nationality}, idType: ${_this.idType}, iqamaIssueDate: ${_this.iqamaIssueDate}, iqamaExpiryDate: ${_this.iqamaExpiryDate}, role: ${_this.role}, boat: ${_this.boat}, port: ${_this.port}, licenseNumber: ${_this.licenseNumber}, licenseStatus: ${_this.licenseStatus}, licenseDate: ${_this.licenseDate}, licenseExpiry: ${_this.licenseExpiry}, experienceYears: ${_this.experienceYears}, tripsCount: ${_this.tripsCount}, status: ${_this.status}, version: ${_this.version})';
}


}

/// @nodoc
abstract mixin class $FisherCopyWith<$Res>  {
  factory $FisherCopyWith(Fisher value, $Res Function(Fisher) _then) = _$FisherCopyWithImpl;
@useResult
$Res call({
 int id, String name, bool isCaptain, String? phone, String? email, String? avatarUrl, String? nationalId, String? nationality, IdName? idType, DateTime? iqamaIssueDate, DateTime? iqamaExpiryDate, IdName? role, IdName? boat, IdName? port, String? licenseNumber, String? licenseStatus, DateTime? licenseDate, DateTime? licenseExpiry, int experienceYears, int tripsCount, String? status, int? version
});


$IdNameCopyWith<$Res>? get idType;$IdNameCopyWith<$Res>? get role;$IdNameCopyWith<$Res>? get boat;$IdNameCopyWith<$Res>? get port;

}
/// @nodoc
class _$FisherCopyWithImpl<$Res>
    implements $FisherCopyWith<$Res> {
  _$FisherCopyWithImpl(this._self, this._then);

  final Fisher _self;
  final $Res Function(Fisher) _then;

/// Create a copy of Fisher
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? isCaptain = null,Object? phone = freezed,Object? email = freezed,Object? avatarUrl = freezed,Object? nationalId = freezed,Object? nationality = freezed,Object? idType = freezed,Object? iqamaIssueDate = freezed,Object? iqamaExpiryDate = freezed,Object? role = freezed,Object? boat = freezed,Object? port = freezed,Object? licenseNumber = freezed,Object? licenseStatus = freezed,Object? licenseDate = freezed,Object? licenseExpiry = freezed,Object? experienceYears = null,Object? tripsCount = null,Object? status = freezed,Object? version = freezed,}) {
  return _then(Fisher(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isCaptain: null == isCaptain ? _self.isCaptain : isCaptain // ignore: cast_nullable_to_non_nullable
as bool,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,nationalId: freezed == nationalId ? _self.nationalId : nationalId // ignore: cast_nullable_to_non_nullable
as String?,nationality: freezed == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as String?,idType: freezed == idType ? _self.idType : idType // ignore: cast_nullable_to_non_nullable
as IdName?,iqamaIssueDate: freezed == iqamaIssueDate ? _self.iqamaIssueDate : iqamaIssueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,iqamaExpiryDate: freezed == iqamaExpiryDate ? _self.iqamaExpiryDate : iqamaExpiryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as IdName?,boat: freezed == boat ? _self.boat : boat // ignore: cast_nullable_to_non_nullable
as IdName?,port: freezed == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as IdName?,licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,licenseStatus: freezed == licenseStatus ? _self.licenseStatus : licenseStatus // ignore: cast_nullable_to_non_nullable
as String?,licenseDate: freezed == licenseDate ? _self.licenseDate : licenseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,licenseExpiry: freezed == licenseExpiry ? _self.licenseExpiry : licenseExpiry // ignore: cast_nullable_to_non_nullable
as DateTime?,experienceYears: null == experienceYears ? _self.experienceYears : experienceYears // ignore: cast_nullable_to_non_nullable
as int,tripsCount: null == tripsCount ? _self.tripsCount : tripsCount // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of Fisher
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res>? get idType {
    if (_self.idType == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.idType!, (value) {
    return _then(_self.copyWith(idType: value));
  });
}/// Create a copy of Fisher
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res>? get role {
    if (_self.role == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.role!, (value) {
    return _then(_self.copyWith(role: value));
  });
}/// Create a copy of Fisher
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
}/// Create a copy of Fisher
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
}
}


/// Adds pattern-matching-related methods to [Fisher].
extension FisherPatterns on Fisher {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Fisher value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Fisher() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Fisher value)  $default,){
final _that = this;
switch (_that) {
case _Fisher():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Fisher value)?  $default,){
final _that = this;
switch (_that) {
case _Fisher() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  bool isCaptain,  String? phone,  String? email,  String? avatarUrl,  String? nationalId,  String? nationality,  IdName? idType,  DateTime? iqamaIssueDate,  DateTime? iqamaExpiryDate,  IdName? role,  IdName? boat,  IdName? port,  String? licenseNumber,  String? licenseStatus,  DateTime? licenseDate,  DateTime? licenseExpiry,  int experienceYears,  int tripsCount,  String? status,  int? version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Fisher() when $default != null:
return $default(_that.id,_that.name,_that.isCaptain,_that.phone,_that.email,_that.avatarUrl,_that.nationalId,_that.nationality,_that.idType,_that.iqamaIssueDate,_that.iqamaExpiryDate,_that.role,_that.boat,_that.port,_that.licenseNumber,_that.licenseStatus,_that.licenseDate,_that.licenseExpiry,_that.experienceYears,_that.tripsCount,_that.status,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  bool isCaptain,  String? phone,  String? email,  String? avatarUrl,  String? nationalId,  String? nationality,  IdName? idType,  DateTime? iqamaIssueDate,  DateTime? iqamaExpiryDate,  IdName? role,  IdName? boat,  IdName? port,  String? licenseNumber,  String? licenseStatus,  DateTime? licenseDate,  DateTime? licenseExpiry,  int experienceYears,  int tripsCount,  String? status,  int? version)  $default,) {final _that = this;
switch (_that) {
case _Fisher():
return $default(_that.id,_that.name,_that.isCaptain,_that.phone,_that.email,_that.avatarUrl,_that.nationalId,_that.nationality,_that.idType,_that.iqamaIssueDate,_that.iqamaExpiryDate,_that.role,_that.boat,_that.port,_that.licenseNumber,_that.licenseStatus,_that.licenseDate,_that.licenseExpiry,_that.experienceYears,_that.tripsCount,_that.status,_that.version);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  bool isCaptain,  String? phone,  String? email,  String? avatarUrl,  String? nationalId,  String? nationality,  IdName? idType,  DateTime? iqamaIssueDate,  DateTime? iqamaExpiryDate,  IdName? role,  IdName? boat,  IdName? port,  String? licenseNumber,  String? licenseStatus,  DateTime? licenseDate,  DateTime? licenseExpiry,  int experienceYears,  int tripsCount,  String? status,  int? version)?  $default,) {final _that = this;
switch (_that) {
case _Fisher() when $default != null:
return $default(_that.id,_that.name,_that.isCaptain,_that.phone,_that.email,_that.avatarUrl,_that.nationalId,_that.nationality,_that.idType,_that.iqamaIssueDate,_that.iqamaExpiryDate,_that.role,_that.boat,_that.port,_that.licenseNumber,_that.licenseStatus,_that.licenseDate,_that.licenseExpiry,_that.experienceYears,_that.tripsCount,_that.status,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Fisher extends Fisher {
  const _Fisher({required this.id, required this.name, this.isCaptain = false, this.phone, this.email, this.avatarUrl, this.nationalId, this.nationality, this.idType, this.iqamaIssueDate, this.iqamaExpiryDate, this.role, this.boat, this.port, this.licenseNumber, this.licenseStatus, this.licenseDate, this.licenseExpiry, this.experienceYears = 0, this.tripsCount = 0, this.status, this.version}): super._();
  factory _Fisher.fromJson(Map<String, dynamic> json) => _$FisherFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey() final  bool isCaptain;
@override final  String? phone;
@override final  String? email;
@override final  String? avatarUrl;
@override final  String? nationalId;
@override final  String? nationality;
@override final  IdName? idType;
@override final  DateTime? iqamaIssueDate;
@override final  DateTime? iqamaExpiryDate;
@override final  IdName? role;
@override final  IdName? boat;
@override final  IdName? port;
@override final  String? licenseNumber;
@override final  String? licenseStatus;
@override final  DateTime? licenseDate;
@override final  DateTime? licenseExpiry;
@override@JsonKey() final  int experienceYears;
@override@JsonKey() final  int tripsCount;
@override final  String? status;
@override final  int? version;

/// Create a copy of Fisher
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FisherCopyWith<_Fisher> get copyWith => __$FisherCopyWithImpl<_Fisher>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FisherToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Fisher&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.isCaptain, isCaptain) || other.isCaptain == isCaptain)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.nationalId, nationalId) || other.nationalId == nationalId)&&(identical(other.nationality, nationality) || other.nationality == nationality)&&(identical(other.idType, idType) || other.idType == idType)&&(identical(other.iqamaIssueDate, iqamaIssueDate) || other.iqamaIssueDate == iqamaIssueDate)&&(identical(other.iqamaExpiryDate, iqamaExpiryDate) || other.iqamaExpiryDate == iqamaExpiryDate)&&(identical(other.role, role) || other.role == role)&&(identical(other.boat, boat) || other.boat == boat)&&(identical(other.port, port) || other.port == port)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.licenseStatus, licenseStatus) || other.licenseStatus == licenseStatus)&&(identical(other.licenseDate, licenseDate) || other.licenseDate == licenseDate)&&(identical(other.licenseExpiry, licenseExpiry) || other.licenseExpiry == licenseExpiry)&&(identical(other.experienceYears, experienceYears) || other.experienceYears == experienceYears)&&(identical(other.tripsCount, tripsCount) || other.tripsCount == tripsCount)&&(identical(other.status, status) || other.status == status)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,name,isCaptain,phone,email,avatarUrl,nationalId,nationality,idType,iqamaIssueDate,iqamaExpiryDate,role,boat,port,licenseNumber,licenseStatus,licenseDate,licenseExpiry,experienceYears,tripsCount,status,version]);
}

@override
String toString() {
    return 'Fisher(id: $id, name: $name, isCaptain: $isCaptain, phone: $phone, email: $email, avatarUrl: $avatarUrl, nationalId: $nationalId, nationality: $nationality, idType: $idType, iqamaIssueDate: $iqamaIssueDate, iqamaExpiryDate: $iqamaExpiryDate, role: $role, boat: $boat, port: $port, licenseNumber: $licenseNumber, licenseStatus: $licenseStatus, licenseDate: $licenseDate, licenseExpiry: $licenseExpiry, experienceYears: $experienceYears, tripsCount: $tripsCount, status: $status, version: $version)';
}


}

/// @nodoc
abstract mixin class _$FisherCopyWith<$Res> implements $FisherCopyWith<$Res> {
  factory _$FisherCopyWith(_Fisher value, $Res Function(_Fisher) _then) = __$FisherCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, bool isCaptain, String? phone, String? email, String? avatarUrl, String? nationalId, String? nationality, IdName? idType, DateTime? iqamaIssueDate, DateTime? iqamaExpiryDate, IdName? role, IdName? boat, IdName? port, String? licenseNumber, String? licenseStatus, DateTime? licenseDate, DateTime? licenseExpiry, int experienceYears, int tripsCount, String? status, int? version
});


@override $IdNameCopyWith<$Res>? get idType;@override $IdNameCopyWith<$Res>? get role;@override $IdNameCopyWith<$Res>? get boat;@override $IdNameCopyWith<$Res>? get port;

}
/// @nodoc
class __$FisherCopyWithImpl<$Res>
    implements _$FisherCopyWith<$Res> {
  __$FisherCopyWithImpl(this._self, this._then);

  final _Fisher _self;
  final $Res Function(_Fisher) _then;

/// Create a copy of Fisher
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? isCaptain = null,Object? phone = freezed,Object? email = freezed,Object? avatarUrl = freezed,Object? nationalId = freezed,Object? nationality = freezed,Object? idType = freezed,Object? iqamaIssueDate = freezed,Object? iqamaExpiryDate = freezed,Object? role = freezed,Object? boat = freezed,Object? port = freezed,Object? licenseNumber = freezed,Object? licenseStatus = freezed,Object? licenseDate = freezed,Object? licenseExpiry = freezed,Object? experienceYears = null,Object? tripsCount = null,Object? status = freezed,Object? version = freezed,}) {
  return _then(_Fisher(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isCaptain: null == isCaptain ? _self.isCaptain : isCaptain // ignore: cast_nullable_to_non_nullable
as bool,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,nationalId: freezed == nationalId ? _self.nationalId : nationalId // ignore: cast_nullable_to_non_nullable
as String?,nationality: freezed == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as String?,idType: freezed == idType ? _self.idType : idType // ignore: cast_nullable_to_non_nullable
as IdName?,iqamaIssueDate: freezed == iqamaIssueDate ? _self.iqamaIssueDate : iqamaIssueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,iqamaExpiryDate: freezed == iqamaExpiryDate ? _self.iqamaExpiryDate : iqamaExpiryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as IdName?,boat: freezed == boat ? _self.boat : boat // ignore: cast_nullable_to_non_nullable
as IdName?,port: freezed == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as IdName?,licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,licenseStatus: freezed == licenseStatus ? _self.licenseStatus : licenseStatus // ignore: cast_nullable_to_non_nullable
as String?,licenseDate: freezed == licenseDate ? _self.licenseDate : licenseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,licenseExpiry: freezed == licenseExpiry ? _self.licenseExpiry : licenseExpiry // ignore: cast_nullable_to_non_nullable
as DateTime?,experienceYears: null == experienceYears ? _self.experienceYears : experienceYears // ignore: cast_nullable_to_non_nullable
as int,tripsCount: null == tripsCount ? _self.tripsCount : tripsCount // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of Fisher
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res>? get idType {
    if (_self.idType == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.idType!, (value) {
    return _then(_self.copyWith(idType: value));
  });
}/// Create a copy of Fisher
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res>? get role {
    if (_self.role == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.role!, (value) {
    return _then(_self.copyWith(role: value));
  });
}/// Create a copy of Fisher
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
}/// Create a copy of Fisher
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
}
}


/// @nodoc
mixin _$Maintenance {

 int get id; IdName? get boat; IdName? get type; DateTime? get date; String? get technician; double? get estimatedCost; double? get actualCost; String? get description; String? get status; MaintenanceExpense? get expense;
/// Create a copy of Maintenance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceCopyWith<Maintenance> get copyWith => _$MaintenanceCopyWithImpl<Maintenance>(this as Maintenance, _$identity);

  /// Serializes this Maintenance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Maintenance;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Maintenance&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.boat, _this.boat) || other.boat == _this.boat)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.technician, _this.technician) || other.technician == _this.technician)&&(identical(other.estimatedCost, _this.estimatedCost) || other.estimatedCost == _this.estimatedCost)&&(identical(other.actualCost, _this.actualCost) || other.actualCost == _this.actualCost)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.expense, _this.expense) || other.expense == _this.expense));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Maintenance;
  return Object.hash(runtimeType,_this.id,_this.boat,_this.type,_this.date,_this.technician,_this.estimatedCost,_this.actualCost,_this.description,_this.status,_this.expense);
}

@override
String toString() {
  final _this = this as Maintenance;
  return 'Maintenance(id: ${_this.id}, boat: ${_this.boat}, type: ${_this.type}, date: ${_this.date}, technician: ${_this.technician}, estimatedCost: ${_this.estimatedCost}, actualCost: ${_this.actualCost}, description: ${_this.description}, status: ${_this.status}, expense: ${_this.expense})';
}


}

/// @nodoc
abstract mixin class $MaintenanceCopyWith<$Res>  {
  factory $MaintenanceCopyWith(Maintenance value, $Res Function(Maintenance) _then) = _$MaintenanceCopyWithImpl;
@useResult
$Res call({
 int id, IdName? boat, IdName? type, DateTime? date, String? technician, double? estimatedCost, double? actualCost, String? description, String? status, MaintenanceExpense? expense
});


$IdNameCopyWith<$Res>? get boat;$IdNameCopyWith<$Res>? get type;$MaintenanceExpenseCopyWith<$Res>? get expense;

}
/// @nodoc
class _$MaintenanceCopyWithImpl<$Res>
    implements $MaintenanceCopyWith<$Res> {
  _$MaintenanceCopyWithImpl(this._self, this._then);

  final Maintenance _self;
  final $Res Function(Maintenance) _then;

/// Create a copy of Maintenance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? boat = freezed,Object? type = freezed,Object? date = freezed,Object? technician = freezed,Object? estimatedCost = freezed,Object? actualCost = freezed,Object? description = freezed,Object? status = freezed,Object? expense = freezed,}) {
  return _then(Maintenance(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,boat: freezed == boat ? _self.boat : boat // ignore: cast_nullable_to_non_nullable
as IdName?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as IdName?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,technician: freezed == technician ? _self.technician : technician // ignore: cast_nullable_to_non_nullable
as String?,estimatedCost: freezed == estimatedCost ? _self.estimatedCost : estimatedCost // ignore: cast_nullable_to_non_nullable
as double?,actualCost: freezed == actualCost ? _self.actualCost : actualCost // ignore: cast_nullable_to_non_nullable
as double?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,expense: freezed == expense ? _self.expense : expense // ignore: cast_nullable_to_non_nullable
as MaintenanceExpense?,
  ));
}
/// Create a copy of Maintenance
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
}/// Create a copy of Maintenance
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res>? get type {
    if (_self.type == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.type!, (value) {
    return _then(_self.copyWith(type: value));
  });
}/// Create a copy of Maintenance
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MaintenanceExpenseCopyWith<$Res>? get expense {
    if (_self.expense == null) {
    return null;
  }

  return $MaintenanceExpenseCopyWith<$Res>(_self.expense!, (value) {
    return _then(_self.copyWith(expense: value));
  });
}
}


/// Adds pattern-matching-related methods to [Maintenance].
extension MaintenancePatterns on Maintenance {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Maintenance value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Maintenance() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Maintenance value)  $default,){
final _that = this;
switch (_that) {
case _Maintenance():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Maintenance value)?  $default,){
final _that = this;
switch (_that) {
case _Maintenance() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  IdName? boat,  IdName? type,  DateTime? date,  String? technician,  double? estimatedCost,  double? actualCost,  String? description,  String? status,  MaintenanceExpense? expense)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Maintenance() when $default != null:
return $default(_that.id,_that.boat,_that.type,_that.date,_that.technician,_that.estimatedCost,_that.actualCost,_that.description,_that.status,_that.expense);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  IdName? boat,  IdName? type,  DateTime? date,  String? technician,  double? estimatedCost,  double? actualCost,  String? description,  String? status,  MaintenanceExpense? expense)  $default,) {final _that = this;
switch (_that) {
case _Maintenance():
return $default(_that.id,_that.boat,_that.type,_that.date,_that.technician,_that.estimatedCost,_that.actualCost,_that.description,_that.status,_that.expense);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  IdName? boat,  IdName? type,  DateTime? date,  String? technician,  double? estimatedCost,  double? actualCost,  String? description,  String? status,  MaintenanceExpense? expense)?  $default,) {final _that = this;
switch (_that) {
case _Maintenance() when $default != null:
return $default(_that.id,_that.boat,_that.type,_that.date,_that.technician,_that.estimatedCost,_that.actualCost,_that.description,_that.status,_that.expense);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Maintenance implements Maintenance {
  const _Maintenance({required this.id, this.boat, this.type, this.date, this.technician, this.estimatedCost, this.actualCost, this.description, this.status, this.expense});
  factory _Maintenance.fromJson(Map<String, dynamic> json) => _$MaintenanceFromJson(json);

@override final  int id;
@override final  IdName? boat;
@override final  IdName? type;
@override final  DateTime? date;
@override final  String? technician;
@override final  double? estimatedCost;
@override final  double? actualCost;
@override final  String? description;
@override final  String? status;
@override final  MaintenanceExpense? expense;

/// Create a copy of Maintenance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceCopyWith<_Maintenance> get copyWith => __$MaintenanceCopyWithImpl<_Maintenance>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaintenanceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Maintenance&&(identical(other.id, id) || other.id == id)&&(identical(other.boat, boat) || other.boat == boat)&&(identical(other.type, type) || other.type == type)&&(identical(other.date, date) || other.date == date)&&(identical(other.technician, technician) || other.technician == technician)&&(identical(other.estimatedCost, estimatedCost) || other.estimatedCost == estimatedCost)&&(identical(other.actualCost, actualCost) || other.actualCost == actualCost)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&(identical(other.expense, expense) || other.expense == expense));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,boat,type,date,technician,estimatedCost,actualCost,description,status,expense);
}

@override
String toString() {
    return 'Maintenance(id: $id, boat: $boat, type: $type, date: $date, technician: $technician, estimatedCost: $estimatedCost, actualCost: $actualCost, description: $description, status: $status, expense: $expense)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceCopyWith<$Res> implements $MaintenanceCopyWith<$Res> {
  factory _$MaintenanceCopyWith(_Maintenance value, $Res Function(_Maintenance) _then) = __$MaintenanceCopyWithImpl;
@override @useResult
$Res call({
 int id, IdName? boat, IdName? type, DateTime? date, String? technician, double? estimatedCost, double? actualCost, String? description, String? status, MaintenanceExpense? expense
});


@override $IdNameCopyWith<$Res>? get boat;@override $IdNameCopyWith<$Res>? get type;@override $MaintenanceExpenseCopyWith<$Res>? get expense;

}
/// @nodoc
class __$MaintenanceCopyWithImpl<$Res>
    implements _$MaintenanceCopyWith<$Res> {
  __$MaintenanceCopyWithImpl(this._self, this._then);

  final _Maintenance _self;
  final $Res Function(_Maintenance) _then;

/// Create a copy of Maintenance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? boat = freezed,Object? type = freezed,Object? date = freezed,Object? technician = freezed,Object? estimatedCost = freezed,Object? actualCost = freezed,Object? description = freezed,Object? status = freezed,Object? expense = freezed,}) {
  return _then(_Maintenance(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,boat: freezed == boat ? _self.boat : boat // ignore: cast_nullable_to_non_nullable
as IdName?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as IdName?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,technician: freezed == technician ? _self.technician : technician // ignore: cast_nullable_to_non_nullable
as String?,estimatedCost: freezed == estimatedCost ? _self.estimatedCost : estimatedCost // ignore: cast_nullable_to_non_nullable
as double?,actualCost: freezed == actualCost ? _self.actualCost : actualCost // ignore: cast_nullable_to_non_nullable
as double?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,expense: freezed == expense ? _self.expense : expense // ignore: cast_nullable_to_non_nullable
as MaintenanceExpense?,
  ));
}

/// Create a copy of Maintenance
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
}/// Create a copy of Maintenance
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res>? get type {
    if (_self.type == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.type!, (value) {
    return _then(_self.copyWith(type: value));
  });
}/// Create a copy of Maintenance
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MaintenanceExpenseCopyWith<$Res>? get expense {
    if (_self.expense == null) {
    return null;
  }

  return $MaintenanceExpenseCopyWith<$Res>(_self.expense!, (value) {
    return _then(_self.copyWith(expense: value));
  });
}
}


/// @nodoc
mixin _$MaintenanceExpense {

 int get id; String? get expenseNumber; double get total; double get paidAmount;
/// Create a copy of MaintenanceExpense
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceExpenseCopyWith<MaintenanceExpense> get copyWith => _$MaintenanceExpenseCopyWithImpl<MaintenanceExpense>(this as MaintenanceExpense, _$identity);

  /// Serializes this MaintenanceExpense to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MaintenanceExpense;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceExpense&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.expenseNumber, _this.expenseNumber) || other.expenseNumber == _this.expenseNumber)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.paidAmount, _this.paidAmount) || other.paidAmount == _this.paidAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MaintenanceExpense;
  return Object.hash(runtimeType,_this.id,_this.expenseNumber,_this.total,_this.paidAmount);
}

@override
String toString() {
  final _this = this as MaintenanceExpense;
  return 'MaintenanceExpense(id: ${_this.id}, expenseNumber: ${_this.expenseNumber}, total: ${_this.total}, paidAmount: ${_this.paidAmount})';
}


}

/// @nodoc
abstract mixin class $MaintenanceExpenseCopyWith<$Res>  {
  factory $MaintenanceExpenseCopyWith(MaintenanceExpense value, $Res Function(MaintenanceExpense) _then) = _$MaintenanceExpenseCopyWithImpl;
@useResult
$Res call({
 int id, String? expenseNumber, double total, double paidAmount
});




}
/// @nodoc
class _$MaintenanceExpenseCopyWithImpl<$Res>
    implements $MaintenanceExpenseCopyWith<$Res> {
  _$MaintenanceExpenseCopyWithImpl(this._self, this._then);

  final MaintenanceExpense _self;
  final $Res Function(MaintenanceExpense) _then;

/// Create a copy of MaintenanceExpense
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? expenseNumber = freezed,Object? total = null,Object? paidAmount = null,}) {
  return _then(MaintenanceExpense(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,expenseNumber: freezed == expenseNumber ? _self.expenseNumber : expenseNumber // ignore: cast_nullable_to_non_nullable
as String?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MaintenanceExpense].
extension MaintenanceExpensePatterns on MaintenanceExpense {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaintenanceExpense value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaintenanceExpense() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaintenanceExpense value)  $default,){
final _that = this;
switch (_that) {
case _MaintenanceExpense():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaintenanceExpense value)?  $default,){
final _that = this;
switch (_that) {
case _MaintenanceExpense() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? expenseNumber,  double total,  double paidAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaintenanceExpense() when $default != null:
return $default(_that.id,_that.expenseNumber,_that.total,_that.paidAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? expenseNumber,  double total,  double paidAmount)  $default,) {final _that = this;
switch (_that) {
case _MaintenanceExpense():
return $default(_that.id,_that.expenseNumber,_that.total,_that.paidAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? expenseNumber,  double total,  double paidAmount)?  $default,) {final _that = this;
switch (_that) {
case _MaintenanceExpense() when $default != null:
return $default(_that.id,_that.expenseNumber,_that.total,_that.paidAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaintenanceExpense implements MaintenanceExpense {
  const _MaintenanceExpense({required this.id, this.expenseNumber, this.total = 0, this.paidAmount = 0});
  factory _MaintenanceExpense.fromJson(Map<String, dynamic> json) => _$MaintenanceExpenseFromJson(json);

@override final  int id;
@override final  String? expenseNumber;
@override@JsonKey() final  double total;
@override@JsonKey() final  double paidAmount;

/// Create a copy of MaintenanceExpense
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceExpenseCopyWith<_MaintenanceExpense> get copyWith => __$MaintenanceExpenseCopyWithImpl<_MaintenanceExpense>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaintenanceExpenseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceExpense&&(identical(other.id, id) || other.id == id)&&(identical(other.expenseNumber, expenseNumber) || other.expenseNumber == expenseNumber)&&(identical(other.total, total) || other.total == total)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,expenseNumber,total,paidAmount);
}

@override
String toString() {
    return 'MaintenanceExpense(id: $id, expenseNumber: $expenseNumber, total: $total, paidAmount: $paidAmount)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceExpenseCopyWith<$Res> implements $MaintenanceExpenseCopyWith<$Res> {
  factory _$MaintenanceExpenseCopyWith(_MaintenanceExpense value, $Res Function(_MaintenanceExpense) _then) = __$MaintenanceExpenseCopyWithImpl;
@override @useResult
$Res call({
 int id, String? expenseNumber, double total, double paidAmount
});




}
/// @nodoc
class __$MaintenanceExpenseCopyWithImpl<$Res>
    implements _$MaintenanceExpenseCopyWith<$Res> {
  __$MaintenanceExpenseCopyWithImpl(this._self, this._then);

  final _MaintenanceExpense _self;
  final $Res Function(_MaintenanceExpense) _then;

/// Create a copy of MaintenanceExpense
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? expenseNumber = freezed,Object? total = null,Object? paidAmount = null,}) {
  return _then(_MaintenanceExpense(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,expenseNumber: freezed == expenseNumber ? _self.expenseNumber : expenseNumber // ignore: cast_nullable_to_non_nullable
as String?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
