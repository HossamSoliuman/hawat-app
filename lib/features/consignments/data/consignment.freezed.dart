// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consignment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Consignment {

 int get id; String get consignmentNumber; String? get status; PersonRef? get dalal; TripNumberRef? get trip; double get totalKg; List<ConsignmentLine> get items; DateTime? get sentAt; String? get notes;
/// Create a copy of Consignment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsignmentCopyWith<Consignment> get copyWith => _$ConsignmentCopyWithImpl<Consignment>(this as Consignment, _$identity);

  /// Serializes this Consignment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Consignment;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Consignment&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.consignmentNumber, _this.consignmentNumber) || other.consignmentNumber == _this.consignmentNumber)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.dalal, _this.dalal) || other.dalal == _this.dalal)&&(identical(other.trip, _this.trip) || other.trip == _this.trip)&&(identical(other.totalKg, _this.totalKg) || other.totalKg == _this.totalKg)&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.sentAt, _this.sentAt) || other.sentAt == _this.sentAt)&&(identical(other.notes, _this.notes) || other.notes == _this.notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Consignment;
  return Object.hash(runtimeType,_this.id,_this.consignmentNumber,_this.status,_this.dalal,_this.trip,_this.totalKg,const DeepCollectionEquality().hash(_this.items),_this.sentAt,_this.notes);
}

@override
String toString() {
  final _this = this as Consignment;
  return 'Consignment(id: ${_this.id}, consignmentNumber: ${_this.consignmentNumber}, status: ${_this.status}, dalal: ${_this.dalal}, trip: ${_this.trip}, totalKg: ${_this.totalKg}, items: ${_this.items}, sentAt: ${_this.sentAt}, notes: ${_this.notes})';
}


}

/// @nodoc
abstract mixin class $ConsignmentCopyWith<$Res>  {
  factory $ConsignmentCopyWith(Consignment value, $Res Function(Consignment) _then) = _$ConsignmentCopyWithImpl;
@useResult
$Res call({
 int id, String consignmentNumber, String? status, PersonRef? dalal, TripNumberRef? trip, double totalKg, List<ConsignmentLine> items, DateTime? sentAt, String? notes
});


$PersonRefCopyWith<$Res>? get dalal;$TripNumberRefCopyWith<$Res>? get trip;

}
/// @nodoc
class _$ConsignmentCopyWithImpl<$Res>
    implements $ConsignmentCopyWith<$Res> {
  _$ConsignmentCopyWithImpl(this._self, this._then);

  final Consignment _self;
  final $Res Function(Consignment) _then;

/// Create a copy of Consignment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? consignmentNumber = null,Object? status = freezed,Object? dalal = freezed,Object? trip = freezed,Object? totalKg = null,Object? items = null,Object? sentAt = freezed,Object? notes = freezed,}) {
  return _then(Consignment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,consignmentNumber: null == consignmentNumber ? _self.consignmentNumber : consignmentNumber // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,dalal: freezed == dalal ? _self.dalal : dalal // ignore: cast_nullable_to_non_nullable
as PersonRef?,trip: freezed == trip ? _self.trip : trip // ignore: cast_nullable_to_non_nullable
as TripNumberRef?,totalKg: null == totalKg ? _self.totalKg : totalKg // ignore: cast_nullable_to_non_nullable
as double,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ConsignmentLine>,sentAt: freezed == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Consignment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonRefCopyWith<$Res>? get dalal {
    if (_self.dalal == null) {
    return null;
  }

  return $PersonRefCopyWith<$Res>(_self.dalal!, (value) {
    return _then(_self.copyWith(dalal: value));
  });
}/// Create a copy of Consignment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripNumberRefCopyWith<$Res>? get trip {
    if (_self.trip == null) {
    return null;
  }

  return $TripNumberRefCopyWith<$Res>(_self.trip!, (value) {
    return _then(_self.copyWith(trip: value));
  });
}
}


/// Adds pattern-matching-related methods to [Consignment].
extension ConsignmentPatterns on Consignment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Consignment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Consignment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Consignment value)  $default,){
final _that = this;
switch (_that) {
case _Consignment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Consignment value)?  $default,){
final _that = this;
switch (_that) {
case _Consignment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String consignmentNumber,  String? status,  PersonRef? dalal,  TripNumberRef? trip,  double totalKg,  List<ConsignmentLine> items,  DateTime? sentAt,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Consignment() when $default != null:
return $default(_that.id,_that.consignmentNumber,_that.status,_that.dalal,_that.trip,_that.totalKg,_that.items,_that.sentAt,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String consignmentNumber,  String? status,  PersonRef? dalal,  TripNumberRef? trip,  double totalKg,  List<ConsignmentLine> items,  DateTime? sentAt,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _Consignment():
return $default(_that.id,_that.consignmentNumber,_that.status,_that.dalal,_that.trip,_that.totalKg,_that.items,_that.sentAt,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String consignmentNumber,  String? status,  PersonRef? dalal,  TripNumberRef? trip,  double totalKg,  List<ConsignmentLine> items,  DateTime? sentAt,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _Consignment() when $default != null:
return $default(_that.id,_that.consignmentNumber,_that.status,_that.dalal,_that.trip,_that.totalKg,_that.items,_that.sentAt,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Consignment implements Consignment {
  const _Consignment({required this.id, required this.consignmentNumber, this.status, this.dalal, this.trip, this.totalKg = 0,  List<ConsignmentLine> items = const <ConsignmentLine>[], this.sentAt, this.notes}): _items = items;
  factory _Consignment.fromJson(Map<String, dynamic> json) => _$ConsignmentFromJson(json);

@override final  int id;
@override final  String consignmentNumber;
@override final  String? status;
@override final  PersonRef? dalal;
@override final  TripNumberRef? trip;
@override@JsonKey() final  double totalKg;
 final  List<ConsignmentLine> _items;
@override@JsonKey() List<ConsignmentLine> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  DateTime? sentAt;
@override final  String? notes;

/// Create a copy of Consignment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsignmentCopyWith<_Consignment> get copyWith => __$ConsignmentCopyWithImpl<_Consignment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConsignmentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Consignment&&(identical(other.id, id) || other.id == id)&&(identical(other.consignmentNumber, consignmentNumber) || other.consignmentNumber == consignmentNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.dalal, dalal) || other.dalal == dalal)&&(identical(other.trip, trip) || other.trip == trip)&&(identical(other.totalKg, totalKg) || other.totalKg == totalKg)&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,consignmentNumber,status,dalal,trip,totalKg,const DeepCollectionEquality().hash(_items),sentAt,notes);
}

@override
String toString() {
    return 'Consignment(id: $id, consignmentNumber: $consignmentNumber, status: $status, dalal: $dalal, trip: $trip, totalKg: $totalKg, items: $items, sentAt: $sentAt, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$ConsignmentCopyWith<$Res> implements $ConsignmentCopyWith<$Res> {
  factory _$ConsignmentCopyWith(_Consignment value, $Res Function(_Consignment) _then) = __$ConsignmentCopyWithImpl;
@override @useResult
$Res call({
 int id, String consignmentNumber, String? status, PersonRef? dalal, TripNumberRef? trip, double totalKg, List<ConsignmentLine> items, DateTime? sentAt, String? notes
});


@override $PersonRefCopyWith<$Res>? get dalal;@override $TripNumberRefCopyWith<$Res>? get trip;

}
/// @nodoc
class __$ConsignmentCopyWithImpl<$Res>
    implements _$ConsignmentCopyWith<$Res> {
  __$ConsignmentCopyWithImpl(this._self, this._then);

  final _Consignment _self;
  final $Res Function(_Consignment) _then;

/// Create a copy of Consignment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? consignmentNumber = null,Object? status = freezed,Object? dalal = freezed,Object? trip = freezed,Object? totalKg = null,Object? items = null,Object? sentAt = freezed,Object? notes = freezed,}) {
  return _then(_Consignment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,consignmentNumber: null == consignmentNumber ? _self.consignmentNumber : consignmentNumber // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,dalal: freezed == dalal ? _self.dalal : dalal // ignore: cast_nullable_to_non_nullable
as PersonRef?,trip: freezed == trip ? _self.trip : trip // ignore: cast_nullable_to_non_nullable
as TripNumberRef?,totalKg: null == totalKg ? _self.totalKg : totalKg // ignore: cast_nullable_to_non_nullable
as double,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ConsignmentLine>,sentAt: freezed == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Consignment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonRefCopyWith<$Res>? get dalal {
    if (_self.dalal == null) {
    return null;
  }

  return $PersonRefCopyWith<$Res>(_self.dalal!, (value) {
    return _then(_self.copyWith(dalal: value));
  });
}/// Create a copy of Consignment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripNumberRefCopyWith<$Res>? get trip {
    if (_self.trip == null) {
    return null;
  }

  return $TripNumberRefCopyWith<$Res>(_self.trip!, (value) {
    return _then(_self.copyWith(trip: value));
  });
}
}


/// @nodoc
mixin _$ConsignmentLine {

 int get id; IdName? get species; double get weightKg;
/// Create a copy of ConsignmentLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsignmentLineCopyWith<ConsignmentLine> get copyWith => _$ConsignmentLineCopyWithImpl<ConsignmentLine>(this as ConsignmentLine, _$identity);

  /// Serializes this ConsignmentLine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ConsignmentLine;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsignmentLine&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.species, _this.species) || other.species == _this.species)&&(identical(other.weightKg, _this.weightKg) || other.weightKg == _this.weightKg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ConsignmentLine;
  return Object.hash(runtimeType,_this.id,_this.species,_this.weightKg);
}

@override
String toString() {
  final _this = this as ConsignmentLine;
  return 'ConsignmentLine(id: ${_this.id}, species: ${_this.species}, weightKg: ${_this.weightKg})';
}


}

/// @nodoc
abstract mixin class $ConsignmentLineCopyWith<$Res>  {
  factory $ConsignmentLineCopyWith(ConsignmentLine value, $Res Function(ConsignmentLine) _then) = _$ConsignmentLineCopyWithImpl;
@useResult
$Res call({
 int id, IdName? species, double weightKg
});


$IdNameCopyWith<$Res>? get species;

}
/// @nodoc
class _$ConsignmentLineCopyWithImpl<$Res>
    implements $ConsignmentLineCopyWith<$Res> {
  _$ConsignmentLineCopyWithImpl(this._self, this._then);

  final ConsignmentLine _self;
  final $Res Function(ConsignmentLine) _then;

/// Create a copy of ConsignmentLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? species = freezed,Object? weightKg = null,}) {
  return _then(ConsignmentLine(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,species: freezed == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as IdName?,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of ConsignmentLine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res>? get species {
    if (_self.species == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.species!, (value) {
    return _then(_self.copyWith(species: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConsignmentLine].
extension ConsignmentLinePatterns on ConsignmentLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsignmentLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsignmentLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsignmentLine value)  $default,){
final _that = this;
switch (_that) {
case _ConsignmentLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsignmentLine value)?  $default,){
final _that = this;
switch (_that) {
case _ConsignmentLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  IdName? species,  double weightKg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsignmentLine() when $default != null:
return $default(_that.id,_that.species,_that.weightKg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  IdName? species,  double weightKg)  $default,) {final _that = this;
switch (_that) {
case _ConsignmentLine():
return $default(_that.id,_that.species,_that.weightKg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  IdName? species,  double weightKg)?  $default,) {final _that = this;
switch (_that) {
case _ConsignmentLine() when $default != null:
return $default(_that.id,_that.species,_that.weightKg);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConsignmentLine implements ConsignmentLine {
  const _ConsignmentLine({required this.id, this.species, this.weightKg = 0});
  factory _ConsignmentLine.fromJson(Map<String, dynamic> json) => _$ConsignmentLineFromJson(json);

@override final  int id;
@override final  IdName? species;
@override@JsonKey() final  double weightKg;

/// Create a copy of ConsignmentLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsignmentLineCopyWith<_ConsignmentLine> get copyWith => __$ConsignmentLineCopyWithImpl<_ConsignmentLine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConsignmentLineToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsignmentLine&&(identical(other.id, id) || other.id == id)&&(identical(other.species, species) || other.species == species)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,species,weightKg);
}

@override
String toString() {
    return 'ConsignmentLine(id: $id, species: $species, weightKg: $weightKg)';
}


}

/// @nodoc
abstract mixin class _$ConsignmentLineCopyWith<$Res> implements $ConsignmentLineCopyWith<$Res> {
  factory _$ConsignmentLineCopyWith(_ConsignmentLine value, $Res Function(_ConsignmentLine) _then) = __$ConsignmentLineCopyWithImpl;
@override @useResult
$Res call({
 int id, IdName? species, double weightKg
});


@override $IdNameCopyWith<$Res>? get species;

}
/// @nodoc
class __$ConsignmentLineCopyWithImpl<$Res>
    implements _$ConsignmentLineCopyWith<$Res> {
  __$ConsignmentLineCopyWithImpl(this._self, this._then);

  final _ConsignmentLine _self;
  final $Res Function(_ConsignmentLine) _then;

/// Create a copy of ConsignmentLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? species = freezed,Object? weightKg = null,}) {
  return _then(_ConsignmentLine(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,species: freezed == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as IdName?,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of ConsignmentLine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res>? get species {
    if (_self.species == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.species!, (value) {
    return _then(_self.copyWith(species: value));
  });
}
}

/// @nodoc
mixin _$ConsignmentInput {

 int get tripId; int get dalalId; String? get notes; List<ConsignLineInput> get items;
/// Create a copy of ConsignmentInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsignmentInputCopyWith<ConsignmentInput> get copyWith => _$ConsignmentInputCopyWithImpl<ConsignmentInput>(this as ConsignmentInput, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ConsignmentInput;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsignmentInput&&(identical(other.tripId, _this.tripId) || other.tripId == _this.tripId)&&(identical(other.dalalId, _this.dalalId) || other.dalalId == _this.dalalId)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&const DeepCollectionEquality().equals(other.items, _this.items));
}


@override
int get hashCode {
  final _this = this as ConsignmentInput;
  return Object.hash(runtimeType,_this.tripId,_this.dalalId,_this.notes,const DeepCollectionEquality().hash(_this.items));
}

@override
String toString() {
  final _this = this as ConsignmentInput;
  return 'ConsignmentInput(tripId: ${_this.tripId}, dalalId: ${_this.dalalId}, notes: ${_this.notes}, items: ${_this.items})';
}


}

/// @nodoc
abstract mixin class $ConsignmentInputCopyWith<$Res>  {
  factory $ConsignmentInputCopyWith(ConsignmentInput value, $Res Function(ConsignmentInput) _then) = _$ConsignmentInputCopyWithImpl;
@useResult
$Res call({
 int tripId, int dalalId, String? notes, List<ConsignLineInput> items
});




}
/// @nodoc
class _$ConsignmentInputCopyWithImpl<$Res>
    implements $ConsignmentInputCopyWith<$Res> {
  _$ConsignmentInputCopyWithImpl(this._self, this._then);

  final ConsignmentInput _self;
  final $Res Function(ConsignmentInput) _then;

/// Create a copy of ConsignmentInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tripId = null,Object? dalalId = null,Object? notes = freezed,Object? items = null,}) {
  return _then(ConsignmentInput(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,dalalId: null == dalalId ? _self.dalalId : dalalId // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ConsignLineInput>,
  ));
}

}


/// Adds pattern-matching-related methods to [ConsignmentInput].
extension ConsignmentInputPatterns on ConsignmentInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsignmentInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsignmentInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsignmentInput value)  $default,){
final _that = this;
switch (_that) {
case _ConsignmentInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsignmentInput value)?  $default,){
final _that = this;
switch (_that) {
case _ConsignmentInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int tripId,  int dalalId,  String? notes,  List<ConsignLineInput> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsignmentInput() when $default != null:
return $default(_that.tripId,_that.dalalId,_that.notes,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int tripId,  int dalalId,  String? notes,  List<ConsignLineInput> items)  $default,) {final _that = this;
switch (_that) {
case _ConsignmentInput():
return $default(_that.tripId,_that.dalalId,_that.notes,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int tripId,  int dalalId,  String? notes,  List<ConsignLineInput> items)?  $default,) {final _that = this;
switch (_that) {
case _ConsignmentInput() when $default != null:
return $default(_that.tripId,_that.dalalId,_that.notes,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _ConsignmentInput implements ConsignmentInput {
  const _ConsignmentInput({required this.tripId, required this.dalalId, this.notes, required  List<ConsignLineInput> items}): _items = items;
  

@override final  int tripId;
@override final  int dalalId;
@override final  String? notes;
 final  List<ConsignLineInput> _items;
@override List<ConsignLineInput> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ConsignmentInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsignmentInputCopyWith<_ConsignmentInput> get copyWith => __$ConsignmentInputCopyWithImpl<_ConsignmentInput>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsignmentInput&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.dalalId, dalalId) || other.dalalId == dalalId)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.items, _items));
}


@override
int get hashCode {
    return Object.hash(runtimeType,tripId,dalalId,notes,const DeepCollectionEquality().hash(_items));
}

@override
String toString() {
    return 'ConsignmentInput(tripId: $tripId, dalalId: $dalalId, notes: $notes, items: $items)';
}


}

/// @nodoc
abstract mixin class _$ConsignmentInputCopyWith<$Res> implements $ConsignmentInputCopyWith<$Res> {
  factory _$ConsignmentInputCopyWith(_ConsignmentInput value, $Res Function(_ConsignmentInput) _then) = __$ConsignmentInputCopyWithImpl;
@override @useResult
$Res call({
 int tripId, int dalalId, String? notes, List<ConsignLineInput> items
});




}
/// @nodoc
class __$ConsignmentInputCopyWithImpl<$Res>
    implements _$ConsignmentInputCopyWith<$Res> {
  __$ConsignmentInputCopyWithImpl(this._self, this._then);

  final _ConsignmentInput _self;
  final $Res Function(_ConsignmentInput) _then;

/// Create a copy of ConsignmentInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tripId = null,Object? dalalId = null,Object? notes = freezed,Object? items = null,}) {
  return _then(_ConsignmentInput(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,dalalId: null == dalalId ? _self.dalalId : dalalId // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ConsignLineInput>,
  ));
}


}

/// @nodoc
mixin _$ConsignLineInput {

 int get speciesId; double get weightKg;
/// Create a copy of ConsignLineInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsignLineInputCopyWith<ConsignLineInput> get copyWith => _$ConsignLineInputCopyWithImpl<ConsignLineInput>(this as ConsignLineInput, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ConsignLineInput;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsignLineInput&&(identical(other.speciesId, _this.speciesId) || other.speciesId == _this.speciesId)&&(identical(other.weightKg, _this.weightKg) || other.weightKg == _this.weightKg));
}


@override
int get hashCode {
  final _this = this as ConsignLineInput;
  return Object.hash(runtimeType,_this.speciesId,_this.weightKg);
}

@override
String toString() {
  final _this = this as ConsignLineInput;
  return 'ConsignLineInput(speciesId: ${_this.speciesId}, weightKg: ${_this.weightKg})';
}


}

/// @nodoc
abstract mixin class $ConsignLineInputCopyWith<$Res>  {
  factory $ConsignLineInputCopyWith(ConsignLineInput value, $Res Function(ConsignLineInput) _then) = _$ConsignLineInputCopyWithImpl;
@useResult
$Res call({
 int speciesId, double weightKg
});




}
/// @nodoc
class _$ConsignLineInputCopyWithImpl<$Res>
    implements $ConsignLineInputCopyWith<$Res> {
  _$ConsignLineInputCopyWithImpl(this._self, this._then);

  final ConsignLineInput _self;
  final $Res Function(ConsignLineInput) _then;

/// Create a copy of ConsignLineInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? speciesId = null,Object? weightKg = null,}) {
  return _then(ConsignLineInput(
speciesId: null == speciesId ? _self.speciesId : speciesId // ignore: cast_nullable_to_non_nullable
as int,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ConsignLineInput].
extension ConsignLineInputPatterns on ConsignLineInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsignLineInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsignLineInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsignLineInput value)  $default,){
final _that = this;
switch (_that) {
case _ConsignLineInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsignLineInput value)?  $default,){
final _that = this;
switch (_that) {
case _ConsignLineInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int speciesId,  double weightKg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsignLineInput() when $default != null:
return $default(_that.speciesId,_that.weightKg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int speciesId,  double weightKg)  $default,) {final _that = this;
switch (_that) {
case _ConsignLineInput():
return $default(_that.speciesId,_that.weightKg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int speciesId,  double weightKg)?  $default,) {final _that = this;
switch (_that) {
case _ConsignLineInput() when $default != null:
return $default(_that.speciesId,_that.weightKg);case _:
  return null;

}
}

}

/// @nodoc


class _ConsignLineInput implements ConsignLineInput {
  const _ConsignLineInput({required this.speciesId, required this.weightKg});
  

@override final  int speciesId;
@override final  double weightKg;

/// Create a copy of ConsignLineInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsignLineInputCopyWith<_ConsignLineInput> get copyWith => __$ConsignLineInputCopyWithImpl<_ConsignLineInput>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsignLineInput&&(identical(other.speciesId, speciesId) || other.speciesId == speciesId)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg));
}


@override
int get hashCode {
    return Object.hash(runtimeType,speciesId,weightKg);
}

@override
String toString() {
    return 'ConsignLineInput(speciesId: $speciesId, weightKg: $weightKg)';
}


}

/// @nodoc
abstract mixin class _$ConsignLineInputCopyWith<$Res> implements $ConsignLineInputCopyWith<$Res> {
  factory _$ConsignLineInputCopyWith(_ConsignLineInput value, $Res Function(_ConsignLineInput) _then) = __$ConsignLineInputCopyWithImpl;
@override @useResult
$Res call({
 int speciesId, double weightKg
});




}
/// @nodoc
class __$ConsignLineInputCopyWithImpl<$Res>
    implements _$ConsignLineInputCopyWith<$Res> {
  __$ConsignLineInputCopyWithImpl(this._self, this._then);

  final _ConsignLineInput _self;
  final $Res Function(_ConsignLineInput) _then;

/// Create a copy of ConsignLineInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? speciesId = null,Object? weightKg = null,}) {
  return _then(_ConsignLineInput(
speciesId: null == speciesId ? _self.speciesId : speciesId // ignore: cast_nullable_to_non_nullable
as int,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
