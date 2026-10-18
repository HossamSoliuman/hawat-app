import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/trips/data/trip.dart';
import 'router.dart';

part 'nav_requests.g.dart';

/// "Open the trips list on this tab", from the home rows and the pipeline.
/// Every request is new (a serial), so asking twice for the same tab still
/// switches back to it after the owner moved to another one by hand.
class TabRequest<T> {
  const TabRequest(this.value, this.serial);

  final T value;
  final int serial;
}

@Riverpod(keepAlive: true)
class TripsTabRequest extends _$TripsTabRequest {
  @override
  TabRequest<TripStage>? build() => null;

  void open(TripStage stage) => state = TabRequest(stage, (state?.serial ?? 0) + 1);
}

/// "Open the sales list with only the unpaid invoices" (or all of them).
@Riverpod(keepAlive: true)
class SalesFilterRequest extends _$SalesFilterRequest {
  @override
  TabRequest<bool>? build() => null;

  void open({required bool unpaidOnly}) => state = TabRequest(unpaidOnly, (state?.serial ?? 0) + 1);
}

/// Switches to the trips tab on [stage], even if it is already open on another tab.
void openTrips(BuildContext context, WidgetRef ref, TripStage stage) {
  ref.read(tripsTabRequestProvider.notifier).open(stage);
  context.go(Routes.tripsAt(stage));
}

/// Switches to the sales tab, with only the unpaid invoices or all of them.
void openSales(BuildContext context, WidgetRef ref, {bool unpaidOnly = false}) {
  ref.read(salesFilterRequestProvider.notifier).open(unpaidOnly: unpaidOnly);
  context.go(unpaidOnly ? Routes.unpaidSales() : Routes.sales);
}
