// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dalal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Dalal {

 int get id; String get name; String? get phone; Partnership? get partnership;
/// Create a copy of Dalal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DalalCopyWith<Dalal> get copyWith => _$DalalCopyWithImpl<Dalal>(this as Dalal, _$identity);

  /// Serializes this Dalal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Dalal;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Dalal&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.partnership, _this.partnership) || other.partnership == _this.partnership));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Dalal;
  return Object.hash(runtimeType,_this.id,_this.name,_this.phone,_this.partnership);
}

@override
String toString() {
  final _this = this as Dalal;
  return 'Dalal(id: ${_this.id}, name: ${_this.name}, phone: ${_this.phone}, partnership: ${_this.partnership})';
}


}

/// @nodoc
abstract mixin class $DalalCopyWith<$Res>  {
  factory $DalalCopyWith(Dalal value, $Res Function(Dalal) _then) = _$DalalCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? phone, Partnership? partnership
});


$PartnershipCopyWith<$Res>? get partnership;

}
/// @nodoc
class _$DalalCopyWithImpl<$Res>
    implements $DalalCopyWith<$Res> {
  _$DalalCopyWithImpl(this._self, this._then);

  final Dalal _self;
  final $Res Function(Dalal) _then;

/// Create a copy of Dalal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? phone = freezed,Object? partnership = freezed,}) {
  return _then(Dalal(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,partnership: freezed == partnership ? _self.partnership : partnership // ignore: cast_nullable_to_non_nullable
as Partnership?,
  ));
}
/// Create a copy of Dalal
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartnershipCopyWith<$Res>? get partnership {
    if (_self.partnership == null) {
    return null;
  }

  return $PartnershipCopyWith<$Res>(_self.partnership!, (value) {
    return _then(_self.copyWith(partnership: value));
  });
}
}


/// Adds pattern-matching-related methods to [Dalal].
extension DalalPatterns on Dalal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Dalal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Dalal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Dalal value)  $default,){
final _that = this;
switch (_that) {
case _Dalal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Dalal value)?  $default,){
final _that = this;
switch (_that) {
case _Dalal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? phone,  Partnership? partnership)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Dalal() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.partnership);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? phone,  Partnership? partnership)  $default,) {final _that = this;
switch (_that) {
case _Dalal():
return $default(_that.id,_that.name,_that.phone,_that.partnership);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? phone,  Partnership? partnership)?  $default,) {final _that = this;
switch (_that) {
case _Dalal() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.partnership);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Dalal extends Dalal {
  const _Dalal({required this.id, required this.name, this.phone, this.partnership}): super._();
  factory _Dalal.fromJson(Map<String, dynamic> json) => _$DalalFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? phone;
@override final  Partnership? partnership;

/// Create a copy of Dalal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DalalCopyWith<_Dalal> get copyWith => __$DalalCopyWithImpl<_Dalal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DalalToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Dalal&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.partnership, partnership) || other.partnership == partnership));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,phone,partnership);
}

@override
String toString() {
    return 'Dalal(id: $id, name: $name, phone: $phone, partnership: $partnership)';
}


}

/// @nodoc
abstract mixin class _$DalalCopyWith<$Res> implements $DalalCopyWith<$Res> {
  factory _$DalalCopyWith(_Dalal value, $Res Function(_Dalal) _then) = __$DalalCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? phone, Partnership? partnership
});


@override $PartnershipCopyWith<$Res>? get partnership;

}
/// @nodoc
class __$DalalCopyWithImpl<$Res>
    implements _$DalalCopyWith<$Res> {
  __$DalalCopyWithImpl(this._self, this._then);

  final _Dalal _self;
  final $Res Function(_Dalal) _then;

/// Create a copy of Dalal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? phone = freezed,Object? partnership = freezed,}) {
  return _then(_Dalal(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,partnership: freezed == partnership ? _self.partnership : partnership // ignore: cast_nullable_to_non_nullable
as Partnership?,
  ));
}

/// Create a copy of Dalal
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartnershipCopyWith<$Res>? get partnership {
    if (_self.partnership == null) {
    return null;
  }

  return $PartnershipCopyWith<$Res>(_self.partnership!, (value) {
    return _then(_self.copyWith(partnership: value));
  });
}
}


/// @nodoc
mixin _$Partnership {

 int get id; double get commissionPct; double get wagePct; String? get message; String get status; String? get statusLabel; String? get responseNote; DateTime? get respondedAt;
/// Create a copy of Partnership
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartnershipCopyWith<Partnership> get copyWith => _$PartnershipCopyWithImpl<Partnership>(this as Partnership, _$identity);

  /// Serializes this Partnership to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Partnership;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Partnership&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.commissionPct, _this.commissionPct) || other.commissionPct == _this.commissionPct)&&(identical(other.wagePct, _this.wagePct) || other.wagePct == _this.wagePct)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.statusLabel, _this.statusLabel) || other.statusLabel == _this.statusLabel)&&(identical(other.responseNote, _this.responseNote) || other.responseNote == _this.responseNote)&&(identical(other.respondedAt, _this.respondedAt) || other.respondedAt == _this.respondedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Partnership;
  return Object.hash(runtimeType,_this.id,_this.commissionPct,_this.wagePct,_this.message,_this.status,_this.statusLabel,_this.responseNote,_this.respondedAt);
}

@override
String toString() {
  final _this = this as Partnership;
  return 'Partnership(id: ${_this.id}, commissionPct: ${_this.commissionPct}, wagePct: ${_this.wagePct}, message: ${_this.message}, status: ${_this.status}, statusLabel: ${_this.statusLabel}, responseNote: ${_this.responseNote}, respondedAt: ${_this.respondedAt})';
}


}

/// @nodoc
abstract mixin class $PartnershipCopyWith<$Res>  {
  factory $PartnershipCopyWith(Partnership value, $Res Function(Partnership) _then) = _$PartnershipCopyWithImpl;
@useResult
$Res call({
 int id, double commissionPct, double wagePct, String? message, String status, String? statusLabel, String? responseNote, DateTime? respondedAt
});




}
/// @nodoc
class _$PartnershipCopyWithImpl<$Res>
    implements $PartnershipCopyWith<$Res> {
  _$PartnershipCopyWithImpl(this._self, this._then);

  final Partnership _self;
  final $Res Function(Partnership) _then;

/// Create a copy of Partnership
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? commissionPct = null,Object? wagePct = null,Object? message = freezed,Object? status = null,Object? statusLabel = freezed,Object? responseNote = freezed,Object? respondedAt = freezed,}) {
  return _then(Partnership(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,commissionPct: null == commissionPct ? _self.commissionPct : commissionPct // ignore: cast_nullable_to_non_nullable
as double,wagePct: null == wagePct ? _self.wagePct : wagePct // ignore: cast_nullable_to_non_nullable
as double,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,statusLabel: freezed == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String?,responseNote: freezed == responseNote ? _self.responseNote : responseNote // ignore: cast_nullable_to_non_nullable
as String?,respondedAt: freezed == respondedAt ? _self.respondedAt : respondedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Partnership].
extension PartnershipPatterns on Partnership {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Partnership value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Partnership() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Partnership value)  $default,){
final _that = this;
switch (_that) {
case _Partnership():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Partnership value)?  $default,){
final _that = this;
switch (_that) {
case _Partnership() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  double commissionPct,  double wagePct,  String? message,  String status,  String? statusLabel,  String? responseNote,  DateTime? respondedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Partnership() when $default != null:
return $default(_that.id,_that.commissionPct,_that.wagePct,_that.message,_that.status,_that.statusLabel,_that.responseNote,_that.respondedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  double commissionPct,  double wagePct,  String? message,  String status,  String? statusLabel,  String? responseNote,  DateTime? respondedAt)  $default,) {final _that = this;
switch (_that) {
case _Partnership():
return $default(_that.id,_that.commissionPct,_that.wagePct,_that.message,_that.status,_that.statusLabel,_that.responseNote,_that.respondedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  double commissionPct,  double wagePct,  String? message,  String status,  String? statusLabel,  String? responseNote,  DateTime? respondedAt)?  $default,) {final _that = this;
switch (_that) {
case _Partnership() when $default != null:
return $default(_that.id,_that.commissionPct,_that.wagePct,_that.message,_that.status,_that.statusLabel,_that.responseNote,_that.respondedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Partnership extends Partnership {
  const _Partnership({required this.id, this.commissionPct = 0, this.wagePct = 0, this.message, this.status = Partnership.pending, this.statusLabel, this.responseNote, this.respondedAt}): super._();
  factory _Partnership.fromJson(Map<String, dynamic> json) => _$PartnershipFromJson(json);

@override final  int id;
@override@JsonKey() final  double commissionPct;
@override@JsonKey() final  double wagePct;
@override final  String? message;
@override@JsonKey() final  String status;
@override final  String? statusLabel;
@override final  String? responseNote;
@override final  DateTime? respondedAt;

/// Create a copy of Partnership
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartnershipCopyWith<_Partnership> get copyWith => __$PartnershipCopyWithImpl<_Partnership>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartnershipToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Partnership&&(identical(other.id, id) || other.id == id)&&(identical(other.commissionPct, commissionPct) || other.commissionPct == commissionPct)&&(identical(other.wagePct, wagePct) || other.wagePct == wagePct)&&(identical(other.message, message) || other.message == message)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.responseNote, responseNote) || other.responseNote == responseNote)&&(identical(other.respondedAt, respondedAt) || other.respondedAt == respondedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,commissionPct,wagePct,message,status,statusLabel,responseNote,respondedAt);
}

@override
String toString() {
    return 'Partnership(id: $id, commissionPct: $commissionPct, wagePct: $wagePct, message: $message, status: $status, statusLabel: $statusLabel, responseNote: $responseNote, respondedAt: $respondedAt)';
}


}

/// @nodoc
abstract mixin class _$PartnershipCopyWith<$Res> implements $PartnershipCopyWith<$Res> {
  factory _$PartnershipCopyWith(_Partnership value, $Res Function(_Partnership) _then) = __$PartnershipCopyWithImpl;
@override @useResult
$Res call({
 int id, double commissionPct, double wagePct, String? message, String status, String? statusLabel, String? responseNote, DateTime? respondedAt
});




}
/// @nodoc
class __$PartnershipCopyWithImpl<$Res>
    implements _$PartnershipCopyWith<$Res> {
  __$PartnershipCopyWithImpl(this._self, this._then);

  final _Partnership _self;
  final $Res Function(_Partnership) _then;

/// Create a copy of Partnership
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? commissionPct = null,Object? wagePct = null,Object? message = freezed,Object? status = null,Object? statusLabel = freezed,Object? responseNote = freezed,Object? respondedAt = freezed,}) {
  return _then(_Partnership(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,commissionPct: null == commissionPct ? _self.commissionPct : commissionPct // ignore: cast_nullable_to_non_nullable
as double,wagePct: null == wagePct ? _self.wagePct : wagePct // ignore: cast_nullable_to_non_nullable
as double,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,statusLabel: freezed == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String?,responseNote: freezed == responseNote ? _self.responseNote : responseNote // ignore: cast_nullable_to_non_nullable
as String?,respondedAt: freezed == respondedAt ? _self.respondedAt : respondedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
