import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hawat_app/core/auth/session.dart';
import 'package:hawat_app/core/auth/user.dart';
import 'package:hawat_app/core/providers.dart';
import 'package:hawat_app/core/storage/local_store.dart';
import 'package:hawat_app/core/storage/token_store.dart';
import 'package:hawat_app/core/theme/theme.dart';
import 'package:hawat_app/l10n/app_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'fake_api.dart';

/// Arabic dates with Western digits, as `main` sets them.
Future<void> setUpFormatting() async {
  await initializeDateFormatting('ar');
  DateFormat.useNativeDigitsByDefaultFor('ar', false);
}

/// The real fonts (Chakra Petch, Tajawal, Material Icons), so screenshots
/// look like the phone and Arabic shapes and widths are measured truly.
Future<void> loadAppFonts() async {
  Future<void> family(String name, List<String> files) async {
    final loader = FontLoader(name);
    for (final file in files) {
      loader.addFont(rootBundle.load(file));
    }
    await loader.load();
  }

  await family('ChakraPetch', [
    for (final w in ['Regular', 'Medium', 'SemiBold', 'Bold']) 'assets/fonts/ChakraPetch-$w.ttf',
  ]);
  await family('Tajawal', [
    for (final w in ['Regular', 'Medium', 'Bold', 'ExtraBold']) 'assets/fonts/Tajawal-$w.ttf',
  ]);

  final flutterRoot = Platform.environment['FLUTTER_ROOT'] ?? 'D:/dev/flutter';
  final icons = File('$flutterRoot/bin/cache/artifacts/material_fonts/materialicons-regular.otf');
  if (icons.existsSync()) {
    final loader = FontLoader('MaterialIcons')..addFont(Future.value(ByteData.sublistView(icons.readAsBytesSync())));
    await loader.load();
  }
}

const owner = AppUser(
  id: 1,
  name: 'محمود الزهراني',
  phone: '0500000001',
  role: UserRole(key: 'owner', name: 'مالك القارب'),
);

class FakeSession extends Session {
  FakeSession(this.initial);

  final SessionState initial;

  @override
  SessionState build() => initial;
}

/// Pumps [screen] as the app would show it: RTL Arabic, the HUD theme, the
/// fake API, a signed-in owner, and a router that records where it went.
class TestApp {
  TestApp({FakeApi? api, this.user = owner, LocalStore? store, this.realSession = false})
    : api = api ?? FakeApi(),
      store = store ?? MemoryLocalStore();

  final FakeApi api;
  final AppUser? user;
  final LocalStore store;

  /// Use the real session (login screen tests) instead of a signed-in owner.
  final bool realSession;
  final tokens = MemoryTokenStore();
  final List<String> visited = [];
  late GoRouter router;
  late ProviderContainer container;

  Future<void> pump(
    WidgetTester tester,
    Widget screen, {
    bool dark = false,
    Size size = const Size(360, 780),
    double textScale = 1,
    List<Override> overrides = const [],
  }) async {
    tester.view
      ..physicalSize = size * 3
      ..devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    Widget recorder(BuildContext _, GoRouterState state) {
      visited.add(state.uri.toString());
      return Scaffold(body: Center(child: Text('route:${state.uri}')));
    }

    router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(path: '/', builder: (_, _) => screen),
        for (final path in const [
          '/home',
          '/trips',
          '/sales',
          '/more',
          '/notifications',
          '/profile',
          '/profile/edit',
          '/profile/password',
          '/catch-log',
          '/trip/new',
          '/trip/:id',
          '/trip/:id/edit',
          '/trip/:id/catch',
          '/sale/new',
          '/sale/:id',
          '/consign/new',
          '/consignments',
          '/consignment/:id',
          '/stock',
          '/stock/movements',
          '/dalals',
        ])
          GoRoute(path: path, builder: recorder),
      ],
    );

    await tester.pumpWidget(
      ProviderScope(
        retry: (_, _) => null,
        overrides: [
          apiClientProvider.overrideWith(
            (ref) => api.client(
              token: realSession ? null : 'test-token',
              onUnauthorized: () => ref.read(sessionProvider.notifier).expire(),
            ),
          ),
          localStoreProvider.overrideWithValue(store),
          tokenStoreProvider.overrideWithValue(tokens),
          if (!realSession)
            sessionProvider.overrideWith(() => FakeSession(user == null ? const SignedOut() : SignedIn(user!))),
          ...overrides,
        ],
        child: Consumer(
          builder: (context, ref, _) {
            container = ProviderScope.containerOf(context);
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: router,
              theme: HawatTheme.light(),
              darkTheme: HawatTheme.dark(),
              themeMode: dark ? ThemeMode.dark : ThemeMode.light,
              locale: const Locale('ar'),
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              builder: (context, child) => MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(textScale)),
                child: child!,
              ),
            );
          },
        ),
      ),
    );
  }
}

/// The Arabic strings, for asserting on what the owner reads.
final ar = lookupAppLocalizations(const Locale('ar'));
