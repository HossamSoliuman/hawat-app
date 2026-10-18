// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Dashboard {

 String? get period; DashboardKpis get kpis; ActionItems get actionItems; List<RevenuePoint> get revenueByMonth; List<StockLine> get stock; List<Trip> get scheduledTrips; List<Trip> get activeTrips; List<Sale> get recentSales;
/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardCopyWith<Dashboard> get copyWith => _$DashboardCopyWithImpl<Dashboard>(this as Dashboard, _$identity);

  /// Serializes this Dashboard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Dashboard;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Dashboard&&(identical(other.period, _this.period) || other.period == _this.period)&&(identical(other.kpis, _this.kpis) || other.kpis == _this.kpis)&&(identical(other.actionItems, _this.actionItems) || other.actionItems == _this.actionItems)&&const DeepCollectionEquality().equals(other.revenueByMonth, _this.revenueByMonth)&&const DeepCollectionEquality().equals(other.stock, _this.stock)&&const DeepCollectionEquality().equals(other.scheduledTrips, _this.scheduledTrips)&&const DeepCollectionEquality().equals(other.activeTrips, _this.activeTrips)&&const DeepCollectionEquality().equals(other.recentSales, _this.recentSales));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Dashboard;
  return Object.hash(runtimeType,_this.period,_this.kpis,_this.actionItems,const DeepCollectionEquality().hash(_this.revenueByMonth),const DeepCollectionEquality().hash(_this.stock),const DeepCollectionEquality().hash(_this.scheduledTrips),const DeepCollectionEquality().hash(_this.activeTrips),const DeepCollectionEquality().hash(_this.recentSales));
}

@override
String toString() {
  final _this = this as Dashboard;
  return 'Dashboard(period: ${_this.period}, kpis: ${_this.kpis}, actionItems: ${_this.actionItems}, revenueByMonth: ${_this.revenueByMonth}, stock: ${_this.stock}, scheduledTrips: ${_this.scheduledTrips}, activeTrips: ${_this.activeTrips}, recentSales: ${_this.recentSales})';
}


}

/// @nodoc
abstract mixin class $DashboardCopyWith<$Res>  {
  factory $DashboardCopyWith(Dashboard value, $Res Function(Dashboard) _then) = _$DashboardCopyWithImpl;
@useResult
$Res call({
 String? period, DashboardKpis kpis, ActionItems actionItems, List<RevenuePoint> revenueByMonth, List<StockLine> stock, List<Trip> scheduledTrips, List<Trip> activeTrips, List<Sale> recentSales
});


$DashboardKpisCopyWith<$Res> get kpis;$ActionItemsCopyWith<$Res> get actionItems;

}
/// @nodoc
class _$DashboardCopyWithImpl<$Res>
    implements $DashboardCopyWith<$Res> {
  _$DashboardCopyWithImpl(this._self, this._then);

  final Dashboard _self;
  final $Res Function(Dashboard) _then;

/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? period = freezed,Object? kpis = null,Object? actionItems = null,Object? revenueByMonth = null,Object? stock = null,Object? scheduledTrips = null,Object? activeTrips = null,Object? recentSales = null,}) {
  return _then(Dashboard(
period: freezed == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String?,kpis: null == kpis ? _self.kpis : kpis // ignore: cast_nullable_to_non_nullable
as DashboardKpis,actionItems: null == actionItems ? _self.actionItems : actionItems // ignore: cast_nullable_to_non_nullable
as ActionItems,revenueByMonth: null == revenueByMonth ? _self.revenueByMonth : revenueByMonth // ignore: cast_nullable_to_non_nullable
as List<RevenuePoint>,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as List<StockLine>,scheduledTrips: null == scheduledTrips ? _self.scheduledTrips : scheduledTrips // ignore: cast_nullable_to_non_nullable
as List<Trip>,activeTrips: null == activeTrips ? _self.activeTrips : activeTrips // ignore: cast_nullable_to_non_nullable
as List<Trip>,recentSales: null == recentSales ? _self.recentSales : recentSales // ignore: cast_nullable_to_non_nullable
as List<Sale>,
  ));
}
/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardKpisCopyWith<$Res> get kpis {
  
  return $DashboardKpisCopyWith<$Res>(_self.kpis, (value) {
    return _then(_self.copyWith(kpis: value));
  });
}/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActionItemsCopyWith<$Res> get actionItems {
  
  return $ActionItemsCopyWith<$Res>(_self.actionItems, (value) {
    return _then(_self.copyWith(actionItems: value));
  });
}
}


/// Adds pattern-matching-related methods to [Dashboard].
extension DashboardPatterns on Dashboard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Dashboard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Dashboard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Dashboard value)  $default,){
final _that = this;
switch (_that) {
case _Dashboard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Dashboard value)?  $default,){
final _that = this;
switch (_that) {
case _Dashboard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? period,  DashboardKpis kpis,  ActionItems actionItems,  List<RevenuePoint> revenueByMonth,  List<StockLine> stock,  List<Trip> scheduledTrips,  List<Trip> activeTrips,  List<Sale> recentSales)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Dashboard() when $default != null:
return $default(_that.period,_that.kpis,_that.actionItems,_that.revenueByMonth,_that.stock,_that.scheduledTrips,_that.activeTrips,_that.recentSales);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? period,  DashboardKpis kpis,  ActionItems actionItems,  List<RevenuePoint> revenueByMonth,  List<StockLine> stock,  List<Trip> scheduledTrips,  List<Trip> activeTrips,  List<Sale> recentSales)  $default,) {final _that = this;
switch (_that) {
case _Dashboard():
return $default(_that.period,_that.kpis,_that.actionItems,_that.revenueByMonth,_that.stock,_that.scheduledTrips,_that.activeTrips,_that.recentSales);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? period,  DashboardKpis kpis,  ActionItems actionItems,  List<RevenuePoint> revenueByMonth,  List<StockLine> stock,  List<Trip> scheduledTrips,  List<Trip> activeTrips,  List<Sale> recentSales)?  $default,) {final _that = this;
switch (_that) {
case _Dashboard() when $default != null:
return $default(_that.period,_that.kpis,_that.actionItems,_that.revenueByMonth,_that.stock,_that.scheduledTrips,_that.activeTrips,_that.recentSales);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Dashboard extends Dashboard {
  const _Dashboard({this.period, required this.kpis, this.actionItems = const ActionItems(),  List<RevenuePoint> revenueByMonth = const <RevenuePoint>[],  List<StockLine> stock = const <StockLine>[],  List<Trip> scheduledTrips = const <Trip>[],  List<Trip> activeTrips = const <Trip>[],  List<Sale> recentSales = const <Sale>[]}): _revenueByMonth = revenueByMonth,_stock = stock,_scheduledTrips = scheduledTrips,_activeTrips = activeTrips,_recentSales = recentSales,super._();
  factory _Dashboard.fromJson(Map<String, dynamic> json) => _$DashboardFromJson(json);

@override final  String? period;
@override final  DashboardKpis kpis;
@override@JsonKey() final  ActionItems actionItems;
 final  List<RevenuePoint> _revenueByMonth;
@override@JsonKey() List<RevenuePoint> get revenueByMonth {
  if (_revenueByMonth is EqualUnmodifiableListView) return _revenueByMonth;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_revenueByMonth);
}

 final  List<StockLine> _stock;
@override@JsonKey() List<StockLine> get stock {
  if (_stock is EqualUnmodifiableListView) return _stock;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stock);
}

 final  List<Trip> _scheduledTrips;
@override@JsonKey() List<Trip> get scheduledTrips {
  if (_scheduledTrips is EqualUnmodifiableListView) return _scheduledTrips;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scheduledTrips);
}

 final  List<Trip> _activeTrips;
@override@JsonKey() List<Trip> get activeTrips {
  if (_activeTrips is EqualUnmodifiableListView) return _activeTrips;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activeTrips);
}

 final  List<Sale> _recentSales;
@override@JsonKey() List<Sale> get recentSales {
  if (_recentSales is EqualUnmodifiableListView) return _recentSales;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentSales);
}


/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardCopyWith<_Dashboard> get copyWith => __$DashboardCopyWithImpl<_Dashboard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Dashboard&&(identical(other.period, period) || other.period == period)&&(identical(other.kpis, kpis) || other.kpis == kpis)&&(identical(other.actionItems, actionItems) || other.actionItems == actionItems)&&const DeepCollectionEquality().equals(other.revenueByMonth, _revenueByMonth)&&const DeepCollectionEquality().equals(other.stock, _stock)&&const DeepCollectionEquality().equals(other.scheduledTrips, _scheduledTrips)&&const DeepCollectionEquality().equals(other.activeTrips, _activeTrips)&&const DeepCollectionEquality().equals(other.recentSales, _recentSales));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,period,kpis,actionItems,const DeepCollectionEquality().hash(_revenueByMonth),const DeepCollectionEquality().hash(_stock),const DeepCollectionEquality().hash(_scheduledTrips),const DeepCollectionEquality().hash(_activeTrips),const DeepCollectionEquality().hash(_recentSales));
}

@override
String toString() {
    return 'Dashboard(period: $period, kpis: $kpis, actionItems: $actionItems, revenueByMonth: $revenueByMonth, stock: $stock, scheduledTrips: $scheduledTrips, activeTrips: $activeTrips, recentSales: $recentSales)';
}


}

/// @nodoc
abstract mixin class _$DashboardCopyWith<$Res> implements $DashboardCopyWith<$Res> {
  factory _$DashboardCopyWith(_Dashboard value, $Res Function(_Dashboard) _then) = __$DashboardCopyWithImpl;
@override @useResult
$Res call({
 String? period, DashboardKpis kpis, ActionItems actionItems, List<RevenuePoint> revenueByMonth, List<StockLine> stock, List<Trip> scheduledTrips, List<Trip> activeTrips, List<Sale> recentSales
});


@override $DashboardKpisCopyWith<$Res> get kpis;@override $ActionItemsCopyWith<$Res> get actionItems;

}
/// @nodoc
class __$DashboardCopyWithImpl<$Res>
    implements _$DashboardCopyWith<$Res> {
  __$DashboardCopyWithImpl(this._self, this._then);

  final _Dashboard _self;
  final $Res Function(_Dashboard) _then;

/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? period = freezed,Object? kpis = null,Object? actionItems = null,Object? revenueByMonth = null,Object? stock = null,Object? scheduledTrips = null,Object? activeTrips = null,Object? recentSales = null,}) {
  return _then(_Dashboard(
period: freezed == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String?,kpis: null == kpis ? _self.kpis : kpis // ignore: cast_nullable_to_non_nullable
as DashboardKpis,actionItems: null == actionItems ? _self.actionItems : actionItems // ignore: cast_nullable_to_non_nullable
as ActionItems,revenueByMonth: null == revenueByMonth ? _self._revenueByMonth : revenueByMonth // ignore: cast_nullable_to_non_nullable
as List<RevenuePoint>,stock: null == stock ? _self._stock : stock // ignore: cast_nullable_to_non_nullable
as List<StockLine>,scheduledTrips: null == scheduledTrips ? _self._scheduledTrips : scheduledTrips // ignore: cast_nullable_to_non_nullable
as List<Trip>,activeTrips: null == activeTrips ? _self._activeTrips : activeTrips // ignore: cast_nullable_to_non_nullable
as List<Trip>,recentSales: null == recentSales ? _self._recentSales : recentSales // ignore: cast_nullable_to_non_nullable
as List<Sale>,
  ));
}

/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardKpisCopyWith<$Res> get kpis {
  
  return $DashboardKpisCopyWith<$Res>(_self.kpis, (value) {
    return _then(_self.copyWith(kpis: value));
  });
}/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActionItemsCopyWith<$Res> get actionItems {
  
  return $ActionItemsCopyWith<$Res>(_self.actionItems, (value) {
    return _then(_self.copyWith(actionItems: value));
  });
}
}


/// @nodoc
mixin _$DashboardKpis {

 double get revenue; double get catchKg; int get activeBoats; int get boats; int get tripsScheduled; int get tripsAtSea; int get tripsAwaitingCount; int get tripsForSale; int get salesCount; double get unpaid; int get customers;
/// Create a copy of DashboardKpis
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardKpisCopyWith<DashboardKpis> get copyWith => _$DashboardKpisCopyWithImpl<DashboardKpis>(this as DashboardKpis, _$identity);

  /// Serializes this DashboardKpis to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DashboardKpis;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardKpis&&(identical(other.revenue, _this.revenue) || other.revenue == _this.revenue)&&(identical(other.catchKg, _this.catchKg) || other.catchKg == _this.catchKg)&&(identical(other.activeBoats, _this.activeBoats) || other.activeBoats == _this.activeBoats)&&(identical(other.boats, _this.boats) || other.boats == _this.boats)&&(identical(other.tripsScheduled, _this.tripsScheduled) || other.tripsScheduled == _this.tripsScheduled)&&(identical(other.tripsAtSea, _this.tripsAtSea) || other.tripsAtSea == _this.tripsAtSea)&&(identical(other.tripsAwaitingCount, _this.tripsAwaitingCount) || other.tripsAwaitingCount == _this.tripsAwaitingCount)&&(identical(other.tripsForSale, _this.tripsForSale) || other.tripsForSale == _this.tripsForSale)&&(identical(other.salesCount, _this.salesCount) || other.salesCount == _this.salesCount)&&(identical(other.unpaid, _this.unpaid) || other.unpaid == _this.unpaid)&&(identical(other.customers, _this.customers) || other.customers == _this.customers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DashboardKpis;
  return Object.hash(runtimeType,_this.revenue,_this.catchKg,_this.activeBoats,_this.boats,_this.tripsScheduled,_this.tripsAtSea,_this.tripsAwaitingCount,_this.tripsForSale,_this.salesCount,_this.unpaid,_this.customers);
}

@override
String toString() {
  final _this = this as DashboardKpis;
  return 'DashboardKpis(revenue: ${_this.revenue}, catchKg: ${_this.catchKg}, activeBoats: ${_this.activeBoats}, boats: ${_this.boats}, tripsScheduled: ${_this.tripsScheduled}, tripsAtSea: ${_this.tripsAtSea}, tripsAwaitingCount: ${_this.tripsAwaitingCount}, tripsForSale: ${_this.tripsForSale}, salesCount: ${_this.salesCount}, unpaid: ${_this.unpaid}, customers: ${_this.customers})';
}


}

/// @nodoc
abstract mixin class $DashboardKpisCopyWith<$Res>  {
  factory $DashboardKpisCopyWith(DashboardKpis value, $Res Function(DashboardKpis) _then) = _$DashboardKpisCopyWithImpl;
@useResult
$Res call({
 double revenue, double catchKg, int activeBoats, int boats, int tripsScheduled, int tripsAtSea, int tripsAwaitingCount, int tripsForSale, int salesCount, double unpaid, int customers
});




}
/// @nodoc
class _$DashboardKpisCopyWithImpl<$Res>
    implements $DashboardKpisCopyWith<$Res> {
  _$DashboardKpisCopyWithImpl(this._self, this._then);

  final DashboardKpis _self;
  final $Res Function(DashboardKpis) _then;

/// Create a copy of DashboardKpis
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? revenue = null,Object? catchKg = null,Object? activeBoats = null,Object? boats = null,Object? tripsScheduled = null,Object? tripsAtSea = null,Object? tripsAwaitingCount = null,Object? tripsForSale = null,Object? salesCount = null,Object? unpaid = null,Object? customers = null,}) {
  return _then(DashboardKpis(
revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as double,catchKg: null == catchKg ? _self.catchKg : catchKg // ignore: cast_nullable_to_non_nullable
as double,activeBoats: null == activeBoats ? _self.activeBoats : activeBoats // ignore: cast_nullable_to_non_nullable
as int,boats: null == boats ? _self.boats : boats // ignore: cast_nullable_to_non_nullable
as int,tripsScheduled: null == tripsScheduled ? _self.tripsScheduled : tripsScheduled // ignore: cast_nullable_to_non_nullable
as int,tripsAtSea: null == tripsAtSea ? _self.tripsAtSea : tripsAtSea // ignore: cast_nullable_to_non_nullable
as int,tripsAwaitingCount: null == tripsAwaitingCount ? _self.tripsAwaitingCount : tripsAwaitingCount // ignore: cast_nullable_to_non_nullable
as int,tripsForSale: null == tripsForSale ? _self.tripsForSale : tripsForSale // ignore: cast_nullable_to_non_nullable
as int,salesCount: null == salesCount ? _self.salesCount : salesCount // ignore: cast_nullable_to_non_nullable
as int,unpaid: null == unpaid ? _self.unpaid : unpaid // ignore: cast_nullable_to_non_nullable
as double,customers: null == customers ? _self.customers : customers // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardKpis].
extension DashboardKpisPatterns on DashboardKpis {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardKpis value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardKpis() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardKpis value)  $default,){
final _that = this;
switch (_that) {
case _DashboardKpis():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardKpis value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardKpis() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double revenue,  double catchKg,  int activeBoats,  int boats,  int tripsScheduled,  int tripsAtSea,  int tripsAwaitingCount,  int tripsForSale,  int salesCount,  double unpaid,  int customers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardKpis() when $default != null:
return $default(_that.revenue,_that.catchKg,_that.activeBoats,_that.boats,_that.tripsScheduled,_that.tripsAtSea,_that.tripsAwaitingCount,_that.tripsForSale,_that.salesCount,_that.unpaid,_that.customers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double revenue,  double catchKg,  int activeBoats,  int boats,  int tripsScheduled,  int tripsAtSea,  int tripsAwaitingCount,  int tripsForSale,  int salesCount,  double unpaid,  int customers)  $default,) {final _that = this;
switch (_that) {
case _DashboardKpis():
return $default(_that.revenue,_that.catchKg,_that.activeBoats,_that.boats,_that.tripsScheduled,_that.tripsAtSea,_that.tripsAwaitingCount,_that.tripsForSale,_that.salesCount,_that.unpaid,_that.customers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double revenue,  double catchKg,  int activeBoats,  int boats,  int tripsScheduled,  int tripsAtSea,  int tripsAwaitingCount,  int tripsForSale,  int salesCount,  double unpaid,  int customers)?  $default,) {final _that = this;
switch (_that) {
case _DashboardKpis() when $default != null:
return $default(_that.revenue,_that.catchKg,_that.activeBoats,_that.boats,_that.tripsScheduled,_that.tripsAtSea,_that.tripsAwaitingCount,_that.tripsForSale,_that.salesCount,_that.unpaid,_that.customers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardKpis implements DashboardKpis {
  const _DashboardKpis({this.revenue = 0, this.catchKg = 0, this.activeBoats = 0, this.boats = 0, this.tripsScheduled = 0, this.tripsAtSea = 0, this.tripsAwaitingCount = 0, this.tripsForSale = 0, this.salesCount = 0, this.unpaid = 0, this.customers = 0});
  factory _DashboardKpis.fromJson(Map<String, dynamic> json) => _$DashboardKpisFromJson(json);

@override@JsonKey() final  double revenue;
@override@JsonKey() final  double catchKg;
@override@JsonKey() final  int activeBoats;
@override@JsonKey() final  int boats;
@override@JsonKey() final  int tripsScheduled;
@override@JsonKey() final  int tripsAtSea;
@override@JsonKey() final  int tripsAwaitingCount;
@override@JsonKey() final  int tripsForSale;
@override@JsonKey() final  int salesCount;
@override@JsonKey() final  double unpaid;
@override@JsonKey() final  int customers;

/// Create a copy of DashboardKpis
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardKpisCopyWith<_DashboardKpis> get copyWith => __$DashboardKpisCopyWithImpl<_DashboardKpis>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardKpisToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardKpis&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.catchKg, catchKg) || other.catchKg == catchKg)&&(identical(other.activeBoats, activeBoats) || other.activeBoats == activeBoats)&&(identical(other.boats, boats) || other.boats == boats)&&(identical(other.tripsScheduled, tripsScheduled) || other.tripsScheduled == tripsScheduled)&&(identical(other.tripsAtSea, tripsAtSea) || other.tripsAtSea == tripsAtSea)&&(identical(other.tripsAwaitingCount, tripsAwaitingCount) || other.tripsAwaitingCount == tripsAwaitingCount)&&(identical(other.tripsForSale, tripsForSale) || other.tripsForSale == tripsForSale)&&(identical(other.salesCount, salesCount) || other.salesCount == salesCount)&&(identical(other.unpaid, unpaid) || other.unpaid == unpaid)&&(identical(other.customers, customers) || other.customers == customers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,revenue,catchKg,activeBoats,boats,tripsScheduled,tripsAtSea,tripsAwaitingCount,tripsForSale,salesCount,unpaid,customers);
}

@override
String toString() {
    return 'DashboardKpis(revenue: $revenue, catchKg: $catchKg, activeBoats: $activeBoats, boats: $boats, tripsScheduled: $tripsScheduled, tripsAtSea: $tripsAtSea, tripsAwaitingCount: $tripsAwaitingCount, tripsForSale: $tripsForSale, salesCount: $salesCount, unpaid: $unpaid, customers: $customers)';
}


}

/// @nodoc
abstract mixin class _$DashboardKpisCopyWith<$Res> implements $DashboardKpisCopyWith<$Res> {
  factory _$DashboardKpisCopyWith(_DashboardKpis value, $Res Function(_DashboardKpis) _then) = __$DashboardKpisCopyWithImpl;
@override @useResult
$Res call({
 double revenue, double catchKg, int activeBoats, int boats, int tripsScheduled, int tripsAtSea, int tripsAwaitingCount, int tripsForSale, int salesCount, double unpaid, int customers
});




}
/// @nodoc
class __$DashboardKpisCopyWithImpl<$Res>
    implements _$DashboardKpisCopyWith<$Res> {
  __$DashboardKpisCopyWithImpl(this._self, this._then);

  final _DashboardKpis _self;
  final $Res Function(_DashboardKpis) _then;

/// Create a copy of DashboardKpis
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? revenue = null,Object? catchKg = null,Object? activeBoats = null,Object? boats = null,Object? tripsScheduled = null,Object? tripsAtSea = null,Object? tripsAwaitingCount = null,Object? tripsForSale = null,Object? salesCount = null,Object? unpaid = null,Object? customers = null,}) {
  return _then(_DashboardKpis(
revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as double,catchKg: null == catchKg ? _self.catchKg : catchKg // ignore: cast_nullable_to_non_nullable
as double,activeBoats: null == activeBoats ? _self.activeBoats : activeBoats // ignore: cast_nullable_to_non_nullable
as int,boats: null == boats ? _self.boats : boats // ignore: cast_nullable_to_non_nullable
as int,tripsScheduled: null == tripsScheduled ? _self.tripsScheduled : tripsScheduled // ignore: cast_nullable_to_non_nullable
as int,tripsAtSea: null == tripsAtSea ? _self.tripsAtSea : tripsAtSea // ignore: cast_nullable_to_non_nullable
as int,tripsAwaitingCount: null == tripsAwaitingCount ? _self.tripsAwaitingCount : tripsAwaitingCount // ignore: cast_nullable_to_non_nullable
as int,tripsForSale: null == tripsForSale ? _self.tripsForSale : tripsForSale // ignore: cast_nullable_to_non_nullable
as int,salesCount: null == salesCount ? _self.salesCount : salesCount // ignore: cast_nullable_to_non_nullable
as int,unpaid: null == unpaid ? _self.unpaid : unpaid // ignore: cast_nullable_to_non_nullable
as double,customers: null == customers ? _self.customers : customers // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ActionItems {

 int get tripsToStart; int get tripsToSell; int get unpaidSales; double get unpaidTotal;
/// Create a copy of ActionItems
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActionItemsCopyWith<ActionItems> get copyWith => _$ActionItemsCopyWithImpl<ActionItems>(this as ActionItems, _$identity);

  /// Serializes this ActionItems to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ActionItems;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionItems&&(identical(other.tripsToStart, _this.tripsToStart) || other.tripsToStart == _this.tripsToStart)&&(identical(other.tripsToSell, _this.tripsToSell) || other.tripsToSell == _this.tripsToSell)&&(identical(other.unpaidSales, _this.unpaidSales) || other.unpaidSales == _this.unpaidSales)&&(identical(other.unpaidTotal, _this.unpaidTotal) || other.unpaidTotal == _this.unpaidTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ActionItems;
  return Object.hash(runtimeType,_this.tripsToStart,_this.tripsToSell,_this.unpaidSales,_this.unpaidTotal);
}

@override
String toString() {
  final _this = this as ActionItems;
  return 'ActionItems(tripsToStart: ${_this.tripsToStart}, tripsToSell: ${_this.tripsToSell}, unpaidSales: ${_this.unpaidSales}, unpaidTotal: ${_this.unpaidTotal})';
}


}

/// @nodoc
abstract mixin class $ActionItemsCopyWith<$Res>  {
  factory $ActionItemsCopyWith(ActionItems value, $Res Function(ActionItems) _then) = _$ActionItemsCopyWithImpl;
@useResult
$Res call({
 int tripsToStart, int tripsToSell, int unpaidSales, double unpaidTotal
});




}
/// @nodoc
class _$ActionItemsCopyWithImpl<$Res>
    implements $ActionItemsCopyWith<$Res> {
  _$ActionItemsCopyWithImpl(this._self, this._then);

  final ActionItems _self;
  final $Res Function(ActionItems) _then;

/// Create a copy of ActionItems
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tripsToStart = null,Object? tripsToSell = null,Object? unpaidSales = null,Object? unpaidTotal = null,}) {
  return _then(ActionItems(
tripsToStart: null == tripsToStart ? _self.tripsToStart : tripsToStart // ignore: cast_nullable_to_non_nullable
as int,tripsToSell: null == tripsToSell ? _self.tripsToSell : tripsToSell // ignore: cast_nullable_to_non_nullable
as int,unpaidSales: null == unpaidSales ? _self.unpaidSales : unpaidSales // ignore: cast_nullable_to_non_nullable
as int,unpaidTotal: null == unpaidTotal ? _self.unpaidTotal : unpaidTotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ActionItems].
extension ActionItemsPatterns on ActionItems {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActionItems value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActionItems() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActionItems value)  $default,){
final _that = this;
switch (_that) {
case _ActionItems():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActionItems value)?  $default,){
final _that = this;
switch (_that) {
case _ActionItems() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int tripsToStart,  int tripsToSell,  int unpaidSales,  double unpaidTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActionItems() when $default != null:
return $default(_that.tripsToStart,_that.tripsToSell,_that.unpaidSales,_that.unpaidTotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int tripsToStart,  int tripsToSell,  int unpaidSales,  double unpaidTotal)  $default,) {final _that = this;
switch (_that) {
case _ActionItems():
return $default(_that.tripsToStart,_that.tripsToSell,_that.unpaidSales,_that.unpaidTotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int tripsToStart,  int tripsToSell,  int unpaidSales,  double unpaidTotal)?  $default,) {final _that = this;
switch (_that) {
case _ActionItems() when $default != null:
return $default(_that.tripsToStart,_that.tripsToSell,_that.unpaidSales,_that.unpaidTotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActionItems implements ActionItems {
  const _ActionItems({this.tripsToStart = 0, this.tripsToSell = 0, this.unpaidSales = 0, this.unpaidTotal = 0});
  factory _ActionItems.fromJson(Map<String, dynamic> json) => _$ActionItemsFromJson(json);

@override@JsonKey() final  int tripsToStart;
@override@JsonKey() final  int tripsToSell;
@override@JsonKey() final  int unpaidSales;
@override@JsonKey() final  double unpaidTotal;

/// Create a copy of ActionItems
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActionItemsCopyWith<_ActionItems> get copyWith => __$ActionItemsCopyWithImpl<_ActionItems>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActionItemsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActionItems&&(identical(other.tripsToStart, tripsToStart) || other.tripsToStart == tripsToStart)&&(identical(other.tripsToSell, tripsToSell) || other.tripsToSell == tripsToSell)&&(identical(other.unpaidSales, unpaidSales) || other.unpaidSales == unpaidSales)&&(identical(other.unpaidTotal, unpaidTotal) || other.unpaidTotal == unpaidTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,tripsToStart,tripsToSell,unpaidSales,unpaidTotal);
}

@override
String toString() {
    return 'ActionItems(tripsToStart: $tripsToStart, tripsToSell: $tripsToSell, unpaidSales: $unpaidSales, unpaidTotal: $unpaidTotal)';
}


}

/// @nodoc
abstract mixin class _$ActionItemsCopyWith<$Res> implements $ActionItemsCopyWith<$Res> {
  factory _$ActionItemsCopyWith(_ActionItems value, $Res Function(_ActionItems) _then) = __$ActionItemsCopyWithImpl;
@override @useResult
$Res call({
 int tripsToStart, int tripsToSell, int unpaidSales, double unpaidTotal
});




}
/// @nodoc
class __$ActionItemsCopyWithImpl<$Res>
    implements _$ActionItemsCopyWith<$Res> {
  __$ActionItemsCopyWithImpl(this._self, this._then);

  final _ActionItems _self;
  final $Res Function(_ActionItems) _then;

/// Create a copy of ActionItems
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tripsToStart = null,Object? tripsToSell = null,Object? unpaidSales = null,Object? unpaidTotal = null,}) {
  return _then(_ActionItems(
tripsToStart: null == tripsToStart ? _self.tripsToStart : tripsToStart // ignore: cast_nullable_to_non_nullable
as int,tripsToSell: null == tripsToSell ? _self.tripsToSell : tripsToSell // ignore: cast_nullable_to_non_nullable
as int,unpaidSales: null == unpaidSales ? _self.unpaidSales : unpaidSales // ignore: cast_nullable_to_non_nullable
as int,unpaidTotal: null == unpaidTotal ? _self.unpaidTotal : unpaidTotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$RevenuePoint {

 String get month; String? get label; double get total;
/// Create a copy of RevenuePoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RevenuePointCopyWith<RevenuePoint> get copyWith => _$RevenuePointCopyWithImpl<RevenuePoint>(this as RevenuePoint, _$identity);

  /// Serializes this RevenuePoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RevenuePoint;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RevenuePoint&&(identical(other.month, _this.month) || other.month == _this.month)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.total, _this.total) || other.total == _this.total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RevenuePoint;
  return Object.hash(runtimeType,_this.month,_this.label,_this.total);
}

@override
String toString() {
  final _this = this as RevenuePoint;
  return 'RevenuePoint(month: ${_this.month}, label: ${_this.label}, total: ${_this.total})';
}


}

/// @nodoc
abstract mixin class $RevenuePointCopyWith<$Res>  {
  factory $RevenuePointCopyWith(RevenuePoint value, $Res Function(RevenuePoint) _then) = _$RevenuePointCopyWithImpl;
@useResult
$Res call({
 String month, String? label, double total
});




}
/// @nodoc
class _$RevenuePointCopyWithImpl<$Res>
    implements $RevenuePointCopyWith<$Res> {
  _$RevenuePointCopyWithImpl(this._self, this._then);

  final RevenuePoint _self;
  final $Res Function(RevenuePoint) _then;

/// Create a copy of RevenuePoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? month = null,Object? label = freezed,Object? total = null,}) {
  return _then(RevenuePoint(
month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as String,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [RevenuePoint].
extension RevenuePointPatterns on RevenuePoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RevenuePoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RevenuePoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RevenuePoint value)  $default,){
final _that = this;
switch (_that) {
case _RevenuePoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RevenuePoint value)?  $default,){
final _that = this;
switch (_that) {
case _RevenuePoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String month,  String? label,  double total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RevenuePoint() when $default != null:
return $default(_that.month,_that.label,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String month,  String? label,  double total)  $default,) {final _that = this;
switch (_that) {
case _RevenuePoint():
return $default(_that.month,_that.label,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String month,  String? label,  double total)?  $default,) {final _that = this;
switch (_that) {
case _RevenuePoint() when $default != null:
return $default(_that.month,_that.label,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RevenuePoint implements RevenuePoint {
  const _RevenuePoint({required this.month, this.label, this.total = 0});
  factory _RevenuePoint.fromJson(Map<String, dynamic> json) => _$RevenuePointFromJson(json);

@override final  String month;
@override final  String? label;
@override@JsonKey() final  double total;

/// Create a copy of RevenuePoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RevenuePointCopyWith<_RevenuePoint> get copyWith => __$RevenuePointCopyWithImpl<_RevenuePoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RevenuePointToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RevenuePoint&&(identical(other.month, month) || other.month == month)&&(identical(other.label, label) || other.label == label)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,month,label,total);
}

@override
String toString() {
    return 'RevenuePoint(month: $month, label: $label, total: $total)';
}


}

/// @nodoc
abstract mixin class _$RevenuePointCopyWith<$Res> implements $RevenuePointCopyWith<$Res> {
  factory _$RevenuePointCopyWith(_RevenuePoint value, $Res Function(_RevenuePoint) _then) = __$RevenuePointCopyWithImpl;
@override @useResult
$Res call({
 String month, String? label, double total
});




}
/// @nodoc
class __$RevenuePointCopyWithImpl<$Res>
    implements _$RevenuePointCopyWith<$Res> {
  __$RevenuePointCopyWithImpl(this._self, this._then);

  final _RevenuePoint _self;
  final $Res Function(_RevenuePoint) _then;

/// Create a copy of RevenuePoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? month = null,Object? label = freezed,Object? total = null,}) {
  return _then(_RevenuePoint(
month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as String,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


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

// dart format on
