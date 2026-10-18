// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IdName {

 int? get id; String? get name;
/// Create a copy of IdName
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IdNameCopyWith<IdName> get copyWith => _$IdNameCopyWithImpl<IdName>(this as IdName, _$identity);

  /// Serializes this IdName to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as IdName;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdName&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as IdName;
  return Object.hash(runtimeType,_this.id,_this.name);
}

@override
String toString() {
  final _this = this as IdName;
  return 'IdName(id: ${_this.id}, name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $IdNameCopyWith<$Res>  {
  factory $IdNameCopyWith(IdName value, $Res Function(IdName) _then) = _$IdNameCopyWithImpl;
@useResult
$Res call({
 int? id, String? name
});




}
/// @nodoc
class _$IdNameCopyWithImpl<$Res>
    implements $IdNameCopyWith<$Res> {
  _$IdNameCopyWithImpl(this._self, this._then);

  final IdName _self;
  final $Res Function(IdName) _then;

/// Create a copy of IdName
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(IdName(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [IdName].
extension IdNamePatterns on IdName {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IdName value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IdName() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IdName value)  $default,){
final _that = this;
switch (_that) {
case _IdName():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IdName value)?  $default,){
final _that = this;
switch (_that) {
case _IdName() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IdName() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? name)  $default,) {final _that = this;
switch (_that) {
case _IdName():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? name)?  $default,) {final _that = this;
switch (_that) {
case _IdName() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IdName implements IdName {
  const _IdName({this.id, this.name});
  factory _IdName.fromJson(Map<String, dynamic> json) => _$IdNameFromJson(json);

@override final  int? id;
@override final  String? name;

/// Create a copy of IdName
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IdNameCopyWith<_IdName> get copyWith => __$IdNameCopyWithImpl<_IdName>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IdNameToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _IdName&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name);
}

@override
String toString() {
    return 'IdName(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$IdNameCopyWith<$Res> implements $IdNameCopyWith<$Res> {
  factory _$IdNameCopyWith(_IdName value, $Res Function(_IdName) _then) = __$IdNameCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name
});




}
/// @nodoc
class __$IdNameCopyWithImpl<$Res>
    implements _$IdNameCopyWith<$Res> {
  __$IdNameCopyWithImpl(this._self, this._then);

  final _IdName _self;
  final $Res Function(_IdName) _then;

/// Create a copy of IdName
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_IdName(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PersonRef {

 int? get id; String? get name; String? get phone;
/// Create a copy of PersonRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonRefCopyWith<PersonRef> get copyWith => _$PersonRefCopyWithImpl<PersonRef>(this as PersonRef, _$identity);

  /// Serializes this PersonRef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PersonRef;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonRef&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.phone, _this.phone) || other.phone == _this.phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PersonRef;
  return Object.hash(runtimeType,_this.id,_this.name,_this.phone);
}

@override
String toString() {
  final _this = this as PersonRef;
  return 'PersonRef(id: ${_this.id}, name: ${_this.name}, phone: ${_this.phone})';
}


}

/// @nodoc
abstract mixin class $PersonRefCopyWith<$Res>  {
  factory $PersonRefCopyWith(PersonRef value, $Res Function(PersonRef) _then) = _$PersonRefCopyWithImpl;
@useResult
$Res call({
 int? id, String? name, String? phone
});




}
/// @nodoc
class _$PersonRefCopyWithImpl<$Res>
    implements $PersonRefCopyWith<$Res> {
  _$PersonRefCopyWithImpl(this._self, this._then);

  final PersonRef _self;
  final $Res Function(PersonRef) _then;

/// Create a copy of PersonRef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? phone = freezed,}) {
  return _then(PersonRef(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PersonRef].
extension PersonRefPatterns on PersonRef {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PersonRef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PersonRef() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PersonRef value)  $default,){
final _that = this;
switch (_that) {
case _PersonRef():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PersonRef value)?  $default,){
final _that = this;
switch (_that) {
case _PersonRef() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? name,  String? phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PersonRef() when $default != null:
return $default(_that.id,_that.name,_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? name,  String? phone)  $default,) {final _that = this;
switch (_that) {
case _PersonRef():
return $default(_that.id,_that.name,_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? name,  String? phone)?  $default,) {final _that = this;
switch (_that) {
case _PersonRef() when $default != null:
return $default(_that.id,_that.name,_that.phone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PersonRef implements PersonRef {
  const _PersonRef({this.id, this.name, this.phone});
  factory _PersonRef.fromJson(Map<String, dynamic> json) => _$PersonRefFromJson(json);

@override final  int? id;
@override final  String? name;
@override final  String? phone;

/// Create a copy of PersonRef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonRefCopyWith<_PersonRef> get copyWith => __$PersonRefCopyWithImpl<_PersonRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PersonRefToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonRef&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,phone);
}

@override
String toString() {
    return 'PersonRef(id: $id, name: $name, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$PersonRefCopyWith<$Res> implements $PersonRefCopyWith<$Res> {
  factory _$PersonRefCopyWith(_PersonRef value, $Res Function(_PersonRef) _then) = __$PersonRefCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name, String? phone
});




}
/// @nodoc
class __$PersonRefCopyWithImpl<$Res>
    implements _$PersonRefCopyWith<$Res> {
  __$PersonRefCopyWithImpl(this._self, this._then);

  final _PersonRef _self;
  final $Res Function(_PersonRef) _then;

/// Create a copy of PersonRef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? phone = freezed,}) {
  return _then(_PersonRef(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SpeciesRef {

 int get id; String get name; String? get nameSci;
/// Create a copy of SpeciesRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeciesRefCopyWith<SpeciesRef> get copyWith => _$SpeciesRefCopyWithImpl<SpeciesRef>(this as SpeciesRef, _$identity);

  /// Serializes this SpeciesRef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SpeciesRef;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeciesRef&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.nameSci, _this.nameSci) || other.nameSci == _this.nameSci));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SpeciesRef;
  return Object.hash(runtimeType,_this.id,_this.name,_this.nameSci);
}

@override
String toString() {
  final _this = this as SpeciesRef;
  return 'SpeciesRef(id: ${_this.id}, name: ${_this.name}, nameSci: ${_this.nameSci})';
}


}

/// @nodoc
abstract mixin class $SpeciesRefCopyWith<$Res>  {
  factory $SpeciesRefCopyWith(SpeciesRef value, $Res Function(SpeciesRef) _then) = _$SpeciesRefCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? nameSci
});




}
/// @nodoc
class _$SpeciesRefCopyWithImpl<$Res>
    implements $SpeciesRefCopyWith<$Res> {
  _$SpeciesRefCopyWithImpl(this._self, this._then);

  final SpeciesRef _self;
  final $Res Function(SpeciesRef) _then;

/// Create a copy of SpeciesRef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? nameSci = freezed,}) {
  return _then(SpeciesRef(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameSci: freezed == nameSci ? _self.nameSci : nameSci // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SpeciesRef].
extension SpeciesRefPatterns on SpeciesRef {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpeciesRef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpeciesRef() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpeciesRef value)  $default,){
final _that = this;
switch (_that) {
case _SpeciesRef():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpeciesRef value)?  $default,){
final _that = this;
switch (_that) {
case _SpeciesRef() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? nameSci)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpeciesRef() when $default != null:
return $default(_that.id,_that.name,_that.nameSci);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? nameSci)  $default,) {final _that = this;
switch (_that) {
case _SpeciesRef():
return $default(_that.id,_that.name,_that.nameSci);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? nameSci)?  $default,) {final _that = this;
switch (_that) {
case _SpeciesRef() when $default != null:
return $default(_that.id,_that.name,_that.nameSci);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpeciesRef implements SpeciesRef {
  const _SpeciesRef({required this.id, required this.name, this.nameSci});
  factory _SpeciesRef.fromJson(Map<String, dynamic> json) => _$SpeciesRefFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? nameSci;

/// Create a copy of SpeciesRef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpeciesRefCopyWith<_SpeciesRef> get copyWith => __$SpeciesRefCopyWithImpl<_SpeciesRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpeciesRefToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpeciesRef&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameSci, nameSci) || other.nameSci == nameSci));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,nameSci);
}

@override
String toString() {
    return 'SpeciesRef(id: $id, name: $name, nameSci: $nameSci)';
}


}

/// @nodoc
abstract mixin class _$SpeciesRefCopyWith<$Res> implements $SpeciesRefCopyWith<$Res> {
  factory _$SpeciesRefCopyWith(_SpeciesRef value, $Res Function(_SpeciesRef) _then) = __$SpeciesRefCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? nameSci
});




}
/// @nodoc
class __$SpeciesRefCopyWithImpl<$Res>
    implements _$SpeciesRefCopyWith<$Res> {
  __$SpeciesRefCopyWithImpl(this._self, this._then);

  final _SpeciesRef _self;
  final $Res Function(_SpeciesRef) _then;

/// Create a copy of SpeciesRef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? nameSci = freezed,}) {
  return _then(_SpeciesRef(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameSci: freezed == nameSci ? _self.nameSci : nameSci // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TripNumberRef {

 int get id; String get tripNumber;
/// Create a copy of TripNumberRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripNumberRefCopyWith<TripNumberRef> get copyWith => _$TripNumberRefCopyWithImpl<TripNumberRef>(this as TripNumberRef, _$identity);

  /// Serializes this TripNumberRef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TripNumberRef;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripNumberRef&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.tripNumber, _this.tripNumber) || other.tripNumber == _this.tripNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TripNumberRef;
  return Object.hash(runtimeType,_this.id,_this.tripNumber);
}

@override
String toString() {
  final _this = this as TripNumberRef;
  return 'TripNumberRef(id: ${_this.id}, tripNumber: ${_this.tripNumber})';
}


}

/// @nodoc
abstract mixin class $TripNumberRefCopyWith<$Res>  {
  factory $TripNumberRefCopyWith(TripNumberRef value, $Res Function(TripNumberRef) _then) = _$TripNumberRefCopyWithImpl;
@useResult
$Res call({
 int id, String tripNumber
});




}
/// @nodoc
class _$TripNumberRefCopyWithImpl<$Res>
    implements $TripNumberRefCopyWith<$Res> {
  _$TripNumberRefCopyWithImpl(this._self, this._then);

  final TripNumberRef _self;
  final $Res Function(TripNumberRef) _then;

/// Create a copy of TripNumberRef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tripNumber = null,}) {
  return _then(TripNumberRef(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tripNumber: null == tripNumber ? _self.tripNumber : tripNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TripNumberRef].
extension TripNumberRefPatterns on TripNumberRef {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripNumberRef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripNumberRef() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripNumberRef value)  $default,){
final _that = this;
switch (_that) {
case _TripNumberRef():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripNumberRef value)?  $default,){
final _that = this;
switch (_that) {
case _TripNumberRef() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String tripNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripNumberRef() when $default != null:
return $default(_that.id,_that.tripNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String tripNumber)  $default,) {final _that = this;
switch (_that) {
case _TripNumberRef():
return $default(_that.id,_that.tripNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String tripNumber)?  $default,) {final _that = this;
switch (_that) {
case _TripNumberRef() when $default != null:
return $default(_that.id,_that.tripNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TripNumberRef implements TripNumberRef {
  const _TripNumberRef({required this.id, required this.tripNumber});
  factory _TripNumberRef.fromJson(Map<String, dynamic> json) => _$TripNumberRefFromJson(json);

@override final  int id;
@override final  String tripNumber;

/// Create a copy of TripNumberRef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripNumberRefCopyWith<_TripNumberRef> get copyWith => __$TripNumberRefCopyWithImpl<_TripNumberRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TripNumberRefToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripNumberRef&&(identical(other.id, id) || other.id == id)&&(identical(other.tripNumber, tripNumber) || other.tripNumber == tripNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,tripNumber);
}

@override
String toString() {
    return 'TripNumberRef(id: $id, tripNumber: $tripNumber)';
}


}

/// @nodoc
abstract mixin class _$TripNumberRefCopyWith<$Res> implements $TripNumberRefCopyWith<$Res> {
  factory _$TripNumberRefCopyWith(_TripNumberRef value, $Res Function(_TripNumberRef) _then) = __$TripNumberRefCopyWithImpl;
@override @useResult
$Res call({
 int id, String tripNumber
});




}
/// @nodoc
class __$TripNumberRefCopyWithImpl<$Res>
    implements _$TripNumberRefCopyWith<$Res> {
  __$TripNumberRefCopyWithImpl(this._self, this._then);

  final _TripNumberRef _self;
  final $Res Function(_TripNumberRef) _then;

/// Create a copy of TripNumberRef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tripNumber = null,}) {
  return _then(_TripNumberRef(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tripNumber: null == tripNumber ? _self.tripNumber : tripNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
