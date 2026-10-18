// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The device name sent with the login, so the owner can tell sessions apart.

@ProviderFor(deviceName)
final deviceNameProvider = DeviceNameProvider._();

/// The device name sent with the login, so the owner can tell sessions apart.

final class DeviceNameProvider extends $FunctionalProvider<String, String, String> with $Provider<String> {
  /// The device name sent with the login, so the owner can tell sessions apart.
  DeviceNameProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceNameProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceNameHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return deviceName(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<String>(value));
  }
}

String _$deviceNameHash() => r'a4739848b7a0d66a2038bd399ec4ec3c8f9bcce0';

/// Who is signed in. A saved token with a cached account opens the app at
/// once (no network), and the account is refreshed behind it.

@ProviderFor(Session)
final sessionProvider = SessionProvider._();

/// Who is signed in. A saved token with a cached account opens the app at
/// once (no network), and the account is refreshed behind it.
final class SessionProvider extends $NotifierProvider<Session, SessionState> {
  /// Who is signed in. A saved token with a cached account opens the app at
  /// once (no network), and the account is refreshed behind it.
  SessionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionHash();

  @$internal
  @override
  Session create() => Session();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SessionState value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<SessionState>(value));
  }
}

String _$sessionHash() => r'4f43616b6e976b37f4deab45c05eb5c8f18feafd';

/// Who is signed in. A saved token with a cached account opens the app at
/// once (no network), and the account is refreshed behind it.

abstract class _$Session extends $Notifier<SessionState> {
  SessionState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<SessionState, SessionState>;
    final element =
        ref.element as $ClassProviderElement<AnyNotifier<SessionState, SessionState>, SessionState, Object?, Object?>;
    return element.handleCreate(ref, build);
  }
}

/// The signed-in owner; screens behind the router's auth gate can rely on it.

@ProviderFor(currentUser)
final currentUserProvider = CurrentUserProvider._();

/// The signed-in owner; screens behind the router's auth gate can rely on it.

final class CurrentUserProvider extends $FunctionalProvider<AppUser?, AppUser?, AppUser?> with $Provider<AppUser?> {
  /// The signed-in owner; screens behind the router's auth gate can rely on it.
  CurrentUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserHash();

  @$internal
  @override
  $ProviderElement<AppUser?> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  AppUser? create(Ref ref) {
    return currentUser(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppUser? value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<AppUser?>(value));
  }
}

String _$currentUserHash() => r'860c0d85affb909e417917f453d05073c10b4025';
