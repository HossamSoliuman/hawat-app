// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Sale {

 int get id; String get invoiceNumber; String? get status; TripNumberRef? get trip; PersonRef? get customer; IdName? get paymentMethod; IdName? get paymentStatus; double get subtotal; double get discount; double get total; double get paidAmount; double get remaining; int? get itemsCount; double? get totalKg; List<SaleItem> get items; String? get invoiceUrl; DateTime? get soldAt; String? get notes;
/// Create a copy of Sale
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleCopyWith<Sale> get copyWith => _$SaleCopyWithImpl<Sale>(this as Sale, _$identity);

  /// Serializes this Sale to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Sale;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sale&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.invoiceNumber, _this.invoiceNumber) || other.invoiceNumber == _this.invoiceNumber)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.trip, _this.trip) || other.trip == _this.trip)&&(identical(other.customer, _this.customer) || other.customer == _this.customer)&&(identical(other.paymentMethod, _this.paymentMethod) || other.paymentMethod == _this.paymentMethod)&&(identical(other.paymentStatus, _this.paymentStatus) || other.paymentStatus == _this.paymentStatus)&&(identical(other.subtotal, _this.subtotal) || other.subtotal == _this.subtotal)&&(identical(other.discount, _this.discount) || other.discount == _this.discount)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.paidAmount, _this.paidAmount) || other.paidAmount == _this.paidAmount)&&(identical(other.remaining, _this.remaining) || other.remaining == _this.remaining)&&(identical(other.itemsCount, _this.itemsCount) || other.itemsCount == _this.itemsCount)&&(identical(other.totalKg, _this.totalKg) || other.totalKg == _this.totalKg)&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.invoiceUrl, _this.invoiceUrl) || other.invoiceUrl == _this.invoiceUrl)&&(identical(other.soldAt, _this.soldAt) || other.soldAt == _this.soldAt)&&(identical(other.notes, _this.notes) || other.notes == _this.notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Sale;
  return Object.hash(runtimeType,_this.id,_this.invoiceNumber,_this.status,_this.trip,_this.customer,_this.paymentMethod,_this.paymentStatus,_this.subtotal,_this.discount,_this.total,_this.paidAmount,_this.remaining,_this.itemsCount,_this.totalKg,const DeepCollectionEquality().hash(_this.items),_this.invoiceUrl,_this.soldAt,_this.notes);
}

@override
String toString() {
  final _this = this as Sale;
  return 'Sale(id: ${_this.id}, invoiceNumber: ${_this.invoiceNumber}, status: ${_this.status}, trip: ${_this.trip}, customer: ${_this.customer}, paymentMethod: ${_this.paymentMethod}, paymentStatus: ${_this.paymentStatus}, subtotal: ${_this.subtotal}, discount: ${_this.discount}, total: ${_this.total}, paidAmount: ${_this.paidAmount}, remaining: ${_this.remaining}, itemsCount: ${_this.itemsCount}, totalKg: ${_this.totalKg}, items: ${_this.items}, invoiceUrl: ${_this.invoiceUrl}, soldAt: ${_this.soldAt}, notes: ${_this.notes})';
}


}

/// @nodoc
abstract mixin class $SaleCopyWith<$Res>  {
  factory $SaleCopyWith(Sale value, $Res Function(Sale) _then) = _$SaleCopyWithImpl;
@useResult
$Res call({
 int id, String invoiceNumber, String? status, TripNumberRef? trip, PersonRef? customer, IdName? paymentMethod, IdName? paymentStatus, double subtotal, double discount, double total, double paidAmount, double remaining, int? itemsCount, double? totalKg, List<SaleItem> items, String? invoiceUrl, DateTime? soldAt, String? notes
});


$TripNumberRefCopyWith<$Res>? get trip;$PersonRefCopyWith<$Res>? get customer;$IdNameCopyWith<$Res>? get paymentMethod;$IdNameCopyWith<$Res>? get paymentStatus;

}
/// @nodoc
class _$SaleCopyWithImpl<$Res>
    implements $SaleCopyWith<$Res> {
  _$SaleCopyWithImpl(this._self, this._then);

  final Sale _self;
  final $Res Function(Sale) _then;

/// Create a copy of Sale
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? invoiceNumber = null,Object? status = freezed,Object? trip = freezed,Object? customer = freezed,Object? paymentMethod = freezed,Object? paymentStatus = freezed,Object? subtotal = null,Object? discount = null,Object? total = null,Object? paidAmount = null,Object? remaining = null,Object? itemsCount = freezed,Object? totalKg = freezed,Object? items = null,Object? invoiceUrl = freezed,Object? soldAt = freezed,Object? notes = freezed,}) {
  return _then(Sale(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,trip: freezed == trip ? _self.trip : trip // ignore: cast_nullable_to_non_nullable
as TripNumberRef?,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as PersonRef?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as IdName?,paymentStatus: freezed == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as IdName?,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as double,itemsCount: freezed == itemsCount ? _self.itemsCount : itemsCount // ignore: cast_nullable_to_non_nullable
as int?,totalKg: freezed == totalKg ? _self.totalKg : totalKg // ignore: cast_nullable_to_non_nullable
as double?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SaleItem>,invoiceUrl: freezed == invoiceUrl ? _self.invoiceUrl : invoiceUrl // ignore: cast_nullable_to_non_nullable
as String?,soldAt: freezed == soldAt ? _self.soldAt : soldAt // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Sale
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
}/// Create a copy of Sale
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonRefCopyWith<$Res>? get customer {
    if (_self.customer == null) {
    return null;
  }

  return $PersonRefCopyWith<$Res>(_self.customer!, (value) {
    return _then(_self.copyWith(customer: value));
  });
}/// Create a copy of Sale
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res>? get paymentMethod {
    if (_self.paymentMethod == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.paymentMethod!, (value) {
    return _then(_self.copyWith(paymentMethod: value));
  });
}/// Create a copy of Sale
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res>? get paymentStatus {
    if (_self.paymentStatus == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.paymentStatus!, (value) {
    return _then(_self.copyWith(paymentStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [Sale].
extension SalePatterns on Sale {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sale value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sale() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sale value)  $default,){
final _that = this;
switch (_that) {
case _Sale():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sale value)?  $default,){
final _that = this;
switch (_that) {
case _Sale() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String invoiceNumber,  String? status,  TripNumberRef? trip,  PersonRef? customer,  IdName? paymentMethod,  IdName? paymentStatus,  double subtotal,  double discount,  double total,  double paidAmount,  double remaining,  int? itemsCount,  double? totalKg,  List<SaleItem> items,  String? invoiceUrl,  DateTime? soldAt,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sale() when $default != null:
return $default(_that.id,_that.invoiceNumber,_that.status,_that.trip,_that.customer,_that.paymentMethod,_that.paymentStatus,_that.subtotal,_that.discount,_that.total,_that.paidAmount,_that.remaining,_that.itemsCount,_that.totalKg,_that.items,_that.invoiceUrl,_that.soldAt,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String invoiceNumber,  String? status,  TripNumberRef? trip,  PersonRef? customer,  IdName? paymentMethod,  IdName? paymentStatus,  double subtotal,  double discount,  double total,  double paidAmount,  double remaining,  int? itemsCount,  double? totalKg,  List<SaleItem> items,  String? invoiceUrl,  DateTime? soldAt,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _Sale():
return $default(_that.id,_that.invoiceNumber,_that.status,_that.trip,_that.customer,_that.paymentMethod,_that.paymentStatus,_that.subtotal,_that.discount,_that.total,_that.paidAmount,_that.remaining,_that.itemsCount,_that.totalKg,_that.items,_that.invoiceUrl,_that.soldAt,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String invoiceNumber,  String? status,  TripNumberRef? trip,  PersonRef? customer,  IdName? paymentMethod,  IdName? paymentStatus,  double subtotal,  double discount,  double total,  double paidAmount,  double remaining,  int? itemsCount,  double? totalKg,  List<SaleItem> items,  String? invoiceUrl,  DateTime? soldAt,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _Sale() when $default != null:
return $default(_that.id,_that.invoiceNumber,_that.status,_that.trip,_that.customer,_that.paymentMethod,_that.paymentStatus,_that.subtotal,_that.discount,_that.total,_that.paidAmount,_that.remaining,_that.itemsCount,_that.totalKg,_that.items,_that.invoiceUrl,_that.soldAt,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Sale extends Sale {
  const _Sale({required this.id, required this.invoiceNumber, this.status, this.trip, this.customer, this.paymentMethod, this.paymentStatus, this.subtotal = 0, this.discount = 0, this.total = 0, this.paidAmount = 0, this.remaining = 0, this.itemsCount, this.totalKg,  List<SaleItem> items = const <SaleItem>[], this.invoiceUrl, this.soldAt, this.notes}): _items = items,super._();
  factory _Sale.fromJson(Map<String, dynamic> json) => _$SaleFromJson(json);

@override final  int id;
@override final  String invoiceNumber;
@override final  String? status;
@override final  TripNumberRef? trip;
@override final  PersonRef? customer;
@override final  IdName? paymentMethod;
@override final  IdName? paymentStatus;
@override@JsonKey() final  double subtotal;
@override@JsonKey() final  double discount;
@override@JsonKey() final  double total;
@override@JsonKey() final  double paidAmount;
@override@JsonKey() final  double remaining;
@override final  int? itemsCount;
@override final  double? totalKg;
 final  List<SaleItem> _items;
@override@JsonKey() List<SaleItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? invoiceUrl;
@override final  DateTime? soldAt;
@override final  String? notes;

/// Create a copy of Sale
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleCopyWith<_Sale> get copyWith => __$SaleCopyWithImpl<_Sale>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaleToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sale&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.trip, trip) || other.trip == trip)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.total, total) || other.total == total)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.remaining, remaining) || other.remaining == remaining)&&(identical(other.itemsCount, itemsCount) || other.itemsCount == itemsCount)&&(identical(other.totalKg, totalKg) || other.totalKg == totalKg)&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.invoiceUrl, invoiceUrl) || other.invoiceUrl == invoiceUrl)&&(identical(other.soldAt, soldAt) || other.soldAt == soldAt)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,invoiceNumber,status,trip,customer,paymentMethod,paymentStatus,subtotal,discount,total,paidAmount,remaining,itemsCount,totalKg,const DeepCollectionEquality().hash(_items),invoiceUrl,soldAt,notes);
}

@override
String toString() {
    return 'Sale(id: $id, invoiceNumber: $invoiceNumber, status: $status, trip: $trip, customer: $customer, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, subtotal: $subtotal, discount: $discount, total: $total, paidAmount: $paidAmount, remaining: $remaining, itemsCount: $itemsCount, totalKg: $totalKg, items: $items, invoiceUrl: $invoiceUrl, soldAt: $soldAt, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$SaleCopyWith<$Res> implements $SaleCopyWith<$Res> {
  factory _$SaleCopyWith(_Sale value, $Res Function(_Sale) _then) = __$SaleCopyWithImpl;
@override @useResult
$Res call({
 int id, String invoiceNumber, String? status, TripNumberRef? trip, PersonRef? customer, IdName? paymentMethod, IdName? paymentStatus, double subtotal, double discount, double total, double paidAmount, double remaining, int? itemsCount, double? totalKg, List<SaleItem> items, String? invoiceUrl, DateTime? soldAt, String? notes
});


@override $TripNumberRefCopyWith<$Res>? get trip;@override $PersonRefCopyWith<$Res>? get customer;@override $IdNameCopyWith<$Res>? get paymentMethod;@override $IdNameCopyWith<$Res>? get paymentStatus;

}
/// @nodoc
class __$SaleCopyWithImpl<$Res>
    implements _$SaleCopyWith<$Res> {
  __$SaleCopyWithImpl(this._self, this._then);

  final _Sale _self;
  final $Res Function(_Sale) _then;

/// Create a copy of Sale
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? invoiceNumber = null,Object? status = freezed,Object? trip = freezed,Object? customer = freezed,Object? paymentMethod = freezed,Object? paymentStatus = freezed,Object? subtotal = null,Object? discount = null,Object? total = null,Object? paidAmount = null,Object? remaining = null,Object? itemsCount = freezed,Object? totalKg = freezed,Object? items = null,Object? invoiceUrl = freezed,Object? soldAt = freezed,Object? notes = freezed,}) {
  return _then(_Sale(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,trip: freezed == trip ? _self.trip : trip // ignore: cast_nullable_to_non_nullable
as TripNumberRef?,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as PersonRef?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as IdName?,paymentStatus: freezed == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as IdName?,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as double,itemsCount: freezed == itemsCount ? _self.itemsCount : itemsCount // ignore: cast_nullable_to_non_nullable
as int?,totalKg: freezed == totalKg ? _self.totalKg : totalKg // ignore: cast_nullable_to_non_nullable
as double?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SaleItem>,invoiceUrl: freezed == invoiceUrl ? _self.invoiceUrl : invoiceUrl // ignore: cast_nullable_to_non_nullable
as String?,soldAt: freezed == soldAt ? _self.soldAt : soldAt // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Sale
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
}/// Create a copy of Sale
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonRefCopyWith<$Res>? get customer {
    if (_self.customer == null) {
    return null;
  }

  return $PersonRefCopyWith<$Res>(_self.customer!, (value) {
    return _then(_self.copyWith(customer: value));
  });
}/// Create a copy of Sale
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res>? get paymentMethod {
    if (_self.paymentMethod == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.paymentMethod!, (value) {
    return _then(_self.copyWith(paymentMethod: value));
  });
}/// Create a copy of Sale
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res>? get paymentStatus {
    if (_self.paymentStatus == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.paymentStatus!, (value) {
    return _then(_self.copyWith(paymentStatus: value));
  });
}
}


/// @nodoc
mixin _$SaleItem {

 int get id; SpeciesRef? get species; double get weightKg; double get pricePerKg; double get total;
/// Create a copy of SaleItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleItemCopyWith<SaleItem> get copyWith => _$SaleItemCopyWithImpl<SaleItem>(this as SaleItem, _$identity);

  /// Serializes this SaleItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SaleItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleItem&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.species, _this.species) || other.species == _this.species)&&(identical(other.weightKg, _this.weightKg) || other.weightKg == _this.weightKg)&&(identical(other.pricePerKg, _this.pricePerKg) || other.pricePerKg == _this.pricePerKg)&&(identical(other.total, _this.total) || other.total == _this.total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SaleItem;
  return Object.hash(runtimeType,_this.id,_this.species,_this.weightKg,_this.pricePerKg,_this.total);
}

@override
String toString() {
  final _this = this as SaleItem;
  return 'SaleItem(id: ${_this.id}, species: ${_this.species}, weightKg: ${_this.weightKg}, pricePerKg: ${_this.pricePerKg}, total: ${_this.total})';
}


}

/// @nodoc
abstract mixin class $SaleItemCopyWith<$Res>  {
  factory $SaleItemCopyWith(SaleItem value, $Res Function(SaleItem) _then) = _$SaleItemCopyWithImpl;
@useResult
$Res call({
 int id, SpeciesRef? species, double weightKg, double pricePerKg, double total
});


$SpeciesRefCopyWith<$Res>? get species;

}
/// @nodoc
class _$SaleItemCopyWithImpl<$Res>
    implements $SaleItemCopyWith<$Res> {
  _$SaleItemCopyWithImpl(this._self, this._then);

  final SaleItem _self;
  final $Res Function(SaleItem) _then;

/// Create a copy of SaleItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? species = freezed,Object? weightKg = null,Object? pricePerKg = null,Object? total = null,}) {
  return _then(SaleItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,species: freezed == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as SpeciesRef?,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double,pricePerKg: null == pricePerKg ? _self.pricePerKg : pricePerKg // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of SaleItem
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
}
}


/// Adds pattern-matching-related methods to [SaleItem].
extension SaleItemPatterns on SaleItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleItem value)  $default,){
final _that = this;
switch (_that) {
case _SaleItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleItem value)?  $default,){
final _that = this;
switch (_that) {
case _SaleItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  SpeciesRef? species,  double weightKg,  double pricePerKg,  double total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleItem() when $default != null:
return $default(_that.id,_that.species,_that.weightKg,_that.pricePerKg,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  SpeciesRef? species,  double weightKg,  double pricePerKg,  double total)  $default,) {final _that = this;
switch (_that) {
case _SaleItem():
return $default(_that.id,_that.species,_that.weightKg,_that.pricePerKg,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  SpeciesRef? species,  double weightKg,  double pricePerKg,  double total)?  $default,) {final _that = this;
switch (_that) {
case _SaleItem() when $default != null:
return $default(_that.id,_that.species,_that.weightKg,_that.pricePerKg,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaleItem implements SaleItem {
  const _SaleItem({required this.id, this.species, this.weightKg = 0, this.pricePerKg = 0, this.total = 0});
  factory _SaleItem.fromJson(Map<String, dynamic> json) => _$SaleItemFromJson(json);

@override final  int id;
@override final  SpeciesRef? species;
@override@JsonKey() final  double weightKg;
@override@JsonKey() final  double pricePerKg;
@override@JsonKey() final  double total;

/// Create a copy of SaleItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleItemCopyWith<_SaleItem> get copyWith => __$SaleItemCopyWithImpl<_SaleItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaleItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleItem&&(identical(other.id, id) || other.id == id)&&(identical(other.species, species) || other.species == species)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.pricePerKg, pricePerKg) || other.pricePerKg == pricePerKg)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,species,weightKg,pricePerKg,total);
}

@override
String toString() {
    return 'SaleItem(id: $id, species: $species, weightKg: $weightKg, pricePerKg: $pricePerKg, total: $total)';
}


}

/// @nodoc
abstract mixin class _$SaleItemCopyWith<$Res> implements $SaleItemCopyWith<$Res> {
  factory _$SaleItemCopyWith(_SaleItem value, $Res Function(_SaleItem) _then) = __$SaleItemCopyWithImpl;
@override @useResult
$Res call({
 int id, SpeciesRef? species, double weightKg, double pricePerKg, double total
});


@override $SpeciesRefCopyWith<$Res>? get species;

}
/// @nodoc
class __$SaleItemCopyWithImpl<$Res>
    implements _$SaleItemCopyWith<$Res> {
  __$SaleItemCopyWithImpl(this._self, this._then);

  final _SaleItem _self;
  final $Res Function(_SaleItem) _then;

/// Create a copy of SaleItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? species = freezed,Object? weightKg = null,Object? pricePerKg = null,Object? total = null,}) {
  return _then(_SaleItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,species: freezed == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as SpeciesRef?,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double,pricePerKg: null == pricePerKg ? _self.pricePerKg : pricePerKg // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of SaleItem
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
}
}


/// @nodoc
mixin _$Consignment {

 int get id; String get consignmentNumber; String? get status; PersonRef? get dalal; TripNumberRef? get trip; double get totalKg; DateTime? get sentAt;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Consignment&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.consignmentNumber, _this.consignmentNumber) || other.consignmentNumber == _this.consignmentNumber)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.dalal, _this.dalal) || other.dalal == _this.dalal)&&(identical(other.trip, _this.trip) || other.trip == _this.trip)&&(identical(other.totalKg, _this.totalKg) || other.totalKg == _this.totalKg)&&(identical(other.sentAt, _this.sentAt) || other.sentAt == _this.sentAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Consignment;
  return Object.hash(runtimeType,_this.id,_this.consignmentNumber,_this.status,_this.dalal,_this.trip,_this.totalKg,_this.sentAt);
}

@override
String toString() {
  final _this = this as Consignment;
  return 'Consignment(id: ${_this.id}, consignmentNumber: ${_this.consignmentNumber}, status: ${_this.status}, dalal: ${_this.dalal}, trip: ${_this.trip}, totalKg: ${_this.totalKg}, sentAt: ${_this.sentAt})';
}


}

/// @nodoc
abstract mixin class $ConsignmentCopyWith<$Res>  {
  factory $ConsignmentCopyWith(Consignment value, $Res Function(Consignment) _then) = _$ConsignmentCopyWithImpl;
@useResult
$Res call({
 int id, String consignmentNumber, String? status, PersonRef? dalal, TripNumberRef? trip, double totalKg, DateTime? sentAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? consignmentNumber = null,Object? status = freezed,Object? dalal = freezed,Object? trip = freezed,Object? totalKg = null,Object? sentAt = freezed,}) {
  return _then(Consignment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,consignmentNumber: null == consignmentNumber ? _self.consignmentNumber : consignmentNumber // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,dalal: freezed == dalal ? _self.dalal : dalal // ignore: cast_nullable_to_non_nullable
as PersonRef?,trip: freezed == trip ? _self.trip : trip // ignore: cast_nullable_to_non_nullable
as TripNumberRef?,totalKg: null == totalKg ? _self.totalKg : totalKg // ignore: cast_nullable_to_non_nullable
as double,sentAt: freezed == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String consignmentNumber,  String? status,  PersonRef? dalal,  TripNumberRef? trip,  double totalKg,  DateTime? sentAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Consignment() when $default != null:
return $default(_that.id,_that.consignmentNumber,_that.status,_that.dalal,_that.trip,_that.totalKg,_that.sentAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String consignmentNumber,  String? status,  PersonRef? dalal,  TripNumberRef? trip,  double totalKg,  DateTime? sentAt)  $default,) {final _that = this;
switch (_that) {
case _Consignment():
return $default(_that.id,_that.consignmentNumber,_that.status,_that.dalal,_that.trip,_that.totalKg,_that.sentAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String consignmentNumber,  String? status,  PersonRef? dalal,  TripNumberRef? trip,  double totalKg,  DateTime? sentAt)?  $default,) {final _that = this;
switch (_that) {
case _Consignment() when $default != null:
return $default(_that.id,_that.consignmentNumber,_that.status,_that.dalal,_that.trip,_that.totalKg,_that.sentAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Consignment implements Consignment {
  const _Consignment({required this.id, required this.consignmentNumber, this.status, this.dalal, this.trip, this.totalKg = 0, this.sentAt});
  factory _Consignment.fromJson(Map<String, dynamic> json) => _$ConsignmentFromJson(json);

@override final  int id;
@override final  String consignmentNumber;
@override final  String? status;
@override final  PersonRef? dalal;
@override final  TripNumberRef? trip;
@override@JsonKey() final  double totalKg;
@override final  DateTime? sentAt;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Consignment&&(identical(other.id, id) || other.id == id)&&(identical(other.consignmentNumber, consignmentNumber) || other.consignmentNumber == consignmentNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.dalal, dalal) || other.dalal == dalal)&&(identical(other.trip, trip) || other.trip == trip)&&(identical(other.totalKg, totalKg) || other.totalKg == totalKg)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,consignmentNumber,status,dalal,trip,totalKg,sentAt);
}

@override
String toString() {
    return 'Consignment(id: $id, consignmentNumber: $consignmentNumber, status: $status, dalal: $dalal, trip: $trip, totalKg: $totalKg, sentAt: $sentAt)';
}


}

/// @nodoc
abstract mixin class _$ConsignmentCopyWith<$Res> implements $ConsignmentCopyWith<$Res> {
  factory _$ConsignmentCopyWith(_Consignment value, $Res Function(_Consignment) _then) = __$ConsignmentCopyWithImpl;
@override @useResult
$Res call({
 int id, String consignmentNumber, String? status, PersonRef? dalal, TripNumberRef? trip, double totalKg, DateTime? sentAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? consignmentNumber = null,Object? status = freezed,Object? dalal = freezed,Object? trip = freezed,Object? totalKg = null,Object? sentAt = freezed,}) {
  return _then(_Consignment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,consignmentNumber: null == consignmentNumber ? _self.consignmentNumber : consignmentNumber // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,dalal: freezed == dalal ? _self.dalal : dalal // ignore: cast_nullable_to_non_nullable
as PersonRef?,trip: freezed == trip ? _self.trip : trip // ignore: cast_nullable_to_non_nullable
as TripNumberRef?,totalKg: null == totalKg ? _self.totalKg : totalKg // ignore: cast_nullable_to_non_nullable
as double,sentAt: freezed == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
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

// dart format on
