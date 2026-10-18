// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The selected period chip, remembered on the device.

@ProviderFor(HomePeriod)
final homePeriodProvider = HomePeriodProvider._();

/// The selected period chip, remembered on the device.
final class HomePeriodProvider
    extends $NotifierProvider<HomePeriod, DashboardPeriod> {
  /// The selected period chip, remembered on the device.
  HomePeriodProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homePeriodProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homePeriodHash();

  @$internal
  @override
  HomePeriod create() => HomePeriod();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DashboardPeriod value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DashboardPeriod>(value),
    );
  }
}

String _$homePeriodHash() => r'bccaf2b2bf7f6c6edcb5b371d119fb8ac01182dc';

/// The selected period chip, remembered on the device.

abstract class _$HomePeriod extends $Notifier<DashboardPeriod> {
  DashboardPeriod build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<DashboardPeriod, DashboardPeriod>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DashboardPeriod, DashboardPeriod>,
              DashboardPeriod,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// `GET /owner/dashboard?period=…`, stale-while-revalidate: the saved copy
/// renders at once and the server's copy replaces it.

@ProviderFor(DashboardController)
final dashboardControllerProvider = DashboardControllerFamily._();

/// `GET /owner/dashboard?period=…`, stale-while-revalidate: the saved copy
/// renders at once and the server's copy replaces it.
final class DashboardControllerProvider
    extends $AsyncNotifierProvider<DashboardController, HomeData> {
  /// `GET /owner/dashboard?period=…`, stale-while-revalidate: the saved copy
  /// renders at once and the server's copy replaces it.
  DashboardControllerProvider._({
    required DashboardControllerFamily super.from,
    required DashboardPeriod super.argument,
  }) : super(
         retry: null,
         name: r'dashboardControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$dashboardControllerHash();

  @override
  String toString() {
    return r'dashboardControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DashboardController create() => DashboardController();

  @override
  bool operator ==(Object other) {
    return other is DashboardControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$dashboardControllerHash() =>
    r'ab918026fec21ae8345eaece27859c5fe25a01cc';

/// `GET /owner/dashboard?period=…`, stale-while-revalidate: the saved copy
/// renders at once and the server's copy replaces it.

final class DashboardControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          DashboardController,
          AsyncValue<HomeData>,
          HomeData,
          FutureOr<HomeData>,
          DashboardPeriod
        > {
  DashboardControllerFamily._()
    : super(
        retry: null,
        name: r'dashboardControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// `GET /owner/dashboard?period=…`, stale-while-revalidate: the saved copy
  /// renders at once and the server's copy replaces it.

  DashboardControllerProvider call(DashboardPeriod period) =>
      DashboardControllerProvider._(argument: period, from: this);

  @override
  String toString() => r'dashboardControllerProvider';
}

/// `GET /owner/dashboard?period=…`, stale-while-revalidate: the saved copy
/// renders at once and the server's copy replaces it.

abstract class _$DashboardController extends $AsyncNotifier<HomeData> {
  late final _$args = ref.$arg as DashboardPeriod;
  DashboardPeriod get period => _$args;

  FutureOr<HomeData> build(DashboardPeriod period);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<HomeData>, HomeData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<HomeData>, HomeData>,
              AsyncValue<HomeData>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
