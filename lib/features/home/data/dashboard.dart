import 'package:freezed_annotation/freezed_annotation.dart';

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
  }) = _Dashboard;

  factory Dashboard.fromJson(Map<String, dynamic> json) => _$DashboardFromJson(json);

  bool get hasPendingActions =>
      actionItems.tripsToStart > 0 || actionItems.tripsToSell > 0 || actionItems.unpaidSales > 0;
}

@freezed
abstract class DashboardKpis with _$DashboardKpis {
  const factory DashboardKpis({
    @Default(0) double revenue,
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
