import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hawat_app/features/trips/presentation/trip_screen.dart';

import '../helpers/fake_api.dart';
import '../helpers/harness.dart';
import '../helpers/owner_api.dart';

void main() {
  setUpAll(() async {
    await setUpFormatting();
    await loadAppFonts();
  });

  Future<TestApp> open(WidgetTester tester, int id, {FakeApi? api}) async {
    final app = TestApp(api: api ?? ownerApi());
    await app.pump(tester, TripScreen(id: id), size: const Size(360, 2600));
    await tester.pumpAndSettle();
    return app;
  }

  testWidgets('a scheduled trip offers start, edit and cancel', (tester) async {
    await open(tester, 16);

    expect(find.text(ar.actionStartTrip), findsOneWidget);
    await tester.tap(find.byIcon(Icons.more_vert));
    await tester.pumpAndSettle();
    expect(find.text(ar.menuEditTrip), findsOneWidget);
    expect(find.text(ar.menuCancelTrip), findsOneWidget);
  });

  testWidgets('at sea: the next step is recording the catch', (tester) async {
    final app = await open(tester, 15);

    await tester.tap(find.text(ar.actionSubmitCatch));
    await tester.pumpAndSettle();
    expect(app.visited.last, '/trip/15/catch');
  });

  testWidgets('with the counter: no action, just where it waits', (tester) async {
    await open(tester, 8);

    expect(find.text(ar.actionStartTrip), findsNothing);
    expect(find.text(ar.actionSubmitCatch), findsNothing);
    expect(find.textContaining(ar.waitingCounterAt('')), findsOneWidget);
    expect(find.byIcon(Icons.more_vert), findsNothing);
  });

  testWidgets('for sale: the counted catch and what is left to sell', (tester) async {
    await open(tester, 12);

    expect(find.text(ar.sectionAvailable), findsOneWidget);
    expect(find.textContaining('المتاح للبيع'), findsWidgets);
    expect(find.text(ar.sectionTripSales), findsOneWidget);
  });

  testWidgets('cancelling needs a reason, then sends it', (tester) async {
    final api = ownerApi()
      ..on('POST', '/owner/trips/16/cancel', (request) {
        final trip = Map<String, dynamic>.from(fixtureData<Map<String, dynamic>>('trip_16'))
          ..['status'] = 'ملغاة'
          ..['cancel_reason'] = (request.data as Map)['reason'];
        return Reply({'data': trip});
      });
    await open(tester, 16, api: api);

    await tester.tap(find.byIcon(Icons.more_vert));
    await tester.pumpAndSettle();
    await tester.tap(find.text(ar.menuCancelTrip));
    await tester.pumpAndSettle();

    await tester.tap(find.text(ar.cancelTripConfirm));
    await tester.pump();
    expect(find.text(ar.cancelReasonRequired), findsOneWidget);
    expect(api.sent('POST', '/owner/trips/16/cancel'), isEmpty);

    await tester.tap(find.text(ar.reasonWeather));
    await tester.tap(find.text(ar.cancelTripConfirm));
    await tester.pumpAndSettle();

    final sent = api.sent('POST', '/owner/trips/16/cancel').single;
    expect(sent.data, {'reason': ar.reasonWeather});
    expect(sent.headers['Idempotency-Key'], isNotEmpty);
    expect(find.text(ar.tripCancelled), findsOneWidget);
  });

  testWidgets('a trip of another owner is not found', (tester) async {
    await open(tester, 999);
    expect(find.text(ar.errorNotFound), findsOneWidget);
  });
}
