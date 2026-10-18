import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hawat_app/core/auth/session.dart';
import 'package:hawat_app/features/auth/presentation/login_screen.dart';

import '../helpers/fake_api.dart';
import '../helpers/harness.dart';

void main() {
  setUpAll(() async {
    await setUpFormatting();
    await loadAppFonts();
  });

  Future<TestApp> open(WidgetTester tester, FakeApi api) async {
    final app = TestApp(api: api, realSession: true, user: null);
    await app.pump(tester, const LoginScreen());
    await tester.pumpAndSettle();
    return app;
  }

  testWidgets('empty fields are caught before any request', (tester) async {
    final api = FakeApi();
    await open(tester, api);

    await tester.tap(find.text(ar.loginButton));
    await tester.pump();

    expect(find.text(ar.phoneRequired), findsOneWidget);
    expect(find.text(ar.passwordRequired), findsOneWidget);
    expect(api.sent('POST', '/auth/login'), isEmpty);
  });

  testWidgets('a short number is refused; +966 is normalized as typed', (tester) async {
    await open(tester, FakeApi());
    final phone = find.byType(TextField).first;

    await tester.enterText(phone, '05123');
    await tester.enterText(find.byType(TextField).last, 'x');
    await tester.tap(find.text(ar.loginButton));
    await tester.pump();
    expect(find.text(ar.phoneInvalid), findsOneWidget);

    await tester.enterText(phone, '+966 50 000 0101');
    expect(find.text('0500000101'), findsOneWidget);
  });

  testWidgets('wrong credentials show the server message under the phone', (tester) async {
    final api = FakeApi()
      ..json('POST', '/auth/login', {
        'message': 'بيانات الدخول غير صحيحة.',
        'errors': {
          'phone': ['بيانات الدخول غير صحيحة.'],
        },
      }, status: 422);
    await open(tester, api);

    await tester.enterText(find.byType(TextField).first, '0500000101');
    await tester.enterText(find.byType(TextField).last, 'wrong');
    await tester.tap(find.text(ar.loginButton));
    await tester.pumpAndSettle();

    expect(find.text('بيانات الدخول غير صحيحة.'), findsOneWidget);
    expect(api.sent('POST', '/auth/login').single.data, containsPair('phone', '0500000101'));
  });

  testWidgets('a correct login signs the owner in and keeps the token', (tester) async {
    final api = FakeApi()
      ..json('POST', '/auth/login', {
        'data': {'token': '9|ok', 'token_type': 'Bearer', 'user': fixtureData<Map<String, dynamic>>('me')},
      });
    final app = await open(tester, api);

    await tester.enterText(find.byType(TextField).first, '0500000001');
    await tester.enterText(find.byType(TextField).last, 'secret');
    await tester.tap(find.text(ar.loginButton));
    await tester.pumpAndSettle();

    expect(app.container.read(sessionProvider), isA<SignedIn>());
    expect(app.tokens.token, '9|ok');
  });

  testWidgets('forgot password opens the support sheet with call and WhatsApp', (tester) async {
    await open(tester, FakeApi());

    await tester.tap(find.text(ar.forgotPassword));
    await tester.pumpAndSettle();

    expect(find.text(ar.forgotBody), findsOneWidget);
    expect(find.textContaining(ar.callSupport), findsOneWidget);
    expect(find.text(ar.whatsappSupport), findsOneWidget);
  });
}
