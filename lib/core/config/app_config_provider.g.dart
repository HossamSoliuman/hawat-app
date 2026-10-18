// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// `GET /app/config` on every launch. The last copy answers at once and the
/// fresh one replaces it; without either, the app waits a few seconds and
/// falls back to [AppConfig.fallback]. Never fails.

@ProviderFor(AppConfigController)
final appConfigControllerProvider = AppConfigControllerProvider._();

/// `GET /app/config` on every launch. The last copy answers at once and the
/// fresh one replaces it; without either, the app waits a few seconds and
/// falls back to [AppConfig.fallback]. Never fails.
final class AppConfigControllerProvider
    extends $AsyncNotifierProvider<AppConfigController, AppConfig> {
  /// `GET /app/config` on every launch. The last copy answers at once and the
  /// fresh one replaces it; without either, the app waits a few seconds and
  /// falls back to [AppConfig.fallback]. Never fails.
  AppConfigControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appConfigControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appConfigControllerHash();

  @$internal
  @override
  AppConfigController create() => AppConfigController();
}

String _$appConfigControllerHash() =>
    r'4420dccb142543d9129c41629bb16227204b04cd';

/// `GET /app/config` on every launch. The last copy answers at once and the
/// fresh one replaces it; without either, the app waits a few seconds and
/// falls back to [AppConfig.fallback]. Never fails.

abstract class _$AppConfigController extends $AsyncNotifier<AppConfig> {
  FutureOr<AppConfig> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<AppConfig>, AppConfig>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AppConfig>, AppConfig>,
              AsyncValue<AppConfig>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// The config once loaded, or the fallback while it loads.

@ProviderFor(appConfig)
final appConfigProvider = AppConfigProvider._();

/// The config once loaded, or the fallback while it loads.

final class AppConfigProvider
    extends $FunctionalProvider<AppConfig, AppConfig, AppConfig>
    with $Provider<AppConfig> {
  /// The config once loaded, or the fallback while it loads.
  AppConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appConfigProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appConfigHash();

  @$internal
  @override
  $ProviderElement<AppConfig> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppConfig create(Ref ref) {
    return appConfig(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppConfig>(value),
    );
  }
}

String _$appConfigHash() => r'f0b8a13d86024171518eb1660739d876305d8a93';
