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
mixin _$SalesTotals {

 int get count; double get total; double get remaining;
/// Create a copy of SalesTotals
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesTotalsCopyWith<SalesTotals> get copyWith => _$SalesTotalsCopyWithImpl<SalesTotals>(this as SalesTotals, _$identity);

  /// Serializes this SalesTotals to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SalesTotals;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesTotals&&(identical(other.count, _this.count) || other.count == _this.count)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.remaining, _this.remaining) || other.remaining == _this.remaining));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SalesTotals;
  return Object.hash(runtimeType,_this.count,_this.total,_this.remaining);
}

@override
String toString() {
  final _this = this as SalesTotals;
  return 'SalesTotals(count: ${_this.count}, total: ${_this.total}, remaining: ${_this.remaining})';
}


}

/// @nodoc
abstract mixin class $SalesTotalsCopyWith<$Res>  {
  factory $SalesTotalsCopyWith(SalesTotals value, $Res Function(SalesTotals) _then) = _$SalesTotalsCopyWithImpl;
@useResult
$Res call({
 int count, double total, double remaining
});




}
/// @nodoc
class _$SalesTotalsCopyWithImpl<$Res>
    implements $SalesTotalsCopyWith<$Res> {
  _$SalesTotalsCopyWithImpl(this._self, this._then);

  final SalesTotals _self;
  final $Res Function(SalesTotals) _then;

/// Create a copy of SalesTotals
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? total = null,Object? remaining = null,}) {
  return _then(SalesTotals(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesTotals].
extension SalesTotalsPatterns on SalesTotals {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesTotals value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesTotals() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesTotals value)  $default,){
final _that = this;
switch (_that) {
case _SalesTotals():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesTotals value)?  $default,){
final _that = this;
switch (_that) {
case _SalesTotals() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  double total,  double remaining)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesTotals() when $default != null:
return $default(_that.count,_that.total,_that.remaining);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  double total,  double remaining)  $default,) {final _that = this;
switch (_that) {
case _SalesTotals():
return $default(_that.count,_that.total,_that.remaining);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  double total,  double remaining)?  $default,) {final _that = this;
switch (_that) {
case _SalesTotals() when $default != null:
return $default(_that.count,_that.total,_that.remaining);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesTotals implements SalesTotals {
  const _SalesTotals({this.count = 0, this.total = 0, this.remaining = 0});
  factory _SalesTotals.fromJson(Map<String, dynamic> json) => _$SalesTotalsFromJson(json);

@override@JsonKey() final  int count;
@override@JsonKey() final  double total;
@override@JsonKey() final  double remaining;

/// Create a copy of SalesTotals
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesTotalsCopyWith<_SalesTotals> get copyWith => __$SalesTotalsCopyWithImpl<_SalesTotals>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesTotalsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesTotals&&(identical(other.count, count) || other.count == count)&&(identical(other.total, total) || other.total == total)&&(identical(other.remaining, remaining) || other.remaining == remaining));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,count,total,remaining);
}

@override
String toString() {
    return 'SalesTotals(count: $count, total: $total, remaining: $remaining)';
}


}

/// @nodoc
abstract mixin class _$SalesTotalsCopyWith<$Res> implements $SalesTotalsCopyWith<$Res> {
  factory _$SalesTotalsCopyWith(_SalesTotals value, $Res Function(_SalesTotals) _then) = __$SalesTotalsCopyWithImpl;
@override @useResult
$Res call({
 int count, double total, double remaining
});




}
/// @nodoc
class __$SalesTotalsCopyWithImpl<$Res>
    implements _$SalesTotalsCopyWith<$Res> {
  __$SalesTotalsCopyWithImpl(this._self, this._then);

  final _SalesTotals _self;
  final $Res Function(_SalesTotals) _then;

/// Create a copy of SalesTotals
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? total = null,Object? remaining = null,}) {
  return _then(_SalesTotals(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$SaleInput {

 int get tripId; int? get customerId; int? get paymentMethodId; double? get discount;/// Null = paid in full.
 double? get paidAmount; String? get notes; List<SaleLineInput> get items;
/// Create a copy of SaleInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleInputCopyWith<SaleInput> get copyWith => _$SaleInputCopyWithImpl<SaleInput>(this as SaleInput, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SaleInput;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleInput&&(identical(other.tripId, _this.tripId) || other.tripId == _this.tripId)&&(identical(other.customerId, _this.customerId) || other.customerId == _this.customerId)&&(identical(other.paymentMethodId, _this.paymentMethodId) || other.paymentMethodId == _this.paymentMethodId)&&(identical(other.discount, _this.discount) || other.discount == _this.discount)&&(identical(other.paidAmount, _this.paidAmount) || other.paidAmount == _this.paidAmount)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&const DeepCollectionEquality().equals(other.items, _this.items));
}


@override
int get hashCode {
  final _this = this as SaleInput;
  return Object.hash(runtimeType,_this.tripId,_this.customerId,_this.paymentMethodId,_this.discount,_this.paidAmount,_this.notes,const DeepCollectionEquality().hash(_this.items));
}

@override
String toString() {
  final _this = this as SaleInput;
  return 'SaleInput(tripId: ${_this.tripId}, customerId: ${_this.customerId}, paymentMethodId: ${_this.paymentMethodId}, discount: ${_this.discount}, paidAmount: ${_this.paidAmount}, notes: ${_this.notes}, items: ${_this.items})';
}


}

/// @nodoc
abstract mixin class $SaleInputCopyWith<$Res>  {
  factory $SaleInputCopyWith(SaleInput value, $Res Function(SaleInput) _then) = _$SaleInputCopyWithImpl;
@useResult
$Res call({
 int tripId, int? customerId, int? paymentMethodId, double? discount, double? paidAmount, String? notes, List<SaleLineInput> items
});




}
/// @nodoc
class _$SaleInputCopyWithImpl<$Res>
    implements $SaleInputCopyWith<$Res> {
  _$SaleInputCopyWithImpl(this._self, this._then);

  final SaleInput _self;
  final $Res Function(SaleInput) _then;

/// Create a copy of SaleInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tripId = null,Object? customerId = freezed,Object? paymentMethodId = freezed,Object? discount = freezed,Object? paidAmount = freezed,Object? notes = freezed,Object? items = null,}) {
  return _then(SaleInput(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int?,paymentMethodId: freezed == paymentMethodId ? _self.paymentMethodId : paymentMethodId // ignore: cast_nullable_to_non_nullable
as int?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double?,paidAmount: freezed == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SaleLineInput>,
  ));
}

}


/// Adds pattern-matching-related methods to [SaleInput].
extension SaleInputPatterns on SaleInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleInput value)  $default,){
final _that = this;
switch (_that) {
case _SaleInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleInput value)?  $default,){
final _that = this;
switch (_that) {
case _SaleInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int tripId,  int? customerId,  int? paymentMethodId,  double? discount,  double? paidAmount,  String? notes,  List<SaleLineInput> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleInput() when $default != null:
return $default(_that.tripId,_that.customerId,_that.paymentMethodId,_that.discount,_that.paidAmount,_that.notes,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int tripId,  int? customerId,  int? paymentMethodId,  double? discount,  double? paidAmount,  String? notes,  List<SaleLineInput> items)  $default,) {final _that = this;
switch (_that) {
case _SaleInput():
return $default(_that.tripId,_that.customerId,_that.paymentMethodId,_that.discount,_that.paidAmount,_that.notes,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int tripId,  int? customerId,  int? paymentMethodId,  double? discount,  double? paidAmount,  String? notes,  List<SaleLineInput> items)?  $default,) {final _that = this;
switch (_that) {
case _SaleInput() when $default != null:
return $default(_that.tripId,_that.customerId,_that.paymentMethodId,_that.discount,_that.paidAmount,_that.notes,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _SaleInput implements SaleInput {
  const _SaleInput({required this.tripId, this.customerId, this.paymentMethodId, this.discount, this.paidAmount, this.notes, required  List<SaleLineInput> items}): _items = items;
  

@override final  int tripId;
@override final  int? customerId;
@override final  int? paymentMethodId;
@override final  double? discount;
/// Null = paid in full.
@override final  double? paidAmount;
@override final  String? notes;
 final  List<SaleLineInput> _items;
@override List<SaleLineInput> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of SaleInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleInputCopyWith<_SaleInput> get copyWith => __$SaleInputCopyWithImpl<_SaleInput>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleInput&&(identical(other.tripId, tripId) || other.tripId == tripId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.paymentMethodId, paymentMethodId) || other.paymentMethodId == paymentMethodId)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.items, _items));
}


@override
int get hashCode {
    return Object.hash(runtimeType,tripId,customerId,paymentMethodId,discount,paidAmount,notes,const DeepCollectionEquality().hash(_items));
}

@override
String toString() {
    return 'SaleInput(tripId: $tripId, customerId: $customerId, paymentMethodId: $paymentMethodId, discount: $discount, paidAmount: $paidAmount, notes: $notes, items: $items)';
}


}

/// @nodoc
abstract mixin class _$SaleInputCopyWith<$Res> implements $SaleInputCopyWith<$Res> {
  factory _$SaleInputCopyWith(_SaleInput value, $Res Function(_SaleInput) _then) = __$SaleInputCopyWithImpl;
@override @useResult
$Res call({
 int tripId, int? customerId, int? paymentMethodId, double? discount, double? paidAmount, String? notes, List<SaleLineInput> items
});




}
/// @nodoc
class __$SaleInputCopyWithImpl<$Res>
    implements _$SaleInputCopyWith<$Res> {
  __$SaleInputCopyWithImpl(this._self, this._then);

  final _SaleInput _self;
  final $Res Function(_SaleInput) _then;

/// Create a copy of SaleInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tripId = null,Object? customerId = freezed,Object? paymentMethodId = freezed,Object? discount = freezed,Object? paidAmount = freezed,Object? notes = freezed,Object? items = null,}) {
  return _then(_SaleInput(
tripId: null == tripId ? _self.tripId : tripId // ignore: cast_nullable_to_non_nullable
as int,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int?,paymentMethodId: freezed == paymentMethodId ? _self.paymentMethodId : paymentMethodId // ignore: cast_nullable_to_non_nullable
as int?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double?,paidAmount: freezed == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SaleLineInput>,
  ));
}


}

/// @nodoc
mixin _$SaleLineInput {

 int get speciesId; double get weightKg; double get pricePerKg;
/// Create a copy of SaleLineInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleLineInputCopyWith<SaleLineInput> get copyWith => _$SaleLineInputCopyWithImpl<SaleLineInput>(this as SaleLineInput, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SaleLineInput;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleLineInput&&(identical(other.speciesId, _this.speciesId) || other.speciesId == _this.speciesId)&&(identical(other.weightKg, _this.weightKg) || other.weightKg == _this.weightKg)&&(identical(other.pricePerKg, _this.pricePerKg) || other.pricePerKg == _this.pricePerKg));
}


@override
int get hashCode {
  final _this = this as SaleLineInput;
  return Object.hash(runtimeType,_this.speciesId,_this.weightKg,_this.pricePerKg);
}

@override
String toString() {
  final _this = this as SaleLineInput;
  return 'SaleLineInput(speciesId: ${_this.speciesId}, weightKg: ${_this.weightKg}, pricePerKg: ${_this.pricePerKg})';
}


}

/// @nodoc
abstract mixin class $SaleLineInputCopyWith<$Res>  {
  factory $SaleLineInputCopyWith(SaleLineInput value, $Res Function(SaleLineInput) _then) = _$SaleLineInputCopyWithImpl;
@useResult
$Res call({
 int speciesId, double weightKg, double pricePerKg
});




}
/// @nodoc
class _$SaleLineInputCopyWithImpl<$Res>
    implements $SaleLineInputCopyWith<$Res> {
  _$SaleLineInputCopyWithImpl(this._self, this._then);

  final SaleLineInput _self;
  final $Res Function(SaleLineInput) _then;

/// Create a copy of SaleLineInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? speciesId = null,Object? weightKg = null,Object? pricePerKg = null,}) {
  return _then(SaleLineInput(
speciesId: null == speciesId ? _self.speciesId : speciesId // ignore: cast_nullable_to_non_nullable
as int,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double,pricePerKg: null == pricePerKg ? _self.pricePerKg : pricePerKg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SaleLineInput].
extension SaleLineInputPatterns on SaleLineInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleLineInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleLineInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleLineInput value)  $default,){
final _that = this;
switch (_that) {
case _SaleLineInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleLineInput value)?  $default,){
final _that = this;
switch (_that) {
case _SaleLineInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int speciesId,  double weightKg,  double pricePerKg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleLineInput() when $default != null:
return $default(_that.speciesId,_that.weightKg,_that.pricePerKg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int speciesId,  double weightKg,  double pricePerKg)  $default,) {final _that = this;
switch (_that) {
case _SaleLineInput():
return $default(_that.speciesId,_that.weightKg,_that.pricePerKg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int speciesId,  double weightKg,  double pricePerKg)?  $default,) {final _that = this;
switch (_that) {
case _SaleLineInput() when $default != null:
return $default(_that.speciesId,_that.weightKg,_that.pricePerKg);case _:
  return null;

}
}

}

/// @nodoc


class _SaleLineInput implements SaleLineInput {
  const _SaleLineInput({required this.speciesId, required this.weightKg, required this.pricePerKg});
  

@override final  int speciesId;
@override final  double weightKg;
@override final  double pricePerKg;

/// Create a copy of SaleLineInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleLineInputCopyWith<_SaleLineInput> get copyWith => __$SaleLineInputCopyWithImpl<_SaleLineInput>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleLineInput&&(identical(other.speciesId, speciesId) || other.speciesId == speciesId)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.pricePerKg, pricePerKg) || other.pricePerKg == pricePerKg));
}


@override
int get hashCode {
    return Object.hash(runtimeType,speciesId,weightKg,pricePerKg);
}

@override
String toString() {
    return 'SaleLineInput(speciesId: $speciesId, weightKg: $weightKg, pricePerKg: $pricePerKg)';
}


}

/// @nodoc
abstract mixin class _$SaleLineInputCopyWith<$Res> implements $SaleLineInputCopyWith<$Res> {
  factory _$SaleLineInputCopyWith(_SaleLineInput value, $Res Function(_SaleLineInput) _then) = __$SaleLineInputCopyWithImpl;
@override @useResult
$Res call({
 int speciesId, double weightKg, double pricePerKg
});




}
/// @nodoc
class __$SaleLineInputCopyWithImpl<$Res>
    implements _$SaleLineInputCopyWith<$Res> {
  __$SaleLineInputCopyWithImpl(this._self, this._then);

  final _SaleLineInput _self;
  final $Res Function(_SaleLineInput) _then;

/// Create a copy of SaleLineInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? speciesId = null,Object? weightKg = null,Object? pricePerKg = null,}) {
  return _then(_SaleLineInput(
speciesId: null == speciesId ? _self.speciesId : speciesId // ignore: cast_nullable_to_non_nullable
as int,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double,pricePerKg: null == pricePerKg ? _self.pricePerKg : pricePerKg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
