// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Customer {

 int get id; String get name; String? get phone; String? get email; IdName? get type; String? get notes; String? get status; int get salesCount; double? get salesTotal;
/// Create a copy of Customer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerCopyWith<Customer> get copyWith => _$CustomerCopyWithImpl<Customer>(this as Customer, _$identity);

  /// Serializes this Customer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Customer;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Customer&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.salesCount, _this.salesCount) || other.salesCount == _this.salesCount)&&(identical(other.salesTotal, _this.salesTotal) || other.salesTotal == _this.salesTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Customer;
  return Object.hash(runtimeType,_this.id,_this.name,_this.phone,_this.email,_this.type,_this.notes,_this.status,_this.salesCount,_this.salesTotal);
}

@override
String toString() {
  final _this = this as Customer;
  return 'Customer(id: ${_this.id}, name: ${_this.name}, phone: ${_this.phone}, email: ${_this.email}, type: ${_this.type}, notes: ${_this.notes}, status: ${_this.status}, salesCount: ${_this.salesCount}, salesTotal: ${_this.salesTotal})';
}


}

/// @nodoc
abstract mixin class $CustomerCopyWith<$Res>  {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) _then) = _$CustomerCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? phone, String? email, IdName? type, String? notes, String? status, int salesCount, double? salesTotal
});


$IdNameCopyWith<$Res>? get type;

}
/// @nodoc
class _$CustomerCopyWithImpl<$Res>
    implements $CustomerCopyWith<$Res> {
  _$CustomerCopyWithImpl(this._self, this._then);

  final Customer _self;
  final $Res Function(Customer) _then;

/// Create a copy of Customer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? phone = freezed,Object? email = freezed,Object? type = freezed,Object? notes = freezed,Object? status = freezed,Object? salesCount = null,Object? salesTotal = freezed,}) {
  return _then(Customer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as IdName?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,salesCount: null == salesCount ? _self.salesCount : salesCount // ignore: cast_nullable_to_non_nullable
as int,salesTotal: freezed == salesTotal ? _self.salesTotal : salesTotal // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of Customer
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
}
}


/// Adds pattern-matching-related methods to [Customer].
extension CustomerPatterns on Customer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Customer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Customer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Customer value)  $default,){
final _that = this;
switch (_that) {
case _Customer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Customer value)?  $default,){
final _that = this;
switch (_that) {
case _Customer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? phone,  String? email,  IdName? type,  String? notes,  String? status,  int salesCount,  double? salesTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Customer() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.email,_that.type,_that.notes,_that.status,_that.salesCount,_that.salesTotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? phone,  String? email,  IdName? type,  String? notes,  String? status,  int salesCount,  double? salesTotal)  $default,) {final _that = this;
switch (_that) {
case _Customer():
return $default(_that.id,_that.name,_that.phone,_that.email,_that.type,_that.notes,_that.status,_that.salesCount,_that.salesTotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? phone,  String? email,  IdName? type,  String? notes,  String? status,  int salesCount,  double? salesTotal)?  $default,) {final _that = this;
switch (_that) {
case _Customer() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.email,_that.type,_that.notes,_that.status,_that.salesCount,_that.salesTotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Customer implements Customer {
  const _Customer({required this.id, required this.name, this.phone, this.email, this.type, this.notes, this.status, this.salesCount = 0, this.salesTotal});
  factory _Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? phone;
@override final  String? email;
@override final  IdName? type;
@override final  String? notes;
@override final  String? status;
@override@JsonKey() final  int salesCount;
@override final  double? salesTotal;

/// Create a copy of Customer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerCopyWith<_Customer> get copyWith => __$CustomerCopyWithImpl<_Customer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Customer&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.type, type) || other.type == type)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.status, status) || other.status == status)&&(identical(other.salesCount, salesCount) || other.salesCount == salesCount)&&(identical(other.salesTotal, salesTotal) || other.salesTotal == salesTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,phone,email,type,notes,status,salesCount,salesTotal);
}

@override
String toString() {
    return 'Customer(id: $id, name: $name, phone: $phone, email: $email, type: $type, notes: $notes, status: $status, salesCount: $salesCount, salesTotal: $salesTotal)';
}


}

/// @nodoc
abstract mixin class _$CustomerCopyWith<$Res> implements $CustomerCopyWith<$Res> {
  factory _$CustomerCopyWith(_Customer value, $Res Function(_Customer) _then) = __$CustomerCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? phone, String? email, IdName? type, String? notes, String? status, int salesCount, double? salesTotal
});


@override $IdNameCopyWith<$Res>? get type;

}
/// @nodoc
class __$CustomerCopyWithImpl<$Res>
    implements _$CustomerCopyWith<$Res> {
  __$CustomerCopyWithImpl(this._self, this._then);

  final _Customer _self;
  final $Res Function(_Customer) _then;

/// Create a copy of Customer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? phone = freezed,Object? email = freezed,Object? type = freezed,Object? notes = freezed,Object? status = freezed,Object? salesCount = null,Object? salesTotal = freezed,}) {
  return _then(_Customer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as IdName?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,salesCount: null == salesCount ? _self.salesCount : salesCount // ignore: cast_nullable_to_non_nullable
as int,salesTotal: freezed == salesTotal ? _self.salesTotal : salesTotal // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of Customer
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
}
}


/// @nodoc
mixin _$Vendor {

 int get id; String get name; String? get phone; String? get email; String? get notes; String? get status;
/// Create a copy of Vendor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VendorCopyWith<Vendor> get copyWith => _$VendorCopyWithImpl<Vendor>(this as Vendor, _$identity);

  /// Serializes this Vendor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Vendor;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Vendor&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.status, _this.status) || other.status == _this.status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Vendor;
  return Object.hash(runtimeType,_this.id,_this.name,_this.phone,_this.email,_this.notes,_this.status);
}

@override
String toString() {
  final _this = this as Vendor;
  return 'Vendor(id: ${_this.id}, name: ${_this.name}, phone: ${_this.phone}, email: ${_this.email}, notes: ${_this.notes}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $VendorCopyWith<$Res>  {
  factory $VendorCopyWith(Vendor value, $Res Function(Vendor) _then) = _$VendorCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? phone, String? email, String? notes, String? status
});




}
/// @nodoc
class _$VendorCopyWithImpl<$Res>
    implements $VendorCopyWith<$Res> {
  _$VendorCopyWithImpl(this._self, this._then);

  final Vendor _self;
  final $Res Function(Vendor) _then;

/// Create a copy of Vendor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? phone = freezed,Object? email = freezed,Object? notes = freezed,Object? status = freezed,}) {
  return _then(Vendor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Vendor].
extension VendorPatterns on Vendor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Vendor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Vendor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Vendor value)  $default,){
final _that = this;
switch (_that) {
case _Vendor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Vendor value)?  $default,){
final _that = this;
switch (_that) {
case _Vendor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? phone,  String? email,  String? notes,  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Vendor() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.email,_that.notes,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? phone,  String? email,  String? notes,  String? status)  $default,) {final _that = this;
switch (_that) {
case _Vendor():
return $default(_that.id,_that.name,_that.phone,_that.email,_that.notes,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? phone,  String? email,  String? notes,  String? status)?  $default,) {final _that = this;
switch (_that) {
case _Vendor() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.email,_that.notes,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Vendor implements Vendor {
  const _Vendor({required this.id, required this.name, this.phone, this.email, this.notes, this.status});
  factory _Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? phone;
@override final  String? email;
@override final  String? notes;
@override final  String? status;

/// Create a copy of Vendor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VendorCopyWith<_Vendor> get copyWith => __$VendorCopyWithImpl<_Vendor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VendorToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Vendor&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,phone,email,notes,status);
}

@override
String toString() {
    return 'Vendor(id: $id, name: $name, phone: $phone, email: $email, notes: $notes, status: $status)';
}


}

/// @nodoc
abstract mixin class _$VendorCopyWith<$Res> implements $VendorCopyWith<$Res> {
  factory _$VendorCopyWith(_Vendor value, $Res Function(_Vendor) _then) = __$VendorCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? phone, String? email, String? notes, String? status
});




}
/// @nodoc
class __$VendorCopyWithImpl<$Res>
    implements _$VendorCopyWith<$Res> {
  __$VendorCopyWithImpl(this._self, this._then);

  final _Vendor _self;
  final $Res Function(_Vendor) _then;

/// Create a copy of Vendor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? phone = freezed,Object? email = freezed,Object? notes = freezed,Object? status = freezed,}) {
  return _then(_Vendor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Employee {

 int get id; String get name; String? get phone; String? get email; String? get idNumber; String? get nationality; IdName? get jobTitle; String? get notes; String? get status;
/// Create a copy of Employee
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeCopyWith<Employee> get copyWith => _$EmployeeCopyWithImpl<Employee>(this as Employee, _$identity);

  /// Serializes this Employee to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Employee;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Employee&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.idNumber, _this.idNumber) || other.idNumber == _this.idNumber)&&(identical(other.nationality, _this.nationality) || other.nationality == _this.nationality)&&(identical(other.jobTitle, _this.jobTitle) || other.jobTitle == _this.jobTitle)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.status, _this.status) || other.status == _this.status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Employee;
  return Object.hash(runtimeType,_this.id,_this.name,_this.phone,_this.email,_this.idNumber,_this.nationality,_this.jobTitle,_this.notes,_this.status);
}

@override
String toString() {
  final _this = this as Employee;
  return 'Employee(id: ${_this.id}, name: ${_this.name}, phone: ${_this.phone}, email: ${_this.email}, idNumber: ${_this.idNumber}, nationality: ${_this.nationality}, jobTitle: ${_this.jobTitle}, notes: ${_this.notes}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $EmployeeCopyWith<$Res>  {
  factory $EmployeeCopyWith(Employee value, $Res Function(Employee) _then) = _$EmployeeCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? phone, String? email, String? idNumber, String? nationality, IdName? jobTitle, String? notes, String? status
});


$IdNameCopyWith<$Res>? get jobTitle;

}
/// @nodoc
class _$EmployeeCopyWithImpl<$Res>
    implements $EmployeeCopyWith<$Res> {
  _$EmployeeCopyWithImpl(this._self, this._then);

  final Employee _self;
  final $Res Function(Employee) _then;

/// Create a copy of Employee
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? phone = freezed,Object? email = freezed,Object? idNumber = freezed,Object? nationality = freezed,Object? jobTitle = freezed,Object? notes = freezed,Object? status = freezed,}) {
  return _then(Employee(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,idNumber: freezed == idNumber ? _self.idNumber : idNumber // ignore: cast_nullable_to_non_nullable
as String?,nationality: freezed == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as String?,jobTitle: freezed == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as IdName?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Employee
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res>? get jobTitle {
    if (_self.jobTitle == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.jobTitle!, (value) {
    return _then(_self.copyWith(jobTitle: value));
  });
}
}


/// Adds pattern-matching-related methods to [Employee].
extension EmployeePatterns on Employee {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Employee value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Employee() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Employee value)  $default,){
final _that = this;
switch (_that) {
case _Employee():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Employee value)?  $default,){
final _that = this;
switch (_that) {
case _Employee() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? phone,  String? email,  String? idNumber,  String? nationality,  IdName? jobTitle,  String? notes,  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Employee() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.email,_that.idNumber,_that.nationality,_that.jobTitle,_that.notes,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? phone,  String? email,  String? idNumber,  String? nationality,  IdName? jobTitle,  String? notes,  String? status)  $default,) {final _that = this;
switch (_that) {
case _Employee():
return $default(_that.id,_that.name,_that.phone,_that.email,_that.idNumber,_that.nationality,_that.jobTitle,_that.notes,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? phone,  String? email,  String? idNumber,  String? nationality,  IdName? jobTitle,  String? notes,  String? status)?  $default,) {final _that = this;
switch (_that) {
case _Employee() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.email,_that.idNumber,_that.nationality,_that.jobTitle,_that.notes,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Employee implements Employee {
  const _Employee({required this.id, required this.name, this.phone, this.email, this.idNumber, this.nationality, this.jobTitle, this.notes, this.status});
  factory _Employee.fromJson(Map<String, dynamic> json) => _$EmployeeFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? phone;
@override final  String? email;
@override final  String? idNumber;
@override final  String? nationality;
@override final  IdName? jobTitle;
@override final  String? notes;
@override final  String? status;

/// Create a copy of Employee
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeeCopyWith<_Employee> get copyWith => __$EmployeeCopyWithImpl<_Employee>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmployeeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Employee&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.idNumber, idNumber) || other.idNumber == idNumber)&&(identical(other.nationality, nationality) || other.nationality == nationality)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,phone,email,idNumber,nationality,jobTitle,notes,status);
}

@override
String toString() {
    return 'Employee(id: $id, name: $name, phone: $phone, email: $email, idNumber: $idNumber, nationality: $nationality, jobTitle: $jobTitle, notes: $notes, status: $status)';
}


}

/// @nodoc
abstract mixin class _$EmployeeCopyWith<$Res> implements $EmployeeCopyWith<$Res> {
  factory _$EmployeeCopyWith(_Employee value, $Res Function(_Employee) _then) = __$EmployeeCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? phone, String? email, String? idNumber, String? nationality, IdName? jobTitle, String? notes, String? status
});


@override $IdNameCopyWith<$Res>? get jobTitle;

}
/// @nodoc
class __$EmployeeCopyWithImpl<$Res>
    implements _$EmployeeCopyWith<$Res> {
  __$EmployeeCopyWithImpl(this._self, this._then);

  final _Employee _self;
  final $Res Function(_Employee) _then;

/// Create a copy of Employee
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? phone = freezed,Object? email = freezed,Object? idNumber = freezed,Object? nationality = freezed,Object? jobTitle = freezed,Object? notes = freezed,Object? status = freezed,}) {
  return _then(_Employee(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,idNumber: freezed == idNumber ? _self.idNumber : idNumber // ignore: cast_nullable_to_non_nullable
as String?,nationality: freezed == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as String?,jobTitle: freezed == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as IdName?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Employee
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res>? get jobTitle {
    if (_self.jobTitle == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.jobTitle!, (value) {
    return _then(_self.copyWith(jobTitle: value));
  });
}
}

// dart format on
