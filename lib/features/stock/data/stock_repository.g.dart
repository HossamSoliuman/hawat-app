// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(stockRepository)
final stockRepositoryProvider = StockRepositoryProvider._();

final class StockRepositoryProvider
    extends
        $FunctionalProvider<StockRepository, StockRepository, StockRepository>
    with $Provider<StockRepository> {
  StockRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stockRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stockRepositoryHash();

  @$internal
  @override
  $ProviderElement<StockRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  StockRepository create(Ref ref) {
    return stockRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StockRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StockRepository>(value),
    );
  }
}

String _$stockRepositoryHash() => r'e0087fdecd4b85ccddbdad8dbd6ac658421f2449';

/// الأسماك المتوفرة, heaviest first.

@ProviderFor(stock)
final stockProvider = StockProvider._();

/// الأسماك المتوفرة, heaviest first.

final class StockProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<StockLine>>,
          List<StockLine>,
          FutureOr<List<StockLine>>
        >
    with $FutureModifier<List<StockLine>>, $FutureProvider<List<StockLine>> {
  /// الأسماك المتوفرة, heaviest first.
  StockProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stockProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stockHash();

  @$internal
  @override
  $FutureProviderElement<List<StockLine>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<StockLine>> create(Ref ref) {
    return stock(ref);
  }
}

String _$stockHash() => r'15c433431d305acc24dc18338e2052e34a9e8412';

/// حركات الصنف, newest first; one species or all of them.

@ProviderFor(StockMovements)
final stockMovementsProvider = StockMovementsFamily._();

/// حركات الصنف, newest first; one species or all of them.
final class StockMovementsProvider
    extends $AsyncNotifierProvider<StockMovements, PagedList<StockMovement>> {
  /// حركات الصنف, newest first; one species or all of them.
  StockMovementsProvider._({
    required StockMovementsFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'stockMovementsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$stockMovementsHash();

  @override
  String toString() {
    return r'stockMovementsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  StockMovements create() => StockMovements();

  @override
  bool operator ==(Object other) {
    return other is StockMovementsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$stockMovementsHash() => r'093787d84e159a2b8d1ac93e5c6c74cd55dc2f84';

/// حركات الصنف, newest first; one species or all of them.

final class StockMovementsFamily extends $Family
    with
        $ClassFamilyOverride<
          StockMovements,
          AsyncValue<PagedList<StockMovement>>,
          PagedList<StockMovement>,
          FutureOr<PagedList<StockMovement>>,
          int?
        > {
  StockMovementsFamily._()
    : super(
        retry: null,
        name: r'stockMovementsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// حركات الصنف, newest first; one species or all of them.

  StockMovementsProvider call(int? speciesId) =>
      StockMovementsProvider._(argument: speciesId, from: this);

  @override
  String toString() => r'stockMovementsProvider';
}

/// حركات الصنف, newest first; one species or all of them.

abstract class _$StockMovements
    extends $AsyncNotifier<PagedList<StockMovement>> {
  late final _$args = ref.$arg as int?;
  int? get speciesId => _$args;

  FutureOr<PagedList<StockMovement>> build(int? speciesId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<PagedList<StockMovement>>,
              PagedList<StockMovement>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<PagedList<StockMovement>>,
                PagedList<StockMovement>
              >,
              AsyncValue<PagedList<StockMovement>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
