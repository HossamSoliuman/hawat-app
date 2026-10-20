// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dalals_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dalalsRepository)
final dalalsRepositoryProvider = DalalsRepositoryProvider._();

final class DalalsRepositoryProvider
    extends
        $FunctionalProvider<
          DalalsRepository,
          DalalsRepository,
          DalalsRepository
        >
    with $Provider<DalalsRepository> {
  DalalsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dalalsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dalalsRepositoryHash();

  @$internal
  @override
  $ProviderElement<DalalsRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DalalsRepository create(Ref ref) {
    return dalalsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DalalsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DalalsRepository>(value),
    );
  }
}

String _$dalalsRepositoryHash() => r'9533d841c24c66ad403d9ca257abd2dc0f2219fa';

/// Every active dalal (the server sends them all, by name).

@ProviderFor(dalals)
final dalalsProvider = DalalsProvider._();

/// Every active dalal (the server sends them all, by name).

final class DalalsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Dalal>>,
          List<Dalal>,
          FutureOr<List<Dalal>>
        >
    with $FutureModifier<List<Dalal>>, $FutureProvider<List<Dalal>> {
  /// Every active dalal (the server sends them all, by name).
  DalalsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dalalsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dalalsHash();

  @$internal
  @override
  $FutureProviderElement<List<Dalal>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Dalal>> create(Ref ref) {
    return dalals(ref);
  }
}

String _$dalalsHash() => r'ef8186a78c657de0a73c62278cd101b2d3943d75';
