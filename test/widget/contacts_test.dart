import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hawat_app/features/contacts/presentation/contact_form_screen.dart';
import 'package:hawat_app/features/contacts/presentation/contacts_screens.dart';

import '../helpers/fake_api.dart';
import '../helpers/harness.dart';
import '../helpers/owner_api.dart';

void main() {
  setUpAll(() async {
    await setUpFormatting();
    await loadAppFonts();
  });

  testWidgets('the customers list searches on the server once typing pauses', (tester) async {
    final api = ownerApi();
    final app = TestApp(api: api);
    await app.pump(tester, const CustomersScreen());
    await tester.pumpAndSettle();

    expect(find.text('سوق السمك المركزي'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'سوق');
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pumpAndSettle();
    expect(api.sent('GET', '/owner/customers').last.queryParameters['search'], 'سوق');

    await tester.tap(find.text('سوق السمك المركزي'));
    await tester.pumpAndSettle();
    expect(app.visited.last, '/contact/customer/1');
  });

  testWidgets('a new customer needs a name, then is created', (tester) async {
    final api = ownerApi()
      ..json('POST', '/owner/customers', {
        'data': {'id': 9, 'name': 'مطعم الميناء', 'status': 'نشط', 'sales_count': 0},
      }, status: 201);
    await TestApp(api: api)
        .pump(tester, const ContactFormScreen(kind: ContactKind.customer), size: const Size(360, 1400));
    await tester.pumpAndSettle();

    await tester.tap(find.text(ar.save));
    await tester.pump();
    expect(find.text(ar.nameRequired), findsOneWidget);

    await tester.enterText(find.byType(TextField).at(0), '  مطعم الميناء ');
    await tester.enterText(find.byType(TextField).at(1), '0555123456');
    await tester.tap(find.text(ar.save));
    await tester.pumpAndSettle();

    final sent = api.sent('POST', '/owner/customers').single.data as Map;
    expect(sent['name'], 'مطعم الميناء');
    expect(sent['phone'], '0555123456');
    expect(sent['status'], 'نشط');
    expect(sent['email'], isNull);
  });

  testWidgets('a vendor opens filled in, saves, and can be deleted', (tester) async {
    final vendor = (fixture('vendors')['data'] as List).first as Map<String, dynamic>;
    final api = ownerApi()
      ..on('PUT', '/owner/vendors/1', (request) => Reply({'data': vendor}))
      ..json('DELETE', '/owner/vendors/1', {'message': 'حُذف'});
    await TestApp(api: api)
        .pump(tester, const ContactFormScreen(kind: ContactKind.vendor, id: 1), size: const Size(360, 1400));
    await tester.pumpAndSettle();

    expect(find.widgetWithText(TextField, vendor['name'] as String), findsOneWidget);
    expect(find.text(ar.customerTypeLabel), findsNothing);
    await tester.tap(find.text(ar.save));
    await tester.pumpAndSettle();
    expect((api.sent('PUT', '/owner/vendors/1').single.data as Map)['name'], vendor['name']);

    await tester.pumpWidget(const SizedBox());
    await TestApp(api: api)
        .pump(tester, const ContactFormScreen(kind: ContactKind.vendor, id: 1), size: const Size(360, 1400));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip(ar.deleteAction));
    await tester.pumpAndSettle();
    expect(find.text(ar.deleteTitle(vendor['name'] as String)), findsOneWidget);
    await tester.tap(find.text(ar.deleteAction).last);
    await tester.pumpAndSettle();
    expect(api.sent('DELETE', '/owner/vendors/1'), hasLength(1));
  });

  testWidgets('an employee has a job title, an id number and a nationality', (tester) async {
    await TestApp(api: ownerApi())
        .pump(tester, const ContactFormScreen(kind: ContactKind.employee, id: 1), size: const Size(360, 1600));
    await tester.pumpAndSettle();

    expect(find.text(ar.jobTitleLabel), findsOneWidget);
    expect(find.text(ar.idNumberLabel), findsOneWidget);
    expect(find.widgetWithText(TextField, 'سعودي'), findsOneWidget);
  });
}
