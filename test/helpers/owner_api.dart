import 'dart:io';

import 'package:dio/dio.dart';

import 'fake_api.dart';
import 'harness.dart';

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

  /// A record's own fixture when one was captured for it, else its list row.
  Reply detail(RequestOptions request, String list, String? captured) {
    final id = request.uri.pathSegments.last;
    if (captured != null && '${fixtureData<Map<String, dynamic>>(captured)['id']}' == id) {
      return Reply(fixture(captured));
    }
    final row = (fixture(list)['data'] as List)
        .cast<Map<String, dynamic>>()
        .where((r) => '${r['id']}' == id)
        .firstOrNull;
    return row == null ? const Reply({'message': 'غير موجود'}, status: 404) : Reply({'data': row});
  }

  api
    ..json('GET', '/auth/me', fixture('me'))
    ..json('GET', '/app/config', fixture('app_config'))
    ..json('GET', '/lookups', fixture('lookups'))
    ..json('GET', '/owner/dashboard', fixture('dashboard'))
    ..json('GET', '/owner/boats', fixture('boats'))
    ..on('GET', '/owner/boats/*', (request) => detail(request, 'boats', 'boat_detail'))
    ..json('GET', '/owner/captains', fixture('captains'))
    ..on('GET', '/owner/captains/*', (request) => detail(request, 'captains', 'captain_detail'))
    ..on('GET', '/owner/crew', (request) {
      final boat = request.queryParameters['boat_id'];
      final crew = (fixture('crew')['data'] as List).cast<Map<String, dynamic>>();
      return Reply(page(crew.where((c) => boat == null || '${(c['boat'] as Map?)?['id']}' == '$boat').toList()));
    })
    ..on('GET', '/owner/crew/*', (request) => detail(request, 'crew', 'crew_detail'))
    ..on('GET', '/owner/maintenance', (request) {
      final boat = request.queryParameters['boat_id'];
      final rows = (fixture('maintenance')['data'] as List).cast<Map<String, dynamic>>();
      return Reply(page(rows.where((m) => boat == null || '${(m['boat'] as Map?)?['id']}' == '$boat').toList()));
    })
    ..on('GET', '/owner/customers/*', (request) => detail(request, 'customers', null))
    ..json('GET', '/owner/vendors', fixture('vendors'))
    ..on('GET', '/owner/vendors/*', (request) => detail(request, 'vendors', null))
    ..json('GET', '/owner/employees', fixture('employees'))
    ..on('GET', '/owner/employees/*', (request) => detail(request, 'employees', null))
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

/// [ownerApi] on a busy morning ([testNow]): a boat back late, one about to
/// sail, one at sea, one at the counter, catch waiting days to be sold,
/// invoices left unpaid, and the month ahead of the last one.
FakeApi busyOwnerApi() {
  final api = ownerApi();
  final dashboard = fixture('dashboard');
  final data = dashboard['data'] as Map<String, dynamic>;
  String ago(Duration d) => testNow.subtract(d).toUtc().toIso8601String();
  String ahead(Duration d) => testNow.add(d).toUtc().toIso8601String();
  final trips = {for (final t in (fixture('trips')['data'] as List).cast<Map<String, dynamic>>()) t['id'] as int: t};
  final boats = {
    for (final b in (fixture('boats')['data'] as List).cast<Map<String, dynamic>>())
      b['id'] as int: {'id': b['id'], 'name': b['name'], 'boat_number': b['boat_number'], 'status': b['status']},
  };
  Map<String, dynamic> boatRef(int id) => {
    'id': id,
    'name': boats[id]!['name'],
    'boat_number': boats[id]!['boat_number'],
  };

  (data['kpis'] as Map)
    ..['revenue'] = 48250
    ..['previous_revenue'] = 41200
    ..['collected'] = 41950
    ..['uncollected'] = 6300
    ..['catch_kg'] = 1840.5
    ..['unpaid'] = 6300;
  data['action_items'] = {'trips_to_start': 1, 'trips_to_sell': 4, 'unpaid_sales': 3, 'unpaid_total': 6300};
  final months = data['revenue_by_month'] as List;
  const totals = [12400, 18900, 9800, 22350, 31200, 48250];
  for (var i = 0; i < months.length; i++) {
    (months[i] as Map)['total'] = totals[i];
  }

  data['fleet'] = [
    {
      ...boats[6]!,
      'trip': {...trips[5]!, 'started_at': ago(const Duration(days: 6, hours: 2)), 'planned_days': 4},
    },
    {
      ...boats[1]!,
      'status': 'نشط',
      'trip': {...trips[16]!, 'departure_time': ahead(const Duration(hours: 7))},
    },
    {
      ...boats[5]!,
      'trip': {...trips[15]!, 'started_at': ago(const Duration(days: 2, hours: 3)), 'planned_days': 5},
    },
    {
      ...boats[3]!,
      'trip': {...trips[8]!, 'catch_submitted_at': ago(const Duration(hours: 5))},
    },
    {...boats[2]!, 'status': 'نشط', 'trip': null},
    {...boats[4]!, 'status': 'صيانة', 'trip': null},
  ];

  data['trips_to_sell'] = [
    {
      ...trips[13]!,
      'counted_at': ago(const Duration(days: 3, hours: 4)),
      'available_stock': [
        {'species_id': 5, 'species': 'الحريد', 'available_kg': 420},
        {'species_id': 1, 'species': 'الهامور', 'available_kg': 380},
      ],
    },
    {
      ...trips[12]!,
      'counted_at': ago(const Duration(days: 1, hours: 2)),
      'available_stock': [
        {'species_id': 3, 'species': 'الكنعد', 'available_kg': 1240},
        {'species_id': 2, 'species': 'الشعري', 'available_kg': 860},
      ],
    },
    {
      ...trips[11]!,
      'boat': boatRef(3),
      'counted_at': ago(const Duration(hours: 6)),
      'available_stock': [
        {'species_id': 4, 'species': 'الناجل', 'available_kg': 640},
        {'species_id': 3, 'species': 'الكنعد', 'available_kg': 310},
      ],
    },
  ];

  final sale = (fixture('sales')['data'] as List).first as Map<String, dynamic>;
  data['unpaid_sales'] = [
    for (final (i, (name, phone, total, paid, age)) in const [
      ('محل أبو خالد للأسماك', '0551234567', 1250.5, 0, Duration(days: 12)),
      ('مطعم البحر', '0559876543', 9600, 6000, Duration(days: 3)),
      ('سالم الدوسري', null, 1449.5, 0, Duration(hours: 20)),
    ].indexed)
      {
        ...sale,
        'id': 101 + i,
        'invoice_number': '26-10-000${120 + i}',
        'total': total,
        'paid_amount': paid,
        'remaining': total - paid,
        'sold_at': ago(age),
        'customer': {'id': 11 + i, 'name': name, 'phone': phone},
      },
  ];
  return api..json('GET', '/owner/dashboard', dashboard);
}
