@Tags(['golden'])
library;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hawat_app/core/auth/session.dart';
import 'package:hawat_app/features/auth/presentation/login_screen.dart';
import 'package:hawat_app/features/catch_log/presentation/catch_log_screen.dart';
import 'package:hawat_app/features/consignments/presentation/consign_screen.dart';
import 'package:hawat_app/features/consignments/presentation/consignment_screen.dart';
import 'package:hawat_app/features/consignments/presentation/consignments_screen.dart';
import 'package:hawat_app/features/dalals/presentation/dalals_screen.dart';
import 'package:hawat_app/features/home/presentation/home_screen.dart';
import 'package:hawat_app/features/more/presentation/more_screen.dart';
import 'package:hawat_app/features/notifications/presentation/notifications_screen.dart';
import 'package:hawat_app/features/profile/presentation/profile_screen.dart';
import 'package:hawat_app/features/sales/presentation/sale_form_screen.dart';
import 'package:hawat_app/features/sales/presentation/sale_screen.dart';
import 'package:hawat_app/features/sales/presentation/sales_screen.dart';
import 'package:hawat_app/features/stock/presentation/stock_movements_screen.dart';
import 'package:hawat_app/features/stock/presentation/stock_screen.dart';
import 'package:hawat_app/features/trips/data/trip.dart';
import 'package:hawat_app/features/trips/presentation/catch_screen.dart';
import 'package:hawat_app/features/trips/presentation/trip_form_screen.dart';
import 'package:hawat_app/features/trips/presentation/trip_screen.dart';
import 'package:hawat_app/features/trips/presentation/trips_screen.dart';

import '../helpers/fake_api.dart';
import '../helpers/harness.dart';
import '../helpers/owner_api.dart';

/// Screenshots of every screen at 360dp, RTL, light and dark, with the real
/// fonts and captured server data. Run `flutter test --tags golden
/// --update-goldens` to refresh them, then look at test/golden/goldens/.
void main() {
  setUpAll(() async {
    await setUpFormatting();
    await loadAppFonts();
  });

  Future<void> shot(
    WidgetTester tester,
    String name,
    Widget screen, {
    FakeApi? api,
    bool dark = false,
    double height = 780,
    double textScale = 1,
    SessionState? session,
    Future<void> Function(WidgetTester tester)? before,
  }) async {
    final app = TestApp(api: api ?? ownerApi(), user: session is SignedOut ? null : owner);
    await app.pump(tester, screen, dark: dark, size: Size(360, height), textScale: textScale);
    await tester.pumpAndSettle();
    if (before != null) {
      await before(tester);
      await tester.pumpAndSettle();
    }
    // Asset images decode outside the fake clock.
    await tester.runAsync(() async {
      for (final element in find.byType(Image).evaluate()) {
        final image = element.widget as Image;
        await precacheImage(image.image, element);
      }
    });
    await tester.pumpAndSettle();
    await expectLater(find.byType(MaterialApp), matchesGoldenFile('goldens/$name.png'));
  }

  testWidgets('login', (tester) => shot(tester, 'login', const LoginScreen(), session: const SignedOut()));
  testWidgets(
    'login dark',
    (tester) => shot(tester, 'login_dark', const LoginScreen(), dark: true, session: const SignedOut()),
  );
  testWidgets('home', (tester) => shot(tester, 'home', const HomeScreen(), api: busyOwnerApi(), height: 2300));
  testWidgets(
    'home dark',
    (tester) => shot(tester, 'home_dark', const HomeScreen(), api: busyOwnerApi(), dark: true, height: 2300),
  );
  testWidgets('home first screen', (tester) => shot(tester, 'home_fold', const HomeScreen(), api: busyOwnerApi()));
  testWidgets(
    'home text 1.3',
    (tester) => shot(tester, 'home_text_1_3', const HomeScreen(), api: busyOwnerApi(), height: 2700, textScale: 1.3),
  );
  testWidgets(
    'trips',
    (tester) => shot(tester, 'trips', const TripsScreen(initialStage: TripStage.inProgress), height: 1400),
  );
  testWidgets(
    'trips for sale',
    (tester) => shot(tester, 'trips_for_sale', const TripsScreen(initialStage: TripStage.forSale)),
  );
  testWidgets('trip scheduled', (tester) => shot(tester, 'trip_scheduled', const TripScreen(id: 16), height: 1200));
  testWidgets('trip at sea', (tester) => shot(tester, 'trip_at_sea', const TripScreen(id: 15), height: 1200));
  testWidgets(
    'trip awaiting counter',
    (tester) => shot(tester, 'trip_awaiting', const TripScreen(id: 8), height: 1200),
  );
  testWidgets('trip for sale', (tester) => shot(tester, 'trip_for_sale', const TripScreen(id: 12), height: 2000));
  testWidgets(
    'trip for sale dark',
    (tester) => shot(tester, 'trip_for_sale_dark', const TripScreen(id: 12), dark: true, height: 2000),
  );
  testWidgets('trip cancelled', (tester) => shot(tester, 'trip_cancelled', const TripScreen(id: 14), height: 1200));
  testWidgets('new trip', (tester) => shot(tester, 'trip_new', const TripFormScreen(), height: 1500));
  testWidgets('catch', (tester) => shot(tester, 'catch', const CatchScreen(tripId: 15)));
  testWidgets('sales', (tester) => shot(tester, 'sales', const SalesScreen()));
  testWidgets('sale', (tester) => shot(tester, 'sale', const SaleScreen(id: 1), height: 1000));
  testWidgets('notifications', (tester) => shot(tester, 'notifications', const NotificationsScreen()));
  testWidgets('more', (tester) => shot(tester, 'more', const MoreScreen()));
  testWidgets('profile', (tester) => shot(tester, 'profile', const ProfileScreen()));
  testWidgets('catch log', (tester) => shot(tester, 'catch_log', const CatchLogScreen(), height: 1300));

  // M3: selling and stock.
  final stock = Trip.fromJson(fixtureData('trip_12')).availableLines;

  Future<void> next(WidgetTester tester) async {
    await tester.tap(find.text(ar.nextStep));
    await tester.pumpAndSettle();
  }

  /// Two lines on the sale: one capped at what is left, one priced.
  Future<void> fillLines(WidgetTester tester) async {
    await next(tester);
    for (var i = 0; i < 2; i++) {
      if (i > 0) {
        await tester.tap(find.text(ar.addSpecies));
        await tester.pumpAndSettle();
      }
      await tester.tap(find.text(ar.chooseSpecies).last);
      await tester.pumpAndSettle();
      await tester.tap(find.text(stock[i].species!).last);
      await tester.pumpAndSettle();
    }
    await tester.enterText(find.byType(TextField).at(0), '120');
    await tester.enterText(find.byType(TextField).at(1), '45');
    await tester.enterText(find.byType(TextField).at(2), '99999');
    await tester.enterText(find.byType(TextField).at(3), '38.5');
  }

  testWidgets('sale customer step', (tester) => shot(tester, 'sale_new', const SaleFormScreen(tripId: 12)));
  testWidgets(
    'sale lines step',
    (tester) => shot(tester, 'sale_new_lines', const SaleFormScreen(tripId: 12), height: 1100, before: fillLines),
  );
  testWidgets(
    'sale payment step',
    (tester) => shot(
      tester,
      'sale_new_payment',
      const SaleFormScreen(tripId: 12),
      height: 1100,
      before: (tester) async {
        await fillLines(tester);
        await tester.pumpAndSettle();
        await next(tester);
        await tester.enterText(find.byType(TextField).at(0), '200');
        await tester.tap(find.text(ar.paidInFull));
        await tester.pumpAndSettle();
        await tester.enterText(find.byType(TextField).at(1), '5000');
      },
    ),
  );
  testWidgets(
    'sale review step',
    (tester) => shot(
      tester,
      'sale_new_review',
      const SaleFormScreen(tripId: 12),
      height: 1300,
      before: (tester) async {
        await fillLines(tester);
        await tester.pumpAndSettle();
        await next(tester);
        await next(tester);
      },
    ),
  );
  testWidgets(
    'sale review dark',
    (tester) => shot(
      tester,
      'sale_new_review_dark',
      const SaleFormScreen(tripId: 12),
      dark: true,
      height: 1300,
      before: (tester) async {
        await fillLines(tester);
        await tester.pumpAndSettle();
        await next(tester);
        await next(tester);
      },
    ),
  );
  testWidgets('sale with money due', (tester) {
    final sale = Map<String, dynamic>.from(fixtureData<Map<String, dynamic>>('sale_detail'))
      ..['paid_amount'] = 2000
      ..['remaining'] = 4050
      ..['payment_status'] = {'id': 2, 'name': 'مدفوع جزئيًا'};
    return shot(
      tester,
      'sale_due',
      const SaleScreen(id: 1),
      api: ownerApi()..json('GET', '/owner/sales/1', {'data': sale}),
      height: 1000,
    );
  });
  testWidgets(
    'consign',
    (tester) => shot(
      tester,
      'consign',
      const ConsignScreen(tripId: 12),
      height: 1000,
      before: (tester) async {
        await tester.tap(find.text(ar.chooseDalal).first);
        await tester.pumpAndSettle();
        await tester.tap(find.text('دلال تجريبي'));
        await tester.pumpAndSettle();
        await tester.tap(find.text(ar.chooseSpecies).first);
        await tester.pumpAndSettle();
        await tester.tap(find.text(stock.first.species!).last);
        await tester.pumpAndSettle();
        await tester.enterText(find.byType(TextField).first, '300');
      },
    ),
  );
  testWidgets('consignments', (tester) => shot(tester, 'consignments', const ConsignmentsScreen()));
  testWidgets('consignment', (tester) => shot(tester, 'consignment', const ConsignmentScreen(id: 1)));
  testWidgets('stock', (tester) => shot(tester, 'stock', const StockScreen(), height: 1000));
  testWidgets('stock dark', (tester) => shot(tester, 'stock_dark', const StockScreen(), dark: true, height: 1000));
  testWidgets('movements', (tester) => shot(tester, 'movements', const StockMovementsScreen(), height: 1500));
  testWidgets('dalals', (tester) => shot(tester, 'dalals', const DalalsScreen()));
  testWidgets(
    'dalal request',
    (tester) => shot(
      tester,
      'dalal_request',
      const DalalsScreen(),
      before: (tester) async {
        await tester.tap(find.text('دلال القطيف'));
      },
    ),
  );
}
