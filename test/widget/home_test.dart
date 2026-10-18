import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hawat_app/core/storage/local_store.dart';
import 'package:hawat_app/features/home/presentation/home_screen.dart';

import '../helpers/fake_api.dart';
import '../helpers/harness.dart';
import '../helpers/owner_api.dart';

void main() {
  setUpAll(() async {
    await setUpFormatting();
    await loadAppFonts();
  });

  FakeApi withUnpaid() {
    final api = ownerApi();
    final dashboard = fixture('dashboard');
    (dashboard['data'] as Map)['action_items'] = {
      'trips_to_start': 1,
      'trips_to_sell': 7,
      'unpaid_sales': 2,
      'unpaid_total': 900,
    };
    return api..json('GET', '/owner/dashboard', dashboard);
  }

  Future<TestApp> open(WidgetTester tester, FakeApi api, {LocalStore? store}) async {
    final app = TestApp(api: api, store: store);
    await app.pump(tester, const HomeScreen(), size: const Size(360, 1600));
    await tester.pumpAndSettle();
    return app;
  }

  testWidgets('what needs the owner leads, each row opens its filtered list', (tester) async {
    final app = await open(tester, withUnpaid());

    expect(find.text(ar.needsAction), findsOneWidget);
    expect(find.text(ar.actionTripsToStart), findsOneWidget);

    await tester.tap(find.text(ar.actionTripsToSell).first);
    await tester.pumpAndSettle();
    expect(app.visited.last, '/trips?stage=for_sale');

    app.router.go('/');
    await tester.pumpAndSettle();
    await tester.tap(find.text(ar.actionUnpaid));
    await tester.pumpAndSettle();
    expect(app.visited.last, '/sales?unpaid=1');
  });

  testWidgets('nothing pending says so', (tester) async {
    final api = ownerApi();
    final dashboard = fixture('dashboard');
    (dashboard['data'] as Map)['action_items'] = {
      'trips_to_start': 0,
      'trips_to_sell': 0,
      'unpaid_sales': 0,
      'unpaid_total': 0,
    };
    api.json('GET', '/owner/dashboard', dashboard);
    await open(tester, api);

    expect(find.text(ar.nothingPending), findsOneWidget);
  });

  testWidgets('ابدأ starts the trip once, with one idempotency key, and refreshes the home', (tester) async {
    final api = withUnpaid()
      ..on('POST', '/owner/trips/16/start', (_) => Reply({'data': fixtureData<List<dynamic>>('trips').first}));
    await open(tester, api);
    final loadsBefore = api.sent('GET', '/owner/dashboard').length;

    await tester.tap(find.text(ar.startShort));
    await tester.pumpAndSettle();
    expect(find.text(ar.startConfirmTitle), findsOneWidget);

    await tester.tap(find.text(ar.actionStartTrip));
    await tester.pumpAndSettle();

    final starts = api.sent('POST', '/owner/trips/16/start');
    expect(starts, hasLength(1));
    expect(starts.single.headers['Idempotency-Key'], isNotEmpty);
    expect(find.text(ar.tripStarted), findsOneWidget);
    expect(api.sent('GET', '/owner/dashboard').length, greaterThan(loadsBefore));
  });

  testWidgets('the saved home shows at once, offline included', (tester) async {
    final store = MemoryLocalStore();
    await store.writeJson(CacheKeys.dashboard('month'), fixtureData<Map<String, dynamic>>('dashboard'));
    final api = ownerApi()..json('GET', '/owner/dashboard', {}, status: 503);

    final app = TestApp(api: api, store: store);
    await app.pump(tester, const HomeScreen(), size: const Size(360, 1600));
    await tester.pump();

    expect(find.text(ar.needsAction), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.textContaining('غير متصل'), findsOneWidget);
  });

  testWidgets('the period chip reloads that period', (tester) async {
    final api = withUnpaid();
    await open(tester, api);

    await tester.tap(find.text(ar.periodYear));
    await tester.pumpAndSettle();

    expect(api.sent('GET', '/owner/dashboard').last.uri.queryParameters['period'], 'year');
    expect(find.text(ar.statRevenueYear), findsOneWidget);
  });
}
