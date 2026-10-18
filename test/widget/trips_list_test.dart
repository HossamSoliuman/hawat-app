import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hawat_app/app/nav_requests.dart';
import 'package:hawat_app/features/trips/data/trip.dart';
import 'package:hawat_app/features/trips/presentation/trips_screen.dart';

import '../helpers/harness.dart';
import '../helpers/owner_api.dart';

void main() {
  setUpAll(() async {
    await setUpFormatting();
    await loadAppFonts();
  });

  TabController tabs(WidgetTester tester) => tester.widget<TabBar>(find.byType(TabBar)).controller!;

  testWidgets('each tab asks the server for its stage', (tester) async {
    final api = ownerApi();
    await TestApp(api: api).pump(tester, const TripsScreen(initialStage: TripStage.forSale));
    await tester.pumpAndSettle();

    expect(tabs(tester).index, TripStage.forSale.index);
    expect(api.sent('GET', '/owner/trips').last.uri.queryParameters['stage'], 'for_sale');

    await tester.tap(find.text(ar.tabScheduled));
    await tester.pumpAndSettle();
    expect(api.sent('GET', '/owner/trips').last.uri.queryParameters['stage'], 'scheduled');
  });

  testWidgets('a home row reopens its tab even after a manual switch', (tester) async {
    final app = TestApp(api: ownerApi());
    await app.pump(tester, const TripsScreen(initialStage: TripStage.forSale));
    await tester.pumpAndSettle();

    await tester.tap(find.text(ar.tabCancelled));
    await tester.pumpAndSettle();
    expect(tabs(tester).index, TripStage.cancelled.index);

    app.container.read(tripsTabRequestProvider.notifier).open(TripStage.forSale);
    await tester.pumpAndSettle();
    expect(tabs(tester).index, TripStage.forSale.index);
  });

  testWidgets('searching by trip number narrows the list', (tester) async {
    final api = ownerApi();
    await TestApp(api: api).pump(tester, const TripsScreen(initialStage: TripStage.inProgress));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), '0015');
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pumpAndSettle();

    expect(api.sent('GET', '/owner/trips').last.uri.queryParameters['search'], '0015');
    expect(find.textContaining('TR-2026-0015'), findsOneWidget);
    expect(find.textContaining('TR-2026-0009'), findsNothing);
  });
}
