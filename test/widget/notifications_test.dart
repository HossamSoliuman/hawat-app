import 'package:flutter_test/flutter_test.dart';
import 'package:hawat_app/features/notifications/presentation/notifications_screen.dart';

import '../helpers/fake_api.dart';
import '../helpers/harness.dart';
import '../helpers/owner_api.dart';

void main() {
  setUpAll(() async {
    await setUpFormatting();
    await loadAppFonts();
  });

  testWidgets('a trip notification is marked read and opens the trip', (tester) async {
    final api = ownerApi()..json('POST', '/notifications/*', {'data': {}});
    final app = TestApp(api: api);
    await app.pump(tester, const NotificationsScreen());
    await tester.pumpAndSettle();

    final tripNote = (fixture('notifications')['data'] as List).cast<Map<String, dynamic>>().firstWhere(
      (n) => n['trip'] != null,
    );
    await tester.tap(find.text(tripNote['title'] as String));
    await tester.pumpAndSettle();

    expect(api.sent('POST', '/notifications/${tripNote['id']}/read'), hasLength(1));
    expect(app.visited.last, '/trip/${(tripNote['trip'] as Map)['id']}');
  });

  testWidgets('a dalal notification opens the dalals', (tester) async {
    final api = ownerApi()..json('POST', '/notifications/*', {'data': {}});
    final app = TestApp(api: api);
    await app.pump(tester, const NotificationsScreen());
    await tester.pumpAndSettle();

    await tester.tap(find.text('دفعة من الدلال').first);
    await tester.pumpAndSettle();

    expect(app.visited.last, '/dalals');
  });

  testWidgets('a notification about a screen not in the app stays on the list', (tester) async {
    final notes = fixture('notifications');
    for (final n in (notes['data'] as List).cast<Map<String, dynamic>>()) {
      if ((n['payload'] as Map?)?['target'] == 'dalals') (n['payload'] as Map)['target'] = 'dalal_invoice';
    }
    final api = ownerApi()
      ..json('GET', '/notifications', notes)
      ..json('POST', '/notifications/*', {'data': {}});
    final app = TestApp(api: api);
    await app.pump(tester, const NotificationsScreen());
    await tester.pumpAndSettle();

    await tester.tap(find.text('دفعة من الدلال').first);
    await tester.pumpAndSettle();

    expect(app.visited, isEmpty);
    expect(find.text(ar.earlierSection), findsOneWidget, reason: 'it moved under the read ones');
  });

  testWidgets('read all clears the new section', (tester) async {
    final api = ownerApi()
      ..json('POST', '/notifications/read-all', {
        'data': {'marked': 3},
      });
    await TestApp(api: api).pump(tester, const NotificationsScreen());
    await tester.pumpAndSettle();

    await tester.tap(find.text(ar.markAllRead));
    await tester.pumpAndSettle();

    expect(find.text(ar.unreadSection), findsNothing);
    expect(find.text(ar.markAllRead), findsNothing);
  });
}
