// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lookups.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Lookups {

 List<Species> get species; List<Port> get ports; List<IdName> get gearTypes; List<IdName> get tripTypes; List<IdName> get paymentMethods;
/// Create a copy of Lookups
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LookupsCopyWith<Lookups> get copyWith => _$LookupsCopyWithImpl<Lookups>(this as Lookups, _$identity);

  /// Serializes this Lookups to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Lookups;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Lookups&&const DeepCollectionEquality().equals(other.species, _this.species)&&const DeepCollectionEquality().equals(other.ports, _this.ports)&&const DeepCollectionEquality().equals(other.gearTypes, _this.gearTypes)&&const DeepCollectionEquality().equals(other.tripTypes, _this.tripTypes)&&const DeepCollectionEquality().equals(other.paymentMethods, _this.paymentMethods));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Lookups;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.species),const DeepCollectionEquality().hash(_this.ports),const DeepCollectionEquality().hash(_this.gearTypes),const DeepCollectionEquality().hash(_this.tripTypes),const DeepCollectionEquality().hash(_this.paymentMethods));
}

@override
String toString() {
  final _this = this as Lookups;
  return 'Lookups(species: ${_this.species}, ports: ${_this.ports}, gearTypes: ${_this.gearTypes}, tripTypes: ${_this.tripTypes}, paymentMethods: ${_this.paymentMethods})';
}


}

/// @nodoc
abstract mixin class $LookupsCopyWith<$Res>  {
  factory $LookupsCopyWith(Lookups value, $Res Function(Lookups) _then) = _$LookupsCopyWithImpl;
@useResult
$Res call({
 List<Species> species, List<Port> ports, List<IdName> gearTypes, List<IdName> tripTypes, List<IdName> paymentMethods
});




}
/// @nodoc
class _$LookupsCopyWithImpl<$Res>
    implements $LookupsCopyWith<$Res> {
  _$LookupsCopyWithImpl(this._self, this._then);

  final Lookups _self;
  final $Res Function(Lookups) _then;

/// Create a copy of Lookups
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? species = null,Object? ports = null,Object? gearTypes = null,Object? tripTypes = null,Object? paymentMethods = null,}) {
  return _then(Lookups(
species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as List<Species>,ports: null == ports ? _self.ports : ports // ignore: cast_nullable_to_non_nullable
as List<Port>,gearTypes: null == gearTypes ? _self.gearTypes : gearTypes // ignore: cast_nullable_to_non_nullable
as List<IdName>,tripTypes: null == tripTypes ? _self.tripTypes : tripTypes // ignore: cast_nullable_to_non_nullable
as List<IdName>,paymentMethods: null == paymentMethods ? _self.paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as List<IdName>,
  ));
}

}


/// Adds pattern-matching-related methods to [Lookups].
extension LookupsPatterns on Lookups {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Lookups value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Lookups() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Lookups value)  $default,){
final _that = this;
switch (_that) {
case _Lookups():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Lookups value)?  $default,){
final _that = this;
switch (_that) {
case _Lookups() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Species> species,  List<Port> ports,  List<IdName> gearTypes,  List<IdName> tripTypes,  List<IdName> paymentMethods)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Lookups() when $default != null:
return $default(_that.species,_that.ports,_that.gearTypes,_that.tripTypes,_that.paymentMethods);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Species> species,  List<Port> ports,  List<IdName> gearTypes,  List<IdName> tripTypes,  List<IdName> paymentMethods)  $default,) {final _that = this;
switch (_that) {
case _Lookups():
return $default(_that.species,_that.ports,_that.gearTypes,_that.tripTypes,_that.paymentMethods);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Species> species,  List<Port> ports,  List<IdName> gearTypes,  List<IdName> tripTypes,  List<IdName> paymentMethods)?  $default,) {final _that = this;
switch (_that) {
case _Lookups() when $default != null:
return $default(_that.species,_that.ports,_that.gearTypes,_that.tripTypes,_that.paymentMethods);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Lookups implements Lookups {
  const _Lookups({ List<Species> species = const <Species>[],  List<Port> ports = const <Port>[],  List<IdName> gearTypes = const <IdName>[],  List<IdName> tripTypes = const <IdName>[],  List<IdName> paymentMethods = const <IdName>[]}): _species = species,_ports = ports,_gearTypes = gearTypes,_tripTypes = tripTypes,_paymentMethods = paymentMethods;
  factory _Lookups.fromJson(Map<String, dynamic> json) => _$LookupsFromJson(json);

 final  List<Species> _species;
@override@JsonKey() List<Species> get species {
  if (_species is EqualUnmodifiableListView) return _species;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_species);
}

 final  List<Port> _ports;
@override@JsonKey() List<Port> get ports {
  if (_ports is EqualUnmodifiableListView) return _ports;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ports);
}

 final  List<IdName> _gearTypes;
@override@JsonKey() List<IdName> get gearTypes {
  if (_gearTypes is EqualUnmodifiableListView) return _gearTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_gearTypes);
}

 final  List<IdName> _tripTypes;
@override@JsonKey() List<IdName> get tripTypes {
  if (_tripTypes is EqualUnmodifiableListView) return _tripTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tripTypes);
}

 final  List<IdName> _paymentMethods;
@override@JsonKey() List<IdName> get paymentMethods {
  if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_paymentMethods);
}


/// Create a copy of Lookups
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LookupsCopyWith<_Lookups> get copyWith => __$LookupsCopyWithImpl<_Lookups>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LookupsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Lookups&&const DeepCollectionEquality().equals(other.species, _species)&&const DeepCollectionEquality().equals(other.ports, _ports)&&const DeepCollectionEquality().equals(other.gearTypes, _gearTypes)&&const DeepCollectionEquality().equals(other.tripTypes, _tripTypes)&&const DeepCollectionEquality().equals(other.paymentMethods, _paymentMethods));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_species),const DeepCollectionEquality().hash(_ports),const DeepCollectionEquality().hash(_gearTypes),const DeepCollectionEquality().hash(_tripTypes),const DeepCollectionEquality().hash(_paymentMethods));
}

@override
String toString() {
    return 'Lookups(species: $species, ports: $ports, gearTypes: $gearTypes, tripTypes: $tripTypes, paymentMethods: $paymentMethods)';
}


}

/// @nodoc
abstract mixin class _$LookupsCopyWith<$Res> implements $LookupsCopyWith<$Res> {
  factory _$LookupsCopyWith(_Lookups value, $Res Function(_Lookups) _then) = __$LookupsCopyWithImpl;
@override @useResult
$Res call({
 List<Species> species, List<Port> ports, List<IdName> gearTypes, List<IdName> tripTypes, List<IdName> paymentMethods
});




}
/// @nodoc
class __$LookupsCopyWithImpl<$Res>
    implements _$LookupsCopyWith<$Res> {
  __$LookupsCopyWithImpl(this._self, this._then);

  final _Lookups _self;
  final $Res Function(_Lookups) _then;

/// Create a copy of Lookups
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? species = null,Object? ports = null,Object? gearTypes = null,Object? tripTypes = null,Object? paymentMethods = null,}) {
  return _then(_Lookups(
species: null == species ? _self._species : species // ignore: cast_nullable_to_non_nullable
as List<Species>,ports: null == ports ? _self._ports : ports // ignore: cast_nullable_to_non_nullable
as List<Port>,gearTypes: null == gearTypes ? _self._gearTypes : gearTypes // ignore: cast_nullable_to_non_nullable
as List<IdName>,tripTypes: null == tripTypes ? _self._tripTypes : tripTypes // ignore: cast_nullable_to_non_nullable
as List<IdName>,paymentMethods: null == paymentMethods ? _self._paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as List<IdName>,
  ));
}


}


/// @nodoc
mixin _$Species {

 int get id; String get name; String? get nameSci; String? get category;
/// Create a copy of Species
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeciesCopyWith<Species> get copyWith => _$SpeciesCopyWithImpl<Species>(this as Species, _$identity);

  /// Serializes this Species to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Species;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Species&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.nameSci, _this.nameSci) || other.nameSci == _this.nameSci)&&(identical(other.category, _this.category) || other.category == _this.category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Species;
  return Object.hash(runtimeType,_this.id,_this.name,_this.nameSci,_this.category);
}

@override
String toString() {
  final _this = this as Species;
  return 'Species(id: ${_this.id}, name: ${_this.name}, nameSci: ${_this.nameSci}, category: ${_this.category})';
}


}

/// @nodoc
abstract mixin class $SpeciesCopyWith<$Res>  {
  factory $SpeciesCopyWith(Species value, $Res Function(Species) _then) = _$SpeciesCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? nameSci, String? category
});




}
/// @nodoc
class _$SpeciesCopyWithImpl<$Res>
    implements $SpeciesCopyWith<$Res> {
  _$SpeciesCopyWithImpl(this._self, this._then);

  final Species _self;
  final $Res Function(Species) _then;

/// Create a copy of Species
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? nameSci = freezed,Object? category = freezed,}) {
  return _then(Species(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameSci: freezed == nameSci ? _self.nameSci : nameSci // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Species].
extension SpeciesPatterns on Species {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Species value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Species() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Species value)  $default,){
final _that = this;
switch (_that) {
case _Species():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Species value)?  $default,){
final _that = this;
switch (_that) {
case _Species() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? nameSci,  String? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Species() when $default != null:
return $default(_that.id,_that.name,_that.nameSci,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? nameSci,  String? category)  $default,) {final _that = this;
switch (_that) {
case _Species():
return $default(_that.id,_that.name,_that.nameSci,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? nameSci,  String? category)?  $default,) {final _that = this;
switch (_that) {
case _Species() when $default != null:
return $default(_that.id,_that.name,_that.nameSci,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Species implements Species {
  const _Species({required this.id, required this.name, this.nameSci, this.category});
  factory _Species.fromJson(Map<String, dynamic> json) => _$SpeciesFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? nameSci;
@override final  String? category;

/// Create a copy of Species
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpeciesCopyWith<_Species> get copyWith => __$SpeciesCopyWithImpl<_Species>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpeciesToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Species&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameSci, nameSci) || other.nameSci == nameSci)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,nameSci,category);
}

@override
String toString() {
    return 'Species(id: $id, name: $name, nameSci: $nameSci, category: $category)';
}


}

/// @nodoc
abstract mixin class _$SpeciesCopyWith<$Res> implements $SpeciesCopyWith<$Res> {
  factory _$SpeciesCopyWith(_Species value, $Res Function(_Species) _then) = __$SpeciesCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? nameSci, String? category
});




}
/// @nodoc
class __$SpeciesCopyWithImpl<$Res>
    implements _$SpeciesCopyWith<$Res> {
  __$SpeciesCopyWithImpl(this._self, this._then);

  final _Species _self;
  final $Res Function(_Species) _then;

/// Create a copy of Species
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? nameSci = freezed,Object? category = freezed,}) {
  return _then(_Species(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameSci: freezed == nameSci ? _self.nameSci : nameSci // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Port {

 int get id; String get name; PortGovernorate? get governorate;
/// Create a copy of Port
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortCopyWith<Port> get copyWith => _$PortCopyWithImpl<Port>(this as Port, _$identity);

  /// Serializes this Port to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Port;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Port&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.governorate, _this.governorate) || other.governorate == _this.governorate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Port;
  return Object.hash(runtimeType,_this.id,_this.name,_this.governorate);
}

@override
String toString() {
  final _this = this as Port;
  return 'Port(id: ${_this.id}, name: ${_this.name}, governorate: ${_this.governorate})';
}


}

/// @nodoc
abstract mixin class $PortCopyWith<$Res>  {
  factory $PortCopyWith(Port value, $Res Function(Port) _then) = _$PortCopyWithImpl;
@useResult
$Res call({
 int id, String name, PortGovernorate? governorate
});


$PortGovernorateCopyWith<$Res>? get governorate;

}
/// @nodoc
class _$PortCopyWithImpl<$Res>
    implements $PortCopyWith<$Res> {
  _$PortCopyWithImpl(this._self, this._then);

  final Port _self;
  final $Res Function(Port) _then;

/// Create a copy of Port
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? governorate = freezed,}) {
  return _then(Port(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,governorate: freezed == governorate ? _self.governorate : governorate // ignore: cast_nullable_to_non_nullable
as PortGovernorate?,
  ));
}
/// Create a copy of Port
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PortGovernorateCopyWith<$Res>? get governorate {
    if (_self.governorate == null) {
    return null;
  }

  return $PortGovernorateCopyWith<$Res>(_self.governorate!, (value) {
    return _then(_self.copyWith(governorate: value));
  });
}
}


/// Adds pattern-matching-related methods to [Port].
extension PortPatterns on Port {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Port value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Port() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Port value)  $default,){
final _that = this;
switch (_that) {
case _Port():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Port value)?  $default,){
final _that = this;
switch (_that) {
case _Port() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  PortGovernorate? governorate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Port() when $default != null:
return $default(_that.id,_that.name,_that.governorate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  PortGovernorate? governorate)  $default,) {final _that = this;
switch (_that) {
case _Port():
return $default(_that.id,_that.name,_that.governorate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  PortGovernorate? governorate)?  $default,) {final _that = this;
switch (_that) {
case _Port() when $default != null:
return $default(_that.id,_that.name,_that.governorate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Port implements Port {
  const _Port({required this.id, required this.name, this.governorate});
  factory _Port.fromJson(Map<String, dynamic> json) => _$PortFromJson(json);

@override final  int id;
@override final  String name;
@override final  PortGovernorate? governorate;

/// Create a copy of Port
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PortCopyWith<_Port> get copyWith => __$PortCopyWithImpl<_Port>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PortToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Port&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.governorate, governorate) || other.governorate == governorate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,governorate);
}

@override
String toString() {
    return 'Port(id: $id, name: $name, governorate: $governorate)';
}


}

/// @nodoc
abstract mixin class _$PortCopyWith<$Res> implements $PortCopyWith<$Res> {
  factory _$PortCopyWith(_Port value, $Res Function(_Port) _then) = __$PortCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, PortGovernorate? governorate
});


@override $PortGovernorateCopyWith<$Res>? get governorate;

}
/// @nodoc
class __$PortCopyWithImpl<$Res>
    implements _$PortCopyWith<$Res> {
  __$PortCopyWithImpl(this._self, this._then);

  final _Port _self;
  final $Res Function(_Port) _then;

/// Create a copy of Port
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? governorate = freezed,}) {
  return _then(_Port(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,governorate: freezed == governorate ? _self.governorate : governorate // ignore: cast_nullable_to_non_nullable
as PortGovernorate?,
  ));
}

/// Create a copy of Port
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PortGovernorateCopyWith<$Res>? get governorate {
    if (_self.governorate == null) {
    return null;
  }

  return $PortGovernorateCopyWith<$Res>(_self.governorate!, (value) {
    return _then(_self.copyWith(governorate: value));
  });
}
}


/// @nodoc
mixin _$PortGovernorate {

 int? get id; String? get name; String? get region;
/// Create a copy of PortGovernorate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortGovernorateCopyWith<PortGovernorate> get copyWith => _$PortGovernorateCopyWithImpl<PortGovernorate>(this as PortGovernorate, _$identity);

  /// Serializes this PortGovernorate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PortGovernorate;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortGovernorate&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.region, _this.region) || other.region == _this.region));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PortGovernorate;
  return Object.hash(runtimeType,_this.id,_this.name,_this.region);
}

@override
String toString() {
  final _this = this as PortGovernorate;
  return 'PortGovernorate(id: ${_this.id}, name: ${_this.name}, region: ${_this.region})';
}


}

/// @nodoc
abstract mixin class $PortGovernorateCopyWith<$Res>  {
  factory $PortGovernorateCopyWith(PortGovernorate value, $Res Function(PortGovernorate) _then) = _$PortGovernorateCopyWithImpl;
@useResult
$Res call({
 int? id, String? name, String? region
});




}
/// @nodoc
class _$PortGovernorateCopyWithImpl<$Res>
    implements $PortGovernorateCopyWith<$Res> {
  _$PortGovernorateCopyWithImpl(this._self, this._then);

  final PortGovernorate _self;
  final $Res Function(PortGovernorate) _then;

/// Create a copy of PortGovernorate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? region = freezed,}) {
  return _then(PortGovernorate(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PortGovernorate].
extension PortGovernoratePatterns on PortGovernorate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PortGovernorate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PortGovernorate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PortGovernorate value)  $default,){
final _that = this;
switch (_that) {
case _PortGovernorate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PortGovernorate value)?  $default,){
final _that = this;
switch (_that) {
case _PortGovernorate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? name,  String? region)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PortGovernorate() when $default != null:
return $default(_that.id,_that.name,_that.region);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? name,  String? region)  $default,) {final _that = this;
switch (_that) {
case _PortGovernorate():
return $default(_that.id,_that.name,_that.region);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? name,  String? region)?  $default,) {final _that = this;
switch (_that) {
case _PortGovernorate() when $default != null:
return $default(_that.id,_that.name,_that.region);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PortGovernorate implements PortGovernorate {
  const _PortGovernorate({this.id, this.name, this.region});
  factory _PortGovernorate.fromJson(Map<String, dynamic> json) => _$PortGovernorateFromJson(json);

@override final  int? id;
@override final  String? name;
@override final  String? region;

/// Create a copy of PortGovernorate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PortGovernorateCopyWith<_PortGovernorate> get copyWith => __$PortGovernorateCopyWithImpl<_PortGovernorate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PortGovernorateToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PortGovernorate&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.region, region) || other.region == region));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,region);
}

@override
String toString() {
    return 'PortGovernorate(id: $id, name: $name, region: $region)';
}


}

/// @nodoc
abstract mixin class _$PortGovernorateCopyWith<$Res> implements $PortGovernorateCopyWith<$Res> {
  factory _$PortGovernorateCopyWith(_PortGovernorate value, $Res Function(_PortGovernorate) _then) = __$PortGovernorateCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name, String? region
});




}
/// @nodoc
class __$PortGovernorateCopyWithImpl<$Res>
    implements _$PortGovernorateCopyWith<$Res> {
  __$PortGovernorateCopyWithImpl(this._self, this._then);

  final _PortGovernorate _self;
  final $Res Function(_PortGovernorate) _then;

/// Create a copy of PortGovernorate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? region = freezed,}) {
  return _then(_PortGovernorate(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
