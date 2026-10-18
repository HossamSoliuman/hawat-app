import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hawat_app/core/storage/local_store.dart';
import 'package:hawat_app/features/lookups/data/lookups.dart';
import 'package:hawat_app/features/trips/presentation/catch_screen.dart';

import '../helpers/fake_api.dart';
import '../helpers/harness.dart';
import '../helpers/owner_api.dart';

void main() {
  setUpAll(() async {
    await setUpFormatting();
    await loadAppFonts();
  });

  final species = Lookups.fromJson(fixtureData('lookups')).species;

  Future<void> pickSpecies(WidgetTester tester, int line, String name) async {
    await tester.tap(find.text(ar.chooseSpecies).at(line));
    await tester.pumpAndSettle();
    await tester.tap(find.text(name).last);
    await tester.pumpAndSettle();
  }

  testWidgets('an empty catch is not delivered', (tester) async {
    final api = ownerApi();
    await TestApp(api: api).pump(tester, const CatchScreen(tripId: 15));
    await tester.pumpAndSettle();

    await tester.tap(find.text(ar.reviewCatch));
    await tester.pumpAndSettle();

    expect(find.text(ar.catchEmpty), findsOneWidget);
    expect(api.sent('POST', '/owner/trips/15/catch'), isEmpty);
  });

  testWidgets('a line needs its weight', (tester) async {
    await TestApp(api: ownerApi()).pump(tester, const CatchScreen(tripId: 15));
    await tester.pumpAndSettle();

    await pickSpecies(tester, 0, species.first.name);
    await tester.tap(find.text(ar.reviewCatch));
    await tester.pumpAndSettle();

    expect(find.text(ar.lineWeightRequired), findsOneWidget);
  });

  testWidgets('lines → summary → delivered once; the draft is kept until then', (tester) async {
    final store = MemoryLocalStore();
    final api = ownerApi()
      ..on('POST', '/owner/trips/15/catch', (_) {
        final trip = Map<String, dynamic>.from(fixtureData<Map<String, dynamic>>('trip_15'))
          ..['status'] = 'بانتظار الإحصاء';
        return Reply({'data': trip});
      });
    final app = TestApp(api: api, store: store);
    await app.pump(tester, const CatchScreen(tripId: 15), size: const Size(360, 1200));
    await tester.pumpAndSettle();

    await pickSpecies(tester, 0, species[0].name);
    await tester.enterText(find.byType(TextField).first, '100');
    await tester.tap(find.text(ar.addSpecies));
    await tester.pumpAndSettle();
    // Every species field keeps its hint in the tree (hidden once filled): the new line is the second.
    await pickSpecies(tester, 1, species[1].name);
    await tester.enterText(find.byType(TextField).at(1), '40.5');
    await tester.pump(const Duration(milliseconds: 500));

    expect(store.readJson(CacheKeys.catchDraft(15)), isNotNull, reason: 'the lines survive a closed app');
    expect(find.textContaining('140.5'), findsOneWidget);

    await tester.tap(find.text(ar.reviewCatch));
    await tester.pumpAndSettle();
    expect(find.text(ar.catchSummaryTitle), findsOneWidget);

    await tester.tap(find.text(ar.submitCatch));
    await tester.pumpAndSettle();

    final sent = api.sent('POST', '/owner/trips/15/catch').single;
    expect(sent.data, {
      'items': [
        {'species_id': species[0].id, 'weight_kg': 100.0},
        {'species_id': species[1].id, 'weight_kg': 40.5},
      ],
    });
    expect(sent.headers['Idempotency-Key'], isNotEmpty);
    expect(store.readJson(CacheKeys.catchDraft(15)), isNull);
  });

  testWidgets('a saved draft comes back', (tester) async {
    final store = MemoryLocalStore();
    await store.writeJson(CacheKeys.catchDraft(15), {
      'lines': [
        {'species_id': species[0].id, 'weight': '75', 'notes': ''},
      ],
    });
    await TestApp(api: ownerApi(), store: store).pump(tester, const CatchScreen(tripId: 15));
    await tester.pumpAndSettle();

    expect(find.text(species[0].name), findsOneWidget);
    expect(find.text('75'), findsOneWidget);
  });
}
