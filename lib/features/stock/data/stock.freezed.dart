// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StockLine {

 int get speciesId; String? get species; String? get nameSci; double get weightKg;
/// Create a copy of StockLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockLineCopyWith<StockLine> get copyWith => _$StockLineCopyWithImpl<StockLine>(this as StockLine, _$identity);

  /// Serializes this StockLine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as StockLine;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockLine&&(identical(other.speciesId, _this.speciesId) || other.speciesId == _this.speciesId)&&(identical(other.species, _this.species) || other.species == _this.species)&&(identical(other.nameSci, _this.nameSci) || other.nameSci == _this.nameSci)&&(identical(other.weightKg, _this.weightKg) || other.weightKg == _this.weightKg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as StockLine;
  return Object.hash(runtimeType,_this.speciesId,_this.species,_this.nameSci,_this.weightKg);
}

@override
String toString() {
  final _this = this as StockLine;
  return 'StockLine(speciesId: ${_this.speciesId}, species: ${_this.species}, nameSci: ${_this.nameSci}, weightKg: ${_this.weightKg})';
}


}

/// @nodoc
abstract mixin class $StockLineCopyWith<$Res>  {
  factory $StockLineCopyWith(StockLine value, $Res Function(StockLine) _then) = _$StockLineCopyWithImpl;
@useResult
$Res call({
 int speciesId, String? species, String? nameSci, double weightKg
});




}
/// @nodoc
class _$StockLineCopyWithImpl<$Res>
    implements $StockLineCopyWith<$Res> {
  _$StockLineCopyWithImpl(this._self, this._then);

  final StockLine _self;
  final $Res Function(StockLine) _then;

/// Create a copy of StockLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? speciesId = null,Object? species = freezed,Object? nameSci = freezed,Object? weightKg = null,}) {
  return _then(StockLine(
speciesId: null == speciesId ? _self.speciesId : speciesId // ignore: cast_nullable_to_non_nullable
as int,species: freezed == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String?,nameSci: freezed == nameSci ? _self.nameSci : nameSci // ignore: cast_nullable_to_non_nullable
as String?,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [StockLine].
extension StockLinePatterns on StockLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockLine value)  $default,){
final _that = this;
switch (_that) {
case _StockLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockLine value)?  $default,){
final _that = this;
switch (_that) {
case _StockLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int speciesId,  String? species,  String? nameSci,  double weightKg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockLine() when $default != null:
return $default(_that.speciesId,_that.species,_that.nameSci,_that.weightKg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int speciesId,  String? species,  String? nameSci,  double weightKg)  $default,) {final _that = this;
switch (_that) {
case _StockLine():
return $default(_that.speciesId,_that.species,_that.nameSci,_that.weightKg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int speciesId,  String? species,  String? nameSci,  double weightKg)?  $default,) {final _that = this;
switch (_that) {
case _StockLine() when $default != null:
return $default(_that.speciesId,_that.species,_that.nameSci,_that.weightKg);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockLine implements StockLine {
  const _StockLine({required this.speciesId, this.species, this.nameSci, this.weightKg = 0});
  factory _StockLine.fromJson(Map<String, dynamic> json) => _$StockLineFromJson(json);

@override final  int speciesId;
@override final  String? species;
@override final  String? nameSci;
@override@JsonKey() final  double weightKg;

/// Create a copy of StockLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockLineCopyWith<_StockLine> get copyWith => __$StockLineCopyWithImpl<_StockLine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockLineToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockLine&&(identical(other.speciesId, speciesId) || other.speciesId == speciesId)&&(identical(other.species, species) || other.species == species)&&(identical(other.nameSci, nameSci) || other.nameSci == nameSci)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,speciesId,species,nameSci,weightKg);
}

@override
String toString() {
    return 'StockLine(speciesId: $speciesId, species: $species, nameSci: $nameSci, weightKg: $weightKg)';
}


}

/// @nodoc
abstract mixin class _$StockLineCopyWith<$Res> implements $StockLineCopyWith<$Res> {
  factory _$StockLineCopyWith(_StockLine value, $Res Function(_StockLine) _then) = __$StockLineCopyWithImpl;
@override @useResult
$Res call({
 int speciesId, String? species, String? nameSci, double weightKg
});




}
/// @nodoc
class __$StockLineCopyWithImpl<$Res>
    implements _$StockLineCopyWith<$Res> {
  __$StockLineCopyWithImpl(this._self, this._then);

  final _StockLine _self;
  final $Res Function(_StockLine) _then;

/// Create a copy of StockLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? speciesId = null,Object? species = freezed,Object? nameSci = freezed,Object? weightKg = null,}) {
  return _then(_StockLine(
speciesId: null == speciesId ? _self.speciesId : speciesId // ignore: cast_nullable_to_non_nullable
as int,species: freezed == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String?,nameSci: freezed == nameSci ? _self.nameSci : nameSci // ignore: cast_nullable_to_non_nullable
as String?,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$StockMovement {

 int get id; String? get species; String? get tripNumber; String? get type; double get weightKg; double get balanceAfter; String? get user; String? get notes; DateTime? get createdAt;
/// Create a copy of StockMovement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockMovementCopyWith<StockMovement> get copyWith => _$StockMovementCopyWithImpl<StockMovement>(this as StockMovement, _$identity);

  /// Serializes this StockMovement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as StockMovement;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockMovement&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.species, _this.species) || other.species == _this.species)&&(identical(other.tripNumber, _this.tripNumber) || other.tripNumber == _this.tripNumber)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.weightKg, _this.weightKg) || other.weightKg == _this.weightKg)&&(identical(other.balanceAfter, _this.balanceAfter) || other.balanceAfter == _this.balanceAfter)&&(identical(other.user, _this.user) || other.user == _this.user)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as StockMovement;
  return Object.hash(runtimeType,_this.id,_this.species,_this.tripNumber,_this.type,_this.weightKg,_this.balanceAfter,_this.user,_this.notes,_this.createdAt);
}

@override
String toString() {
  final _this = this as StockMovement;
  return 'StockMovement(id: ${_this.id}, species: ${_this.species}, tripNumber: ${_this.tripNumber}, type: ${_this.type}, weightKg: ${_this.weightKg}, balanceAfter: ${_this.balanceAfter}, user: ${_this.user}, notes: ${_this.notes}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $StockMovementCopyWith<$Res>  {
  factory $StockMovementCopyWith(StockMovement value, $Res Function(StockMovement) _then) = _$StockMovementCopyWithImpl;
@useResult
$Res call({
 int id, String? species, String? tripNumber, String? type, double weightKg, double balanceAfter, String? user, String? notes, DateTime? createdAt
});




}
/// @nodoc
class _$StockMovementCopyWithImpl<$Res>
    implements $StockMovementCopyWith<$Res> {
  _$StockMovementCopyWithImpl(this._self, this._then);

  final StockMovement _self;
  final $Res Function(StockMovement) _then;

/// Create a copy of StockMovement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? species = freezed,Object? tripNumber = freezed,Object? type = freezed,Object? weightKg = null,Object? balanceAfter = null,Object? user = freezed,Object? notes = freezed,Object? createdAt = freezed,}) {
  return _then(StockMovement(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,species: freezed == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String?,tripNumber: freezed == tripNumber ? _self.tripNumber : tripNumber // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double,balanceAfter: null == balanceAfter ? _self.balanceAfter : balanceAfter // ignore: cast_nullable_to_non_nullable
as double,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [StockMovement].
extension StockMovementPatterns on StockMovement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockMovement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockMovement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockMovement value)  $default,){
final _that = this;
switch (_that) {
case _StockMovement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockMovement value)?  $default,){
final _that = this;
switch (_that) {
case _StockMovement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? species,  String? tripNumber,  String? type,  double weightKg,  double balanceAfter,  String? user,  String? notes,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockMovement() when $default != null:
return $default(_that.id,_that.species,_that.tripNumber,_that.type,_that.weightKg,_that.balanceAfter,_that.user,_that.notes,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? species,  String? tripNumber,  String? type,  double weightKg,  double balanceAfter,  String? user,  String? notes,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _StockMovement():
return $default(_that.id,_that.species,_that.tripNumber,_that.type,_that.weightKg,_that.balanceAfter,_that.user,_that.notes,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? species,  String? tripNumber,  String? type,  double weightKg,  double balanceAfter,  String? user,  String? notes,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _StockMovement() when $default != null:
return $default(_that.id,_that.species,_that.tripNumber,_that.type,_that.weightKg,_that.balanceAfter,_that.user,_that.notes,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockMovement extends StockMovement {
  const _StockMovement({required this.id, this.species, this.tripNumber, this.type, this.weightKg = 0, this.balanceAfter = 0, this.user, this.notes, this.createdAt}): super._();
  factory _StockMovement.fromJson(Map<String, dynamic> json) => _$StockMovementFromJson(json);

@override final  int id;
@override final  String? species;
@override final  String? tripNumber;
@override final  String? type;
@override@JsonKey() final  double weightKg;
@override@JsonKey() final  double balanceAfter;
@override final  String? user;
@override final  String? notes;
@override final  DateTime? createdAt;

/// Create a copy of StockMovement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockMovementCopyWith<_StockMovement> get copyWith => __$StockMovementCopyWithImpl<_StockMovement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockMovementToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockMovement&&(identical(other.id, id) || other.id == id)&&(identical(other.species, species) || other.species == species)&&(identical(other.tripNumber, tripNumber) || other.tripNumber == tripNumber)&&(identical(other.type, type) || other.type == type)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.balanceAfter, balanceAfter) || other.balanceAfter == balanceAfter)&&(identical(other.user, user) || other.user == user)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,species,tripNumber,type,weightKg,balanceAfter,user,notes,createdAt);
}

@override
String toString() {
    return 'StockMovement(id: $id, species: $species, tripNumber: $tripNumber, type: $type, weightKg: $weightKg, balanceAfter: $balanceAfter, user: $user, notes: $notes, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$StockMovementCopyWith<$Res> implements $StockMovementCopyWith<$Res> {
  factory _$StockMovementCopyWith(_StockMovement value, $Res Function(_StockMovement) _then) = __$StockMovementCopyWithImpl;
@override @useResult
$Res call({
 int id, String? species, String? tripNumber, String? type, double weightKg, double balanceAfter, String? user, String? notes, DateTime? createdAt
});




}
/// @nodoc
class __$StockMovementCopyWithImpl<$Res>
    implements _$StockMovementCopyWith<$Res> {
  __$StockMovementCopyWithImpl(this._self, this._then);

  final _StockMovement _self;
  final $Res Function(_StockMovement) _then;

/// Create a copy of StockMovement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? species = freezed,Object? tripNumber = freezed,Object? type = freezed,Object? weightKg = null,Object? balanceAfter = null,Object? user = freezed,Object? notes = freezed,Object? createdAt = freezed,}) {
  return _then(_StockMovement(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,species: freezed == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String?,tripNumber: freezed == tripNumber ? _self.tripNumber : tripNumber // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double,balanceAfter: null == balanceAfter ? _self.balanceAfter : balanceAfter // ignore: cast_nullable_to_non_nullable
as double,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
