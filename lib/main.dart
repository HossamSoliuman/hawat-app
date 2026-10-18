import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'app/app.dart';
import 'core/auth/session.dart';
import 'core/providers.dart';
import 'core/storage/local_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('ar');
  // Arabic month names with Western digits, as on the web portal.
  DateFormat.useNativeDigitsByDefaultFor('ar', false);

  final results = await Future.wait([HiveLocalStore.open(), PackageInfo.fromPlatform(), _deviceName()]);

  runApp(
    ProviderScope(
      // Screens show their own retry buttons; no silent automatic retries.
      retry: (_, _) => null,
      overrides: [
        localStoreProvider.overrideWithValue(results[0] as LocalStore),
        appVersionProvider.overrideWithValue((results[1] as PackageInfo).version),
        deviceNameProvider.overrideWithValue(results[2] as String),
      ],
      child: const HawatApp(),
    ),
  );
}

/// "Samsung SM-A546E", sent with the login so the owner can tell sessions apart.
Future<String> _deviceName() async {
  try {
    if (kIsWeb) return 'web';
    final info = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final android = await info.androidInfo;
      return '${android.manufacturer} ${android.model}'.trim();
    }
    if (Platform.isIOS) return (await info.iosInfo).utsname.machine;
  } catch (_) {
    // The name is a convenience; the login works without it.
  }
  return 'mobile';
}
