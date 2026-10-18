// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Trip {

 int get id; String get tripNumber; String get status; String? get appStatus; int get progressStep; String get saleStatus; bool get canSell; TripBoat? get boat; PersonRef? get captain; PersonRef? get counter; IdName? get departurePort; IdName? get returnPort; IdName? get tripType; int get crewCount; int? get plannedDays; String? get gearType; String? get licenseNumber; DateTime? get departureTime; DateTime? get startedAt; DateTime? get returnTime; DateTime? get catchSubmittedAt; DateTime? get receivedAt; DateTime? get countedAt; DateTime? get cancelledAt; String? get cancelReason; double? get durationHours; double? get captainInputKg; double? get actualWeightKg; double? get diffKg; double? get approvedKg; String? get notes; List<CatchRecord> get catchRecords; List<AvailableLine> get availableStock; DateTime? get createdAt;
/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripCopyWith<Trip> get copyWith => _$TripCopyWithImpl<Trip>(this as Trip, _$identity);

  /// Serializes this Trip to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Trip;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Trip&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.tripNumber, _this.tripNumber) || other.tripNumber == _this.tripNumber)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.appStatus, _this.appStatus) || other.appStatus == _this.appStatus)&&(identical(other.progressStep, _this.progressStep) || other.progressStep == _this.progressStep)&&(identical(other.saleStatus, _this.saleStatus) || other.saleStatus == _this.saleStatus)&&(identical(other.canSell, _this.canSell) || other.canSell == _this.canSell)&&(identical(other.boat, _this.boat) || other.boat == _this.boat)&&(identical(other.captain, _this.captain) || other.captain == _this.captain)&&(identical(other.counter, _this.counter) || other.counter == _this.counter)&&(identical(other.departurePort, _this.departurePort) || other.departurePort == _this.departurePort)&&(identical(other.returnPort, _this.returnPort) || other.returnPort == _this.returnPort)&&(identical(other.tripType, _this.tripType) || other.tripType == _this.tripType)&&(identical(other.crewCount, _this.crewCount) || other.crewCount == _this.crewCount)&&(identical(other.plannedDays, _this.plannedDays) || other.plannedDays == _this.plannedDays)&&(identical(other.gearType, _this.gearType) || other.gearType == _this.gearType)&&(identical(other.licenseNumber, _this.licenseNumber) || other.licenseNumber == _this.licenseNumber)&&(identical(other.departureTime, _this.departureTime) || other.departureTime == _this.departureTime)&&(identical(other.startedAt, _this.startedAt) || other.startedAt == _this.startedAt)&&(identical(other.returnTime, _this.returnTime) || other.returnTime == _this.returnTime)&&(identical(other.catchSubmittedAt, _this.catchSubmittedAt) || other.catchSubmittedAt == _this.catchSubmittedAt)&&(identical(other.receivedAt, _this.receivedAt) || other.receivedAt == _this.receivedAt)&&(identical(other.countedAt, _this.countedAt) || other.countedAt == _this.countedAt)&&(identical(other.cancelledAt, _this.cancelledAt) || other.cancelledAt == _this.cancelledAt)&&(identical(other.cancelReason, _this.cancelReason) || other.cancelReason == _this.cancelReason)&&(identical(other.durationHours, _this.durationHours) || other.durationHours == _this.durationHours)&&(identical(other.captainInputKg, _this.captainInputKg) || other.captainInputKg == _this.captainInputKg)&&(identical(other.actualWeightKg, _this.actualWeightKg) || other.actualWeightKg == _this.actualWeightKg)&&(identical(other.diffKg, _this.diffKg) || other.diffKg == _this.diffKg)&&(identical(other.approvedKg, _this.approvedKg) || other.approvedKg == _this.approvedKg)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&const DeepCollectionEquality().equals(other.catchRecords, _this.catchRecords)&&const DeepCollectionEquality().equals(other.availableStock, _this.availableStock)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Trip;
  return Object.hashAll([runtimeType,_this.id,_this.tripNumber,_this.status,_this.appStatus,_this.progressStep,_this.saleStatus,_this.canSell,_this.boat,_this.captain,_this.counter,_this.departurePort,_this.returnPort,_this.tripType,_this.crewCount,_this.plannedDays,_this.gearType,_this.licenseNumber,_this.departureTime,_this.startedAt,_this.returnTime,_this.catchSubmittedAt,_this.receivedAt,_this.countedAt,_this.cancelledAt,_this.cancelReason,_this.durationHours,_this.captainInputKg,_this.actualWeightKg,_this.diffKg,_this.approvedKg,_this.notes,const DeepCollectionEquality().hash(_this.catchRecords),const DeepCollectionEquality().hash(_this.availableStock),_this.createdAt]);
}

@override
String toString() {
  final _this = this as Trip;
  return 'Trip(id: ${_this.id}, tripNumber: ${_this.tripNumber}, status: ${_this.status}, appStatus: ${_this.appStatus}, progressStep: ${_this.progressStep}, saleStatus: ${_this.saleStatus}, canSell: ${_this.canSell}, boat: ${_this.boat}, captain: ${_this.captain}, counter: ${_this.counter}, departurePort: ${_this.departurePort}, returnPort: ${_this.returnPort}, tripType: ${_this.tripType}, crewCount: ${_this.crewCount}, plannedDays: ${_this.plannedDays}, gearType: ${_this.gearType}, licenseNumber: ${_this.licenseNumber}, departureTime: ${_this.departureTime}, startedAt: ${_this.startedAt}, returnTime: ${_this.returnTime}, catchSubmittedAt: ${_this.catchSubmittedAt}, receivedAt: ${_this.receivedAt}, countedAt: ${_this.countedAt}, cancelledAt: ${_this.cancelledAt}, cancelReason: ${_this.cancelReason}, durationHours: ${_this.durationHours}, captainInputKg: ${_this.captainInputKg}, actualWeightKg: ${_this.actualWeightKg}, diffKg: ${_this.diffKg}, approvedKg: ${_this.approvedKg}, notes: ${_this.notes}, catchRecords: ${_this.catchRecords}, availableStock: ${_this.availableStock}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $TripCopyWith<$Res>  {
  factory $TripCopyWith(Trip value, $Res Function(Trip) _then) = _$TripCopyWithImpl;
@useResult
$Res call({
 int id, String tripNumber, String status, String? appStatus, int progressStep, String saleStatus, bool canSell, TripBoat? boat, PersonRef? captain, PersonRef? counter, IdName? departurePort, IdName? returnPort, IdName? tripType, int crewCount, int? plannedDays, String? gearType, String? licenseNumber, DateTime? departureTime, DateTime? startedAt, DateTime? returnTime, DateTime? catchSubmittedAt, DateTime? receivedAt, DateTime? countedAt, DateTime? cancelledAt, String? cancelReason, double? durationHours, double? captainInputKg, double? actualWeightKg, double? diffKg, double? approvedKg, String? notes, List<CatchRecord> catchRecords, List<AvailableLine> availableStock, DateTime? createdAt
});


$TripBoatCopyWith<$Res>? get boat;$PersonRefCopyWith<$Res>? get captain;$PersonRefCopyWith<$Res>? get counter;$IdNameCopyWith<$Res>? get departurePort;$IdNameCopyWith<$Res>? get returnPort;$IdNameCopyWith<$Res>? get tripType;

}
/// @nodoc
class _$TripCopyWithImpl<$Res>
    implements $TripCopyWith<$Res> {
  _$TripCopyWithImpl(this._self, this._then);

  final Trip _self;
  final $Res Function(Trip) _then;

/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tripNumber = null,Object? status = null,Object? appStatus = freezed,Object? progressStep = null,Object? saleStatus = null,Object? canSell = null,Object? boat = freezed,Object? captain = freezed,Object? counter = freezed,Object? departurePort = freezed,Object? returnPort = freezed,Object? tripType = freezed,Object? crewCount = null,Object? plannedDays = freezed,Object? gearType = freezed,Object? licenseNumber = freezed,Object? departureTime = freezed,Object? startedAt = freezed,Object? returnTime = freezed,Object? catchSubmittedAt = freezed,Object? receivedAt = freezed,Object? countedAt = freezed,Object? cancelledAt = freezed,Object? cancelReason = freezed,Object? durationHours = freezed,Object? captainInputKg = freezed,Object? actualWeightKg = freezed,Object? diffKg = freezed,Object? approvedKg = freezed,Object? notes = freezed,Object? catchRecords = null,Object? availableStock = null,Object? createdAt = freezed,}) {
  return _then(Trip(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tripNumber: null == tripNumber ? _self.tripNumber : tripNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,appStatus: freezed == appStatus ? _self.appStatus : appStatus // ignore: cast_nullable_to_non_nullable
as String?,progressStep: null == progressStep ? _self.progressStep : progressStep // ignore: cast_nullable_to_non_nullable
as int,saleStatus: null == saleStatus ? _self.saleStatus : saleStatus // ignore: cast_nullable_to_non_nullable
as String,canSell: null == canSell ? _self.canSell : canSell // ignore: cast_nullable_to_non_nullable
as bool,boat: freezed == boat ? _self.boat : boat // ignore: cast_nullable_to_non_nullable
as TripBoat?,captain: freezed == captain ? _self.captain : captain // ignore: cast_nullable_to_non_nullable
as PersonRef?,counter: freezed == counter ? _self.counter : counter // ignore: cast_nullable_to_non_nullable
as PersonRef?,departurePort: freezed == departurePort ? _self.departurePort : departurePort // ignore: cast_nullable_to_non_nullable
as IdName?,returnPort: freezed == returnPort ? _self.returnPort : returnPort // ignore: cast_nullable_to_non_nullable
as IdName?,tripType: freezed == tripType ? _self.tripType : tripType // ignore: cast_nullable_to_non_nullable
as IdName?,crewCount: null == crewCount ? _self.crewCount : crewCount // ignore: cast_nullable_to_non_nullable
as int,plannedDays: freezed == plannedDays ? _self.plannedDays : plannedDays // ignore: cast_nullable_to_non_nullable
as int?,gearType: freezed == gearType ? _self.gearType : gearType // ignore: cast_nullable_to_non_nullable
as String?,licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,departureTime: freezed == departureTime ? _self.departureTime : departureTime // ignore: cast_nullable_to_non_nullable
as DateTime?,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,returnTime: freezed == returnTime ? _self.returnTime : returnTime // ignore: cast_nullable_to_non_nullable
as DateTime?,catchSubmittedAt: freezed == catchSubmittedAt ? _self.catchSubmittedAt : catchSubmittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,receivedAt: freezed == receivedAt ? _self.receivedAt : receivedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,countedAt: freezed == countedAt ? _self.countedAt : countedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelReason: freezed == cancelReason ? _self.cancelReason : cancelReason // ignore: cast_nullable_to_non_nullable
as String?,durationHours: freezed == durationHours ? _self.durationHours : durationHours // ignore: cast_nullable_to_non_nullable
as double?,captainInputKg: freezed == captainInputKg ? _self.captainInputKg : captainInputKg // ignore: cast_nullable_to_non_nullable
as double?,actualWeightKg: freezed == actualWeightKg ? _self.actualWeightKg : actualWeightKg // ignore: cast_nullable_to_non_nullable
as double?,diffKg: freezed == diffKg ? _self.diffKg : diffKg // ignore: cast_nullable_to_non_nullable
as double?,approvedKg: freezed == approvedKg ? _self.approvedKg : approvedKg // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,catchRecords: null == catchRecords ? _self.catchRecords : catchRecords // ignore: cast_nullable_to_non_nullable
as List<CatchRecord>,availableStock: null == availableStock ? _self.availableStock : availableStock // ignore: cast_nullable_to_non_nullable
as List<AvailableLine>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripBoatCopyWith<$Res>? get boat {
    if (_self.boat == null) {
    return null;
  }

  return $TripBoatCopyWith<$Res>(_self.boat!, (value) {
    return _then(_self.copyWith(boat: value));
  });
}/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonRefCopyWith<$Res>? get captain {
    if (_self.captain == null) {
    return null;
  }

  return $PersonRefCopyWith<$Res>(_self.captain!, (value) {
    return _then(_self.copyWith(captain: value));
  });
}/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonRefCopyWith<$Res>? get counter {
    if (_self.counter == null) {
    return null;
  }

  return $PersonRefCopyWith<$Res>(_self.counter!, (value) {
    return _then(_self.copyWith(counter: value));
  });
}/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res>? get departurePort {
    if (_self.departurePort == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.departurePort!, (value) {
    return _then(_self.copyWith(departurePort: value));
  });
}/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res>? get returnPort {
    if (_self.returnPort == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.returnPort!, (value) {
    return _then(_self.copyWith(returnPort: value));
  });
}/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res>? get tripType {
    if (_self.tripType == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.tripType!, (value) {
    return _then(_self.copyWith(tripType: value));
  });
}
}


/// Adds pattern-matching-related methods to [Trip].
extension TripPatterns on Trip {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Trip value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Trip() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Trip value)  $default,){
final _that = this;
switch (_that) {
case _Trip():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Trip value)?  $default,){
final _that = this;
switch (_that) {
case _Trip() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String tripNumber,  String status,  String? appStatus,  int progressStep,  String saleStatus,  bool canSell,  TripBoat? boat,  PersonRef? captain,  PersonRef? counter,  IdName? departurePort,  IdName? returnPort,  IdName? tripType,  int crewCount,  int? plannedDays,  String? gearType,  String? licenseNumber,  DateTime? departureTime,  DateTime? startedAt,  DateTime? returnTime,  DateTime? catchSubmittedAt,  DateTime? receivedAt,  DateTime? countedAt,  DateTime? cancelledAt,  String? cancelReason,  double? durationHours,  double? captainInputKg,  double? actualWeightKg,  double? diffKg,  double? approvedKg,  String? notes,  List<CatchRecord> catchRecords,  List<AvailableLine> availableStock,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Trip() when $default != null:
return $default(_that.id,_that.tripNumber,_that.status,_that.appStatus,_that.progressStep,_that.saleStatus,_that.canSell,_that.boat,_that.captain,_that.counter,_that.departurePort,_that.returnPort,_that.tripType,_that.crewCount,_that.plannedDays,_that.gearType,_that.licenseNumber,_that.departureTime,_that.startedAt,_that.returnTime,_that.catchSubmittedAt,_that.receivedAt,_that.countedAt,_that.cancelledAt,_that.cancelReason,_that.durationHours,_that.captainInputKg,_that.actualWeightKg,_that.diffKg,_that.approvedKg,_that.notes,_that.catchRecords,_that.availableStock,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String tripNumber,  String status,  String? appStatus,  int progressStep,  String saleStatus,  bool canSell,  TripBoat? boat,  PersonRef? captain,  PersonRef? counter,  IdName? departurePort,  IdName? returnPort,  IdName? tripType,  int crewCount,  int? plannedDays,  String? gearType,  String? licenseNumber,  DateTime? departureTime,  DateTime? startedAt,  DateTime? returnTime,  DateTime? catchSubmittedAt,  DateTime? receivedAt,  DateTime? countedAt,  DateTime? cancelledAt,  String? cancelReason,  double? durationHours,  double? captainInputKg,  double? actualWeightKg,  double? diffKg,  double? approvedKg,  String? notes,  List<CatchRecord> catchRecords,  List<AvailableLine> availableStock,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Trip():
return $default(_that.id,_that.tripNumber,_that.status,_that.appStatus,_that.progressStep,_that.saleStatus,_that.canSell,_that.boat,_that.captain,_that.counter,_that.departurePort,_that.returnPort,_that.tripType,_that.crewCount,_that.plannedDays,_that.gearType,_that.licenseNumber,_that.departureTime,_that.startedAt,_that.returnTime,_that.catchSubmittedAt,_that.receivedAt,_that.countedAt,_that.cancelledAt,_that.cancelReason,_that.durationHours,_that.captainInputKg,_that.actualWeightKg,_that.diffKg,_that.approvedKg,_that.notes,_that.catchRecords,_that.availableStock,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String tripNumber,  String status,  String? appStatus,  int progressStep,  String saleStatus,  bool canSell,  TripBoat? boat,  PersonRef? captain,  PersonRef? counter,  IdName? departurePort,  IdName? returnPort,  IdName? tripType,  int crewCount,  int? plannedDays,  String? gearType,  String? licenseNumber,  DateTime? departureTime,  DateTime? startedAt,  DateTime? returnTime,  DateTime? catchSubmittedAt,  DateTime? receivedAt,  DateTime? countedAt,  DateTime? cancelledAt,  String? cancelReason,  double? durationHours,  double? captainInputKg,  double? actualWeightKg,  double? diffKg,  double? approvedKg,  String? notes,  List<CatchRecord> catchRecords,  List<AvailableLine> availableStock,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Trip() when $default != null:
return $default(_that.id,_that.tripNumber,_that.status,_that.appStatus,_that.progressStep,_that.saleStatus,_that.canSell,_that.boat,_that.captain,_that.counter,_that.departurePort,_that.returnPort,_that.tripType,_that.crewCount,_that.plannedDays,_that.gearType,_that.licenseNumber,_that.departureTime,_that.startedAt,_that.returnTime,_that.catchSubmittedAt,_that.receivedAt,_that.countedAt,_that.cancelledAt,_that.cancelReason,_that.durationHours,_that.captainInputKg,_that.actualWeightKg,_that.diffKg,_that.approvedKg,_that.notes,_that.catchRecords,_that.availableStock,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Trip extends Trip {
  const _Trip({required this.id, required this.tripNumber, required this.status, this.appStatus, this.progressStep = 0, this.saleStatus = TripStatus.saleNotStarted, this.canSell = false, this.boat, this.captain, this.counter, this.departurePort, this.returnPort, this.tripType, this.crewCount = 0, this.plannedDays, this.gearType, this.licenseNumber, this.departureTime, this.startedAt, this.returnTime, this.catchSubmittedAt, this.receivedAt, this.countedAt, this.cancelledAt, this.cancelReason, this.durationHours, this.captainInputKg, this.actualWeightKg, this.diffKg, this.approvedKg, this.notes,  List<CatchRecord> catchRecords = const <CatchRecord>[],  List<AvailableLine> availableStock = const <AvailableLine>[], this.createdAt}): _catchRecords = catchRecords,_availableStock = availableStock,super._();
  factory _Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);

@override final  int id;
@override final  String tripNumber;
@override final  String status;
@override final  String? appStatus;
@override@JsonKey() final  int progressStep;
@override@JsonKey() final  String saleStatus;
@override@JsonKey() final  bool canSell;
@override final  TripBoat? boat;
@override final  PersonRef? captain;
@override final  PersonRef? counter;
@override final  IdName? departurePort;
@override final  IdName? returnPort;
@override final  IdName? tripType;
@override@JsonKey() final  int crewCount;
@override final  int? plannedDays;
@override final  String? gearType;
@override final  String? licenseNumber;
@override final  DateTime? departureTime;
@override final  DateTime? startedAt;
@override final  DateTime? returnTime;
@override final  DateTime? catchSubmittedAt;
@override final  DateTime? receivedAt;
@override final  DateTime? countedAt;
@override final  DateTime? cancelledAt;
@override final  String? cancelReason;
@override final  double? durationHours;
@override final  double? captainInputKg;
@override final  double? actualWeightKg;
@override final  double? diffKg;
@override final  double? approvedKg;
@override final  String? notes;
 final  List<CatchRecord> _catchRecords;
@override@JsonKey() List<CatchRecord> get catchRecords {
  if (_catchRecords is EqualUnmodifiableListView) return _catchRecords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_catchRecords);
}

 final  List<AvailableLine> _availableStock;
@override@JsonKey() List<AvailableLine> get availableStock {
  if (_availableStock is EqualUnmodifiableListView) return _availableStock;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableStock);
}

@override final  DateTime? createdAt;

/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripCopyWith<_Trip> get copyWith => __$TripCopyWithImpl<_Trip>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TripToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Trip&&(identical(other.id, id) || other.id == id)&&(identical(other.tripNumber, tripNumber) || other.tripNumber == tripNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.appStatus, appStatus) || other.appStatus == appStatus)&&(identical(other.progressStep, progressStep) || other.progressStep == progressStep)&&(identical(other.saleStatus, saleStatus) || other.saleStatus == saleStatus)&&(identical(other.canSell, canSell) || other.canSell == canSell)&&(identical(other.boat, boat) || other.boat == boat)&&(identical(other.captain, captain) || other.captain == captain)&&(identical(other.counter, counter) || other.counter == counter)&&(identical(other.departurePort, departurePort) || other.departurePort == departurePort)&&(identical(other.returnPort, returnPort) || other.returnPort == returnPort)&&(identical(other.tripType, tripType) || other.tripType == tripType)&&(identical(other.crewCount, crewCount) || other.crewCount == crewCount)&&(identical(other.plannedDays, plannedDays) || other.plannedDays == plannedDays)&&(identical(other.gearType, gearType) || other.gearType == gearType)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.departureTime, departureTime) || other.departureTime == departureTime)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.returnTime, returnTime) || other.returnTime == returnTime)&&(identical(other.catchSubmittedAt, catchSubmittedAt) || other.catchSubmittedAt == catchSubmittedAt)&&(identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt)&&(identical(other.countedAt, countedAt) || other.countedAt == countedAt)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.cancelReason, cancelReason) || other.cancelReason == cancelReason)&&(identical(other.durationHours, durationHours) || other.durationHours == durationHours)&&(identical(other.captainInputKg, captainInputKg) || other.captainInputKg == captainInputKg)&&(identical(other.actualWeightKg, actualWeightKg) || other.actualWeightKg == actualWeightKg)&&(identical(other.diffKg, diffKg) || other.diffKg == diffKg)&&(identical(other.approvedKg, approvedKg) || other.approvedKg == approvedKg)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.catchRecords, _catchRecords)&&const DeepCollectionEquality().equals(other.availableStock, _availableStock)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,tripNumber,status,appStatus,progressStep,saleStatus,canSell,boat,captain,counter,departurePort,returnPort,tripType,crewCount,plannedDays,gearType,licenseNumber,departureTime,startedAt,returnTime,catchSubmittedAt,receivedAt,countedAt,cancelledAt,cancelReason,durationHours,captainInputKg,actualWeightKg,diffKg,approvedKg,notes,const DeepCollectionEquality().hash(_catchRecords),const DeepCollectionEquality().hash(_availableStock),createdAt]);
}

@override
String toString() {
    return 'Trip(id: $id, tripNumber: $tripNumber, status: $status, appStatus: $appStatus, progressStep: $progressStep, saleStatus: $saleStatus, canSell: $canSell, boat: $boat, captain: $captain, counter: $counter, departurePort: $departurePort, returnPort: $returnPort, tripType: $tripType, crewCount: $crewCount, plannedDays: $plannedDays, gearType: $gearType, licenseNumber: $licenseNumber, departureTime: $departureTime, startedAt: $startedAt, returnTime: $returnTime, catchSubmittedAt: $catchSubmittedAt, receivedAt: $receivedAt, countedAt: $countedAt, cancelledAt: $cancelledAt, cancelReason: $cancelReason, durationHours: $durationHours, captainInputKg: $captainInputKg, actualWeightKg: $actualWeightKg, diffKg: $diffKg, approvedKg: $approvedKg, notes: $notes, catchRecords: $catchRecords, availableStock: $availableStock, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TripCopyWith<$Res> implements $TripCopyWith<$Res> {
  factory _$TripCopyWith(_Trip value, $Res Function(_Trip) _then) = __$TripCopyWithImpl;
@override @useResult
$Res call({
 int id, String tripNumber, String status, String? appStatus, int progressStep, String saleStatus, bool canSell, TripBoat? boat, PersonRef? captain, PersonRef? counter, IdName? departurePort, IdName? returnPort, IdName? tripType, int crewCount, int? plannedDays, String? gearType, String? licenseNumber, DateTime? departureTime, DateTime? startedAt, DateTime? returnTime, DateTime? catchSubmittedAt, DateTime? receivedAt, DateTime? countedAt, DateTime? cancelledAt, String? cancelReason, double? durationHours, double? captainInputKg, double? actualWeightKg, double? diffKg, double? approvedKg, String? notes, List<CatchRecord> catchRecords, List<AvailableLine> availableStock, DateTime? createdAt
});


@override $TripBoatCopyWith<$Res>? get boat;@override $PersonRefCopyWith<$Res>? get captain;@override $PersonRefCopyWith<$Res>? get counter;@override $IdNameCopyWith<$Res>? get departurePort;@override $IdNameCopyWith<$Res>? get returnPort;@override $IdNameCopyWith<$Res>? get tripType;

}
/// @nodoc
class __$TripCopyWithImpl<$Res>
    implements _$TripCopyWith<$Res> {
  __$TripCopyWithImpl(this._self, this._then);

  final _Trip _self;
  final $Res Function(_Trip) _then;

/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tripNumber = null,Object? status = null,Object? appStatus = freezed,Object? progressStep = null,Object? saleStatus = null,Object? canSell = null,Object? boat = freezed,Object? captain = freezed,Object? counter = freezed,Object? departurePort = freezed,Object? returnPort = freezed,Object? tripType = freezed,Object? crewCount = null,Object? plannedDays = freezed,Object? gearType = freezed,Object? licenseNumber = freezed,Object? departureTime = freezed,Object? startedAt = freezed,Object? returnTime = freezed,Object? catchSubmittedAt = freezed,Object? receivedAt = freezed,Object? countedAt = freezed,Object? cancelledAt = freezed,Object? cancelReason = freezed,Object? durationHours = freezed,Object? captainInputKg = freezed,Object? actualWeightKg = freezed,Object? diffKg = freezed,Object? approvedKg = freezed,Object? notes = freezed,Object? catchRecords = null,Object? availableStock = null,Object? createdAt = freezed,}) {
  return _then(_Trip(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tripNumber: null == tripNumber ? _self.tripNumber : tripNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,appStatus: freezed == appStatus ? _self.appStatus : appStatus // ignore: cast_nullable_to_non_nullable
as String?,progressStep: null == progressStep ? _self.progressStep : progressStep // ignore: cast_nullable_to_non_nullable
as int,saleStatus: null == saleStatus ? _self.saleStatus : saleStatus // ignore: cast_nullable_to_non_nullable
as String,canSell: null == canSell ? _self.canSell : canSell // ignore: cast_nullable_to_non_nullable
as bool,boat: freezed == boat ? _self.boat : boat // ignore: cast_nullable_to_non_nullable
as TripBoat?,captain: freezed == captain ? _self.captain : captain // ignore: cast_nullable_to_non_nullable
as PersonRef?,counter: freezed == counter ? _self.counter : counter // ignore: cast_nullable_to_non_nullable
as PersonRef?,departurePort: freezed == departurePort ? _self.departurePort : departurePort // ignore: cast_nullable_to_non_nullable
as IdName?,returnPort: freezed == returnPort ? _self.returnPort : returnPort // ignore: cast_nullable_to_non_nullable
as IdName?,tripType: freezed == tripType ? _self.tripType : tripType // ignore: cast_nullable_to_non_nullable
as IdName?,crewCount: null == crewCount ? _self.crewCount : crewCount // ignore: cast_nullable_to_non_nullable
as int,plannedDays: freezed == plannedDays ? _self.plannedDays : plannedDays // ignore: cast_nullable_to_non_nullable
as int?,gearType: freezed == gearType ? _self.gearType : gearType // ignore: cast_nullable_to_non_nullable
as String?,licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,departureTime: freezed == departureTime ? _self.departureTime : departureTime // ignore: cast_nullable_to_non_nullable
as DateTime?,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,returnTime: freezed == returnTime ? _self.returnTime : returnTime // ignore: cast_nullable_to_non_nullable
as DateTime?,catchSubmittedAt: freezed == catchSubmittedAt ? _self.catchSubmittedAt : catchSubmittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,receivedAt: freezed == receivedAt ? _self.receivedAt : receivedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,countedAt: freezed == countedAt ? _self.countedAt : countedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelReason: freezed == cancelReason ? _self.cancelReason : cancelReason // ignore: cast_nullable_to_non_nullable
as String?,durationHours: freezed == durationHours ? _self.durationHours : durationHours // ignore: cast_nullable_to_non_nullable
as double?,captainInputKg: freezed == captainInputKg ? _self.captainInputKg : captainInputKg // ignore: cast_nullable_to_non_nullable
as double?,actualWeightKg: freezed == actualWeightKg ? _self.actualWeightKg : actualWeightKg // ignore: cast_nullable_to_non_nullable
as double?,diffKg: freezed == diffKg ? _self.diffKg : diffKg // ignore: cast_nullable_to_non_nullable
as double?,approvedKg: freezed == approvedKg ? _self.approvedKg : approvedKg // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,catchRecords: null == catchRecords ? _self._catchRecords : catchRecords // ignore: cast_nullable_to_non_nullable
as List<CatchRecord>,availableStock: null == availableStock ? _self._availableStock : availableStock // ignore: cast_nullable_to_non_nullable
as List<AvailableLine>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripBoatCopyWith<$Res>? get boat {
    if (_self.boat == null) {
    return null;
  }

  return $TripBoatCopyWith<$Res>(_self.boat!, (value) {
    return _then(_self.copyWith(boat: value));
  });
}/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonRefCopyWith<$Res>? get captain {
    if (_self.captain == null) {
    return null;
  }

  return $PersonRefCopyWith<$Res>(_self.captain!, (value) {
    return _then(_self.copyWith(captain: value));
  });
}/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonRefCopyWith<$Res>? get counter {
    if (_self.counter == null) {
    return null;
  }

  return $PersonRefCopyWith<$Res>(_self.counter!, (value) {
    return _then(_self.copyWith(counter: value));
  });
}/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res>? get departurePort {
    if (_self.departurePort == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.departurePort!, (value) {
    return _then(_self.copyWith(departurePort: value));
  });
}/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res>? get returnPort {
    if (_self.returnPort == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.returnPort!, (value) {
    return _then(_self.copyWith(returnPort: value));
  });
}/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameCopyWith<$Res>? get tripType {
    if (_self.tripType == null) {
    return null;
  }

  return $IdNameCopyWith<$Res>(_self.tripType!, (value) {
    return _then(_self.copyWith(tripType: value));
  });
}
}


/// @nodoc
mixin _$TripBoat {

 int get id; String get name; String? get boatNumber;
/// Create a copy of TripBoat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripBoatCopyWith<TripBoat> get copyWith => _$TripBoatCopyWithImpl<TripBoat>(this as TripBoat, _$identity);

  /// Serializes this TripBoat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TripBoat;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripBoat&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.boatNumber, _this.boatNumber) || other.boatNumber == _this.boatNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TripBoat;
  return Object.hash(runtimeType,_this.id,_this.name,_this.boatNumber);
}

@override
String toString() {
  final _this = this as TripBoat;
  return 'TripBoat(id: ${_this.id}, name: ${_this.name}, boatNumber: ${_this.boatNumber})';
}


}

/// @nodoc
abstract mixin class $TripBoatCopyWith<$Res>  {
  factory $TripBoatCopyWith(TripBoat value, $Res Function(TripBoat) _then) = _$TripBoatCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? boatNumber
});




}
/// @nodoc
class _$TripBoatCopyWithImpl<$Res>
    implements $TripBoatCopyWith<$Res> {
  _$TripBoatCopyWithImpl(this._self, this._then);

  final TripBoat _self;
  final $Res Function(TripBoat) _then;

/// Create a copy of TripBoat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? boatNumber = freezed,}) {
  return _then(TripBoat(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,boatNumber: freezed == boatNumber ? _self.boatNumber : boatNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TripBoat].
extension TripBoatPatterns on TripBoat {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripBoat value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripBoat() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripBoat value)  $default,){
final _that = this;
switch (_that) {
case _TripBoat():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripBoat value)?  $default,){
final _that = this;
switch (_that) {
case _TripBoat() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? boatNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripBoat() when $default != null:
return $default(_that.id,_that.name,_that.boatNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? boatNumber)  $default,) {final _that = this;
switch (_that) {
case _TripBoat():
return $default(_that.id,_that.name,_that.boatNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? boatNumber)?  $default,) {final _that = this;
switch (_that) {
case _TripBoat() when $default != null:
return $default(_that.id,_that.name,_that.boatNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TripBoat implements TripBoat {
  const _TripBoat({required this.id, required this.name, this.boatNumber});
  factory _TripBoat.fromJson(Map<String, dynamic> json) => _$TripBoatFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? boatNumber;

/// Create a copy of TripBoat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripBoatCopyWith<_TripBoat> get copyWith => __$TripBoatCopyWithImpl<_TripBoat>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TripBoatToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripBoat&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.boatNumber, boatNumber) || other.boatNumber == boatNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,boatNumber);
}

@override
String toString() {
    return 'TripBoat(id: $id, name: $name, boatNumber: $boatNumber)';
}


}

/// @nodoc
abstract mixin class _$TripBoatCopyWith<$Res> implements $TripBoatCopyWith<$Res> {
  factory _$TripBoatCopyWith(_TripBoat value, $Res Function(_TripBoat) _then) = __$TripBoatCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? boatNumber
});




}
/// @nodoc
class __$TripBoatCopyWithImpl<$Res>
    implements _$TripBoatCopyWith<$Res> {
  __$TripBoatCopyWithImpl(this._self, this._then);

  final _TripBoat _self;
  final $Res Function(_TripBoat) _then;

/// Create a copy of TripBoat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? boatNumber = freezed,}) {
  return _then(_TripBoat(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,boatNumber: freezed == boatNumber ? _self.boatNumber : boatNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CatchRecord {

 int get id; SpeciesRef? get species; double? get captainKg; double? get countedKg; double get quantityKg; String? get captainNotes; String? get counterNotes; bool get verified; String? get addedBy; DateTime? get recordedAt;
/// Create a copy of CatchRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatchRecordCopyWith<CatchRecord> get copyWith => _$CatchRecordCopyWithImpl<CatchRecord>(this as CatchRecord, _$identity);

  /// Serializes this CatchRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CatchRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatchRecord&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.species, _this.species) || other.species == _this.species)&&(identical(other.captainKg, _this.captainKg) || other.captainKg == _this.captainKg)&&(identical(other.countedKg, _this.countedKg) || other.countedKg == _this.countedKg)&&(identical(other.quantityKg, _this.quantityKg) || other.quantityKg == _this.quantityKg)&&(identical(other.captainNotes, _this.captainNotes) || other.captainNotes == _this.captainNotes)&&(identical(other.counterNotes, _this.counterNotes) || other.counterNotes == _this.counterNotes)&&(identical(other.verified, _this.verified) || other.verified == _this.verified)&&(identical(other.addedBy, _this.addedBy) || other.addedBy == _this.addedBy)&&(identical(other.recordedAt, _this.recordedAt) || other.recordedAt == _this.recordedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CatchRecord;
  return Object.hash(runtimeType,_this.id,_this.species,_this.captainKg,_this.countedKg,_this.quantityKg,_this.captainNotes,_this.counterNotes,_this.verified,_this.addedBy,_this.recordedAt);
}

@override
String toString() {
  final _this = this as CatchRecord;
  return 'CatchRecord(id: ${_this.id}, species: ${_this.species}, captainKg: ${_this.captainKg}, countedKg: ${_this.countedKg}, quantityKg: ${_this.quantityKg}, captainNotes: ${_this.captainNotes}, counterNotes: ${_this.counterNotes}, verified: ${_this.verified}, addedBy: ${_this.addedBy}, recordedAt: ${_this.recordedAt})';
}


}

/// @nodoc
abstract mixin class $CatchRecordCopyWith<$Res>  {
  factory $CatchRecordCopyWith(CatchRecord value, $Res Function(CatchRecord) _then) = _$CatchRecordCopyWithImpl;
@useResult
$Res call({
 int id, SpeciesRef? species, double? captainKg, double? countedKg, double quantityKg, String? captainNotes, String? counterNotes, bool verified, String? addedBy, DateTime? recordedAt
});


$SpeciesRefCopyWith<$Res>? get species;

}
/// @nodoc
class _$CatchRecordCopyWithImpl<$Res>
    implements $CatchRecordCopyWith<$Res> {
  _$CatchRecordCopyWithImpl(this._self, this._then);

  final CatchRecord _self;
  final $Res Function(CatchRecord) _then;

/// Create a copy of CatchRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? species = freezed,Object? captainKg = freezed,Object? countedKg = freezed,Object? quantityKg = null,Object? captainNotes = freezed,Object? counterNotes = freezed,Object? verified = null,Object? addedBy = freezed,Object? recordedAt = freezed,}) {
  return _then(CatchRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,species: freezed == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as SpeciesRef?,captainKg: freezed == captainKg ? _self.captainKg : captainKg // ignore: cast_nullable_to_non_nullable
as double?,countedKg: freezed == countedKg ? _self.countedKg : countedKg // ignore: cast_nullable_to_non_nullable
as double?,quantityKg: null == quantityKg ? _self.quantityKg : quantityKg // ignore: cast_nullable_to_non_nullable
as double,captainNotes: freezed == captainNotes ? _self.captainNotes : captainNotes // ignore: cast_nullable_to_non_nullable
as String?,counterNotes: freezed == counterNotes ? _self.counterNotes : counterNotes // ignore: cast_nullable_to_non_nullable
as String?,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,addedBy: freezed == addedBy ? _self.addedBy : addedBy // ignore: cast_nullable_to_non_nullable
as String?,recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of CatchRecord
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


/// Adds pattern-matching-related methods to [CatchRecord].
extension CatchRecordPatterns on CatchRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatchRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatchRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatchRecord value)  $default,){
final _that = this;
switch (_that) {
case _CatchRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatchRecord value)?  $default,){
final _that = this;
switch (_that) {
case _CatchRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  SpeciesRef? species,  double? captainKg,  double? countedKg,  double quantityKg,  String? captainNotes,  String? counterNotes,  bool verified,  String? addedBy,  DateTime? recordedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatchRecord() when $default != null:
return $default(_that.id,_that.species,_that.captainKg,_that.countedKg,_that.quantityKg,_that.captainNotes,_that.counterNotes,_that.verified,_that.addedBy,_that.recordedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  SpeciesRef? species,  double? captainKg,  double? countedKg,  double quantityKg,  String? captainNotes,  String? counterNotes,  bool verified,  String? addedBy,  DateTime? recordedAt)  $default,) {final _that = this;
switch (_that) {
case _CatchRecord():
return $default(_that.id,_that.species,_that.captainKg,_that.countedKg,_that.quantityKg,_that.captainNotes,_that.counterNotes,_that.verified,_that.addedBy,_that.recordedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  SpeciesRef? species,  double? captainKg,  double? countedKg,  double quantityKg,  String? captainNotes,  String? counterNotes,  bool verified,  String? addedBy,  DateTime? recordedAt)?  $default,) {final _that = this;
switch (_that) {
case _CatchRecord() when $default != null:
return $default(_that.id,_that.species,_that.captainKg,_that.countedKg,_that.quantityKg,_that.captainNotes,_that.counterNotes,_that.verified,_that.addedBy,_that.recordedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatchRecord extends CatchRecord {
  const _CatchRecord({required this.id, this.species, this.captainKg, this.countedKg, this.quantityKg = 0, this.captainNotes, this.counterNotes, this.verified = false, this.addedBy, this.recordedAt}): super._();
  factory _CatchRecord.fromJson(Map<String, dynamic> json) => _$CatchRecordFromJson(json);

@override final  int id;
@override final  SpeciesRef? species;
@override final  double? captainKg;
@override final  double? countedKg;
@override@JsonKey() final  double quantityKg;
@override final  String? captainNotes;
@override final  String? counterNotes;
@override@JsonKey() final  bool verified;
@override final  String? addedBy;
@override final  DateTime? recordedAt;

/// Create a copy of CatchRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatchRecordCopyWith<_CatchRecord> get copyWith => __$CatchRecordCopyWithImpl<_CatchRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatchRecordToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatchRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.species, species) || other.species == species)&&(identical(other.captainKg, captainKg) || other.captainKg == captainKg)&&(identical(other.countedKg, countedKg) || other.countedKg == countedKg)&&(identical(other.quantityKg, quantityKg) || other.quantityKg == quantityKg)&&(identical(other.captainNotes, captainNotes) || other.captainNotes == captainNotes)&&(identical(other.counterNotes, counterNotes) || other.counterNotes == counterNotes)&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.addedBy, addedBy) || other.addedBy == addedBy)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,species,captainKg,countedKg,quantityKg,captainNotes,counterNotes,verified,addedBy,recordedAt);
}

@override
String toString() {
    return 'CatchRecord(id: $id, species: $species, captainKg: $captainKg, countedKg: $countedKg, quantityKg: $quantityKg, captainNotes: $captainNotes, counterNotes: $counterNotes, verified: $verified, addedBy: $addedBy, recordedAt: $recordedAt)';
}


}

/// @nodoc
abstract mixin class _$CatchRecordCopyWith<$Res> implements $CatchRecordCopyWith<$Res> {
  factory _$CatchRecordCopyWith(_CatchRecord value, $Res Function(_CatchRecord) _then) = __$CatchRecordCopyWithImpl;
@override @useResult
$Res call({
 int id, SpeciesRef? species, double? captainKg, double? countedKg, double quantityKg, String? captainNotes, String? counterNotes, bool verified, String? addedBy, DateTime? recordedAt
});


@override $SpeciesRefCopyWith<$Res>? get species;

}
/// @nodoc
class __$CatchRecordCopyWithImpl<$Res>
    implements _$CatchRecordCopyWith<$Res> {
  __$CatchRecordCopyWithImpl(this._self, this._then);

  final _CatchRecord _self;
  final $Res Function(_CatchRecord) _then;

/// Create a copy of CatchRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? species = freezed,Object? captainKg = freezed,Object? countedKg = freezed,Object? quantityKg = null,Object? captainNotes = freezed,Object? counterNotes = freezed,Object? verified = null,Object? addedBy = freezed,Object? recordedAt = freezed,}) {
  return _then(_CatchRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,species: freezed == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as SpeciesRef?,captainKg: freezed == captainKg ? _self.captainKg : captainKg // ignore: cast_nullable_to_non_nullable
as double?,countedKg: freezed == countedKg ? _self.countedKg : countedKg // ignore: cast_nullable_to_non_nullable
as double?,quantityKg: null == quantityKg ? _self.quantityKg : quantityKg // ignore: cast_nullable_to_non_nullable
as double,captainNotes: freezed == captainNotes ? _self.captainNotes : captainNotes // ignore: cast_nullable_to_non_nullable
as String?,counterNotes: freezed == counterNotes ? _self.counterNotes : counterNotes // ignore: cast_nullable_to_non_nullable
as String?,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,addedBy: freezed == addedBy ? _self.addedBy : addedBy // ignore: cast_nullable_to_non_nullable
as String?,recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of CatchRecord
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
mixin _$AvailableLine {

 int get speciesId; String? get species; double get availableKg;
/// Create a copy of AvailableLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailableLineCopyWith<AvailableLine> get copyWith => _$AvailableLineCopyWithImpl<AvailableLine>(this as AvailableLine, _$identity);

  /// Serializes this AvailableLine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AvailableLine;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailableLine&&(identical(other.speciesId, _this.speciesId) || other.speciesId == _this.speciesId)&&(identical(other.species, _this.species) || other.species == _this.species)&&(identical(other.availableKg, _this.availableKg) || other.availableKg == _this.availableKg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AvailableLine;
  return Object.hash(runtimeType,_this.speciesId,_this.species,_this.availableKg);
}

@override
String toString() {
  final _this = this as AvailableLine;
  return 'AvailableLine(speciesId: ${_this.speciesId}, species: ${_this.species}, availableKg: ${_this.availableKg})';
}


}

/// @nodoc
abstract mixin class $AvailableLineCopyWith<$Res>  {
  factory $AvailableLineCopyWith(AvailableLine value, $Res Function(AvailableLine) _then) = _$AvailableLineCopyWithImpl;
@useResult
$Res call({
 int speciesId, String? species, double availableKg
});




}
/// @nodoc
class _$AvailableLineCopyWithImpl<$Res>
    implements $AvailableLineCopyWith<$Res> {
  _$AvailableLineCopyWithImpl(this._self, this._then);

  final AvailableLine _self;
  final $Res Function(AvailableLine) _then;

/// Create a copy of AvailableLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? speciesId = null,Object? species = freezed,Object? availableKg = null,}) {
  return _then(AvailableLine(
speciesId: null == speciesId ? _self.speciesId : speciesId // ignore: cast_nullable_to_non_nullable
as int,species: freezed == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String?,availableKg: null == availableKg ? _self.availableKg : availableKg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [AvailableLine].
extension AvailableLinePatterns on AvailableLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvailableLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvailableLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvailableLine value)  $default,){
final _that = this;
switch (_that) {
case _AvailableLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvailableLine value)?  $default,){
final _that = this;
switch (_that) {
case _AvailableLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int speciesId,  String? species,  double availableKg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvailableLine() when $default != null:
return $default(_that.speciesId,_that.species,_that.availableKg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int speciesId,  String? species,  double availableKg)  $default,) {final _that = this;
switch (_that) {
case _AvailableLine():
return $default(_that.speciesId,_that.species,_that.availableKg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int speciesId,  String? species,  double availableKg)?  $default,) {final _that = this;
switch (_that) {
case _AvailableLine() when $default != null:
return $default(_that.speciesId,_that.species,_that.availableKg);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AvailableLine implements AvailableLine {
  const _AvailableLine({required this.speciesId, this.species, this.availableKg = 0});
  factory _AvailableLine.fromJson(Map<String, dynamic> json) => _$AvailableLineFromJson(json);

@override final  int speciesId;
@override final  String? species;
@override@JsonKey() final  double availableKg;

/// Create a copy of AvailableLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvailableLineCopyWith<_AvailableLine> get copyWith => __$AvailableLineCopyWithImpl<_AvailableLine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvailableLineToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvailableLine&&(identical(other.speciesId, speciesId) || other.speciesId == speciesId)&&(identical(other.species, species) || other.species == species)&&(identical(other.availableKg, availableKg) || other.availableKg == availableKg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,speciesId,species,availableKg);
}

@override
String toString() {
    return 'AvailableLine(speciesId: $speciesId, species: $species, availableKg: $availableKg)';
}


}

/// @nodoc
abstract mixin class _$AvailableLineCopyWith<$Res> implements $AvailableLineCopyWith<$Res> {
  factory _$AvailableLineCopyWith(_AvailableLine value, $Res Function(_AvailableLine) _then) = __$AvailableLineCopyWithImpl;
@override @useResult
$Res call({
 int speciesId, String? species, double availableKg
});




}
/// @nodoc
class __$AvailableLineCopyWithImpl<$Res>
    implements _$AvailableLineCopyWith<$Res> {
  __$AvailableLineCopyWithImpl(this._self, this._then);

  final _AvailableLine _self;
  final $Res Function(_AvailableLine) _then;

/// Create a copy of AvailableLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? speciesId = null,Object? species = freezed,Object? availableKg = null,}) {
  return _then(_AvailableLine(
speciesId: null == speciesId ? _self.speciesId : speciesId // ignore: cast_nullable_to_non_nullable
as int,species: freezed == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String?,availableKg: null == availableKg ? _self.availableKg : availableKg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$TripInput {

 int? get boatId; int? get captainId; int? get departurePortId; int? get returnPortId; int? get tripTypeId; int? get crewCount; DateTime? get departureTime; int? get plannedDays; String? get gearType; String? get licenseNumber; String? get notes;
/// Create a copy of TripInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripInputCopyWith<TripInput> get copyWith => _$TripInputCopyWithImpl<TripInput>(this as TripInput, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TripInput;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripInput&&(identical(other.boatId, _this.boatId) || other.boatId == _this.boatId)&&(identical(other.captainId, _this.captainId) || other.captainId == _this.captainId)&&(identical(other.departurePortId, _this.departurePortId) || other.departurePortId == _this.departurePortId)&&(identical(other.returnPortId, _this.returnPortId) || other.returnPortId == _this.returnPortId)&&(identical(other.tripTypeId, _this.tripTypeId) || other.tripTypeId == _this.tripTypeId)&&(identical(other.crewCount, _this.crewCount) || other.crewCount == _this.crewCount)&&(identical(other.departureTime, _this.departureTime) || other.departureTime == _this.departureTime)&&(identical(other.plannedDays, _this.plannedDays) || other.plannedDays == _this.plannedDays)&&(identical(other.gearType, _this.gearType) || other.gearType == _this.gearType)&&(identical(other.licenseNumber, _this.licenseNumber) || other.licenseNumber == _this.licenseNumber)&&(identical(other.notes, _this.notes) || other.notes == _this.notes));
}


@override
int get hashCode {
  final _this = this as TripInput;
  return Object.hash(runtimeType,_this.boatId,_this.captainId,_this.departurePortId,_this.returnPortId,_this.tripTypeId,_this.crewCount,_this.departureTime,_this.plannedDays,_this.gearType,_this.licenseNumber,_this.notes);
}

@override
String toString() {
  final _this = this as TripInput;
  return 'TripInput(boatId: ${_this.boatId}, captainId: ${_this.captainId}, departurePortId: ${_this.departurePortId}, returnPortId: ${_this.returnPortId}, tripTypeId: ${_this.tripTypeId}, crewCount: ${_this.crewCount}, departureTime: ${_this.departureTime}, plannedDays: ${_this.plannedDays}, gearType: ${_this.gearType}, licenseNumber: ${_this.licenseNumber}, notes: ${_this.notes})';
}


}

/// @nodoc
abstract mixin class $TripInputCopyWith<$Res>  {
  factory $TripInputCopyWith(TripInput value, $Res Function(TripInput) _then) = _$TripInputCopyWithImpl;
@useResult
$Res call({
 int? boatId, int? captainId, int? departurePortId, int? returnPortId, int? tripTypeId, int? crewCount, DateTime? departureTime, int? plannedDays, String? gearType, String? licenseNumber, String? notes
});




}
/// @nodoc
class _$TripInputCopyWithImpl<$Res>
    implements $TripInputCopyWith<$Res> {
  _$TripInputCopyWithImpl(this._self, this._then);

  final TripInput _self;
  final $Res Function(TripInput) _then;

/// Create a copy of TripInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? boatId = freezed,Object? captainId = freezed,Object? departurePortId = freezed,Object? returnPortId = freezed,Object? tripTypeId = freezed,Object? crewCount = freezed,Object? departureTime = freezed,Object? plannedDays = freezed,Object? gearType = freezed,Object? licenseNumber = freezed,Object? notes = freezed,}) {
  return _then(TripInput(
boatId: freezed == boatId ? _self.boatId : boatId // ignore: cast_nullable_to_non_nullable
as int?,captainId: freezed == captainId ? _self.captainId : captainId // ignore: cast_nullable_to_non_nullable
as int?,departurePortId: freezed == departurePortId ? _self.departurePortId : departurePortId // ignore: cast_nullable_to_non_nullable
as int?,returnPortId: freezed == returnPortId ? _self.returnPortId : returnPortId // ignore: cast_nullable_to_non_nullable
as int?,tripTypeId: freezed == tripTypeId ? _self.tripTypeId : tripTypeId // ignore: cast_nullable_to_non_nullable
as int?,crewCount: freezed == crewCount ? _self.crewCount : crewCount // ignore: cast_nullable_to_non_nullable
as int?,departureTime: freezed == departureTime ? _self.departureTime : departureTime // ignore: cast_nullable_to_non_nullable
as DateTime?,plannedDays: freezed == plannedDays ? _self.plannedDays : plannedDays // ignore: cast_nullable_to_non_nullable
as int?,gearType: freezed == gearType ? _self.gearType : gearType // ignore: cast_nullable_to_non_nullable
as String?,licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TripInput].
extension TripInputPatterns on TripInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripInput value)  $default,){
final _that = this;
switch (_that) {
case _TripInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripInput value)?  $default,){
final _that = this;
switch (_that) {
case _TripInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? boatId,  int? captainId,  int? departurePortId,  int? returnPortId,  int? tripTypeId,  int? crewCount,  DateTime? departureTime,  int? plannedDays,  String? gearType,  String? licenseNumber,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripInput() when $default != null:
return $default(_that.boatId,_that.captainId,_that.departurePortId,_that.returnPortId,_that.tripTypeId,_that.crewCount,_that.departureTime,_that.plannedDays,_that.gearType,_that.licenseNumber,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? boatId,  int? captainId,  int? departurePortId,  int? returnPortId,  int? tripTypeId,  int? crewCount,  DateTime? departureTime,  int? plannedDays,  String? gearType,  String? licenseNumber,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _TripInput():
return $default(_that.boatId,_that.captainId,_that.departurePortId,_that.returnPortId,_that.tripTypeId,_that.crewCount,_that.departureTime,_that.plannedDays,_that.gearType,_that.licenseNumber,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? boatId,  int? captainId,  int? departurePortId,  int? returnPortId,  int? tripTypeId,  int? crewCount,  DateTime? departureTime,  int? plannedDays,  String? gearType,  String? licenseNumber,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _TripInput() when $default != null:
return $default(_that.boatId,_that.captainId,_that.departurePortId,_that.returnPortId,_that.tripTypeId,_that.crewCount,_that.departureTime,_that.plannedDays,_that.gearType,_that.licenseNumber,_that.notes);case _:
  return null;

}
}

}

/// @nodoc


class _TripInput implements TripInput {
  const _TripInput({this.boatId, this.captainId, this.departurePortId, this.returnPortId, this.tripTypeId, this.crewCount, this.departureTime, this.plannedDays, this.gearType, this.licenseNumber, this.notes});
  

@override final  int? boatId;
@override final  int? captainId;
@override final  int? departurePortId;
@override final  int? returnPortId;
@override final  int? tripTypeId;
@override final  int? crewCount;
@override final  DateTime? departureTime;
@override final  int? plannedDays;
@override final  String? gearType;
@override final  String? licenseNumber;
@override final  String? notes;

/// Create a copy of TripInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripInputCopyWith<_TripInput> get copyWith => __$TripInputCopyWithImpl<_TripInput>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripInput&&(identical(other.boatId, boatId) || other.boatId == boatId)&&(identical(other.captainId, captainId) || other.captainId == captainId)&&(identical(other.departurePortId, departurePortId) || other.departurePortId == departurePortId)&&(identical(other.returnPortId, returnPortId) || other.returnPortId == returnPortId)&&(identical(other.tripTypeId, tripTypeId) || other.tripTypeId == tripTypeId)&&(identical(other.crewCount, crewCount) || other.crewCount == crewCount)&&(identical(other.departureTime, departureTime) || other.departureTime == departureTime)&&(identical(other.plannedDays, plannedDays) || other.plannedDays == plannedDays)&&(identical(other.gearType, gearType) || other.gearType == gearType)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,boatId,captainId,departurePortId,returnPortId,tripTypeId,crewCount,departureTime,plannedDays,gearType,licenseNumber,notes);
}

@override
String toString() {
    return 'TripInput(boatId: $boatId, captainId: $captainId, departurePortId: $departurePortId, returnPortId: $returnPortId, tripTypeId: $tripTypeId, crewCount: $crewCount, departureTime: $departureTime, plannedDays: $plannedDays, gearType: $gearType, licenseNumber: $licenseNumber, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$TripInputCopyWith<$Res> implements $TripInputCopyWith<$Res> {
  factory _$TripInputCopyWith(_TripInput value, $Res Function(_TripInput) _then) = __$TripInputCopyWithImpl;
@override @useResult
$Res call({
 int? boatId, int? captainId, int? departurePortId, int? returnPortId, int? tripTypeId, int? crewCount, DateTime? departureTime, int? plannedDays, String? gearType, String? licenseNumber, String? notes
});




}
/// @nodoc
class __$TripInputCopyWithImpl<$Res>
    implements _$TripInputCopyWith<$Res> {
  __$TripInputCopyWithImpl(this._self, this._then);

  final _TripInput _self;
  final $Res Function(_TripInput) _then;

/// Create a copy of TripInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? boatId = freezed,Object? captainId = freezed,Object? departurePortId = freezed,Object? returnPortId = freezed,Object? tripTypeId = freezed,Object? crewCount = freezed,Object? departureTime = freezed,Object? plannedDays = freezed,Object? gearType = freezed,Object? licenseNumber = freezed,Object? notes = freezed,}) {
  return _then(_TripInput(
boatId: freezed == boatId ? _self.boatId : boatId // ignore: cast_nullable_to_non_nullable
as int?,captainId: freezed == captainId ? _self.captainId : captainId // ignore: cast_nullable_to_non_nullable
as int?,departurePortId: freezed == departurePortId ? _self.departurePortId : departurePortId // ignore: cast_nullable_to_non_nullable
as int?,returnPortId: freezed == returnPortId ? _self.returnPortId : returnPortId // ignore: cast_nullable_to_non_nullable
as int?,tripTypeId: freezed == tripTypeId ? _self.tripTypeId : tripTypeId // ignore: cast_nullable_to_non_nullable
as int?,crewCount: freezed == crewCount ? _self.crewCount : crewCount // ignore: cast_nullable_to_non_nullable
as int?,departureTime: freezed == departureTime ? _self.departureTime : departureTime // ignore: cast_nullable_to_non_nullable
as DateTime?,plannedDays: freezed == plannedDays ? _self.plannedDays : plannedDays // ignore: cast_nullable_to_non_nullable
as int?,gearType: freezed == gearType ? _self.gearType : gearType // ignore: cast_nullable_to_non_nullable
as String?,licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CatchLineInput {

 int get speciesId; double get weightKg; String? get notes;
/// Create a copy of CatchLineInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatchLineInputCopyWith<CatchLineInput> get copyWith => _$CatchLineInputCopyWithImpl<CatchLineInput>(this as CatchLineInput, _$identity);

  /// Serializes this CatchLineInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CatchLineInput;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatchLineInput&&(identical(other.speciesId, _this.speciesId) || other.speciesId == _this.speciesId)&&(identical(other.weightKg, _this.weightKg) || other.weightKg == _this.weightKg)&&(identical(other.notes, _this.notes) || other.notes == _this.notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CatchLineInput;
  return Object.hash(runtimeType,_this.speciesId,_this.weightKg,_this.notes);
}

@override
String toString() {
  final _this = this as CatchLineInput;
  return 'CatchLineInput(speciesId: ${_this.speciesId}, weightKg: ${_this.weightKg}, notes: ${_this.notes})';
}


}

/// @nodoc
abstract mixin class $CatchLineInputCopyWith<$Res>  {
  factory $CatchLineInputCopyWith(CatchLineInput value, $Res Function(CatchLineInput) _then) = _$CatchLineInputCopyWithImpl;
@useResult
$Res call({
 int speciesId, double weightKg, String? notes
});




}
/// @nodoc
class _$CatchLineInputCopyWithImpl<$Res>
    implements $CatchLineInputCopyWith<$Res> {
  _$CatchLineInputCopyWithImpl(this._self, this._then);

  final CatchLineInput _self;
  final $Res Function(CatchLineInput) _then;

/// Create a copy of CatchLineInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? speciesId = null,Object? weightKg = null,Object? notes = freezed,}) {
  return _then(CatchLineInput(
speciesId: null == speciesId ? _self.speciesId : speciesId // ignore: cast_nullable_to_non_nullable
as int,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CatchLineInput].
extension CatchLineInputPatterns on CatchLineInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatchLineInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatchLineInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatchLineInput value)  $default,){
final _that = this;
switch (_that) {
case _CatchLineInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatchLineInput value)?  $default,){
final _that = this;
switch (_that) {
case _CatchLineInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int speciesId,  double weightKg,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatchLineInput() when $default != null:
return $default(_that.speciesId,_that.weightKg,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int speciesId,  double weightKg,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _CatchLineInput():
return $default(_that.speciesId,_that.weightKg,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int speciesId,  double weightKg,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _CatchLineInput() when $default != null:
return $default(_that.speciesId,_that.weightKg,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatchLineInput implements CatchLineInput {
  const _CatchLineInput({required this.speciesId, required this.weightKg, this.notes});
  factory _CatchLineInput.fromJson(Map<String, dynamic> json) => _$CatchLineInputFromJson(json);

@override final  int speciesId;
@override final  double weightKg;
@override final  String? notes;

/// Create a copy of CatchLineInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatchLineInputCopyWith<_CatchLineInput> get copyWith => __$CatchLineInputCopyWithImpl<_CatchLineInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatchLineInputToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatchLineInput&&(identical(other.speciesId, speciesId) || other.speciesId == speciesId)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,speciesId,weightKg,notes);
}

@override
String toString() {
    return 'CatchLineInput(speciesId: $speciesId, weightKg: $weightKg, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$CatchLineInputCopyWith<$Res> implements $CatchLineInputCopyWith<$Res> {
  factory _$CatchLineInputCopyWith(_CatchLineInput value, $Res Function(_CatchLineInput) _then) = __$CatchLineInputCopyWithImpl;
@override @useResult
$Res call({
 int speciesId, double weightKg, String? notes
});




}
/// @nodoc
class __$CatchLineInputCopyWithImpl<$Res>
    implements _$CatchLineInputCopyWith<$Res> {
  __$CatchLineInputCopyWithImpl(this._self, this._then);

  final _CatchLineInput _self;
  final $Res Function(_CatchLineInput) _then;

/// Create a copy of CatchLineInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? speciesId = null,Object? weightKg = null,Object? notes = freezed,}) {
  return _then(_CatchLineInput(
speciesId: null == speciesId ? _self.speciesId : speciesId // ignore: cast_nullable_to_non_nullable
as int,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
