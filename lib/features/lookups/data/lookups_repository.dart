import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/auth/session.dart';
import '../../../core/providers.dart';
import '../../../core/storage/local_store.dart';
import '../../fleet/data/fleet.dart';
import 'lookups.dart';

part 'lookups_repository.g.dart';

/// Reference lists (species, ports, trip types, gear): the saved copy answers
/// at once and a fresh copy replaces it in the background.
@Riverpod(keepAlive: true)
class LookupsController extends _$LookupsController {
  @override
  Future<Lookups> build() async {
    // Read again for the next account; nothing to read while signed out.
    if (ref.watch(currentUserProvider.select((u) => u?.id)) == null) return const Lookups();
    final store = ref.read(localStoreProvider);
    final cached = store.readJson(CacheKeys.lookups);
    if (cached != null) {
      unawaited(Future(_refresh));
      return Lookups.fromJson(cached.json);
    }
    return _fetch();
  }

  Future<Lookups> _fetch() async {
    final json = await ref.read(apiClientProvider).get('/lookups');
    final data = (json['data'] as Map).cast<String, dynamic>();
    await ref.read(localStoreProvider).writeJson(CacheKeys.lookups, data);
    return Lookups.fromJson(data);
  }

  Future<void> _refresh() async {
    try {
      final fresh = await _fetch();
      if (ref.mounted) state = AsyncData(fresh);
    } catch (_) {
      // The saved lists stay; they change rarely.
    }
  }
}

/// The owner's boats and captains, for the trip form and the list filters.
@riverpod
Future<List<Boat>> ownerBoats(Ref ref) async {
  final json = await ref.read(apiClientProvider).get('/owner/boats', query: {'per_page': 100});
  return [for (final row in (json['data'] as List).cast<Map>()) Boat.fromJson(row.cast<String, dynamic>())];
}

@riverpod
Future<List<Fisher>> ownerCaptains(Ref ref) async {
  final json = await ref.read(apiClientProvider).get('/owner/captains', query: {'per_page': 100});
  return [for (final row in (json['data'] as List).cast<Map>()) Fisher.fromJson(row.cast<String, dynamic>())];
}
