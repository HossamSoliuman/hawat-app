import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/api_client.dart';
import '../../../core/providers.dart';
import 'dalal.dart';

part 'dalals_repository.g.dart';

/// `/owner/dalals`: the active dalals and the owner's requests to deal with them.
class DalalsRepository {
  const DalalsRepository(this._api);

  final ApiClient _api;

  Future<List<Dalal>> list() async {
    final json = await _api.get('/owner/dalals');
    return [for (final row in (json['data'] as List).cast<Map>()) Dalal.fromJson(row.cast<String, dynamic>())];
  }

  /// Sends, edits a pending, or re-sends a rejected request.
  Future<Partnership> propose(
    int dalalId, {
    required double commissionPct,
    double? wagePct,
    String? message,
    required String idempotencyKey,
  }) async {
    final json = await _api.post(
      '/owner/dalals/$dalalId/partnership',
      data: {
        'commission_pct': commissionPct,
        'wage_pct': ?wagePct,
        if (message?.trim().isNotEmpty ?? false) 'message': message!.trim(),
      },
      idempotencyKey: idempotencyKey,
    );
    return Partnership.fromJson((json['data'] as Map).cast<String, dynamic>());
  }
}

@Riverpod(keepAlive: true)
DalalsRepository dalalsRepository(Ref ref) => DalalsRepository(ref.watch(apiClientProvider));

/// Every active dalal (the server sends them all, by name).
@riverpod
Future<List<Dalal>> dalals(Ref ref) => ref.read(dalalsRepositoryProvider).list();
