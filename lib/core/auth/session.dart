import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../api/api_exception.dart';
import '../providers.dart';
import '../storage/local_store.dart';
import 'auth_repository.dart';
import 'user.dart';

part 'session.g.dart';

sealed class SessionState {
  const SessionState();
}

/// Reading the saved token at launch.
final class SessionRestoring extends SessionState {
  const SessionRestoring();
}

/// A saved token exists but the account could not be read (offline on the very first launch).
final class SessionRestoreFailed extends SessionState {
  const SessionRestoreFailed(this.error);

  final ApiException error;
}

final class SignedOut extends SessionState {
  const SignedOut({this.expired = false});

  /// The server answered 401: the token was revoked or the password changed elsewhere.
  final bool expired;
}

final class SignedIn extends SessionState {
  const SignedIn(this.user);

  final AppUser user;
}

/// The device name sent with the login, so the owner can tell sessions apart.
@Riverpod(keepAlive: true)
String deviceName(Ref ref) => 'mobile';

/// Who is signed in. A saved token with a cached account opens the app at
/// once (no network), and the account is refreshed behind it.
@Riverpod(keepAlive: true)
class Session extends _$Session {
  @override
  SessionState build() {
    Future.microtask(restore);
    return const SessionRestoring();
  }

  LocalStore get _store => ref.read(localStoreProvider);

  AuthRepository get _auth => ref.read(authRepositoryProvider);

  Future<void> restore() async {
    state = const SessionRestoring();
    final token = await ref.read(tokenStoreProvider).read();
    if (!ref.mounted) return;
    if (token == null) {
      state = const SignedOut();
      return;
    }
    ref.read(authTokenProvider.notifier).set(token);

    final cached = _store.readJson(CacheKeys.me);
    if (cached != null) {
      state = SignedIn(AppUser.fromJson(cached.json));
      unawaited(refreshUser());
      return;
    }

    try {
      final user = await _auth.me();
      await _remember(user);
      if (ref.mounted && state is SessionRestoring) state = SignedIn(user);
    } on UnauthorizedException {
      // expire() already ran from the API client.
    } on ApiException catch (e) {
      if (ref.mounted) state = SessionRestoreFailed(e);
    }
  }

  Future<void> login({required String phone, required String password}) async {
    final result = await _auth.login(phone: phone, password: password, deviceName: ref.read(deviceNameProvider));
    await ref.read(tokenStoreProvider).write(result.token);
    ref.read(authTokenProvider.notifier).set(result.token);
    await _remember(result.user);
    state = SignedIn(result.user);
  }

  /// Re-reads the account; failures other than 401 keep the cached one.
  Future<void> refreshUser() async {
    try {
      final user = await _auth.me();
      if (!ref.mounted || state is! SignedIn) return;
      await _remember(user);
      state = SignedIn(user);
    } on ApiException {
      // Offline or a server hiccup: the cached account stays; 401 expires the session.
    }
  }

  /// After a profile or avatar change.
  Future<void> updateUser(AppUser user) async {
    await _remember(user);
    state = SignedIn(user);
  }

  Future<void> logout() async {
    try {
      await _auth.logout().timeout(const Duration(seconds: 5));
    } catch (_) {
      // The token is dropped on this device either way.
    }
    await _clear();
    state = const SignedOut();
  }

  /// A 401 from any request: the token no longer works.
  Future<void> expire() async {
    if (state is SignedOut) return;
    await _clear();
    if (ref.mounted) state = const SignedOut(expired: true);
  }

  Future<void> _remember(AppUser user) => _store.writeJson(CacheKeys.me, user.toJson());

  Future<void> _clear() async {
    ref.read(authTokenProvider.notifier).set(null);
    await ref.read(tokenStoreProvider).clear();
    await _store.clearAccountData();
  }
}

/// The signed-in owner; screens behind the router's auth gate can rely on it.
@riverpod
AppUser? currentUser(Ref ref) => switch (ref.watch(sessionProvider)) {
  SignedIn(:final user) => user,
  _ => null,
};
