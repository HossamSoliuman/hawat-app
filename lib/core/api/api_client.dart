import 'dart:async';

import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

import 'api_exception.dart';

typedef Json = Map<String, dynamic>;

/// The one door to `/api/v1`. Adds the token, the Arabic locale and the
/// Idempotency-Key, and turns every failure into an [ApiException].
class ApiClient {
  ApiClient({required String baseUrl, required this.tokenProvider, required this.onUnauthorized, Dio? dio})
    : dio = dio ?? Dio() {
    this.dio.options
      ..baseUrl = baseUrl
      ..connectTimeout = const Duration(seconds: 15)
      ..sendTimeout = const Duration(seconds: 30)
      ..receiveTimeout = const Duration(seconds: 30)
      ..responseType = ResponseType.json
      ..headers.addAll({'Accept': 'application/json', 'Accept-Language': 'ar'});
  }

  final Dio dio;

  /// The current bearer token, read on every request.
  final String? Function() tokenProvider;

  /// Called once for a 401 on an authenticated request: the session is over.
  final void Function() onUnauthorized;

  /// How often a POST is retried while the server says the same
  /// Idempotency-Key is still running (409 without a version).
  static const busyRetries = 3;
  static const busyDelay = Duration(milliseconds: 1200);

  static String newIdempotencyKey() => const Uuid().v4();

  Future<Json> get(String path, {Map<String, Object?>? query}) =>
      _send(() => dio.get<Object?>(path, queryParameters: _clean(query), options: _options()));

  /// Every POST that creates or changes something carries an [idempotencyKey]
  /// (one per submit tap, reused when that tap is retried), so a lost reply
  /// never creates a second trip or sale.
  Future<Json> post(String path, {Object? data, String? idempotencyKey}) async {
    for (var attempt = 0; ; attempt++) {
      try {
        return await _send(
          () => dio.post<Object?>(
            path,
            data: data,
            options: _options(idempotencyKey: idempotencyKey),
          ),
        );
      } on ConflictException catch (e) {
        final stillRunning = idempotencyKey != null && e.currentVersion == null;
        if (!stillRunning || attempt >= busyRetries) rethrow;
        await Future<void>.delayed(busyDelay);
      }
    }
  }

  Future<Json> put(String path, {Object? data}) => _send(() => dio.put<Object?>(path, data: data, options: _options()));

  Future<Json> delete(String path) => _send(() => dio.delete<Object?>(path, options: _options()));

  Options _options({String? idempotencyKey}) {
    final token = tokenProvider();
    return Options(headers: {if (token != null) 'Authorization': 'Bearer $token', 'Idempotency-Key': ?idempotencyKey});
  }

  Future<Json> _send(Future<Response<Object?>> Function() request) async {
    final hadToken = tokenProvider() != null;
    try {
      final response = await request();
      final body = response.data;
      if (body is Map) return body.cast<String, dynamic>();
      return const {};
    } on DioException catch (e) {
      final error = ApiException.fromDio(e);
      if (error is UnauthorizedException && hadToken) onUnauthorized();
      throw error;
    }
  }

  static Map<String, Object?>? _clean(Map<String, Object?>? query) {
    if (query == null) return null;
    return {
      for (final e in query.entries)
        if (e.value != null && e.value != '') e.key: e.value is bool ? ((e.value as bool) ? 1 : 0) : e.value,
    };
  }
}
