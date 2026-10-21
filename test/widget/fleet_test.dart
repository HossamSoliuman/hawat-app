import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hawat_app/core/widgets/form_fields.dart';
import 'package:hawat_app/features/fleet/data/fleet.dart';
import 'package:hawat_app/features/fleet/data/fleet_providers.dart';
import 'package:hawat_app/features/fleet/presentation/boat_form_screen.dart';
import 'package:hawat_app/features/fleet/presentation/boat_screen.dart';
import 'package:hawat_app/features/fleet/presentation/fisher_form_screen.dart';

import '../helpers/fake_api.dart';
import '../helpers/harness.dart';
import '../helpers/owner_api.dart';

void main() {
  setUpAll(() async {
    await setUpFormatting();
    await loadAppFonts();
  });

  const tall = Size(360, 3200);
  final boat = fixtureData<Map<String, dynamic>>('boat_detail');

  testWidgets('a boat edit sends the version it was filled from', (tester) async {
    final api = ownerApi()..on('PUT', '/owner/boats/1', (request) => Reply({'data': boat}));
    await TestApp(api: api).pump(tester, const BoatFormScreen(id: 1), size: tall);
    await tester.pumpAndSettle();

    await tester.enterText(find.widgetWithText(TextField, 'نجم الخليج'), 'نجم الخليج الجديد');
    await tester.tap(find.text(ar.save));
    await tester.pumpAndSettle();

    final sent = api.sent('PUT', '/owner/boats/1').single.data as Map;
    expect(sent['name'], 'نجم الخليج الجديد');
    expect(sent['version'], 1);
    expect(sent['boat_number'], 'B-1001');
    expect(sent['port_id'], 1);
    expect(sent['captain_id'], 7);
    expect(sent['next_inspection_date'], '2026-10-05');
  });

  testWidgets('a stale boat edit shows the conflict, and reload brings the newer record', (tester) async {
    final api = ownerApi()..json('PUT', '/owner/boats/1', {'message': 'تعارض', 'current_version': 2}, status: 409);
    await TestApp(api: api).pump(tester, const BoatFormScreen(id: 1), size: tall);
    await tester.pumpAndSettle();

    await tester.enterText(find.widgetWithText(TextField, 'نجم الخليج'), 'اسم قديم');
    await tester.tap(find.text(ar.save));
    await tester.pumpAndSettle();
    expect(find.text(ar.errorConflict), findsOneWidget);

    // Someone renamed it on the web in the meantime.
    api.json('GET', '/owner/boats/1', {
      'data': {...boat, 'name': 'نجم الخليج ٢', 'version': 2},
    });
    await tester.tap(find.text(ar.reload));
    await tester.pumpAndSettle();
    expect(find.text(ar.errorConflict), findsNothing);
    expect(find.widgetWithText(TextField, 'نجم الخليج ٢'), findsOneWidget);

    api.on('PUT', '/owner/boats/1', (request) => Reply({'data': boat}));
    await tester.tap(find.text(ar.save));
    await tester.pumpAndSettle();
    expect((api.sent('PUT', '/owner/boats/1').last.data as Map)['version'], 2);
  });

  testWidgets('a taken boat number lands under its field', (tester) async {
    final api = ownerApi()
      ..json('PUT', '/owner/boats/1', {
        'message': 'خطأ',
        'errors': {
          'boat_number': ['رقم القارب مسجّل لقارب آخر في حوات.'],
        },
      }, status: 422);
    await TestApp(api: api).pump(tester, const BoatFormScreen(id: 1), size: tall);
    await tester.pumpAndSettle();

    await tester.tap(find.text(ar.save));
    await tester.pumpAndSettle();
    expect(find.text('رقم القارب مسجّل لقارب آخر في حوات.'), findsOneWidget);
  });

  testWidgets('a new boat needs a name, a number and a port', (tester) async {
    final api = ownerApi();
    await TestApp(api: api).pump(tester, const BoatFormScreen(), size: tall);
    await tester.pumpAndSettle();

    await tester.tap(find.text(ar.save));
    await tester.pump();
    expect(find.text(ar.nameRequired), findsOneWidget);
    expect(find.text(ar.boatNumberRequired), findsOneWidget);
    expect(find.text(ar.portRequired), findsOneWidget);
    expect(api.sent('POST', '/owner/boats'), isEmpty);
  });

  testWidgets('each missing setup item opens the place that fixes it', (tester) async {
    // Boat 4 has no captain and no crew.
    final app = TestApp(api: ownerApi());
    await app.pump(tester, const BoatScreen(id: 4), size: tall);
    await tester.pumpAndSettle();

    expect(find.text(ar.readinessTitle), findsOneWidget);
    await tester.tap(find.text(ar.fixAssignCaptain));
    await tester.pumpAndSettle();
    expect(app.visited.last, '/boat/4/edit');

    app.router.pop();
    await tester.pumpAndSettle();
    await tester.tap(find.text(ar.fixAddCrew));
    await tester.pumpAndSettle();
    expect(app.visited.last, '/fisher/crew/new?boat=4');
  });

  testWidgets('a ready boat says so, and lists its captain and crew', (tester) async {
    await TestApp(api: ownerApi()).pump(tester, const BoatScreen(id: 1), size: tall);
    await tester.pumpAndSettle();

    expect(find.text(ar.boatReady), findsOneWidget);
    expect(find.text('كابتن تجريبي'), findsOneWidget);
    for (final row in fixture('crew')['data'] as List) {
      expect(find.text((row as Map)['name'] as String), findsOneWidget);
    }
  });

  testWidgets('a crew member from the boat card goes on that boat with a role', (tester) async {
    final crew = (fixture('crew')['data'] as List).first as Map<String, dynamic>;
    final api = ownerApi()..json('POST', '/owner/crew', {'data': crew}, status: 201);
    final app = TestApp(api: api);
    await app.pump(tester, const FisherFormScreen(kind: FisherKind.crew, boatId: 1), size: tall);
    await tester.pumpAndSettle();

    expect(find.text(ar.crewRoleLabel), findsOneWidget);
    await tester.enterText(find.byType(TextField).at(0), 'بحّار جديد');
    await tester.enterText(find.byType(TextField).at(1), '1000000099');
    await tester.tap(
      find.descendant(of: find.widgetWithText(FieldLabel, ar.crewRoleLabel), matching: find.byType(InputDecorator)),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('بحّار').last);
    await tester.pumpAndSettle();
    await tester.tap(find.text(ar.save));
    await tester.pumpAndSettle();

    final sent = api.sent('POST', '/owner/crew').single;
    expect((sent.data as Map)['name'], 'بحّار جديد');
    expect((sent.data as Map)['national_id'], '1000000099');
    expect((sent.data as Map)['boat_id'], 1);
    expect((sent.data as Map)['fisher_role_id'], 2);
    expect(sent.headers['Idempotency-Key'], isNotEmpty);
    expect(app.visited.last, '/fisher/crew/${crew['id']}');
  });

  testWidgets('a captain form has no crew role and goes to the captains path', (tester) async {
    final api = ownerApi()..json('POST', '/owner/captains', {'data': fixtureData('captain_detail')}, status: 201);
    await TestApp(api: api).pump(tester, const FisherFormScreen(kind: FisherKind.captain), size: tall);
    await tester.pumpAndSettle();

    expect(find.text(ar.crewRoleLabel), findsNothing);
    await tester.enterText(find.byType(TextField).at(0), 'كابتن جديد');
    await tester.enterText(find.byType(TextField).at(1), '1000000098');
    await tester.tap(find.text(ar.save));
    await tester.pump();
    expect(find.text(ar.portOrBoatRequired), findsOneWidget, reason: 'a fisher with no boat needs a port');
    expect(api.sent('POST', '/owner/captains'), isEmpty);
  });

  test('a photo goes up as multipart to the fisher it belongs to', () async {
    final api = FakeApi()..json('POST', '/owner/crew/8/avatar', {'data': fixtureData('crew_detail')});
    final repo = FishersRepository(api.client(), FisherKind.crew);
    await repo.uploadAvatar(8, Uint8List.fromList([1, 2, 3]));

    final sent = api.sent('POST', '/owner/crew/8/avatar').single;
    final form = sent.data as FormData;
    expect(form.files.single.key, 'avatar');
    expect(form.files.single.value.filename, 'avatar.jpg');
  });
}
