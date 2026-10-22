import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hawat_app/core/format/format.dart';
import 'package:hawat_app/core/l10n.dart';
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

  Future<TestApp> open(WidgetTester tester, FakeApi api, {LocalStore? store}) async {
    final app = TestApp(api: api, store: store);
    await app.pump(tester, const HomeScreen(), size: const Size(360, 1800));
    await tester.pumpAndSettle();
    return app;
  }

  Future<void> tap(WidgetTester tester, Finder finder) async {
    await tester.ensureVisible(finder);
    await tester.pumpAndSettle();
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  /// The "عرض الكل" of the group titled [title].
  Finder viewAllOf(String title) => find.descendant(
    of: find.ancestor(of: find.textContaining(title, findRichText: true), matching: find.byType(Row)).first,
    matching: find.text(ar.viewAll),
  );

  testWidgets('each boat says where it is, for how long, and its next move; the late one first', (tester) async {
    await open(tester, busyOwnerApi());

    expect(find.text(ar.fleetTitle), findsOneWidget);
    expect(find.text(ar.boatOverdue), findsOneWidget);
    expect(find.text(ar.boatAtSeaDay(7, 4)), findsOneWidget);
    expect(find.text(ar.boatAtSeaDay(3, 5)), findsOneWidget);
    expect(find.text(ar.boatDeparts(ar.when(testNow.add(const Duration(hours: 7)), now: testNow))), findsOneWidget);
    expect(find.text(ar.boatAtCounter), findsOneWidget);
    expect(find.text(ar.since(const Duration(hours: 5))), findsOneWidget);
    expect(find.text(ar.boatInPort), findsOneWidget);
    expect(find.text(ar.boatInMaintenance), findsOneWidget);

    // Right to left: the first card is the rightmost.
    final overdue = tester.getCenter(find.text(ar.boatOverdue)).dx;
    expect(overdue, greaterThan(tester.getCenter(find.text(ar.boatAtCounter)).dx));
    expect(overdue, greaterThan(tester.getCenter(find.text(ar.boatInPort)).dx));
  });

  testWidgets('a boat not at sea has ابدأ رحلة, which opens a trip on that boat', (tester) async {
    final app = await open(tester, busyOwnerApi());
    Finder startOn(String boat) => find.descendant(
      of: find.ancestor(of: find.text(boat), matching: find.byType(Material)).first,
      matching: find.text(ar.startNewTrip),
    );

    // In port, and back in port with the catch at the counter; never at sea or in maintenance.
    expect(find.text(ar.startNewTrip), findsNWidgets(2));
    await tap(tester, startOn('لؤلؤة الدمام'));
    expect(app.visited.last, '/trip/new?boat=2');

    app.router.go('/');
    await tester.pumpAndSettle();
    await tap(tester, startOn('فجر البحر'));
    expect(app.visited.last, '/trip/new?boat=3');
  });

  testWidgets('ابدأ starts the trip once, with one idempotency key, and refreshes the home', (tester) async {
    final api = busyOwnerApi()
      ..on('POST', '/owner/trips/16/start', (_) => Reply({'data': fixtureData<List<dynamic>>('trips').first}));
    await open(tester, api);
    final loadsBefore = api.sent('GET', '/owner/dashboard').length;

    await tap(tester, find.text(ar.startShort));
    expect(find.text(ar.startConfirmTitle), findsOneWidget);

    await tester.tap(find.text(ar.actionStartTrip));
    await tester.pumpAndSettle();

    final starts = api.sent('POST', '/owner/trips/16/start');
    expect(starts, hasLength(1));
    expect(starts.single.headers['Idempotency-Key'], isNotEmpty);
    expect(find.text(ar.tripStarted), findsOneWidget);
    expect(api.sent('GET', '/owner/dashboard').length, greaterThan(loadsBefore));
  });

  testWidgets('catch waiting to be sold: oldest first with its age, بيع opens the sale', (tester) async {
    final app = await open(tester, busyOwnerApi());

    expect(find.textContaining(ar.toSellTitle, findRichText: true), findsOneWidget);
    final oldest = '${ar.leftKg(ar.kg(800))} · ${ar.since(const Duration(days: 3))}';
    expect(find.text(oldest, findRichText: true), findsOneWidget);

    await tap(tester, find.widgetWithText(OutlinedButton, ar.sellShort).first);
    expect(app.visited.last, '/sale/new?trip=13');

    app.router.go('/');
    await tester.pumpAndSettle();
    await tap(tester, viewAllOf(ar.toSellTitle));
    expect(app.visited.last, '/trips?stage=for_sale');
  });

  testWidgets('unpaid invoices: a reminder for those with a phone, حصّل, and the list of all', (tester) async {
    final app = await open(tester, busyOwnerApi());

    expect(find.textContaining(ar.toCollectTitle, findRichText: true), findsOneWidget);
    expect(find.text(ar.sarWhole(6300)), findsOneWidget);
    expect(find.byTooltip(ar.remindWhatsapp), findsNWidgets(2));

    await tap(tester, find.text(ar.collectShort).first);
    expect(find.text(ar.collectTitle), findsOneWidget);
    await tester.tapAt(const Offset(180, 40));
    await tester.pumpAndSettle();

    await tap(tester, viewAllOf(ar.toCollectTitle));
    expect(app.visited.last, '/sales?unpaid=1');
  });

  testWidgets('nothing pending says so in one line', (tester) async {
    final api = ownerApi();
    final dashboard = fixture('dashboard');
    (dashboard['data'] as Map)
      ..['action_items'] = {'trips_to_start': 0, 'trips_to_sell': 0, 'unpaid_sales': 0, 'unpaid_total': 0}
      ..['trips_to_sell'] = []
      ..['unpaid_sales'] = [];
    api.json('GET', '/owner/dashboard', dashboard);
    await open(tester, api);

    expect(find.text(ar.nothingPending), findsOneWidget);
    expect(find.text(ar.needsAction), findsNothing);
  });

  testWidgets('the money card: whole riyals, against last month, collected and still due', (tester) async {
    await open(tester, busyOwnerApi());

    expect(find.text(Fmt.ltr('48,250')), findsOneWidget);
    expect(find.text(Fmt.pct(17)), findsOneWidget);
    expect(find.text(ar.vsLastMonth), findsOneWidget);
    expect(find.textContaining(ar.sarWhole(41950), findRichText: true), findsOneWidget);
    expect(find.textContaining(ar.collectedLabel, findRichText: true), findsOneWidget);
  });

  testWidgets('بيع on a species opens the sale on the trip that carries it, or asks which', (tester) async {
    final app = await open(tester, busyOwnerApi());
    Finder sellOf(String species) => find.descendant(
      of: find.ancestor(of: find.text(species), matching: find.byType(Row)).first,
      matching: find.text(ar.sellShort),
    );

    await tap(tester, sellOf('الحريد'));
    expect(app.visited.last, '/sale/new?trip=13&species=5');

    app.router.go('/');
    await tester.pumpAndSettle();
    await tap(tester, sellOf('الكنعد'));
    expect(find.text(ar.pickTripTitle), findsOneWidget);
    await tester.tap(find.text('فجر البحر').last);
    await tester.pumpAndSettle();
    expect(app.visited.last, '/sale/new?trip=11&species=3');
  });

  testWidgets('a server before 1.10.0: the boats come from the boats list, never "add your first boat"', (
    tester,
  ) async {
    final api = ownerApi();
    final dashboard = fixture('dashboard');
    final data = dashboard['data'] as Map<String, dynamic>;
    data
      ..remove('fleet')
      ..remove('trips_to_sell')
      ..remove('unpaid_sales');
    (data['kpis'] as Map)
      ..remove('previous_revenue')
      ..remove('collected')
      ..remove('uncollected');
    api.json('GET', '/owner/dashboard', dashboard);
    final app = await open(tester, api);

    expect(find.text(ar.fleetEmpty), findsNothing);
    expect(find.text('لؤلؤة الدمام'), findsOneWidget);
    expect(find.text(ar.boatInPort), findsWidgets);
    expect(find.textContaining(ar.collectedLabel, findRichText: true), findsNothing);

    await tap(tester, find.text(ar.startNewTrip).first);
    expect(app.visited.last, startsWith('/trip/new?boat='));
  });

  testWidgets('the saved home shows at once, offline included', (tester) async {
    final store = MemoryLocalStore();
    await store.writeJson(CacheKeys.dashboard('month'), fixtureData<Map<String, dynamic>>('dashboard'));
    final api = ownerApi()..json('GET', '/owner/dashboard', {}, status: 503);

    final app = TestApp(api: api, store: store);
    await app.pump(tester, const HomeScreen(), size: const Size(360, 1600));
    await tester.pump();

    expect(find.text(ar.fleetTitle), findsOneWidget);
    expect(find.text(ar.needsAction), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.textContaining('غير متصل'), findsOneWidget);
  });

  testWidgets('the period chip reloads that period', (tester) async {
    final api = busyOwnerApi();
    await open(tester, api);

    await tap(tester, find.text(ar.periodYear));

    expect(api.sent('GET', '/owner/dashboard').last.uri.queryParameters['period'], 'year');
    expect(find.text(ar.statRevenueYear), findsOneWidget);
    expect(find.text(ar.vsLastYear), findsOneWidget);
  });
}
