import 'package:freezed_annotation/freezed_annotation.dart';

import '../../fleet/data/fleet.dart';
import '../../sales/data/sale.dart';
import '../../stock/data/stock.dart';
import '../../trips/data/trip.dart';

export '../../stock/data/stock.dart' show StockLine;

part 'dashboard.freezed.dart';
part 'dashboard.g.dart';

/// The home's period chip; the server sums revenue, invoices and counted catch over it.
enum DashboardPeriod {
  today('today'),
  month('month'),
  year('year');

  const DashboardPeriod(this.apiValue);

  final String apiValue;

  static DashboardPeriod parse(String? value) =>
      DashboardPeriod.values.where((p) => p.apiValue == value).firstOrNull ?? DashboardPeriod.month;
}

@freezed
abstract class Dashboard with _$Dashboard {
  const Dashboard._();

  const factory Dashboard({
    String? period,
    required DashboardKpis kpis,
    @Default(ActionItems()) ActionItems actionItems,
    @Default(<RevenuePoint>[]) List<RevenuePoint> revenueByMonth,
    @Default(<StockLine>[]) List<StockLine> stock,
    @Default(<Trip>[]) List<Trip> scheduledTrips,
    @Default(<Trip>[]) List<Trip> activeTrips,
    @Default(<Sale>[]) List<Sale> recentSales,

    /// Null from a server before API 1.10.0: see [fleetFrom], [catchToSell], [debts].
    List<FleetBoat>? fleet,
    List<Trip>? tripsToSell,
    List<Sale>? unpaidSales,
  }) = _Dashboard;

  factory Dashboard.fromJson(Map<String, dynamic> json) => _$DashboardFromJson(json);

  bool get hasPendingActions =>
      actionItems.tripsToStart > 0 || actionItems.tripsToSell > 0 || actionItems.unpaidSales > 0;

  /// The fleet as a server before API 1.10.0 allows: the boats list, each
  /// boat with its trip from the home's active and scheduled trips (at sea,
  /// else the next scheduled, else one at the counter).
  List<FleetBoat> fleetFrom(List<Boat> boats) {
    int rank(Trip trip) => switch (trip.phase) {
      TripPhase.atSea => 0,
      TripPhase.scheduled => 1,
      TripPhase.awaitingCounter || TripPhase.counting => 2,
      _ => 9,
    };
    Trip? tripOf(int boatId) {
      final open = [...activeTrips, ...scheduledTrips].where((t) => t.boat?.id == boatId && rank(t) < 9).toList();
      return (open..sort((a, b) => rank(a).compareTo(rank(b)))).firstOrNull;
    }

    return [
      for (final boat in boats)
        if (tripOf(boat.id) case final trip when trip != null || boat.status != 'غير نشط')
          FleetBoat(id: boat.id, name: boat.name, boatNumber: boat.boatNumber, status: boat.status, trip: trip),
    ];
  }

  /// Counted catch waiting to be sold, the oldest count first.
  List<Trip> get catchToSell =>
      tripsToSell ??
      ([
        for (final trip in activeTrips)
          if (trip.phase == TripPhase.forSale) trip,
      ]..sort((a, b) => (a.countedAt ?? DateTime(9999)).compareTo(b.countedAt ?? DateTime(9999))));

  /// Invoices with money still due, the oldest first.
  List<Sale> get debts =>
      unpaidSales ??
      ([
        for (final sale in recentSales)
          if (sale.remaining > 0.004) sale,
      ]..sort((a, b) => (a.soldAt ?? DateTime(9999)).compareTo(b.soldAt ?? DateTime(9999))));
}

@freezed
abstract class DashboardKpis with _$DashboardKpis {
  const factory DashboardKpis({
    @Default(0) double revenue,

    /// The previous period up to the same moment in it; null for all time.
    double? previousRevenue,

    /// The period's revenue in two parts; null from a server before API 1.10.0.
    double? collected,
    double? uncollected,
    @Default(0) double catchKg,
    @Default(0) int activeBoats,
    @Default(0) int boats,
    @Default(0) int tripsScheduled,
    @Default(0) int tripsAtSea,
    @Default(0) int tripsAwaitingCount,
    @Default(0) int tripsForSale,
    @Default(0) int salesCount,
    @Default(0) double unpaid,
    @Default(0) int customers,
  }) = _DashboardKpis;

  factory DashboardKpis.fromJson(Map<String, dynamic> json) => _$DashboardKpisFromJson(json);
}

/// A boat and the trip it is on now: at sea, else its next scheduled one,
/// else one at the counter, else none (in port).
@freezed
abstract class FleetBoat with _$FleetBoat {
  const factory FleetBoat({required int id, required String name, String? boatNumber, String? status, Trip? trip}) =
      _FleetBoat;

  factory FleetBoat.fromJson(Map<String, dynamic> json) => _$FleetBoatFromJson(json);
}

@freezed
abstract class ActionItems with _$ActionItems {
  const factory ActionItems({
    @Default(0) int tripsToStart,
    @Default(0) int tripsToSell,
    @Default(0) int unpaidSales,
    @Default(0) double unpaidTotal,
  }) = _ActionItems;

  factory ActionItems.fromJson(Map<String, dynamic> json) => _$ActionItemsFromJson(json);
}

@freezed
abstract class RevenuePoint with _$RevenuePoint {
  const factory RevenuePoint({required String month, String? label, @Default(0) double total}) = _RevenuePoint;

  factory RevenuePoint.fromJson(Map<String, dynamic> json) => _$RevenuePointFromJson(json);
}
