import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/page.dart';
import '../../../core/providers.dart';
import 'catch_log.dart';

part 'catch_log_providers.g.dart';

class CatchLogQuery {
  const CatchLogQuery({this.boatId, this.captainId});

  final int? boatId;
  final int? captainId;

  Map<String, Object?> get params => {'boat_id': boatId, 'captain_id': captainId};

  @override
  bool operator ==(Object other) => other is CatchLogQuery && other.boatId == boatId && other.captainId == captainId;

  @override
  int get hashCode => Object.hash(boatId, captainId);
}

@riverpod
Future<CatchLogSummary> catchLogSummary(Ref ref, CatchLogQuery query) async {
  final json = await ref.read(apiClientProvider).get('/owner/catch-log/summary', query: query.params);
  return CatchLogSummary.fromJson((json['data'] as Map).cast<String, dynamic>());
}

@riverpod
class CatchLogEntries extends _$CatchLogEntries {
  @override
  Future<PagedList<CatchLogEntry>> build(CatchLogQuery query) async => PagedList.first(await _fetch(1));

  Future<PageResult<CatchLogEntry>> _fetch(int page) async {
    final json = await ref.read(apiClientProvider).get(
      '/owner/catch-log',
      query: {...query.params, 'page': page, 'per_page': perPage},
    );
    return PageResult.fromJson(json, CatchLogEntry.fromJson);
  }

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null) return;
    await loadNextPage(current, _fetch, (next) {
      if (ref.mounted) state = AsyncData(next);
    });
  }
}
