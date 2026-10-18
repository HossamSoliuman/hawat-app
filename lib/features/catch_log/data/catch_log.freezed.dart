// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catch_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CatchLogEntry {

 int get id; SpeciesRef? get species; CatchLogTrip? get trip; double? get captainKg; double? get countedKg; String? get captainNotes; String? get counterNotes; bool get verified; DateTime? get recordedAt;
/// Create a copy of CatchLogEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatchLogEntryCopyWith<CatchLogEntry> get copyWith => _$CatchLogEntryCopyWithImpl<CatchLogEntry>(this as CatchLogEntry, _$identity);

  /// Serializes this CatchLogEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CatchLogEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatchLogEntry&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.species, _this.species) || other.species == _this.species)&&(identical(other.trip, _this.trip) || other.trip == _this.trip)&&(identical(other.captainKg, _this.captainKg) || other.captainKg == _this.captainKg)&&(identical(other.countedKg, _this.countedKg) || other.countedKg == _this.countedKg)&&(identical(other.captainNotes, _this.captainNotes) || other.captainNotes == _this.captainNotes)&&(identical(other.counterNotes, _this.counterNotes) || other.counterNotes == _this.counterNotes)&&(identical(other.verified, _this.verified) || other.verified == _this.verified)&&(identical(other.recordedAt, _this.recordedAt) || other.recordedAt == _this.recordedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CatchLogEntry;
  return Object.hash(runtimeType,_this.id,_this.species,_this.trip,_this.captainKg,_this.countedKg,_this.captainNotes,_this.counterNotes,_this.verified,_this.recordedAt);
}

@override
String toString() {
  final _this = this as CatchLogEntry;
  return 'CatchLogEntry(id: ${_this.id}, species: ${_this.species}, trip: ${_this.trip}, captainKg: ${_this.captainKg}, countedKg: ${_this.countedKg}, captainNotes: ${_this.captainNotes}, counterNotes: ${_this.counterNotes}, verified: ${_this.verified}, recordedAt: ${_this.recordedAt})';
}


}

/// @nodoc
abstract mixin class $CatchLogEntryCopyWith<$Res>  {
  factory $CatchLogEntryCopyWith(CatchLogEntry value, $Res Function(CatchLogEntry) _then) = _$CatchLogEntryCopyWithImpl;
@useResult
$Res call({
 int id, SpeciesRef? species, CatchLogTrip? trip, double? captainKg, double? countedKg, String? captainNotes, String? counterNotes, bool verified, DateTime? recordedAt
});


$SpeciesRefCopyWith<$Res>? get species;$CatchLogTripCopyWith<$Res>? get trip;

}
/// @nodoc
class _$CatchLogEntryCopyWithImpl<$Res>
    implements $CatchLogEntryCopyWith<$Res> {
  _$CatchLogEntryCopyWithImpl(this._self, this._then);

  final CatchLogEntry _self;
  final $Res Function(CatchLogEntry) _then;

/// Create a copy of CatchLogEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? species = freezed,Object? trip = freezed,Object? captainKg = freezed,Object? countedKg = freezed,Object? captainNotes = freezed,Object? counterNotes = freezed,Object? verified = null,Object? recordedAt = freezed,}) {
  return _then(CatchLogEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,species: freezed == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as SpeciesRef?,trip: freezed == trip ? _self.trip : trip // ignore: cast_nullable_to_non_nullable
as CatchLogTrip?,captainKg: freezed == captainKg ? _self.captainKg : captainKg // ignore: cast_nullable_to_non_nullable
as double?,countedKg: freezed == countedKg ? _self.countedKg : countedKg // ignore: cast_nullable_to_non_nullable
as double?,captainNotes: freezed == captainNotes ? _self.captainNotes : captainNotes // ignore: cast_nullable_to_non_nullable
as String?,counterNotes: freezed == counterNotes ? _self.counterNotes : counterNotes // ignore: cast_nullable_to_non_nullable
as String?,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of CatchLogEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpeciesRefCopyWith<$Res>? get species {
    if (_self.species == null) {
    return null;
  }

  return $SpeciesRefCopyWith<$Res>(_self.species!, (value) {
    return _then(_self.copyWith(species: value));
  });
}/// Create a copy of CatchLogEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatchLogTripCopyWith<$Res>? get trip {
    if (_self.trip == null) {
    return null;
  }

  return $CatchLogTripCopyWith<$Res>(_self.trip!, (value) {
    return _then(_self.copyWith(trip: value));
  });
}
}


/// Adds pattern-matching-related methods to [CatchLogEntry].
extension CatchLogEntryPatterns on CatchLogEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatchLogEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatchLogEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatchLogEntry value)  $default,){
final _that = this;
switch (_that) {
case _CatchLogEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatchLogEntry value)?  $default,){
final _that = this;
switch (_that) {
case _CatchLogEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  SpeciesRef? species,  CatchLogTrip? trip,  double? captainKg,  double? countedKg,  String? captainNotes,  String? counterNotes,  bool verified,  DateTime? recordedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatchLogEntry() when $default != null:
return $default(_that.id,_that.species,_that.trip,_that.captainKg,_that.countedKg,_that.captainNotes,_that.counterNotes,_that.verified,_that.recordedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  SpeciesRef? species,  CatchLogTrip? trip,  double? captainKg,  double? countedKg,  String? captainNotes,  String? counterNotes,  bool verified,  DateTime? recordedAt)  $default,) {final _that = this;
switch (_that) {
case _CatchLogEntry():
return $default(_that.id,_that.species,_that.trip,_that.captainKg,_that.countedKg,_that.captainNotes,_that.counterNotes,_that.verified,_that.recordedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  SpeciesRef? species,  CatchLogTrip? trip,  double? captainKg,  double? countedKg,  String? captainNotes,  String? counterNotes,  bool verified,  DateTime? recordedAt)?  $default,) {final _that = this;
switch (_that) {
case _CatchLogEntry() when $default != null:
return $default(_that.id,_that.species,_that.trip,_that.captainKg,_that.countedKg,_that.captainNotes,_that.counterNotes,_that.verified,_that.recordedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatchLogEntry implements CatchLogEntry {
  const _CatchLogEntry({required this.id, this.species, this.trip, this.captainKg, this.countedKg, this.captainNotes, this.counterNotes, this.verified = false, this.recordedAt});
  factory _CatchLogEntry.fromJson(Map<String, dynamic> json) => _$CatchLogEntryFromJson(json);

@override final  int id;
@override final  SpeciesRef? species;
@override final  CatchLogTrip? trip;
@override final  double? captainKg;
@override final  double? countedKg;
@override final  String? captainNotes;
@override final  String? counterNotes;
@override@JsonKey() final  bool verified;
@override final  DateTime? recordedAt;

/// Create a copy of CatchLogEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatchLogEntryCopyWith<_CatchLogEntry> get copyWith => __$CatchLogEntryCopyWithImpl<_CatchLogEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatchLogEntryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatchLogEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.species, species) || other.species == species)&&(identical(other.trip, trip) || other.trip == trip)&&(identical(other.captainKg, captainKg) || other.captainKg == captainKg)&&(identical(other.countedKg, countedKg) || other.countedKg == countedKg)&&(identical(other.captainNotes, captainNotes) || other.captainNotes == captainNotes)&&(identical(other.counterNotes, counterNotes) || other.counterNotes == counterNotes)&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,species,trip,captainKg,countedKg,captainNotes,counterNotes,verified,recordedAt);
}

@override
String toString() {
    return 'CatchLogEntry(id: $id, species: $species, trip: $trip, captainKg: $captainKg, countedKg: $countedKg, captainNotes: $captainNotes, counterNotes: $counterNotes, verified: $verified, recordedAt: $recordedAt)';
}


}

/// @nodoc
abstract mixin class _$CatchLogEntryCopyWith<$Res> implements $CatchLogEntryCopyWith<$Res> {
  factory _$CatchLogEntryCopyWith(_CatchLogEntry value, $Res Function(_CatchLogEntry) _then) = __$CatchLogEntryCopyWithImpl;
@override @useResult
$Res call({
 int id, SpeciesRef? species, CatchLogTrip? trip, double? captainKg, double? countedKg, String? captainNotes, String? counterNotes, bool verified, DateTime? recordedAt
});


@override $SpeciesRefCopyWith<$Res>? get species;@override $CatchLogTripCopyWith<$Res>? get trip;

}
/// @nodoc
class __$CatchLogEntryCopyWithImpl<$Res>
    implements _$CatchLogEntryCopyWith<$Res> {
  __$CatchLogEntryCopyWithImpl(this._self, this._then);

  final _CatchLogEntry _self;
  final $Res Function(_CatchLogEntry) _then;

/// Create a copy of CatchLogEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? species = freezed,Object? trip = freezed,Object? captainKg = freezed,Object? countedKg = freezed,Object? captainNotes = freezed,Object? counterNotes = freezed,Object? verified = null,Object? recordedAt = freezed,}) {
  return _then(_CatchLogEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,species: freezed == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as SpeciesRef?,trip: freezed == trip ? _self.trip : trip // ignore: cast_nullable_to_non_nullable
as CatchLogTrip?,captainKg: freezed == captainKg ? _self.captainKg : captainKg // ignore: cast_nullable_to_non_nullable
as double?,countedKg: freezed == countedKg ? _self.countedKg : countedKg // ignore: cast_nullable_to_non_nullable
as double?,captainNotes: freezed == captainNotes ? _self.captainNotes : captainNotes // ignore: cast_nullable_to_non_nullable
as String?,counterNotes: freezed == counterNotes ? _self.counterNotes : counterNotes // ignore: cast_nullable_to_non_nullable
as String?,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of CatchLogEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpeciesRefCopyWith<$Res>? get species {
    if (_self.species == null) {
    return null;
  }

  return $SpeciesRefCopyWith<$Res>(_self.species!, (value) {
    return _then(_self.copyWith(species: value));
  });
}/// Create a copy of CatchLogEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatchLogTripCopyWith<$Res>? get trip {
    if (_self.trip == null) {
    return null;
  }

  return $CatchLogTripCopyWith<$Res>(_self.trip!, (value) {
    return _then(_self.copyWith(trip: value));
  });
}
}


/// @nodoc
mixin _$CatchLogTrip {

 int get id; String get tripNumber; String? get status; String? get appStatus; String? get boat; String? get captain; DateTime? get returnTime;
/// Create a copy of CatchLogTrip
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatchLogTripCopyWith<CatchLogTrip> get copyWith => _$CatchLogTripCopyWithImpl<CatchLogTrip>(this as CatchLogTrip, _$identity);

  /// Serializes this CatchLogTrip to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CatchLogTrip;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatchLogTrip&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.tripNumber, _this.tripNumber) || other.tripNumber == _this.tripNumber)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.appStatus, _this.appStatus) || other.appStatus == _this.appStatus)&&(identical(other.boat, _this.boat) || other.boat == _this.boat)&&(identical(other.captain, _this.captain) || other.captain == _this.captain)&&(identical(other.returnTime, _this.returnTime) || other.returnTime == _this.returnTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CatchLogTrip;
  return Object.hash(runtimeType,_this.id,_this.tripNumber,_this.status,_this.appStatus,_this.boat,_this.captain,_this.returnTime);
}

@override
String toString() {
  final _this = this as CatchLogTrip;
  return 'CatchLogTrip(id: ${_this.id}, tripNumber: ${_this.tripNumber}, status: ${_this.status}, appStatus: ${_this.appStatus}, boat: ${_this.boat}, captain: ${_this.captain}, returnTime: ${_this.returnTime})';
}


}

/// @nodoc
abstract mixin class $CatchLogTripCopyWith<$Res>  {
  factory $CatchLogTripCopyWith(CatchLogTrip value, $Res Function(CatchLogTrip) _then) = _$CatchLogTripCopyWithImpl;
@useResult
$Res call({
 int id, String tripNumber, String? status, String? appStatus, String? boat, String? captain, DateTime? returnTime
});




}
/// @nodoc
class _$CatchLogTripCopyWithImpl<$Res>
    implements $CatchLogTripCopyWith<$Res> {
  _$CatchLogTripCopyWithImpl(this._self, this._then);

  final CatchLogTrip _self;
  final $Res Function(CatchLogTrip) _then;

/// Create a copy of CatchLogTrip
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tripNumber = null,Object? status = freezed,Object? appStatus = freezed,Object? boat = freezed,Object? captain = freezed,Object? returnTime = freezed,}) {
  return _then(CatchLogTrip(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tripNumber: null == tripNumber ? _self.tripNumber : tripNumber // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,appStatus: freezed == appStatus ? _self.appStatus : appStatus // ignore: cast_nullable_to_non_nullable
as String?,boat: freezed == boat ? _self.boat : boat // ignore: cast_nullable_to_non_nullable
as String?,captain: freezed == captain ? _self.captain : captain // ignore: cast_nullable_to_non_nullable
as String?,returnTime: freezed == returnTime ? _self.returnTime : returnTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CatchLogTrip].
extension CatchLogTripPatterns on CatchLogTrip {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatchLogTrip value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatchLogTrip() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatchLogTrip value)  $default,){
final _that = this;
switch (_that) {
case _CatchLogTrip():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatchLogTrip value)?  $default,){
final _that = this;
switch (_that) {
case _CatchLogTrip() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String tripNumber,  String? status,  String? appStatus,  String? boat,  String? captain,  DateTime? returnTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatchLogTrip() when $default != null:
return $default(_that.id,_that.tripNumber,_that.status,_that.appStatus,_that.boat,_that.captain,_that.returnTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String tripNumber,  String? status,  String? appStatus,  String? boat,  String? captain,  DateTime? returnTime)  $default,) {final _that = this;
switch (_that) {
case _CatchLogTrip():
return $default(_that.id,_that.tripNumber,_that.status,_that.appStatus,_that.boat,_that.captain,_that.returnTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String tripNumber,  String? status,  String? appStatus,  String? boat,  String? captain,  DateTime? returnTime)?  $default,) {final _that = this;
switch (_that) {
case _CatchLogTrip() when $default != null:
return $default(_that.id,_that.tripNumber,_that.status,_that.appStatus,_that.boat,_that.captain,_that.returnTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatchLogTrip implements CatchLogTrip {
  const _CatchLogTrip({required this.id, required this.tripNumber, this.status, this.appStatus, this.boat, this.captain, this.returnTime});
  factory _CatchLogTrip.fromJson(Map<String, dynamic> json) => _$CatchLogTripFromJson(json);

@override final  int id;
@override final  String tripNumber;
@override final  String? status;
@override final  String? appStatus;
@override final  String? boat;
@override final  String? captain;
@override final  DateTime? returnTime;

/// Create a copy of CatchLogTrip
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatchLogTripCopyWith<_CatchLogTrip> get copyWith => __$CatchLogTripCopyWithImpl<_CatchLogTrip>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatchLogTripToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatchLogTrip&&(identical(other.id, id) || other.id == id)&&(identical(other.tripNumber, tripNumber) || other.tripNumber == tripNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.appStatus, appStatus) || other.appStatus == appStatus)&&(identical(other.boat, boat) || other.boat == boat)&&(identical(other.captain, captain) || other.captain == captain)&&(identical(other.returnTime, returnTime) || other.returnTime == returnTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,tripNumber,status,appStatus,boat,captain,returnTime);
}

@override
String toString() {
    return 'CatchLogTrip(id: $id, tripNumber: $tripNumber, status: $status, appStatus: $appStatus, boat: $boat, captain: $captain, returnTime: $returnTime)';
}


}

/// @nodoc
abstract mixin class _$CatchLogTripCopyWith<$Res> implements $CatchLogTripCopyWith<$Res> {
  factory _$CatchLogTripCopyWith(_CatchLogTrip value, $Res Function(_CatchLogTrip) _then) = __$CatchLogTripCopyWithImpl;
@override @useResult
$Res call({
 int id, String tripNumber, String? status, String? appStatus, String? boat, String? captain, DateTime? returnTime
});




}
/// @nodoc
class __$CatchLogTripCopyWithImpl<$Res>
    implements _$CatchLogTripCopyWith<$Res> {
  __$CatchLogTripCopyWithImpl(this._self, this._then);

  final _CatchLogTrip _self;
  final $Res Function(_CatchLogTrip) _then;

/// Create a copy of CatchLogTrip
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tripNumber = null,Object? status = freezed,Object? appStatus = freezed,Object? boat = freezed,Object? captain = freezed,Object? returnTime = freezed,}) {
  return _then(_CatchLogTrip(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tripNumber: null == tripNumber ? _self.tripNumber : tripNumber // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,appStatus: freezed == appStatus ? _self.appStatus : appStatus // ignore: cast_nullable_to_non_nullable
as String?,boat: freezed == boat ? _self.boat : boat // ignore: cast_nullable_to_non_nullable
as String?,captain: freezed == captain ? _self.captain : captain // ignore: cast_nullable_to_non_nullable
as String?,returnTime: freezed == returnTime ? _self.returnTime : returnTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$CatchLogSummary {

 CatchLogTotals get totals; List<SpeciesCatch> get bySpecies;
/// Create a copy of CatchLogSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatchLogSummaryCopyWith<CatchLogSummary> get copyWith => _$CatchLogSummaryCopyWithImpl<CatchLogSummary>(this as CatchLogSummary, _$identity);

  /// Serializes this CatchLogSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CatchLogSummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatchLogSummary&&(identical(other.totals, _this.totals) || other.totals == _this.totals)&&const DeepCollectionEquality().equals(other.bySpecies, _this.bySpecies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CatchLogSummary;
  return Object.hash(runtimeType,_this.totals,const DeepCollectionEquality().hash(_this.bySpecies));
}

@override
String toString() {
  final _this = this as CatchLogSummary;
  return 'CatchLogSummary(totals: ${_this.totals}, bySpecies: ${_this.bySpecies})';
}


}

/// @nodoc
abstract mixin class $CatchLogSummaryCopyWith<$Res>  {
  factory $CatchLogSummaryCopyWith(CatchLogSummary value, $Res Function(CatchLogSummary) _then) = _$CatchLogSummaryCopyWithImpl;
@useResult
$Res call({
 CatchLogTotals totals, List<SpeciesCatch> bySpecies
});


$CatchLogTotalsCopyWith<$Res> get totals;

}
/// @nodoc
class _$CatchLogSummaryCopyWithImpl<$Res>
    implements $CatchLogSummaryCopyWith<$Res> {
  _$CatchLogSummaryCopyWithImpl(this._self, this._then);

  final CatchLogSummary _self;
  final $Res Function(CatchLogSummary) _then;

/// Create a copy of CatchLogSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totals = null,Object? bySpecies = null,}) {
  return _then(CatchLogSummary(
totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as CatchLogTotals,bySpecies: null == bySpecies ? _self.bySpecies : bySpecies // ignore: cast_nullable_to_non_nullable
as List<SpeciesCatch>,
  ));
}
/// Create a copy of CatchLogSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatchLogTotalsCopyWith<$Res> get totals {
  
  return $CatchLogTotalsCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}


/// Adds pattern-matching-related methods to [CatchLogSummary].
extension CatchLogSummaryPatterns on CatchLogSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatchLogSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatchLogSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatchLogSummary value)  $default,){
final _that = this;
switch (_that) {
case _CatchLogSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatchLogSummary value)?  $default,){
final _that = this;
switch (_that) {
case _CatchLogSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CatchLogTotals totals,  List<SpeciesCatch> bySpecies)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatchLogSummary() when $default != null:
return $default(_that.totals,_that.bySpecies);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CatchLogTotals totals,  List<SpeciesCatch> bySpecies)  $default,) {final _that = this;
switch (_that) {
case _CatchLogSummary():
return $default(_that.totals,_that.bySpecies);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CatchLogTotals totals,  List<SpeciesCatch> bySpecies)?  $default,) {final _that = this;
switch (_that) {
case _CatchLogSummary() when $default != null:
return $default(_that.totals,_that.bySpecies);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatchLogSummary implements CatchLogSummary {
  const _CatchLogSummary({this.totals = const CatchLogTotals(),  List<SpeciesCatch> bySpecies = const <SpeciesCatch>[]}): _bySpecies = bySpecies;
  factory _CatchLogSummary.fromJson(Map<String, dynamic> json) => _$CatchLogSummaryFromJson(json);

@override@JsonKey() final  CatchLogTotals totals;
 final  List<SpeciesCatch> _bySpecies;
@override@JsonKey() List<SpeciesCatch> get bySpecies {
  if (_bySpecies is EqualUnmodifiableListView) return _bySpecies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bySpecies);
}


/// Create a copy of CatchLogSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatchLogSummaryCopyWith<_CatchLogSummary> get copyWith => __$CatchLogSummaryCopyWithImpl<_CatchLogSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatchLogSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatchLogSummary&&(identical(other.totals, totals) || other.totals == totals)&&const DeepCollectionEquality().equals(other.bySpecies, _bySpecies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,totals,const DeepCollectionEquality().hash(_bySpecies));
}

@override
String toString() {
    return 'CatchLogSummary(totals: $totals, bySpecies: $bySpecies)';
}


}

/// @nodoc
abstract mixin class _$CatchLogSummaryCopyWith<$Res> implements $CatchLogSummaryCopyWith<$Res> {
  factory _$CatchLogSummaryCopyWith(_CatchLogSummary value, $Res Function(_CatchLogSummary) _then) = __$CatchLogSummaryCopyWithImpl;
@override @useResult
$Res call({
 CatchLogTotals totals, List<SpeciesCatch> bySpecies
});


@override $CatchLogTotalsCopyWith<$Res> get totals;

}
/// @nodoc
class __$CatchLogSummaryCopyWithImpl<$Res>
    implements _$CatchLogSummaryCopyWith<$Res> {
  __$CatchLogSummaryCopyWithImpl(this._self, this._then);

  final _CatchLogSummary _self;
  final $Res Function(_CatchLogSummary) _then;

/// Create a copy of CatchLogSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totals = null,Object? bySpecies = null,}) {
  return _then(_CatchLogSummary(
totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as CatchLogTotals,bySpecies: null == bySpecies ? _self._bySpecies : bySpecies // ignore: cast_nullable_to_non_nullable
as List<SpeciesCatch>,
  ));
}

/// Create a copy of CatchLogSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatchLogTotalsCopyWith<$Res> get totals {
  
  return $CatchLogTotalsCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}


/// @nodoc
mixin _$CatchLogTotals {

 double get captainKg; double get countedKg; int get species;
/// Create a copy of CatchLogTotals
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatchLogTotalsCopyWith<CatchLogTotals> get copyWith => _$CatchLogTotalsCopyWithImpl<CatchLogTotals>(this as CatchLogTotals, _$identity);

  /// Serializes this CatchLogTotals to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CatchLogTotals;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatchLogTotals&&(identical(other.captainKg, _this.captainKg) || other.captainKg == _this.captainKg)&&(identical(other.countedKg, _this.countedKg) || other.countedKg == _this.countedKg)&&(identical(other.species, _this.species) || other.species == _this.species));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CatchLogTotals;
  return Object.hash(runtimeType,_this.captainKg,_this.countedKg,_this.species);
}

@override
String toString() {
  final _this = this as CatchLogTotals;
  return 'CatchLogTotals(captainKg: ${_this.captainKg}, countedKg: ${_this.countedKg}, species: ${_this.species})';
}


}

/// @nodoc
abstract mixin class $CatchLogTotalsCopyWith<$Res>  {
  factory $CatchLogTotalsCopyWith(CatchLogTotals value, $Res Function(CatchLogTotals) _then) = _$CatchLogTotalsCopyWithImpl;
@useResult
$Res call({
 double captainKg, double countedKg, int species
});




}
/// @nodoc
class _$CatchLogTotalsCopyWithImpl<$Res>
    implements $CatchLogTotalsCopyWith<$Res> {
  _$CatchLogTotalsCopyWithImpl(this._self, this._then);

  final CatchLogTotals _self;
  final $Res Function(CatchLogTotals) _then;

/// Create a copy of CatchLogTotals
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? captainKg = null,Object? countedKg = null,Object? species = null,}) {
  return _then(CatchLogTotals(
captainKg: null == captainKg ? _self.captainKg : captainKg // ignore: cast_nullable_to_non_nullable
as double,countedKg: null == countedKg ? _self.countedKg : countedKg // ignore: cast_nullable_to_non_nullable
as double,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CatchLogTotals].
extension CatchLogTotalsPatterns on CatchLogTotals {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatchLogTotals value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatchLogTotals() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatchLogTotals value)  $default,){
final _that = this;
switch (_that) {
case _CatchLogTotals():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatchLogTotals value)?  $default,){
final _that = this;
switch (_that) {
case _CatchLogTotals() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double captainKg,  double countedKg,  int species)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatchLogTotals() when $default != null:
return $default(_that.captainKg,_that.countedKg,_that.species);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double captainKg,  double countedKg,  int species)  $default,) {final _that = this;
switch (_that) {
case _CatchLogTotals():
return $default(_that.captainKg,_that.countedKg,_that.species);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double captainKg,  double countedKg,  int species)?  $default,) {final _that = this;
switch (_that) {
case _CatchLogTotals() when $default != null:
return $default(_that.captainKg,_that.countedKg,_that.species);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatchLogTotals implements CatchLogTotals {
  const _CatchLogTotals({this.captainKg = 0, this.countedKg = 0, this.species = 0});
  factory _CatchLogTotals.fromJson(Map<String, dynamic> json) => _$CatchLogTotalsFromJson(json);

@override@JsonKey() final  double captainKg;
@override@JsonKey() final  double countedKg;
@override@JsonKey() final  int species;

/// Create a copy of CatchLogTotals
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatchLogTotalsCopyWith<_CatchLogTotals> get copyWith => __$CatchLogTotalsCopyWithImpl<_CatchLogTotals>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatchLogTotalsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatchLogTotals&&(identical(other.captainKg, captainKg) || other.captainKg == captainKg)&&(identical(other.countedKg, countedKg) || other.countedKg == countedKg)&&(identical(other.species, species) || other.species == species));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,captainKg,countedKg,species);
}

@override
String toString() {
    return 'CatchLogTotals(captainKg: $captainKg, countedKg: $countedKg, species: $species)';
}


}

/// @nodoc
abstract mixin class _$CatchLogTotalsCopyWith<$Res> implements $CatchLogTotalsCopyWith<$Res> {
  factory _$CatchLogTotalsCopyWith(_CatchLogTotals value, $Res Function(_CatchLogTotals) _then) = __$CatchLogTotalsCopyWithImpl;
@override @useResult
$Res call({
 double captainKg, double countedKg, int species
});




}
/// @nodoc
class __$CatchLogTotalsCopyWithImpl<$Res>
    implements _$CatchLogTotalsCopyWith<$Res> {
  __$CatchLogTotalsCopyWithImpl(this._self, this._then);

  final _CatchLogTotals _self;
  final $Res Function(_CatchLogTotals) _then;

/// Create a copy of CatchLogTotals
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? captainKg = null,Object? countedKg = null,Object? species = null,}) {
  return _then(_CatchLogTotals(
captainKg: null == captainKg ? _self.captainKg : captainKg // ignore: cast_nullable_to_non_nullable
as double,countedKg: null == countedKg ? _self.countedKg : countedKg // ignore: cast_nullable_to_non_nullable
as double,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SpeciesCatch {

 int get speciesId; String get species; String? get nameSci; int get trips; double get captainKg; double get countedKg;
/// Create a copy of SpeciesCatch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeciesCatchCopyWith<SpeciesCatch> get copyWith => _$SpeciesCatchCopyWithImpl<SpeciesCatch>(this as SpeciesCatch, _$identity);

  /// Serializes this SpeciesCatch to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SpeciesCatch;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeciesCatch&&(identical(other.speciesId, _this.speciesId) || other.speciesId == _this.speciesId)&&(identical(other.species, _this.species) || other.species == _this.species)&&(identical(other.nameSci, _this.nameSci) || other.nameSci == _this.nameSci)&&(identical(other.trips, _this.trips) || other.trips == _this.trips)&&(identical(other.captainKg, _this.captainKg) || other.captainKg == _this.captainKg)&&(identical(other.countedKg, _this.countedKg) || other.countedKg == _this.countedKg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SpeciesCatch;
  return Object.hash(runtimeType,_this.speciesId,_this.species,_this.nameSci,_this.trips,_this.captainKg,_this.countedKg);
}

@override
String toString() {
  final _this = this as SpeciesCatch;
  return 'SpeciesCatch(speciesId: ${_this.speciesId}, species: ${_this.species}, nameSci: ${_this.nameSci}, trips: ${_this.trips}, captainKg: ${_this.captainKg}, countedKg: ${_this.countedKg})';
}


}

/// @nodoc
abstract mixin class $SpeciesCatchCopyWith<$Res>  {
  factory $SpeciesCatchCopyWith(SpeciesCatch value, $Res Function(SpeciesCatch) _then) = _$SpeciesCatchCopyWithImpl;
@useResult
$Res call({
 int speciesId, String species, String? nameSci, int trips, double captainKg, double countedKg
});




}
/// @nodoc
class _$SpeciesCatchCopyWithImpl<$Res>
    implements $SpeciesCatchCopyWith<$Res> {
  _$SpeciesCatchCopyWithImpl(this._self, this._then);

  final SpeciesCatch _self;
  final $Res Function(SpeciesCatch) _then;

/// Create a copy of SpeciesCatch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? speciesId = null,Object? species = null,Object? nameSci = freezed,Object? trips = null,Object? captainKg = null,Object? countedKg = null,}) {
  return _then(SpeciesCatch(
speciesId: null == speciesId ? _self.speciesId : speciesId // ignore: cast_nullable_to_non_nullable
as int,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String,nameSci: freezed == nameSci ? _self.nameSci : nameSci // ignore: cast_nullable_to_non_nullable
as String?,trips: null == trips ? _self.trips : trips // ignore: cast_nullable_to_non_nullable
as int,captainKg: null == captainKg ? _self.captainKg : captainKg // ignore: cast_nullable_to_non_nullable
as double,countedKg: null == countedKg ? _self.countedKg : countedKg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SpeciesCatch].
extension SpeciesCatchPatterns on SpeciesCatch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpeciesCatch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpeciesCatch() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpeciesCatch value)  $default,){
final _that = this;
switch (_that) {
case _SpeciesCatch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpeciesCatch value)?  $default,){
final _that = this;
switch (_that) {
case _SpeciesCatch() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int speciesId,  String species,  String? nameSci,  int trips,  double captainKg,  double countedKg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpeciesCatch() when $default != null:
return $default(_that.speciesId,_that.species,_that.nameSci,_that.trips,_that.captainKg,_that.countedKg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int speciesId,  String species,  String? nameSci,  int trips,  double captainKg,  double countedKg)  $default,) {final _that = this;
switch (_that) {
case _SpeciesCatch():
return $default(_that.speciesId,_that.species,_that.nameSci,_that.trips,_that.captainKg,_that.countedKg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int speciesId,  String species,  String? nameSci,  int trips,  double captainKg,  double countedKg)?  $default,) {final _that = this;
switch (_that) {
case _SpeciesCatch() when $default != null:
return $default(_that.speciesId,_that.species,_that.nameSci,_that.trips,_that.captainKg,_that.countedKg);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpeciesCatch implements SpeciesCatch {
  const _SpeciesCatch({required this.speciesId, required this.species, this.nameSci, this.trips = 0, this.captainKg = 0, this.countedKg = 0});
  factory _SpeciesCatch.fromJson(Map<String, dynamic> json) => _$SpeciesCatchFromJson(json);

@override final  int speciesId;
@override final  String species;
@override final  String? nameSci;
@override@JsonKey() final  int trips;
@override@JsonKey() final  double captainKg;
@override@JsonKey() final  double countedKg;

/// Create a copy of SpeciesCatch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpeciesCatchCopyWith<_SpeciesCatch> get copyWith => __$SpeciesCatchCopyWithImpl<_SpeciesCatch>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpeciesCatchToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpeciesCatch&&(identical(other.speciesId, speciesId) || other.speciesId == speciesId)&&(identical(other.species, species) || other.species == species)&&(identical(other.nameSci, nameSci) || other.nameSci == nameSci)&&(identical(other.trips, trips) || other.trips == trips)&&(identical(other.captainKg, captainKg) || other.captainKg == captainKg)&&(identical(other.countedKg, countedKg) || other.countedKg == countedKg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,speciesId,species,nameSci,trips,captainKg,countedKg);
}

@override
String toString() {
    return 'SpeciesCatch(speciesId: $speciesId, species: $species, nameSci: $nameSci, trips: $trips, captainKg: $captainKg, countedKg: $countedKg)';
}


}

/// @nodoc
abstract mixin class _$SpeciesCatchCopyWith<$Res> implements $SpeciesCatchCopyWith<$Res> {
  factory _$SpeciesCatchCopyWith(_SpeciesCatch value, $Res Function(_SpeciesCatch) _then) = __$SpeciesCatchCopyWithImpl;
@override @useResult
$Res call({
 int speciesId, String species, String? nameSci, int trips, double captainKg, double countedKg
});




}
/// @nodoc
class __$SpeciesCatchCopyWithImpl<$Res>
    implements _$SpeciesCatchCopyWith<$Res> {
  __$SpeciesCatchCopyWithImpl(this._self, this._then);

  final _SpeciesCatch _self;
  final $Res Function(_SpeciesCatch) _then;

/// Create a copy of SpeciesCatch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? speciesId = null,Object? species = null,Object? nameSci = freezed,Object? trips = null,Object? captainKg = null,Object? countedKg = null,}) {
  return _then(_SpeciesCatch(
speciesId: null == speciesId ? _self.speciesId : speciesId // ignore: cast_nullable_to_non_nullable
as int,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String,nameSci: freezed == nameSci ? _self.nameSci : nameSci // ignore: cast_nullable_to_non_nullable
as String?,trips: null == trips ? _self.trips : trips // ignore: cast_nullable_to_non_nullable
as int,captainKg: null == captainKg ? _self.captainKg : captainKg // ignore: cast_nullable_to_non_nullable
as double,countedKg: null == countedKg ? _self.countedKg : countedKg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
