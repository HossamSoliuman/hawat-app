import 'dart:async';
import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../providers.dart';
import 'app_config.dart';

part 'app_config_provider.g.dart';

const _prefKey = 'app_config';

/// `GET /app/config` on every launch. The last copy answers at once and the
/// fresh one replaces it; without either, the app waits a few seconds and
/// falls back to [AppConfig.fallback]. Never fails.
@Riverpod(keepAlive: true)
class AppConfigController extends _$AppConfigController {
  @override
  Future<AppConfig> build() async {
    final store = ref.read(localStoreProvider);
    final saved = store.pref<String>(_prefKey);

    final fresh = ref.read(apiClientProvider).get('/app/config').then((json) async {
      final data = (json['data'] as Map).cast<String, dynamic>();
      await store.setPref(_prefKey, jsonEncode(data));
      return AppConfig.fromJson(data);
    });

    if (saved != null) {
      unawaited(
        fresh
            .then((config) {
              if (ref.mounted) state = AsyncData(config);
            })
            .catchError((Object _) {}),
      );
      try {
        return AppConfig.fromJson((jsonDecode(saved) as Map).cast<String, dynamic>());
      } catch (_) {
        // A corrupt copy: fall through to the network.
      }
    }

    try {
      return await fresh.timeout(const Duration(seconds: 5));
    } catch (_) {
      return AppConfig.fallback;
    }
  }
}

/// The config once loaded, or the fallback while it loads.
@riverpod
AppConfig appConfig(Ref ref) => ref.watch(appConfigControllerProvider).value ?? AppConfig.fallback;
