import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hawat_app/features/fleet/data/fleet.dart';
import 'package:hawat_app/features/trips/presentation/trip_form_screen.dart';

import '../helpers/fake_api.dart';
import '../helpers/harness.dart';
import '../helpers/owner_api.dart';

void main() {
  setUpAll(() async {
    await setUpFormatting();
    await loadAppFonts();
  });

  final boats = (fixture('boats')['data'] as List).cast<Map<String, dynamic>>().map(Boat.fromJson).toList();

  Future<void> pickBoat(WidgetTester tester, Boat boat) async {
    await tester.tap(find.text(ar.chooseBoat));
    await tester.pumpAndSettle();
    await tester.tap(find.text(boat.name).last);
    await tester.pumpAndSettle();
  }

  testWidgets('a boat is required', (tester) async {
    final api = ownerApi();
    await TestApp(api: api).pump(tester, const TripFormScreen(), size: const Size(360, 1600));
    await tester.pumpAndSettle();

    await tester.tap(find.text(ar.saveTrip));
    await tester.pump();

    expect(find.text(ar.boatRequired), findsWidgets);
    expect(api.sent('POST', '/owner/trips'), isEmpty);
  });

  testWidgets('picking a boat brings its captain and port as defaults, then creates the trip', (tester) async {
    final boat = boats.firstWhere((b) => b.captain?.name != null);
    final api = ownerApi()
      ..json('POST', '/owner/trips', {'data': fixtureData<Map<String, dynamic>>('trip_16')}, status: 201);
    final app = TestApp(api: api);
    await app.pump(tester, const TripFormScreen(), size: const Size(360, 1600));
    await tester.pumpAndSettle();

    await pickBoat(tester, boat);
    expect(find.text('${ar.captainOfBoat} (${boat.captain!.name})'), findsOneWidget);
    if (boat.port?.name != null) expect(find.text('${ar.portOfBoat} (${boat.port!.name})'), findsOneWidget);

    await tester.enterText(find.byType(TextField).first, '3');
    await tester.tap(find.text(ar.saveTrip));
    await tester.pumpAndSettle();

    final sent = api.sent('POST', '/owner/trips').single;
    expect((sent.data as Map)['boat_id'], boat.id);
    expect((sent.data as Map)['captain_id'], isNull, reason: 'the server uses the boat captain');
    expect((sent.data as Map)['planned_days'], 3);
    expect(sent.headers['Idempotency-Key'], isNotEmpty);
    expect(app.visited.last, '/trip/16');
  });

  testWidgets('server field errors land under their fields', (tester) async {
    final api = ownerApi()
      ..json('POST', '/owner/trips', {
        'message': 'خطأ',
        'errors': {
          'planned_days': ['المدة يجب ألا تتجاوز 90 يومًا.'],
        },
      }, status: 422);
    await TestApp(api: api).pump(tester, const TripFormScreen(), size: const Size(360, 1600));
    await tester.pumpAndSettle();

    await pickBoat(tester, boats.first);
    await tester.tap(find.text(ar.saveTrip));
    await tester.pumpAndSettle();

    expect(find.text('المدة يجب ألا تتجاوز 90 يومًا.'), findsOneWidget);
  });

  testWidgets('editing a scheduled trip loads its values and saves them back', (tester) async {
    final trip = fixtureData<Map<String, dynamic>>('trip_16');
    final api = ownerApi()
      ..on(
        'PUT',
        '/owner/trips/16',
        (request) => Reply({
          'data': {...trip, 'planned_days': (request.data as Map)['planned_days']},
        }),
      );
    await TestApp(api: api).pump(tester, const TripFormScreen(tripId: 16), size: const Size(360, 1600));
    await tester.pumpAndSettle();

    expect(find.text(ar.editTripTitle), findsOneWidget);
    expect(find.text('${trip['planned_days']}'), findsWidgets);

    await tester.enterText(find.byType(TextField).first, '5');
    await tester.tap(find.text(ar.saveTrip));
    await tester.pumpAndSettle();

    final sent = api.sent('PUT', '/owner/trips/16').single.data as Map;
    expect(sent['boat_id'], (trip['boat'] as Map)['id']);
    expect(sent['captain_id'], (trip['captain'] as Map)['id'], reason: 'an edit keeps the captain unless changed');
    expect(sent['planned_days'], 5);
  });
}
