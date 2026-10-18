import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:hawat_app/core/api/api_client.dart';

/// A canned reply.
class Reply {
  const Reply(this.body, {this.status = 200});

  final Object? body;
  final int status;
}

typedef Handler = Reply Function(RequestOptions request);

/// Serves `/api/v1` from test fixtures and records every request, so tests
/// drive the real repositories and providers without a server.
class FakeApi implements HttpClientAdapter {
  final Map<String, Handler> _routes = {};
  final List<RequestOptions> requests = [];

  /// `on('GET', '/owner/dashboard', (_) => Reply(fixture('dashboard')))`.
  /// A path ending in `*` matches any suffix (`/owner/trips/*`).
  void on(String method, String path, Handler handler) => _routes['$method $path'] = handler;

  void json(String method, String path, Object? body, {int status = 200}) =>
      on(method, path, (_) => Reply(body, status: status));

  List<RequestOptions> sent(String method, String path) =>
      requests.where((r) => r.method == method && r.uri.path.endsWith(path)).toList();

  ApiClient client({String? token = 'test-token', void Function()? onUnauthorized}) => ApiClient(
    baseUrl: 'https://test.hawat/api/v1',
    tokenProvider: () => token,
    onUnauthorized: onUnauthorized ?? () {},
    dio: Dio()..httpClientAdapter = this,
  );

  @override
  Future<ResponseBody> fetch(RequestOptions options, Stream<Uint8List>? requestStream, Future<void>? cancelFuture) async {
    requests.add(options);
    final path = options.uri.path.replaceFirst('/api/v1', '');
    Handler? handler = _routes['${options.method} $path'];
    if (handler == null) {
      for (final entry in _routes.entries) {
        final key = entry.key;
        if (key.endsWith('*') && '${options.method} $path'.startsWith(key.substring(0, key.length - 1))) {
          handler = entry.value;
          break;
        }
      }
    }
    final reply = handler?.call(options) ?? const Reply({'message': 'Not found'}, status: 404);
    return ResponseBody.fromString(
      jsonEncode(reply.body ?? {}),
      reply.status,
      headers: {
        Headers.contentTypeHeader: ['application/json'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

/// A captured API response from `test/fixtures/<name>.json` (real local-server output).
Map<String, dynamic> fixture(String name) =>
    jsonDecode(File('test/fixtures/$name.json').readAsStringSync()) as Map<String, dynamic>;

/// The `data` of a fixture.
T fixtureData<T>(String name) => fixture(name)['data'] as T;
