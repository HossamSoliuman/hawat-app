// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookups_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Reference lists (species, ports, trip types, gear): the saved copy answers
/// at once and a fresh copy replaces it in the background.

@ProviderFor(LookupsController)
final lookupsControllerProvider = LookupsControllerProvider._();

/// Reference lists (species, ports, trip types, gear): the saved copy answers
/// at once and a fresh copy replaces it in the background.
final class LookupsControllerProvider
    extends $AsyncNotifierProvider<LookupsController, Lookups> {
  /// Reference lists (species, ports, trip types, gear): the saved copy answers
  /// at once and a fresh copy replaces it in the background.
  LookupsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lookupsControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lookupsControllerHash();

  @$internal
  @override
  LookupsController create() => LookupsController();
}

String _$lookupsControllerHash() => r'4522bde230aef09dfc8714586af3194fb10a26c4';

/// Reference lists (species, ports, trip types, gear): the saved copy answers
/// at once and a fresh copy replaces it in the background.

abstract class _$LookupsController extends $AsyncNotifier<Lookups> {
  FutureOr<Lookups> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Lookups>, Lookups>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Lookups>, Lookups>,
              AsyncValue<Lookups>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// The owner's boats and captains, for the trip form and the list filters.

@ProviderFor(ownerBoats)
final ownerBoatsProvider = OwnerBoatsProvider._();

/// The owner's boats and captains, for the trip form and the list filters.

final class OwnerBoatsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Boat>>,
          List<Boat>,
          FutureOr<List<Boat>>
        >
    with $FutureModifier<List<Boat>>, $FutureProvider<List<Boat>> {
  /// The owner's boats and captains, for the trip form and the list filters.
  OwnerBoatsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ownerBoatsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ownerBoatsHash();

  @$internal
  @override
  $FutureProviderElement<List<Boat>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Boat>> create(Ref ref) {
    return ownerBoats(ref);
  }
}

String _$ownerBoatsHash() => r'ffb121363e84f831d11b5c68ec57feeaffc59214';

@ProviderFor(ownerCaptains)
final ownerCaptainsProvider = OwnerCaptainsProvider._();

final class OwnerCaptainsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Fisher>>,
          List<Fisher>,
          FutureOr<List<Fisher>>
        >
    with $FutureModifier<List<Fisher>>, $FutureProvider<List<Fisher>> {
  OwnerCaptainsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ownerCaptainsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ownerCaptainsHash();

  @$internal
  @override
  $FutureProviderElement<List<Fisher>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Fisher>> create(Ref ref) {
    return ownerCaptains(ref);
  }
}

String _$ownerCaptainsHash() => r'4784b8ffe7c96b7ecaa1c67a93c6e99a64b9d1c7';
