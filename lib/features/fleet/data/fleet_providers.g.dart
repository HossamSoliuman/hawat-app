// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fleet_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(boatsRepository)
final boatsRepositoryProvider = BoatsRepositoryProvider._();

final class BoatsRepositoryProvider
    extends
        $FunctionalProvider<
          ResourceRepository<Boat>,
          ResourceRepository<Boat>,
          ResourceRepository<Boat>
        >
    with $Provider<ResourceRepository<Boat>> {
  BoatsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'boatsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$boatsRepositoryHash();

  @$internal
  @override
  $ProviderElement<ResourceRepository<Boat>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ResourceRepository<Boat> create(Ref ref) {
    return boatsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResourceRepository<Boat> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResourceRepository<Boat>>(value),
    );
  }
}

String _$boatsRepositoryHash() => r'5b67f5b6c2a8cfcb466a2cbff9569b4f5e3db0cb';

@ProviderFor(fishersRepository)
final fishersRepositoryProvider = FishersRepositoryFamily._();

final class FishersRepositoryProvider
    extends
        $FunctionalProvider<
          FishersRepository,
          FishersRepository,
          FishersRepository
        >
    with $Provider<FishersRepository> {
  FishersRepositoryProvider._({
    required FishersRepositoryFamily super.from,
    required FisherKind super.argument,
  }) : super(
         retry: null,
         name: r'fishersRepositoryProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fishersRepositoryHash();

  @override
  String toString() {
    return r'fishersRepositoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<FishersRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FishersRepository create(Ref ref) {
    final argument = this.argument as FisherKind;
    return fishersRepository(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FishersRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FishersRepository>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FishersRepositoryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fishersRepositoryHash() => r'd30064c2de1d07890265379fd7d10ee0955c063a';

final class FishersRepositoryFamily extends $Family
    with $FunctionalFamilyOverride<FishersRepository, FisherKind> {
  FishersRepositoryFamily._()
    : super(
        retry: null,
        name: r'fishersRepositoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  FishersRepositoryProvider call(FisherKind kind) =>
      FishersRepositoryProvider._(argument: kind, from: this);

  @override
  String toString() => r'fishersRepositoryProvider';
}

@ProviderFor(maintenanceRepository)
final maintenanceRepositoryProvider = MaintenanceRepositoryProvider._();

final class MaintenanceRepositoryProvider
    extends
        $FunctionalProvider<
          ResourceRepository<Maintenance>,
          ResourceRepository<Maintenance>,
          ResourceRepository<Maintenance>
        >
    with $Provider<ResourceRepository<Maintenance>> {
  MaintenanceRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'maintenanceRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$maintenanceRepositoryHash();

  @$internal
  @override
  $ProviderElement<ResourceRepository<Maintenance>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ResourceRepository<Maintenance> create(Ref ref) {
    return maintenanceRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResourceRepository<Maintenance> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResourceRepository<Maintenance>>(
        value,
      ),
    );
  }
}

String _$maintenanceRepositoryHash() =>
    r'e32a48a47f3e7094fb27741984e70f3238724c3c';

@ProviderFor(BoatsList)
final boatsListProvider = BoatsListFamily._();

final class BoatsListProvider
    extends $AsyncNotifierProvider<BoatsList, PagedList<Boat>> {
  BoatsListProvider._({
    required BoatsListFamily super.from,
    required ({String search, String? status}) super.argument,
  }) : super(
         retry: null,
         name: r'boatsListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$boatsListHash();

  @override
  String toString() {
    return r'boatsListProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  BoatsList create() => BoatsList();

  @override
  bool operator ==(Object other) {
    return other is BoatsListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$boatsListHash() => r'4c05661ee8c77f855cb59b18d75d46b29cd5913c';

final class BoatsListFamily extends $Family
    with
        $ClassFamilyOverride<
          BoatsList,
          AsyncValue<PagedList<Boat>>,
          PagedList<Boat>,
          FutureOr<PagedList<Boat>>,
          ({String search, String? status})
        > {
  BoatsListFamily._()
    : super(
        retry: null,
        name: r'boatsListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BoatsListProvider call({String search = '', String? status}) =>
      BoatsListProvider._(
        argument: (search: search, status: status),
        from: this,
      );

  @override
  String toString() => r'boatsListProvider';
}

abstract class _$BoatsList extends $AsyncNotifier<PagedList<Boat>> {
  late final _$args = ref.$arg as ({String search, String? status});
  String get search => _$args.search;
  String? get status => _$args.status;

  FutureOr<PagedList<Boat>> build({String search = '', String? status});
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<PagedList<Boat>>, PagedList<Boat>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PagedList<Boat>>, PagedList<Boat>>,
              AsyncValue<PagedList<Boat>>,
              Object?,
              Object?
            >;
    return element.handleCreate(
      ref,
      () => build(search: _$args.search, status: _$args.status),
    );
  }
}

@ProviderFor(BoatDetail)
final boatDetailProvider = BoatDetailFamily._();

final class BoatDetailProvider
    extends $AsyncNotifierProvider<BoatDetail, Boat> {
  BoatDetailProvider._({
    required BoatDetailFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'boatDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$boatDetailHash();

  @override
  String toString() {
    return r'boatDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  BoatDetail create() => BoatDetail();

  @override
  bool operator ==(Object other) {
    return other is BoatDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$boatDetailHash() => r'd15d7a02bc3d937ee3a5f5b13b4e0e2dbeec8f7e';

final class BoatDetailFamily extends $Family
    with
        $ClassFamilyOverride<
          BoatDetail,
          AsyncValue<Boat>,
          Boat,
          FutureOr<Boat>,
          int
        > {
  BoatDetailFamily._()
    : super(
        retry: null,
        name: r'boatDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BoatDetailProvider call(int id) =>
      BoatDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'boatDetailProvider';
}

abstract class _$BoatDetail extends $AsyncNotifier<Boat> {
  late final _$args = ref.$arg as int;
  int get id => _$args;

  FutureOr<Boat> build(int id);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Boat>, Boat>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Boat>, Boat>,
              AsyncValue<Boat>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(FishersList)
final fishersListProvider = FishersListFamily._();

final class FishersListProvider
    extends $AsyncNotifierProvider<FishersList, PagedList<Fisher>> {
  FishersListProvider._({
    required FishersListFamily super.from,
    required (FisherKind, {String search, int? boatId}) super.argument,
  }) : super(
         retry: null,
         name: r'fishersListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fishersListHash();

  @override
  String toString() {
    return r'fishersListProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  FishersList create() => FishersList();

  @override
  bool operator ==(Object other) {
    return other is FishersListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fishersListHash() => r'c165013b186186928a0285cff2676dafd0505eda';

final class FishersListFamily extends $Family
    with
        $ClassFamilyOverride<
          FishersList,
          AsyncValue<PagedList<Fisher>>,
          PagedList<Fisher>,
          FutureOr<PagedList<Fisher>>,
          (FisherKind, {String search, int? boatId})
        > {
  FishersListFamily._()
    : super(
        retry: null,
        name: r'fishersListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FishersListProvider call(
    FisherKind kind, {
    String search = '',
    int? boatId,
  }) => FishersListProvider._(
    argument: (kind, search: search, boatId: boatId),
    from: this,
  );

  @override
  String toString() => r'fishersListProvider';
}

abstract class _$FishersList extends $AsyncNotifier<PagedList<Fisher>> {
  late final _$args = ref.$arg as (FisherKind, {String search, int? boatId});
  FisherKind get kind => _$args.$1;
  String get search => _$args.search;
  int? get boatId => _$args.boatId;

  FutureOr<PagedList<Fisher>> build(
    FisherKind kind, {
    String search = '',
    int? boatId,
  });
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<PagedList<Fisher>>, PagedList<Fisher>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PagedList<Fisher>>, PagedList<Fisher>>,
              AsyncValue<PagedList<Fisher>>,
              Object?,
              Object?
            >;
    return element.handleCreate(
      ref,
      () => build(_$args.$1, search: _$args.search, boatId: _$args.boatId),
    );
  }
}

@ProviderFor(FisherDetail)
final fisherDetailProvider = FisherDetailFamily._();

final class FisherDetailProvider
    extends $AsyncNotifierProvider<FisherDetail, Fisher> {
  FisherDetailProvider._({
    required FisherDetailFamily super.from,
    required (FisherKind, int) super.argument,
  }) : super(
         retry: null,
         name: r'fisherDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fisherDetailHash();

  @override
  String toString() {
    return r'fisherDetailProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  FisherDetail create() => FisherDetail();

  @override
  bool operator ==(Object other) {
    return other is FisherDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fisherDetailHash() => r'f3b0bda01e621ba6cd76338fc8179885c0fee529';

final class FisherDetailFamily extends $Family
    with
        $ClassFamilyOverride<
          FisherDetail,
          AsyncValue<Fisher>,
          Fisher,
          FutureOr<Fisher>,
          (FisherKind, int)
        > {
  FisherDetailFamily._()
    : super(
        retry: null,
        name: r'fisherDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FisherDetailProvider call(FisherKind kind, int id) =>
      FisherDetailProvider._(argument: (kind, id), from: this);

  @override
  String toString() => r'fisherDetailProvider';
}

abstract class _$FisherDetail extends $AsyncNotifier<Fisher> {
  late final _$args = ref.$arg as (FisherKind, int);
  FisherKind get kind => _$args.$1;
  int get id => _$args.$2;

  FutureOr<Fisher> build(FisherKind kind, int id);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Fisher>, Fisher>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Fisher>, Fisher>,
              AsyncValue<Fisher>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args.$1, _$args.$2));
  }
}

@ProviderFor(MaintenanceList)
final maintenanceListProvider = MaintenanceListFamily._();

final class MaintenanceListProvider
    extends $AsyncNotifierProvider<MaintenanceList, PagedList<Maintenance>> {
  MaintenanceListProvider._({
    required MaintenanceListFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'maintenanceListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$maintenanceListHash();

  @override
  String toString() {
    return r'maintenanceListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MaintenanceList create() => MaintenanceList();

  @override
  bool operator ==(Object other) {
    return other is MaintenanceListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$maintenanceListHash() => r'69409ad92c7b77a853bce870aea921392679e855';

final class MaintenanceListFamily extends $Family
    with
        $ClassFamilyOverride<
          MaintenanceList,
          AsyncValue<PagedList<Maintenance>>,
          PagedList<Maintenance>,
          FutureOr<PagedList<Maintenance>>,
          int?
        > {
  MaintenanceListFamily._()
    : super(
        retry: null,
        name: r'maintenanceListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MaintenanceListProvider call({int? boatId}) =>
      MaintenanceListProvider._(argument: boatId, from: this);

  @override
  String toString() => r'maintenanceListProvider';
}

abstract class _$MaintenanceList
    extends $AsyncNotifier<PagedList<Maintenance>> {
  late final _$args = ref.$arg as int?;
  int? get boatId => _$args;

  FutureOr<PagedList<Maintenance>> build({int? boatId});
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<PagedList<Maintenance>>, PagedList<Maintenance>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<PagedList<Maintenance>>,
                PagedList<Maintenance>
              >,
              AsyncValue<PagedList<Maintenance>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(boatId: _$args));
  }
}

/// Fleet writes from any screen. Each one reloads what it touched: a captain
/// moves between boats and a crew member changes a boat's setup, so boats,
/// fishers and the trip form's pickers all reload together.

@ProviderFor(fleetActions)
final fleetActionsProvider = FleetActionsProvider._();

/// Fleet writes from any screen. Each one reloads what it touched: a captain
/// moves between boats and a crew member changes a boat's setup, so boats,
/// fishers and the trip form's pickers all reload together.

final class FleetActionsProvider
    extends $FunctionalProvider<FleetActions, FleetActions, FleetActions>
    with $Provider<FleetActions> {
  /// Fleet writes from any screen. Each one reloads what it touched: a captain
  /// moves between boats and a crew member changes a boat's setup, so boats,
  /// fishers and the trip form's pickers all reload together.
  FleetActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fleetActionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fleetActionsHash();

  @$internal
  @override
  $ProviderElement<FleetActions> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FleetActions create(Ref ref) {
    return fleetActions(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FleetActions value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FleetActions>(value),
    );
  }
}

String _$fleetActionsHash() => r'589d53667d0313d9c566791e2bebe6f28cceea5a';
