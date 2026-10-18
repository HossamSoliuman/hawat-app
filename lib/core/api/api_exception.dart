import 'package:dio/dio.dart';

import '../../l10n/app_localizations.dart';

/// Every failure the API client can raise, already mapped from HTTP.
sealed class ApiException implements Exception {
  const ApiException([this.serverMessage]);

  /// The server's own message (Arabic) when it sent one.
  final String? serverMessage;

  /// What the owner reads. Server messages win: they are written for people.
  String userMessage(AppLocalizations l) => switch (this) {
    NetworkException() => l.errorNetwork,
    UnauthorizedException() => l.sessionExpired,
    ForbiddenException() => serverMessage ?? l.errorForbidden,
    NotFoundException() => l.errorNotFound,
    ConflictException(:final currentVersion) => currentVersion != null ? l.errorConflict : (serverMessage ?? l.errorBusy),
    ValidationException(:final firstError) => firstError ?? serverMessage ?? l.errorUnknown,
    RateLimitedException() => l.errorRateLimited,
    ServerException() => l.errorServer,
    UnknownApiException() => l.errorUnknown,
  };

  /// Errors worth a retry button: the request may well work a moment later.
  bool get isRetryable => this is NetworkException || this is ServerException || this is RateLimitedException;

  static ApiException fromDio(DioException e) {
    switch (e.type) {
      case DioExceptionType.badResponse:
        return _fromResponse(e.response!);
      default:
        // Timeouts, no connection, a cancelled request or a broken certificate:
        // the server was not reached, so the action can simply be retried.
        return e.response == null ? const NetworkException() : _fromResponse(e.response!);
    }
  }

  static ApiException _fromResponse(Response<dynamic> response) {
    final body = response.data;
    final map = body is Map ? body.cast<String, dynamic>() : const <String, dynamic>{};
    final message = map['message'] is String ? map['message'] as String : null;

    return switch (response.statusCode ?? 0) {
      401 => const UnauthorizedException(),
      403 => ForbiddenException(message),
      404 => NotFoundException(message),
      409 => ConflictException(message, currentVersion: map['current_version'] as int?),
      422 => ValidationException(message, _errors(map['errors'])),
      429 => RateLimitedException(message),
      final int code when code >= 500 => ServerException(code),
      _ => UnknownApiException(message),
    };
  }

  static Map<String, List<String>> _errors(Object? raw) {
    if (raw is! Map) return const {};
    return {
      for (final entry in raw.entries)
        entry.key.toString(): [
          if (entry.value is List) ...(entry.value as List).map((e) => e.toString()) else entry.value.toString(),
        ],
    };
  }
}

final class NetworkException extends ApiException {
  const NetworkException();
}

final class UnauthorizedException extends ApiException {
  const UnauthorizedException();
}

final class ForbiddenException extends ApiException {
  const ForbiddenException([super.serverMessage]);
}

final class NotFoundException extends ApiException {
  const NotFoundException([super.serverMessage]);
}

/// A stale `version` on PUT (`currentVersion` set), or the same
/// Idempotency-Key still running on the server.
final class ConflictException extends ApiException {
  const ConflictException(super.serverMessage, {this.currentVersion});

  final int? currentVersion;
}

/// 422: field errors keyed as the server sends them (`phone`, `items.0.weight_kg`).
final class ValidationException extends ApiException {
  const ValidationException(super.serverMessage, this.errors);

  final Map<String, List<String>> errors;

  String? fieldError(String field) => errors[field]?.firstOrNull;

  String? get firstError => errors.values.expand((e) => e).firstOrNull;

  /// The first error on any of [fields], for a widget that edits several keys.
  String? anyOf(Iterable<String> fields) {
    for (final f in fields) {
      final e = fieldError(f);
      if (e != null) return e;
    }
    return null;
  }

  /// Errors that no field on the screen shows, so the screen can show them itself.
  String? outside(Iterable<String> shownFields) {
    final shown = shownFields.toSet();
    for (final entry in errors.entries) {
      final matched = shown.any((f) => entry.key == f || entry.key.startsWith('$f.'));
      if (!matched && entry.value.isNotEmpty) return entry.value.first;
    }
    return null;
  }
}

final class RateLimitedException extends ApiException {
  const RateLimitedException([super.serverMessage]);
}

final class ServerException extends ApiException {
  const ServerException(this.statusCode);

  final int statusCode;
}

final class UnknownApiException extends ApiException {
  const UnknownApiException([super.serverMessage]);
}
