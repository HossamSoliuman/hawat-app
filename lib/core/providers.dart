import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'api/api_client.dart';
import 'auth/session.dart';
import 'env.dart';
import 'storage/local_store.dart';
import 'storage/token_store.dart';

part 'providers.g.dart';

/// Opened once in `main` (Hive) and overridden there; tests use [MemoryLocalStore].
@Riverpod(keepAlive: true)
LocalStore localStore(Ref ref) => MemoryLocalStore();

@Riverpod(keepAlive: true)
TokenStore tokenStore(Ref ref) => const SecureTokenStore();

/// The installed version (`1.0.0`), read once in `main` from the package info.
@Riverpod(keepAlive: true)
String appVersion(Ref ref) => '1.0.0';

/// The bearer token of the signed-in account, kept in memory for every request.
@Riverpod(keepAlive: true)
class AuthToken extends _$AuthToken {
  @override
  String? build() => null;

  void set(String? token) => state = token;
}

@Riverpod(keepAlive: true)
ApiClient apiClient(Ref ref) => ApiClient(
  baseUrl: Env.apiBaseUrl,
  tokenProvider: () => ref.read(authTokenProvider),
  onUnauthorized: () => ref.read(sessionProvider.notifier).expire(),
);
