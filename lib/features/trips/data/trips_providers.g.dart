// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trips_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TripsList)
final tripsListProvider = TripsListFamily._();

final class TripsListProvider extends $AsyncNotifierProvider<TripsList, PagedList<Trip>> {
  TripsListProvider._({required TripsListFamily super.from, required TripsQuery super.argument})
    : super(
        retry: null,
        name: r'tripsListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripsListHash();

  @override
  String toString() {
    return r'tripsListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TripsList create() => TripsList();

  @override
  bool operator ==(Object other) {
    return other is TripsListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tripsListHash() => r'a94365cce4addca26bd722eb3c8a1a8dac090970';

final class TripsListFamily extends $Family
    with
        $ClassFamilyOverride<
          TripsList,
          AsyncValue<PagedList<Trip>>,
          PagedList<Trip>,
          FutureOr<PagedList<Trip>>,
          TripsQuery
        > {
  TripsListFamily._()
    : super(
        retry: null,
        name: r'tripsListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TripsListProvider call(TripsQuery query) => TripsListProvider._(argument: query, from: this);

  @override
  String toString() => r'tripsListProvider';
}

abstract class _$TripsList extends $AsyncNotifier<PagedList<Trip>> {
  late final _$args = ref.$arg as TripsQuery;
  TripsQuery get query => _$args;

  FutureOr<PagedList<Trip>> build(TripsQuery query);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<PagedList<Trip>>, PagedList<Trip>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PagedList<Trip>>, PagedList<Trip>>,
              AsyncValue<PagedList<Trip>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}

/// One trip with its catch lines and what is still available to sell.

@ProviderFor(TripDetail)
final tripDetailProvider = TripDetailFamily._();

/// One trip with its catch lines and what is still available to sell.
final class TripDetailProvider extends $AsyncNotifierProvider<TripDetail, Trip> {
  /// One trip with its catch lines and what is still available to sell.
  TripDetailProvider._({required TripDetailFamily super.from, required int super.argument})
    : super(
        retry: null,
        name: r'tripDetailProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripDetailHash();

  @override
  String toString() {
    return r'tripDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TripDetail create() => TripDetail();

  @override
  bool operator ==(Object other) {
    return other is TripDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tripDetailHash() => r'70443c955d93b9c8cc81e33e09bbf1ef568cef16';

/// One trip with its catch lines and what is still available to sell.

final class TripDetailFamily extends $Family
    with $ClassFamilyOverride<TripDetail, AsyncValue<Trip>, Trip, FutureOr<Trip>, int> {
  TripDetailFamily._()
    : super(
        retry: null,
        name: r'tripDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// One trip with its catch lines and what is still available to sell.

  TripDetailProvider call(int id) => TripDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'tripDetailProvider';
}

/// One trip with its catch lines and what is still available to sell.

abstract class _$TripDetail extends $AsyncNotifier<Trip> {
  late final _$args = ref.$arg as int;
  int get id => _$args;

  FutureOr<Trip> build(int id);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Trip>, Trip>;
    final element =
        ref.element as $ClassProviderElement<AnyNotifier<AsyncValue<Trip>, Trip>, AsyncValue<Trip>, Object?, Object?>;
    return element.handleCreate(ref, () => build(_$args));
  }
}

/// The sales and consignments of one trip, once its catch is on sale.

@ProviderFor(tripSales)
final tripSalesProvider = TripSalesFamily._();

/// The sales and consignments of one trip, once its catch is on sale.

final class TripSalesProvider
    extends
        $FunctionalProvider<
          AsyncValue<(List<Sale>, List<Consignment>)>,
          (List<Sale>, List<Consignment>),
          FutureOr<(List<Sale>, List<Consignment>)>
        >
    with $FutureModifier<(List<Sale>, List<Consignment>)>, $FutureProvider<(List<Sale>, List<Consignment>)> {
  /// The sales and consignments of one trip, once its catch is on sale.
  TripSalesProvider._({required TripSalesFamily super.from, required int super.argument})
    : super(
        retry: null,
        name: r'tripSalesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripSalesHash();

  @override
  String toString() {
    return r'tripSalesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<(List<Sale>, List<Consignment>)> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<(List<Sale>, List<Consignment>)> create(Ref ref) {
    final argument = this.argument as int;
    return tripSales(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is TripSalesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tripSalesHash() => r'bf29b8bfc85ca22271affd1f5ed359f1e5ccbcda';

/// The sales and consignments of one trip, once its catch is on sale.

final class TripSalesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<(List<Sale>, List<Consignment>)>, int> {
  TripSalesFamily._()
    : super(
        retry: null,
        name: r'tripSalesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// The sales and consignments of one trip, once its catch is on sale.

  TripSalesProvider call(int tripId) => TripSalesProvider._(argument: tripId, from: this);

  @override
  String toString() => r'tripSalesProvider';
}

/// Trip actions from any screen (home, list, trip screen). Each one updates
/// the open trip screen with the server's answer and reloads the lists and
/// the home, so counts never disagree.

@ProviderFor(tripActions)
final tripActionsProvider = TripActionsProvider._();

/// Trip actions from any screen (home, list, trip screen). Each one updates
/// the open trip screen with the server's answer and reloads the lists and
/// the home, so counts never disagree.

final class TripActionsProvider extends $FunctionalProvider<TripActions, TripActions, TripActions>
    with $Provider<TripActions> {
  /// Trip actions from any screen (home, list, trip screen). Each one updates
  /// the open trip screen with the server's answer and reloads the lists and
  /// the home, so counts never disagree.
  TripActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripActionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripActionsHash();

  @$internal
  @override
  $ProviderElement<TripActions> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  TripActions create(Ref ref) {
    return tripActions(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripActions value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<TripActions>(value));
  }
}

String _$tripActionsHash() => r'783c42eaaa4f1e1be7dc45d763d2663509b8d8c1';
