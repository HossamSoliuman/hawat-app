import 'package:intl/intl.dart';

import 'api_client.dart';
import 'page.dart';

/// One owner resource with the usual list / show / create / update / delete
/// (`/owner/boats`, `/owner/customers`…). Bodies are built by the forms.
class ResourceRepository<T> {
  const ResourceRepository(this.api, this.path, this.fromJson);

  final ApiClient api;
  final String path;
  final T Function(Json) fromJson;

  Future<PageResult<T>> list({Map<String, Object?> query = const {}, int page = 1, int pageSize = perPage}) async =>
      PageResult.fromJson(await api.get(path, query: {...query, 'page': page, 'per_page': pageSize}), fromJson);

  Future<T> get(int id) async => one(await api.get('$path/$id'));

  Future<T> create(Json body, {required String idempotencyKey}) async =>
      one(await api.post(path, data: body, idempotencyKey: idempotencyKey));

  /// Boat, captain and crew bodies carry the `version` the form was filled
  /// from; a newer one on the server answers 409 with `current_version`.
  Future<T> update(int id, Json body) async => one(await api.put('$path/$id', data: body));

  Future<void> delete(int id) => api.delete('$path/$id');

  T one(Json json) => fromJson((json['data'] as Map).cast<String, dynamic>());
}

/// Form values as the API wants them: trimmed text, empty → null, dates as `2026-10-21`.
abstract final class Body {
  static String? text(String? value) {
    final trimmed = value?.trim() ?? '';
    return trimmed.isEmpty ? null : trimmed;
  }

  static num? number(String? value) => num.tryParse(value?.trim() ?? '');

  static int? integer(String? value) => int.tryParse(value?.trim() ?? '');

  static String? date(DateTime? value) => value == null ? null : _date.format(value);

  static final _date = DateFormat('yyyy-MM-dd', 'en_US');
}
