import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hawat_app/core/format/format.dart';
import 'package:hawat_app/core/l10n.dart';
import 'package:hawat_app/features/consignments/presentation/consign_screen.dart';
import 'package:hawat_app/features/dalals/presentation/dalals_screen.dart';
import 'package:hawat_app/features/sales/presentation/sale_screen.dart';
import 'package:hawat_app/features/sales/presentation/sales_screen.dart';
import 'package:hawat_app/features/stock/presentation/stock_screen.dart';
import 'package:hawat_app/features/trips/data/trip.dart';
import 'package:hawat_app/features/trips/presentation/trip_screen.dart';

import '../helpers/fake_api.dart';
import '../helpers/harness.dart';
import '../helpers/owner_api.dart';

/// Selling around the invoice: collecting what is due, sending catch to a
/// dalal, the stock, the dalals, and the trip's sell buttons.
void main() {
  setUpAll(() async {
    await setUpFormatting();
    await loadAppFonts();
  });

  final stock = Trip.fromJson(fixtureData('trip_12')).availableLines;

  Map<String, dynamic> saleWith({required double paid}) {
    final sale = Map<String, dynamic>.from(fixtureData<Map<String, dynamic>>('sale_detail'));
    final total = (sale['total'] as num).toDouble();
    return sale
      ..['paid_amount'] = paid
      ..['remaining'] = total - paid;
  }

  group('collecting', () {
    testWidgets('a due invoice collects up to what is left, once per tap', (tester) async {
      final api = ownerApi()
        ..json('GET', '/owner/sales/1', {'data': saleWith(paid: 1000)})
        ..json('POST', '/owner/sales/1/payments', {'data': saleWith(paid: 3000)});
      final app = TestApp(api: api);
      await app.pump(tester, const SaleScreen(id: 1), size: const Size(360, 1000));
      await tester.pumpAndSettle();

      await tester.tap(find.textContaining(ar.collectPayment));
      await tester.pumpAndSettle();
      expect(find.text('5050'), findsOneWidget, reason: 'starts at what is left');

      await tester.enterText(find.byType(TextField), '6000');
      await tester.tap(find.text(ar.recordPayment));
      await tester.pump();
      expect(find.text(ar.amountTooHigh(ar.sar(5050))), findsOneWidget);
      expect(api.sent('POST', '/owner/sales/1/payments'), isEmpty);

      await tester.enterText(find.byType(TextField), '2000');
      await tester.tap(find.text(ar.recordPayment));
      await tester.pumpAndSettle();

      final sent = api.sent('POST', '/owner/sales/1/payments').single;
      expect(sent.data, {'amount': 2000.0});
      expect(sent.headers['Idempotency-Key'], isNotEmpty);
      expect(find.text(ar.paymentRecorded), findsOneWidget);
      expect(find.textContaining(ar.sar(3050)), findsWidgets, reason: 'the screen shows the server answer');
    });

    testWidgets('a paid invoice only opens and shares', (tester) async {
      await TestApp(api: ownerApi()).pump(tester, const SaleScreen(id: 1), size: const Size(360, 1000));
      await tester.pumpAndSettle();

      expect(find.textContaining(ar.collectPayment), findsNothing);
      expect(find.text(ar.openInvoice), findsOneWidget);
      expect(find.text(ar.shareInvoice), findsOneWidget);
    });
  });

  group('consigning', () {
    testWidgets('a dalal and a line are needed, then the catch is sent once', (tester) async {
      final api = ownerApi()..json('POST', '/owner/consignments', fixture('consignment_detail'), status: 201);
      final app = TestApp(api: api);
      await app.pump(tester, const ConsignScreen(tripId: 12), size: const Size(360, 1400));
      await tester.pumpAndSettle();

      await tester.tap(find.text(ar.reviewConsign));
      await tester.pumpAndSettle();
      // The hint and the error read the same ("اختر الدلال"), as on the trip form.
      expect(find.text(ar.dalalRequired), findsNWidgets(2));
      expect(find.text(ar.catchEmpty), findsOneWidget);

      await tester.tap(find.text(ar.chooseDalal).first);
      await tester.pumpAndSettle();
      expect(find.text(ar.commissionShort(Fmt.pct(5))), findsOneWidget, reason: 'the agreed commission shows');
      expect(find.text(ar.noAgreement), findsOneWidget);
      await tester.tap(find.text('دلال تجريبي'));
      await tester.pumpAndSettle();

      await tester.tap(find.text(ar.chooseSpecies).first);
      await tester.pumpAndSettle();
      await tester.tap(find.text(stock.first.species!).last);
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField).first, '30');
      await tester.pumpAndSettle();

      await tester.tap(find.text(ar.reviewConsign));
      await tester.pumpAndSettle();
      expect(find.text(ar.consignSummaryTitle), findsOneWidget);
      expect(find.text(ar.agreementTerms(Fmt.pct(5), Fmt.pct(2))), findsOneWidget);

      await tester.tap(find.text(ar.consignConfirm));
      await tester.pumpAndSettle();

      final sent = api.sent('POST', '/owner/consignments').single;
      expect(sent.data, {
        'trip_id': 12,
        'dalal_id': 10,
        'items': [
          {'species_id': stock.first.speciesId, 'weight_kg': 30.0},
        ],
      });
      expect(sent.headers['Idempotency-Key'], isNotEmpty);
      expect(app.visited.last, '/consignment/1');
    });
  });

  testWidgets('stock lists each species; a tap opens its movements', (tester) async {
    final app = TestApp(api: ownerApi());
    await app.pump(tester, const StockScreen(), size: const Size(360, 1400));
    await tester.pumpAndSettle();

    expect(find.text(ar.totalStock), findsOneWidget);
    final first = (fixture('stock')['data'] as List).cast<Map<String, dynamic>>().reduce(
      (a, b) => (a['weight_kg'] as num) >= (b['weight_kg'] as num) ? a : b,
    );
    await tester.tap(find.text(first['species'] as String));
    await tester.pumpAndSettle();
    expect(app.visited.last, '/stock/movements?species=${first['species_id']}');
  });

  testWidgets('a dalal without a deal gets a commission request', (tester) async {
    final api = ownerApi()
      ..json('POST', '/owner/dalals/7/partnership', {
        'data': {
          'id': 4,
          'commission_pct': 4,
          'wage_pct': 0,
          'message': null,
          'status': 'pending',
          'status_label': 'قيد الانتظار',
          'response_note': null,
          'responded_at': null,
          'created_at': '2026-10-20T10:00:00+00:00',
        },
      }, status: 201);
    await TestApp(api: api).pump(tester, const DalalsScreen(), size: const Size(360, 1000));
    await tester.pumpAndSettle();

    expect(find.text(ar.agreementAccepted), findsOneWidget);
    await tester.tap(find.text('دلال القطيف'));
    await tester.pumpAndSettle();

    await tester.tap(find.text(ar.sendRequest));
    await tester.pump();
    expect(find.text(ar.commissionRequired), findsOneWidget);

    await tester.enterText(find.byType(TextField).at(1), '4');
    await tester.tap(find.text(ar.sendRequest));
    await tester.pumpAndSettle();

    final sent = api.sent('POST', '/owner/dalals/7/partnership').single;
    expect(sent.data, {'commission_pct': 4.0});
    expect(sent.headers['Idempotency-Key'], isNotEmpty);
    expect(find.text(ar.requestSent), findsOneWidget);
  });

  testWidgets('a trip for sale sells to a customer or sends to a dalal', (tester) async {
    final app = TestApp(api: ownerApi());
    await app.pump(tester, const TripScreen(id: 12), size: const Size(360, 2600));
    await tester.pumpAndSettle();

    await tester.tap(find.text(ar.actionSell));
    await tester.pumpAndSettle();
    expect(app.visited.last, '/sale/new?trip=12');

    app.router.go('/');
    await tester.pumpAndSettle();
    await tester.tap(find.text(ar.actionConsign));
    await tester.pumpAndSettle();
    expect(app.visited.last, '/consign/new?trip=12');
  });

  testWidgets('the sales list heads with the totals of every matching invoice', (tester) async {
    final api = ownerApi();
    await TestApp(api: api).pump(tester, const SalesScreen());
    await tester.pumpAndSettle();

    expect(find.text(ar.totalsInvoices), findsOneWidget);
    expect(find.text(ar.periodFilter), findsOneWidget);

    await tester.tap(find.text(ar.unpaidOnly));
    await tester.pumpAndSettle();
    expect(api.sent('GET', '/owner/sales').last.uri.queryParameters['unpaid'], '1');
  });
}
