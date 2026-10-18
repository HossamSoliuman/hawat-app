@Tags(['golden'])
library;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hawat_app/core/auth/session.dart';
import 'package:hawat_app/features/auth/presentation/login_screen.dart';
import 'package:hawat_app/features/catch_log/presentation/catch_log_screen.dart';
import 'package:hawat_app/features/home/presentation/home_screen.dart';
import 'package:hawat_app/features/more/presentation/more_screen.dart';
import 'package:hawat_app/features/notifications/presentation/notifications_screen.dart';
import 'package:hawat_app/features/profile/presentation/profile_screen.dart';
import 'package:hawat_app/features/sales/presentation/sale_screen.dart';
import 'package:hawat_app/features/sales/presentation/sales_screen.dart';
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

  /// The captured dashboard with a month of sales, so every home section has content.
  FakeApi busyOwner() {
    final api = ownerApi();
    final dashboard = fixture('dashboard');
    final data = dashboard['data'] as Map<String, dynamic>;
    (data['kpis'] as Map)
      ..['revenue'] = 48250
      ..['catch_kg'] = 1840.5
      ..['unpaid'] = 6300;
    data['action_items'] = {'trips_to_start': 1, 'trips_to_sell': 7, 'unpaid_sales': 3, 'unpaid_total': 6300};
    final months = data['revenue_by_month'] as List;
    const totals = [12400, 18900, 9800, 22350, 31200, 48250];
    for (var i = 0; i < months.length; i++) {
      (months[i] as Map)['total'] = totals[i];
    }
    final sales = fixture('sales')['data'] as List;
    data['recent_sales'] = [
      for (var i = 0; i < 4; i++)
        {
          ...(sales.first as Map<String, dynamic>),
          'id': 100 + i,
          'invoice_number': '26-10-00012${4 - i}',
          'total': [4800, 1250.5, 9600, 2300][i],
          'paid_amount': [4800, 0, 6000, 2300][i],
          'remaining': [0, 1250.5, 3600, 0][i],
          'customer': {'id': i, 'name': ['سوق القطيف المركزي', 'محل أبو خالد للأسماك', 'مطعم البحر', 'سالم الدوسري'][i], 'phone': null},
        },
    ];
    return api..json('GET', '/owner/dashboard', dashboard);
  }

  Future<void> shot(WidgetTester tester, String name, Widget screen, {FakeApi? api, bool dark = false, double height = 780, double textScale = 1, SessionState? session}) async {
    final app = TestApp(api: api ?? ownerApi(), user: session is SignedOut ? null : owner);
    await app.pump(tester, screen, dark: dark, size: Size(360, height), textScale: textScale);
    await tester.pumpAndSettle();
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
  testWidgets('login dark', (tester) => shot(tester, 'login_dark', const LoginScreen(), dark: true, session: const SignedOut()));
  testWidgets('home', (tester) => shot(tester, 'home', const HomeScreen(), api: busyOwner(), height: 2300));
  testWidgets('home dark', (tester) => shot(tester, 'home_dark', const HomeScreen(), api: busyOwner(), dark: true, height: 2300));
  testWidgets('home first screen', (tester) => shot(tester, 'home_fold', const HomeScreen(), api: busyOwner()));
  testWidgets('home text 1.3', (tester) => shot(tester, 'home_text_1_3', const HomeScreen(), api: busyOwner(), height: 2700, textScale: 1.3));
  testWidgets('trips', (tester) => shot(tester, 'trips', const TripsScreen(initialStage: TripStage.inProgress), height: 1400));
  testWidgets('trips for sale', (tester) => shot(tester, 'trips_for_sale', const TripsScreen(initialStage: TripStage.forSale)));
  testWidgets('trip scheduled', (tester) => shot(tester, 'trip_scheduled', const TripScreen(id: 16), height: 1200));
  testWidgets('trip at sea', (tester) => shot(tester, 'trip_at_sea', const TripScreen(id: 15), height: 1200));
  testWidgets('trip awaiting counter', (tester) => shot(tester, 'trip_awaiting', const TripScreen(id: 8), height: 1200));
  testWidgets('trip for sale', (tester) => shot(tester, 'trip_for_sale', const TripScreen(id: 12), height: 2000));
  testWidgets('trip for sale dark', (tester) => shot(tester, 'trip_for_sale_dark', const TripScreen(id: 12), dark: true, height: 2000));
  testWidgets('trip cancelled', (tester) => shot(tester, 'trip_cancelled', const TripScreen(id: 14), height: 1200));
  testWidgets('new trip', (tester) => shot(tester, 'trip_new', const TripFormScreen(), height: 1500));
  testWidgets('catch', (tester) => shot(tester, 'catch', const CatchScreen(tripId: 15)));
  testWidgets('sales', (tester) => shot(tester, 'sales', const SalesScreen()));
  testWidgets('sale', (tester) => shot(tester, 'sale', const SaleScreen(id: 1), height: 1000));
  testWidgets('notifications', (tester) => shot(tester, 'notifications', const NotificationsScreen()));
  testWidgets('more', (tester) => shot(tester, 'more', const MoreScreen()));
  testWidgets('profile', (tester) => shot(tester, 'profile', const ProfileScreen()));
  testWidgets('catch log', (tester) => shot(tester, 'catch_log', const CatchLogScreen(), height: 1300));
}
