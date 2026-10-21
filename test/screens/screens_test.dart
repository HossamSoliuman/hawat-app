@Tags(['screens'])
library;

import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hawat_app/app/app.dart';
import 'package:hawat_app/app/router.dart';
import 'package:hawat_app/core/auth/session.dart';
import 'package:hawat_app/core/auth/user.dart';
import 'package:hawat_app/core/providers.dart';
import 'package:hawat_app/core/storage/local_store.dart';
import 'package:hawat_app/core/storage/token_store.dart';
import 'package:hawat_app/features/contacts/presentation/contacts_screens.dart';
import 'package:hawat_app/features/fleet/data/fleet.dart';
import 'package:hawat_app/features/lookups/data/lookups.dart';
import 'package:hawat_app/features/trips/data/trip.dart';

import '../helpers/fake_api.dart';
import '../helpers/harness.dart';
import '../helpers/owner_api.dart';

/// Every screen in a phone frame, light and dark, through the real router and
/// bottom bar with the captured server data. A screen taller than the phone
/// is also taken scrolled (`-1`, `-2`…). Writes docs/screens/{light,dark}/.
///
/// `flutter test --tags screens --dart-define=FLAVOR=production` (the
/// production build: no quick login, no test-environment label).
void main() {
  setUpAll(() async {
    await setUpFormatting();
    await loadAppFonts();
  });

  const counter = AppUser(
    id: 3,
    name: 'سعيد العداد',
    phone: '0500000003',
    role: UserRole(key: 'counter', name: 'عداد'),
  );
  final stock = Trip.fromJson(fixtureData('trip_12')).availableLines;
  final species = Lookups.fromJson(fixtureData('lookups')).species;

  Future<void> tap(WidgetTester tester, Finder finder) async {
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  Future<void> next(WidgetTester tester) => tap(tester, find.text(ar.nextStep));

  Future<void> saleLines(WidgetTester tester) async {
    await next(tester);
    for (var i = 0; i < 2; i++) {
      if (i > 0) await tap(tester, find.text(ar.addSpecies));
      await tap(tester, find.text(ar.chooseSpecies).last);
      await tap(tester, find.text(stock[i].species!).last);
    }
    await tester.enterText(find.byType(TextField).at(0), '120');
    await tester.enterText(find.byType(TextField).at(1), '45');
    await tester.enterText(find.byType(TextField).at(2), '80');
    await tester.enterText(find.byType(TextField).at(3), '38.5');
  }

  Future<void> catchLines(WidgetTester tester) async {
    await tap(tester, find.text(ar.chooseSpecies).at(0));
    await tap(tester, find.text(species[0].name).last);
    await tester.enterText(find.byType(TextField).first, '100');
    await tap(tester, find.text(ar.addSpecies));
    await tap(tester, find.text(ar.chooseSpecies).at(1));
    await tap(tester, find.text(species[1].name).last);
    await tester.enterText(find.byType(TextField).at(1), '40.5');
  }

  FakeApi saleDue() {
    final sale = Map<String, dynamic>.from(fixtureData<Map<String, dynamic>>('sale_detail'))
      ..['paid_amount'] = 2000
      ..['remaining'] = 4050
      ..['payment_status'] = {'id': 2, 'name': 'مدفوع جزئيًا'};
    return busyOwnerApi()..json('GET', '/owner/sales/1', {'data': sale});
  }

  // Before signing in.
  screen('01-splash', session: const SessionRestoring(), settles: false);
  screen('02-login', session: const SignedOut());
  screen(
    '03-forgot-password',
    session: const SignedOut(),
    before: (tester) => tap(tester, find.text(ar.forgotPassword)),
    sheet: true,
  );
  screen('04-not-owner', session: const SignedIn(counter));
  screen('05-update-required', version: '0.9.0');

  // Home and the bottom bar.
  screen('06-home');
  screen('07-quick-actions', sheet: true, before: (tester) => tap(tester, find.byIcon(Icons.add_rounded)));
  screen('08-start-trip', sheet: true, before: (tester) => tap(tester, find.text(ar.startShort)));
  screen('09-notifications', push: '/notifications');

  // Trips.
  screen('10-trips-scheduled', go: Routes.tripsAt(TripStage.scheduled));
  screen('11-trips-in-progress', go: Routes.tripsAt(TripStage.inProgress));
  screen('12-trips-for-sale', go: Routes.tripsAt(TripStage.forSale));
  screen('13-trips-done', go: Routes.tripsAt(TripStage.done));
  screen('14-trips-cancelled', go: Routes.tripsAt(TripStage.cancelled));
  screen('15-trip-scheduled', push: Routes.trip(16));
  screen(
    '16-trip-menu',
    push: Routes.trip(16),
    sheet: true,
    before: (tester) => tap(tester, find.byIcon(Icons.more_vert)),
  );
  screen(
    '17-trip-cancel',
    sheet: true,
    push: Routes.trip(16),
    before: (tester) async {
      await tap(tester, find.byIcon(Icons.more_vert));
      await tap(tester, find.text(ar.menuCancelTrip));
    },
  );
  screen('18-trip-at-sea', push: Routes.trip(15));
  screen('19-trip-with-counter', push: Routes.trip(8));
  screen('20-trip-for-sale', push: Routes.trip(12));
  screen('21-trip-cancelled', push: Routes.trip(14));
  screen('22-trip-new', push: Routes.newTrip);
  screen('23-trip-edit', push: Routes.editTrip(16));
  screen('24-catch', push: Routes.submitCatch(15), before: catchLines);
  screen(
    '25-catch-review',
    sheet: true,
    push: Routes.submitCatch(15),
    before: (tester) async {
      await catchLines(tester);
      await tap(tester, find.text(ar.reviewCatch));
    },
  );
  screen('26-catch-log', push: Routes.catchLog);

  // Selling.
  screen('27-sales', go: Routes.sales);
  screen('28-sales-unpaid', go: Routes.unpaidSales());
  screen('29-sale', push: Routes.sale(1));
  screen('30-sale-due', push: Routes.sale(1), api: saleDue);
  screen(
    '31-collect-payment',
    sheet: true,
    push: Routes.sale(1),
    api: saleDue,
    before: (tester) => tap(tester, find.textContaining(ar.collectPayment)),
  );
  screen('32-sale-new-customer', push: Routes.newSale(12));
  screen(
    '33-sale-new-quick-customer',
    push: Routes.newSale(12),
    sheet: true,
    before: (tester) => tap(tester, find.text(ar.newCustomer)),
  );
  screen('34-sale-new-lines', push: Routes.newSale(12), before: saleLines);
  screen(
    '35-sale-new-payment',
    push: Routes.newSale(12),
    before: (tester) async {
      await saleLines(tester);
      await next(tester);
      await tester.enterText(find.byType(TextField).at(0), '200');
      await tap(tester, find.text(ar.paidInFull));
    },
  );
  screen(
    '36-sale-new-review',
    push: Routes.newSale(12),
    before: (tester) async {
      await saleLines(tester);
      await next(tester);
      await next(tester);
    },
  );
  screen(
    '37-consign',
    push: Routes.newConsignment(12),
    before: (tester) async {
      await tap(tester, find.text(ar.chooseDalal).first);
      await tap(tester, find.text('دلال تجريبي'));
      await tap(tester, find.text(ar.chooseSpecies).first);
      await tap(tester, find.text(stock.first.species!).last);
      await tester.enterText(find.byType(TextField).first, '300');
    },
  );
  screen('38-consignments', push: Routes.consignments);
  screen('39-consignment', push: Routes.consignment(1));
  screen('40-stock', push: Routes.stock);
  screen('41-stock-movements', push: Routes.stockMovements());
  screen('42-dalals', push: Routes.dalals);
  screen(
    '43-dalal-request',
    push: Routes.dalals,
    sheet: true,
    before: (tester) => tap(tester, find.text('دلال القطيف')),
  );

  // Fleet and contacts.
  screen('44-boats', push: Routes.boats);
  screen('45-boat-setup', push: Routes.boat(4));
  screen('46-boat-ready', push: Routes.boat(1));
  screen('47-boat-edit', push: Routes.editBoat(1));
  screen('48-captains', push: Routes.fishers(FisherKind.captain));
  screen('49-captain', push: Routes.fisher(FisherKind.captain, 7));
  screen('50-crew', push: Routes.fishers(FisherKind.crew));
  screen('51-crew-new', push: Routes.newFisher(FisherKind.crew, boatId: 1));
  screen('52-maintenance', push: Routes.maintenance());
  screen('53-maintenance-new', push: Routes.newMaintenance(boatId: 1));
  screen('54-customers', push: Routes.contacts(ContactKind.customer));
  screen('55-customer-edit', push: Routes.contact(ContactKind.customer, 1));
  screen('56-vendors', push: Routes.contacts(ContactKind.vendor));
  screen('57-employees', push: Routes.contacts(ContactKind.employee));
  screen('58-employee-edit', push: Routes.contact(ContactKind.employee, 1));

  // More and the account.
  screen('59-more', go: Routes.more);
  screen('60-profile', push: Routes.profile);
  screen('61-profile-edit', push: Routes.editProfile);
  screen('62-change-password', push: Routes.changePassword);
}

/// One screen, light and dark. The app opens on home (or wherever [session]
/// and [version] send it), then goes to a tab ([go]) or opens a screen over
/// home ([push]), and [before] drives it to the state worth showing. A [sheet]
/// shot is not scrolled.
void screen(
  String name, {
  String? go,
  String? push,
  SessionState session = const SignedIn(owner),
  String version = '1.0.0',
  FakeApi Function() api = busyOwnerApi,
  Future<void> Function(WidgetTester tester)? before,
  bool sheet = false,
  bool settles = true,
}) {
  for (final dark in [false, true]) {
    final theme = dark ? 'dark' : 'light';
    testWidgets('$name $theme', (tester) async {
      tester.view
        ..physicalSize = PhoneFrame.size * PhoneFrame.ratio
        ..devicePixelRatio = PhoneFrame.ratio;
      addTearDown(tester.view.reset);

      late ProviderContainer container;
      await tester.pumpWidget(
        ProviderScope(
          retry: (_, _) => null,
          overrides: [
            apiClientProvider.overrideWith((ref) => api().client()),
            localStoreProvider.overrideWithValue(MemoryLocalStore()),
            tokenStoreProvider.overrideWithValue(MemoryTokenStore()),
            sessionProvider.overrideWith(() => FakeSession(session)),
            appVersionProvider.overrideWithValue(version),
          ],
          child: Builder(
            builder: (context) {
              container = ProviderScope.containerOf(context);
              return PhoneFrame(dark: dark, child: const HawatApp());
            },
          ),
        ),
      );

      Future<void> settle() async {
        if (settles) {
          await tester.pumpAndSettle();
        } else {
          for (var i = 0; i < 10; i++) {
            await tester.pump(const Duration(milliseconds: 100));
          }
        }
      }

      await settle();
      final router = container.read(routerProvider);
      if (go != null) router.go(go);
      if (push != null) unawaited(router.push(push));
      await settle();
      if (before != null) {
        await before(tester);
        await settle();
      }
      FocusManager.instance.primaryFocus?.unfocus();
      await settle();

      final dir = 'docs/screens/$theme';
      final first = '$dir/$name.png';
      await _save(tester, first);

      // The rest of a long screen, a phone height at a time (not under a sheet).
      final scrollable = sheet ? null : _mainScrollable(tester);
      if (scrollable == null) return;
      // Numbered from 1, so the pages sort in order.
      File(first).renameSync('$dir/$name-1.png');
      final position = scrollable.position;
      final step = position.viewportDimension * 0.8;
      for (var page = 2; page <= 5 && position.pixels < position.maxScrollExtent; page++) {
        position.jumpTo((position.pixels + step).clamp(0, position.maxScrollExtent));
        await settle();
        await _save(tester, '$dir/$name-$page.png');
      }
    });
  }
}

/// The tallest vertical scrollable on screen that has more to show.
ScrollableState? _mainScrollable(WidgetTester tester) {
  ScrollableState? main;
  for (final element in find.byType(Scrollable).evaluate()) {
    final state = (element as StatefulElement).state as ScrollableState;
    final position = state.position;
    if (position.axis != Axis.vertical || !position.hasContentDimensions || position.maxScrollExtent < 24) continue;
    if (main == null || position.viewportDimension > main.position.viewportDimension) main = state;
  }
  return main;
}

Future<void> _save(WidgetTester tester, String path) async {
  await tester.runAsync(() async {
    for (final element in find.byType(Image).evaluate()) {
      await precacheImage((element.widget as Image).image, element);
    }
  });
  await tester.pump();
  await tester.runAsync(() async {
    final frame = tester.renderObject<RenderRepaintBoundary>(find.byKey(PhoneFrame.shot));
    final image = await frame.toImage(pixelRatio: PhoneFrame.ratio);
    final png = await image.toByteData(format: ui.ImageByteFormat.png);
    image.dispose();
    File(path)
      ..createSync(recursive: true)
      ..writeAsBytesSync(png!.buffer.asUint8List());
  });
}

/// A phone around the app: bezel, punch-hole camera, status bar and side
/// buttons. The app gets a 360×780 screen with the status bar as its top inset.
class PhoneFrame extends StatelessWidget {
  const PhoneFrame({super.key, required this.dark, required this.child});

  final bool dark;
  final Widget child;

  static const _width = 360.0;
  static const _height = 780.0;
  static const screen = Size(_width, _height);
  static const ratio = 3.0;
  static const _bezel = 11.0;
  static const _button = 3.0;
  static const _statusBar = 32.0;
  static const size = Size(_width + 2 * (_bezel + _button), _height + 2 * _bezel);
  static const shot = Key('phone');

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).copyWith(
      size: screen,
      padding: const EdgeInsets.only(top: _statusBar),
      viewPadding: const EdgeInsets.only(top: _statusBar),
      viewInsets: EdgeInsets.zero,
      platformBrightness: dark ? Brightness.dark : Brightness.light,
    );
    final ink = dark ? Colors.white : const Color(0xFF15181D);

    Widget button(double height) => Container(
      width: _button,
      height: height,
      decoration: const BoxDecoration(
        color: Color(0xFF2B3038),
        borderRadius: BorderRadius.horizontal(left: Radius.circular(2), right: Radius.circular(2)),
      ),
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: RepaintBoundary(
        key: shot,
        child: Stack(
          children: [
            Positioned(left: 0, top: 150, child: button(36)),
            Positioned(left: 0, top: 200, child: button(64)),
            Positioned(right: 0, top: 180, child: button(56)),
            Positioned.fill(
              left: _button,
              right: _button,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color(0xFF101318),
                  borderRadius: BorderRadius.circular(48),
                  border: Border.all(color: const Color(0xFF3A404A), width: 1.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(_bezel),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(38),
                    child: Stack(
                      children: [
                        MediaQuery(data: media, child: child),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 0,
                          height: _statusBar,
                          child: IgnorePointer(child: _StatusBar(ink: ink)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusBar extends StatelessWidget {
  const _StatusBar({required this.ink});

  final Color ink;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              Text(
                '9:41',
                style: TextStyle(fontFamily: 'Tajawal', fontSize: 14, fontWeight: FontWeight.w700, color: ink),
              ),
              const Spacer(),
              Icon(Icons.signal_cellular_alt, size: 15, color: ink),
              const SizedBox(width: 4),
              Icon(Icons.wifi, size: 15, color: ink),
              const SizedBox(width: 5),
              _Battery(ink: ink),
            ],
          ),
          Container(
            width: 11,
            height: 11,
            decoration: BoxDecoration(
              color: const Color(0xFF05070A),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF262B33), width: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

class _Battery extends StatelessWidget {
  const _Battery({required this.ink});

  final Color ink;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 22,
          height: 11,
          padding: const EdgeInsets.all(1.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            border: Border.all(color: ink.withValues(alpha: 0.5)),
          ),
          alignment: AlignmentDirectional.centerStart,
          child: FractionallySizedBox(
            widthFactor: 0.8,
            heightFactor: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(color: ink, borderRadius: BorderRadius.circular(1.5)),
            ),
          ),
        ),
        Container(width: 1.5, height: 4, margin: const EdgeInsets.only(left: 1), color: ink.withValues(alpha: 0.5)),
      ],
    );
  }
}
