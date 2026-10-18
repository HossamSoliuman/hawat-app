import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hawat_app/core/api/api_client.dart';
import 'package:hawat_app/core/auth/session.dart';
import 'package:hawat_app/core/providers.dart';
import 'package:hawat_app/core/storage/local_store.dart';
import 'package:hawat_app/core/storage/token_store.dart';

import '../helpers/fake_api.dart';

void main() {
  late FakeApi api;
  late MemoryLocalStore store;
  late MemoryTokenStore tokens;

  ProviderContainer container() {
    final c = ProviderContainer(
      retry: (_, _) => null,
      overrides: [
        localStoreProvider.overrideWithValue(store),
        tokenStoreProvider.overrideWithValue(tokens),
        apiClientProvider.overrideWith(
          (ref) => ApiClient(
            baseUrl: 'https://test.hawat/api/v1',
            tokenProvider: () => ref.read(authTokenProvider),
            onUnauthorized: () => ref.read(sessionProvider.notifier).expire(),
            dio: api.client().dio,
          ),
        ),
      ],
    );
    addTearDown(c.dispose);
    return c;
  }

  Future<SessionState> settle(ProviderContainer c) async {
    c.read(sessionProvider);
    for (var i = 0; i < 20 && c.read(sessionProvider) is SessionRestoring; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 5));
    }
    return c.read(sessionProvider);
  }

  setUp(() {
    api = FakeApi()..json('GET', '/auth/me', fixture('me'));
    store = MemoryLocalStore();
    tokens = MemoryTokenStore();
  });

  test('no saved token: the login', () async {
    expect(await settle(container()), isA<SignedOut>());
  });

  test('a saved token reads the account, then reopens without the network', () async {
    tokens.token = 'saved';
    final first = container();
    expect(await settle(first), isA<SignedIn>());
    expect(api.requests.single.headers['Authorization'], 'Bearer saved');

    // Second launch, offline: the cached account opens the app at once.
    api = FakeApi()..json('GET', '/auth/me', {}, status: 503);
    final second = container();
    final state = await settle(second);
    expect(state, isA<SignedIn>());
    expect((state as SignedIn).user.name, isNotEmpty);
  });

  test('offline on the very first launch: a retry, not the login', () async {
    tokens.token = 'saved';
    api = FakeApi()..json('GET', '/auth/me', {}, status: 503);
    expect(await settle(container()), isA<SessionRestoreFailed>());
    expect(tokens.token, 'saved');
  });

  test('login keeps the token and the account; logout forgets both', () async {
    final login = fixture('me')['data'];
    api.json('POST', '/auth/login', {
      'data': {'token': '7|abc', 'token_type': 'Bearer', 'user': login},
    });
    api.json('POST', '/auth/logout', {'message': 'ok'});

    final c = container();
    await settle(c);
    await c.read(sessionProvider.notifier).login(phone: '0500000001', password: 'secret');

    expect(c.read(sessionProvider), isA<SignedIn>());
    expect(tokens.token, '7|abc');
    expect(store.readJson(CacheKeys.me), isNotNull);
    expect(api.sent('POST', '/auth/login').single.data, containsPair('device_name', 'mobile'));

    await c.read(sessionProvider.notifier).logout();
    expect(c.read(sessionProvider), isA<SignedOut>());
    expect(tokens.token, isNull);
    expect(store.readJson(CacheKeys.me), isNull);
  });

  test('a 401 anywhere ends the session and says why', () async {
    tokens.token = 'revoked';
    await store.writeJson(CacheKeys.me, fixture('me')['data'] as Map<String, dynamic>);
    api = FakeApi()..json('GET', '/auth/me', {'message': 'Unauthenticated.'}, status: 401);

    final c = container();
    await settle(c);
    for (var i = 0; i < 20 && c.read(sessionProvider) is SignedIn; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 5));
    }
    final state = c.read(sessionProvider);
    expect(state, isA<SignedOut>());
    expect((state as SignedOut).expired, isTrue);
    expect(tokens.token, isNull);
  });
}
