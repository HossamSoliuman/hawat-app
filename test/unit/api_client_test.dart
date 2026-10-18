import 'package:flutter_test/flutter_test.dart';
import 'package:hawat_app/core/api/api_client.dart';
import 'package:hawat_app/core/api/api_exception.dart';

import '../helpers/fake_api.dart';
import '../helpers/harness.dart';

void main() {
  test('requests carry the token, Arabic and the idempotency key', () async {
    final api = FakeApi()..json('POST', '/owner/trips', {'data': {}}, status: 201);
    await api.client().post('/owner/trips', data: {'boat_id': 1}, idempotencyKey: 'key-1');

    final headers = api.requests.single.headers;
    expect(headers['Authorization'], 'Bearer test-token');
    expect(headers['Accept-Language'], 'ar');
    expect(headers['Accept'], 'application/json');
    expect(headers['Idempotency-Key'], 'key-1');
  });

  test('422 keeps the server field errors (already Arabic)', () async {
    final api = FakeApi()
      ..json('POST', '/auth/login', {
        'message': 'بيانات الدخول غير صحيحة.',
        'errors': {
          'phone': ['بيانات الدخول غير صحيحة.'],
        },
      }, status: 422);

    final error = await api
        .client(token: null)
        .post('/auth/login')
        .then<Object?>((_) => null, onError: (Object e) => e);
    expect(error, isA<ValidationException>());
    expect((error! as ValidationException).fieldError('phone'), 'بيانات الدخول غير صحيحة.');
    expect((error as ValidationException).userMessage(ar), 'بيانات الدخول غير صحيحة.');
  });

  test('a 401 on an authenticated request ends the session once', () async {
    var ended = 0;
    final api = FakeApi()..json('GET', '/owner/dashboard', {'message': 'Unauthenticated.'}, status: 401);
    final client = api.client(onUnauthorized: () => ended++);

    await expectLater(client.get('/owner/dashboard'), throwsA(isA<UnauthorizedException>()));
    expect(ended, 1);
  });

  test('the same key is retried while the first request still runs, then answers once', () async {
    var calls = 0;
    final api = FakeApi()
      ..on('POST', '/owner/trips/5/start', (_) {
        calls++;
        return calls == 1
            ? const Reply({'message': 'الطلب نفسه ما زال قيد التنفيذ'}, status: 409)
            : const Reply({
                'data': {'id': 5},
              });
      });

    final json = await api.client().post('/owner/trips/5/start', idempotencyKey: 'k');
    expect(calls, 2);
    expect((json['data'] as Map)['id'], 5);
    expect(api.requests.map((r) => r.headers['Idempotency-Key']).toSet(), {'k'});
  }, timeout: const Timeout(Duration(seconds: 10)));

  test('a stale version is a conflict, not retried', () async {
    final api = FakeApi()..json('POST', '/x', {'message': 'old', 'current_version': 4}, status: 409);
    await expectLater(
      api.client().post('/x', idempotencyKey: 'k'),
      throwsA(isA<ConflictException>().having((e) => e.currentVersion, 'version', 4)),
    );
    expect(api.requests, hasLength(1));
  });

  test('a 5xx or no connection can be retried', () async {
    final api = FakeApi()..json('GET', '/lookups', {}, status: 503);
    final error = await api.client().get('/lookups').then<Object?>((_) => null, onError: (Object e) => e);
    expect(error, isA<ServerException>());
    expect((error! as ApiException).isRetryable, isTrue);
    expect((error as ApiException).userMessage(ar), ar.errorServer);
  });

  test('empty query values are left out', () async {
    final api = FakeApi()..json('GET', '/owner/trips', {'data': []});
    await api.client().get(
      '/owner/trips',
      query: {'stage': 'scheduled', 'search': '', 'boat_id': null, 'active': true},
    );
    expect(api.requests.single.uri.queryParameters, {'stage': 'scheduled', 'active': '1'});
  });

  test('idempotency keys are unique per tap', () {
    expect(ApiClient.newIdempotencyKey(), isNot(ApiClient.newIdempotencyKey()));
  });
}
