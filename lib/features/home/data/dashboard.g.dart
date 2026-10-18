// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Dashboard _$DashboardFromJson(Map<String, dynamic> json) => _Dashboard(
  period: json['period'] as String?,
  kpis: DashboardKpis.fromJson(json['kpis'] as Map<String, dynamic>),
  actionItems: json['action_items'] == null
      ? const ActionItems()
      : ActionItems.fromJson(json['action_items'] as Map<String, dynamic>),
  revenueByMonth:
      (json['revenue_by_month'] as List<dynamic>?)
          ?.map((e) => RevenuePoint.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <RevenuePoint>[],
  stock:
      (json['stock'] as List<dynamic>?)?.map((e) => StockLine.fromJson(e as Map<String, dynamic>)).toList() ??
      const <StockLine>[],
  scheduledTrips:
      (json['scheduled_trips'] as List<dynamic>?)?.map((e) => Trip.fromJson(e as Map<String, dynamic>)).toList() ??
      const <Trip>[],
  activeTrips:
      (json['active_trips'] as List<dynamic>?)?.map((e) => Trip.fromJson(e as Map<String, dynamic>)).toList() ??
      const <Trip>[],
  recentSales:
      (json['recent_sales'] as List<dynamic>?)?.map((e) => Sale.fromJson(e as Map<String, dynamic>)).toList() ??
      const <Sale>[],
);

Map<String, dynamic> _$DashboardToJson(_Dashboard instance) => <String, dynamic>{
  'period': instance.period,
  'kpis': instance.kpis.toJson(),
  'action_items': instance.actionItems.toJson(),
  'revenue_by_month': instance.revenueByMonth.map((e) => e.toJson()).toList(),
  'stock': instance.stock.map((e) => e.toJson()).toList(),
  'scheduled_trips': instance.scheduledTrips.map((e) => e.toJson()).toList(),
  'active_trips': instance.activeTrips.map((e) => e.toJson()).toList(),
  'recent_sales': instance.recentSales.map((e) => e.toJson()).toList(),
};

_DashboardKpis _$DashboardKpisFromJson(Map<String, dynamic> json) => _DashboardKpis(
  revenue: (json['revenue'] as num?)?.toDouble() ?? 0,
  catchKg: (json['catch_kg'] as num?)?.toDouble() ?? 0,
  activeBoats: (json['active_boats'] as num?)?.toInt() ?? 0,
  boats: (json['boats'] as num?)?.toInt() ?? 0,
  tripsScheduled: (json['trips_scheduled'] as num?)?.toInt() ?? 0,
  tripsAtSea: (json['trips_at_sea'] as num?)?.toInt() ?? 0,
  tripsAwaitingCount: (json['trips_awaiting_count'] as num?)?.toInt() ?? 0,
  tripsForSale: (json['trips_for_sale'] as num?)?.toInt() ?? 0,
  salesCount: (json['sales_count'] as num?)?.toInt() ?? 0,
  unpaid: (json['unpaid'] as num?)?.toDouble() ?? 0,
  customers: (json['customers'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$DashboardKpisToJson(_DashboardKpis instance) => <String, dynamic>{
  'revenue': instance.revenue,
  'catch_kg': instance.catchKg,
  'active_boats': instance.activeBoats,
  'boats': instance.boats,
  'trips_scheduled': instance.tripsScheduled,
  'trips_at_sea': instance.tripsAtSea,
  'trips_awaiting_count': instance.tripsAwaitingCount,
  'trips_for_sale': instance.tripsForSale,
  'sales_count': instance.salesCount,
  'unpaid': instance.unpaid,
  'customers': instance.customers,
};

_ActionItems _$ActionItemsFromJson(Map<String, dynamic> json) => _ActionItems(
  tripsToStart: (json['trips_to_start'] as num?)?.toInt() ?? 0,
  tripsToSell: (json['trips_to_sell'] as num?)?.toInt() ?? 0,
  unpaidSales: (json['unpaid_sales'] as num?)?.toInt() ?? 0,
  unpaidTotal: (json['unpaid_total'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$ActionItemsToJson(_ActionItems instance) => <String, dynamic>{
  'trips_to_start': instance.tripsToStart,
  'trips_to_sell': instance.tripsToSell,
  'unpaid_sales': instance.unpaidSales,
  'unpaid_total': instance.unpaidTotal,
};

_RevenuePoint _$RevenuePointFromJson(Map<String, dynamic> json) => _RevenuePoint(
  month: json['month'] as String,
  label: json['label'] as String?,
  total: (json['total'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$RevenuePointToJson(_RevenuePoint instance) => <String, dynamic>{
  'month': instance.month,
  'label': instance.label,
  'total': instance.total,
};

_StockLine _$StockLineFromJson(Map<String, dynamic> json) => _StockLine(
  speciesId: (json['species_id'] as num).toInt(),
  species: json['species'] as String?,
  nameSci: json['name_sci'] as String?,
  weightKg: (json['weight_kg'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$StockLineToJson(_StockLine instance) => <String, dynamic>{
  'species_id': instance.speciesId,
  'species': instance.species,
  'name_sci': instance.nameSci,
  'weight_kg': instance.weightKg,
};
