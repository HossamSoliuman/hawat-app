import 'dart:convert';

import 'package:hive_ce_flutter/hive_ce_flutter.dart';

/// A cached JSON document and when it was saved.
class CachedJson {
  const CachedJson(this.json, this.savedAt);

  final Map<String, dynamic> json;
  final DateTime savedAt;
}

/// Small on-device storage: the last copy of read screens (stale-while-
/// revalidate), unsent drafts, and preferences. Never money the app computed.
abstract class LocalStore {
  CachedJson? readJson(String key);

  Future<void> writeJson(String key, Map<String, dynamic> json);

  Future<void> remove(String key);

  T? pref<T>(String key);

  Future<void> setPref(String key, Object? value);

  /// Everything tied to the signed-in account (cache and drafts), kept prefs aside.
  Future<void> clearAccountData();
}

class HiveLocalStore implements LocalStore {
  HiveLocalStore._(this._cache, this._prefs);

  final Box<String> _cache;
  final Box<dynamic> _prefs;

  static Future<HiveLocalStore> open() async {
    await Hive.initFlutter('hawat');
    final cache = await Hive.openBox<String>('cache');
    final prefs = await Hive.openBox<dynamic>('prefs');
    return HiveLocalStore._(cache, prefs);
  }

  @override
  CachedJson? readJson(String key) {
    final raw = _cache.get(key);
    if (raw == null) return null;
    try {
      final envelope = jsonDecode(raw) as Map<String, dynamic>;
      return CachedJson(
        (envelope['json'] as Map).cast<String, dynamic>(),
        DateTime.parse(envelope['saved_at'] as String),
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> writeJson(String key, Map<String, dynamic> json) =>
      _cache.put(key, jsonEncode({'saved_at': DateTime.now().toIso8601String(), 'json': json}));

  @override
  Future<void> remove(String key) => _cache.delete(key);

  @override
  T? pref<T>(String key) {
    final value = _prefs.get(key);
    return value is T ? value : null;
  }

  @override
  Future<void> setPref(String key, Object? value) => value == null ? _prefs.delete(key) : _prefs.put(key, value);

  @override
  Future<void> clearAccountData() => _cache.clear();
}

class MemoryLocalStore implements LocalStore {
  final Map<String, CachedJson> cache = {};
  final Map<String, Object?> prefs = {};

  @override
  CachedJson? readJson(String key) => cache[key];

  @override
  Future<void> writeJson(String key, Map<String, dynamic> json) async =>
      cache[key] = CachedJson(jsonDecode(jsonEncode(json)) as Map<String, dynamic>, DateTime.now());

  @override
  Future<void> remove(String key) async => cache.remove(key);

  @override
  T? pref<T>(String key) {
    final value = prefs[key];
    return value is T ? value : null;
  }

  @override
  Future<void> setPref(String key, Object? value) async => value == null ? prefs.remove(key) : prefs[key] = value;

  @override
  Future<void> clearAccountData() async => cache.clear();
}

/// Cache keys, in one place so logout clears all of them.
abstract final class CacheKeys {
  static const me = 'me';
  static const appConfig = 'app_config';
  static const lookups = 'lookups';
  static String dashboard(String period) => 'dashboard:$period';
  static String catchDraft(int tripId) => 'draft:catch:$tripId';
}

abstract final class PrefKeys {
  static const homePeriod = 'home_period';
}
