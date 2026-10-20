// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nav_requests.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TripsTabRequest)
final tripsTabRequestProvider = TripsTabRequestProvider._();

final class TripsTabRequestProvider
    extends $NotifierProvider<TripsTabRequest, TabRequest<TripStage>?> {
  TripsTabRequestProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripsTabRequestProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripsTabRequestHash();

  @$internal
  @override
  TripsTabRequest create() => TripsTabRequest();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TabRequest<TripStage>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TabRequest<TripStage>?>(value),
    );
  }
}

String _$tripsTabRequestHash() => r'52f87477c3cf8905c62e0d46b052e70e0e81d1e4';

abstract class _$TripsTabRequest extends $Notifier<TabRequest<TripStage>?> {
  TabRequest<TripStage>? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<TabRequest<TripStage>?, TabRequest<TripStage>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TabRequest<TripStage>?, TabRequest<TripStage>?>,
              TabRequest<TripStage>?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// "Open the sales list with only the unpaid invoices" (or all of them).

@ProviderFor(SalesFilterRequest)
final salesFilterRequestProvider = SalesFilterRequestProvider._();

/// "Open the sales list with only the unpaid invoices" (or all of them).
final class SalesFilterRequestProvider
    extends $NotifierProvider<SalesFilterRequest, TabRequest<bool>?> {
  /// "Open the sales list with only the unpaid invoices" (or all of them).
  SalesFilterRequestProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'salesFilterRequestProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$salesFilterRequestHash();

  @$internal
  @override
  SalesFilterRequest create() => SalesFilterRequest();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TabRequest<bool>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TabRequest<bool>?>(value),
    );
  }
}

String _$salesFilterRequestHash() =>
    r'2da4f897c0e3425f267cb6b3b976b1fb369a2160';

/// "Open the sales list with only the unpaid invoices" (or all of them).

abstract class _$SalesFilterRequest extends $Notifier<TabRequest<bool>?> {
  TabRequest<bool>? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<TabRequest<bool>?, TabRequest<bool>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TabRequest<bool>?, TabRequest<bool>?>,
              TabRequest<bool>?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
