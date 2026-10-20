import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hawat_app/core/format/format.dart';
import 'package:hawat_app/core/l10n.dart';
import 'package:hawat_app/features/sales/presentation/sale_form_screen.dart';
import 'package:hawat_app/features/trips/data/trip.dart';

import '../helpers/fake_api.dart';
import '../helpers/harness.dart';
import '../helpers/owner_api.dart';

void main() {
  setUpAll(() async {
    await setUpFormatting();
    await loadAppFonts();
  });

  final stock = Trip.fromJson(fixtureData('trip_12')).availableLines;

  Future<TestApp> open(WidgetTester tester, FakeApi api) async {
    final app = TestApp(api: api);
    await app.pump(tester, const SaleFormScreen(tripId: 12), size: const Size(360, 1500));
    await tester.pumpAndSettle();
    return app;
  }

  Future<void> next(WidgetTester tester) async {
    await tester.tap(find.text(ar.nextStep));
    await tester.pumpAndSettle();
  }

  Future<void> pickSpecies(WidgetTester tester, AvailableLine line) async {
    await tester.tap(find.text(ar.chooseSpecies).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text(line.species!).last);
    await tester.pumpAndSettle();
  }

  /// Customer step → lines step with one line of [kg] × [price].
  Future<void> fillLine(WidgetTester tester, {required String kg, required String price}) async {
    await next(tester);
    await pickSpecies(tester, stock.first);
    await tester.enterText(find.byType(TextField).at(0), kg);
    await tester.enterText(find.byType(TextField).at(1), price);
    await tester.pumpAndSettle();
  }

  testWidgets('the kg of a line never goes above what the trip has', (tester) async {
    await open(tester, ownerApi());
    await next(tester);
    await pickSpecies(tester, stock.first);

    await tester.enterText(find.byType(TextField).at(0), '999999');
    await tester.pumpAndSettle();

    final cap = Fmt.plain(stock.first.availableKg);
    expect(find.text(cap), findsOneWidget, reason: 'cut to what is available');
    expect(find.textContaining(ar.cappedAt('')), findsOneWidget);

    // A second line of the same species only gets what the first left.
    await tester.enterText(find.byType(TextField).at(0), '${stock.first.availableKg - 10}');
    await tester.tap(find.text(ar.addSpecies));
    await tester.pumpAndSettle();
    await tester.tap(find.text(ar.chooseSpecies).last);
    await tester.pumpAndSettle();
    await tester.tap(find.text(stock.first.species!).last);
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).at(2), '50');
    await tester.pumpAndSettle();
    expect(find.text('10'), findsOneWidget);
  });

  testWidgets('a line needs a price before the payment step', (tester) async {
    await open(tester, ownerApi());
    await fillLine(tester, kg: '10', price: '');
    await next(tester);

    expect(find.text(ar.linePriceRequired), findsOneWidget);
    expect(find.text(ar.paidInFull), findsNothing, reason: 'still on the lines step');
  });

  testWidgets('a server error on a line comes back under that line', (tester) async {
    final api = ownerApi()
      ..json('POST', '/owner/sales', {
        'message': 'الوزن المطلوب يتجاوز المتاح (5 كجم).',
        'errors': {
          'items.0.weight_kg': ['الوزن المطلوب يتجاوز المتاح (5 كجم).'],
        },
      }, status: 422);
    await open(tester, api);
    await fillLine(tester, kg: '10', price: '50');
    await next(tester);
    await next(tester);
    await tester.tap(find.text(ar.finishSale));
    await tester.pumpAndSettle();

    expect(find.text('الوزن المطلوب يتجاوز المتاح (5 كجم).'), findsOneWidget);
    expect(find.text(ar.nextStep), findsOneWidget, reason: 'back on the lines step');
  });

  testWidgets('a double tap on finish sells once, with the discount and the part paid', (tester) async {
    final api = ownerApi()..json('POST', '/owner/sales', fixture('sale_detail'), status: 201);
    final app = await open(tester, api);
    await fillLine(tester, kg: '10', price: '50');
    await next(tester);

    await tester.enterText(find.byType(TextField).at(0), '50');
    await tester.tap(find.text(ar.paidInFull));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).at(1), '100');
    await tester.pumpAndSettle();
    expect(find.text(ar.sar(350)), findsOneWidget, reason: '500 − 50 discount − 100 paid');
    await next(tester);

    await tester.tap(find.text(ar.finishSale));
    await tester.tap(find.text(ar.finishSale), warnIfMissed: false);
    await tester.pumpAndSettle();

    final sent = api.sent('POST', '/owner/sales');
    expect(sent, hasLength(1));
    expect(sent.single.headers['Idempotency-Key'], isNotEmpty);
    expect(sent.single.data, {
      'trip_id': 12,
      'customer_id': null,
      'payment_method_id': 1,
      'discount': 50.0,
      'paid_amount': 100.0,
      'items': [
        {'species_id': stock.first.speciesId, 'weight_kg': 10.0, 'price_per_kg': 50.0},
      ],
    });
    expect(app.visited.last, '/sale/1');
  });

  testWidgets('a new customer is added from the sale and chosen', (tester) async {
    final api = ownerApi()
      ..json('POST', '/owner/customers', {
        'data': {'id': 9, 'name': 'مطعم الميناء', 'phone': '0555123456', 'status': 'نشط'},
      }, status: 201);
    await open(tester, api);

    await tester.tap(find.text(ar.newCustomer));
    await tester.pumpAndSettle();
    await tester.tap(find.text(ar.addCustomer));
    await tester.pump();
    expect(find.text(ar.nameRequired), findsOneWidget);

    await tester.enterText(find.byType(TextField).at(0), 'مطعم الميناء');
    await tester.enterText(find.byType(TextField).at(1), '0555123456');
    await tester.tap(find.text(ar.addCustomer));
    await tester.pumpAndSettle();

    final sent = api.sent('POST', '/owner/customers').single;
    expect(sent.data, {'name': 'مطعم الميناء', 'phone': '0555123456'});
    expect(sent.headers['Idempotency-Key'], isNotEmpty);
    expect(find.text('مطعم الميناء'), findsOneWidget, reason: 'the new customer is the chosen one');
  });

  testWidgets('a trip with nothing left to sell says so', (tester) async {
    final app = TestApp(api: ownerApi());
    await app.pump(tester, const SaleFormScreen(tripId: 15));
    await tester.pumpAndSettle();

    expect(find.text(ar.notSellable), findsOneWidget);
    expect(find.text(ar.nextStep), findsNothing);
  });
}
