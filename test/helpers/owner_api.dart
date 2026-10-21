import 'dart:io';

import 'fake_api.dart';

/// Every owner endpoint the app reads, answered from the captured fixtures.
/// Trip lists honour `stage` the way the server does.
FakeApi ownerApi() {
  final api = FakeApi();
  final trips = (fixture('trips')['data'] as List).cast<Map<String, dynamic>>();

  bool inStage(Map<String, dynamic> t, String? stage) {
    final status = t['status'];
    final sale = t['sale_status'];
    const counted = ['بانتظار الاعتماد', 'معتمدة'];
    return switch (stage) {
      'scheduled' => status == 'مجدولة',
      'in_progress' => ['في البحر', 'عادت للميناء', 'بانتظار الإحصاء', 'تحت الإحصاء'].contains(status),
      'for_sale' => sale == 'قيد البيع',
      'done' => sale == 'مباعة' || (counted.contains(status) && sale == 'لم يبدأ'),
      'cancelled' => status == 'ملغاة',
      _ => true,
    };
  }

  Map<String, dynamic> page(List<Object?> rows) => {
    'data': rows,
    'links': {'first': null, 'last': null, 'prev': null, 'next': null},
    'meta': {'current_page': 1, 'last_page': 1, 'per_page': 25, 'total': rows.length, 'from': 1, 'to': rows.length},
  };

  api
    ..json('GET', '/auth/me', fixture('me'))
    ..json('GET', '/app/config', fixture('app_config'))
    ..json('GET', '/lookups', fixture('lookups'))
    ..json('GET', '/owner/dashboard', fixture('dashboard'))
    ..json('GET', '/owner/boats', fixture('boats'))
    ..json('GET', '/owner/captains', fixture('captains'))
    ..json('GET', '/owner/sales', fixture('sales'))
    ..on('GET', '/owner/consignments', (request) {
      // A trip's own consignments are empty in the fixtures; the full list is captured.
      return Reply(request.queryParameters['trip_id'] == null ? fixture('consignments') : page(const []));
    })
    ..on('GET', '/owner/consignments/*', (_) => Reply(fixture('consignment_detail')))
    ..json('GET', '/owner/stock', fixture('stock'))
    ..json('GET', '/owner/stock/movements', fixture('stock_movements'))
    ..json('GET', '/owner/dalals', fixture('dalals'))
    ..json('GET', '/owner/customers', fixture('customers'))
    ..json('GET', '/owner/catch-log', fixture('catch_log'))
    ..json('GET', '/owner/catch-log/summary', fixture('catch_summary'))
    ..json('GET', '/notifications', fixture('notifications'))
    ..json('GET', '/notifications/unread-count', {
      'data': {'unread_count': 2},
    })
    ..on('GET', '/owner/trips', (request) {
      final stage = request.queryParameters['stage'] as String?;
      final search = (request.queryParameters['search'] as String?) ?? '';
      return Reply(
        page(trips.where((t) => inStage(t, stage) && (t['trip_number'] as String).contains(search)).toList()),
      );
    })
    ..on('GET', '/owner/trips/*', (request) {
      final id = request.uri.pathSegments.last;
      final detail = File('test/fixtures/trip_$id.json');
      if (detail.existsSync()) return Reply(fixture('trip_$id'));
      final row = trips.where((t) => '${t['id']}' == id).firstOrNull;
      return row == null ? const Reply({'message': 'غير موجود'}, status: 404) : Reply({'data': row});
    })
    ..on('GET', '/owner/sales/*', (_) => Reply(fixture('sale_detail')));
  return api;
}

/// [ownerApi] with a month of sales on the dashboard, so every home section has content.
FakeApi busyOwnerApi() {
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
        'customer': {
          'id': i,
          'name': ['سوق القطيف المركزي', 'محل أبو خالد للأسماك', 'مطعم البحر', 'سالم الدوسري'][i],
          'phone': null,
        },
      },
  ];
  return api..json('GET', '/owner/dashboard', dashboard);
}
