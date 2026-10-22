import 'package:flutter_test/flutter_test.dart';
import 'package:hawat_app/core/api/page.dart';
import 'package:hawat_app/core/api/resource_repository.dart';
import 'package:hawat_app/core/auth/user.dart';
import 'package:hawat_app/core/config/app_config.dart';
import 'package:hawat_app/features/catch_log/data/catch_log.dart';
import 'package:hawat_app/features/consignments/data/consignment.dart';
import 'package:hawat_app/features/contacts/data/customer.dart';
import 'package:hawat_app/features/dalals/data/dalal.dart';
import 'package:hawat_app/features/fleet/data/fleet.dart';
import 'package:hawat_app/features/fleet/presentation/fleet_ui.dart';
import 'package:hawat_app/features/home/data/dashboard.dart';
import 'package:hawat_app/features/lookups/data/lookups.dart';
import 'package:hawat_app/features/notifications/data/app_notification.dart';
import 'package:hawat_app/features/sales/data/sale.dart';
import 'package:hawat_app/features/sales/data/sales_providers.dart';
import 'package:hawat_app/features/stock/data/stock.dart';
import 'package:hawat_app/features/trips/data/trip.dart';

import '../helpers/fake_api.dart';

/// The models read real responses captured from the server (test/fixtures).
void main() {
  List<Map<String, dynamic>> rows(String name) => (fixture(name)['data'] as List).cast<Map<String, dynamic>>();

  test('every captured response parses', () {
    expect(AppUser.fromJson(fixtureData('me')).isOwner, isTrue);
    expect(AppConfig.fromJson(fixtureData('app_config')).smsEnabled, isFalse);
    expect(Lookups.fromJson(fixtureData('lookups')).species, isNotEmpty);
    expect(rows('trips').map(Trip.fromJson), hasLength(16));
    expect(rows('sales').map(Sale.fromJson), isNotEmpty);
    expect(rows('notifications').map(AppNotification.fromJson), isNotEmpty);
    expect(rows('boats').map(Boat.fromJson).first.setup, isNotNull);
    expect(rows('captains').map(Fisher.fromJson), isNotEmpty);
    expect(rows('catch_log').map(CatchLogEntry.fromJson), isNotEmpty);
    expect(CatchLogSummary.fromJson(fixtureData('catch_summary')).bySpecies, isNotEmpty);
    expect(Sale.fromJson(fixtureData('sale_detail')).items, isNotEmpty);
    expect(rows('consignments').map(Consignment.fromJson).first.items, isNotEmpty);
    expect(Consignment.fromJson(fixtureData('consignment_detail')).dalal?.name, isNotEmpty);
    expect(rows('stock').map(StockLine.fromJson), isNotEmpty);
    expect(rows('stock_movements').map(StockMovement.fromJson), isNotEmpty);
    expect(rows('customers').map(Customer.fromJson), isNotEmpty);
    expect(rows('dalals').map(Dalal.fromJson), isNotEmpty);
    expect(rows('crew').map(Fisher.fromJson).every((f) => !f.isCaptain && f.kind == FisherKind.crew), isTrue);
    expect(rows('maintenance').map(Maintenance.fromJson).first.expense?.total, 2300);
    expect(rows('vendors').map(Vendor.fromJson), isNotEmpty);
    expect(rows('employees').map(Employee.fromJson).first.jobTitle?.name, isNotEmpty);
  });

  test('a boat and a fisher read every field the screens show', () {
    final boat = Boat.fromJson(fixtureData('boat_detail'));
    expect(boat.version, 1);
    expect(boat.lengthM, 12.5);
    expect(boat.nextInspectionDate, DateTime(2026, 10, 5));
    expect(boat.license?.status, 'سارية');
    expect(boat.setup?.ready, isTrue);
    expect(boat.captain?.name, isNotEmpty);

    final captain = Fisher.fromJson(fixtureData('captain_detail'));
    expect(captain.isCaptain, isTrue);
    expect(captain.kind, FisherKind.captain);
    expect(captain.version, 1);
    expect(captain.boat?.id, boat.id);

    final customer = Customer.fromJson(rows('customers').first);
    expect(customer.salesCount, 1);
    expect(customer.salesTotal, 6050);
    expect(Customer.fromJson(rows('customers').last).salesTotal, isNull);
  });

  test('form bodies: trimmed text, empty is null, dates without a time', () {
    expect(Body.text('  قارب  '), 'قارب');
    expect(Body.text('   '), isNull);
    expect(Body.number('12.5'), 12.5);
    expect(Body.integer(''), isNull);
    expect(Body.date(DateTime(2026, 3, 7, 18, 30)), '2026-03-07');
  });

  test('a document ends: expired, within 30 days, or fine', () {
    final now = DateTime(2026, 10, 21);
    expect(ExpiryState.of(null, now: now), ExpiryState.none);
    expect(ExpiryState.of(DateTime(2026, 10, 20), now: now), ExpiryState.expired);
    expect(ExpiryState.of(DateTime(2026, 10, 21), now: now), ExpiryState.soon);
    expect(ExpiryState.of(DateTime(2026, 11, 20), now: now), ExpiryState.soon);
    expect(ExpiryState.of(DateTime(2026, 11, 21), now: now), ExpiryState.valid);
  });

  test('the sales list keeps the totals of every matching invoice', () {
    final list = PagedList.first(PageResult.fromJson(fixture('sales'), Sale.fromJson));
    final totals = salesTotalsOf(list)!;
    expect(totals.count, list.total);
    expect(totals.total, 6050);
    expect(totals.remaining, 0);
    final more = list.append(PageResult.fromJson({'data': const [], 'meta': const {}}, Sale.fromJson));
    expect(salesTotalsOf(more), totals, reason: 'later pages keep the first page totals');
  });

  test('stock moves in and out, and a dalal deal is read from its partnership', () {
    final moves = rows('stock_movements').map(StockMovement.fromJson).toList();
    expect(moves.any((m) => m.isIn), isTrue);
    expect(moves.any((m) => !m.isIn), isTrue);

    final dalals = rows('dalals').map(Dalal.fromJson).toList();
    expect(dalals.where((d) => d.hasAgreement), hasLength(1));
    final agreed = dalals.firstWhere((d) => d.hasAgreement).partnership!;
    expect(agreed.commissionPct, 5);
    expect(agreed.wagePct, 2);
    expect(dalals.where((d) => d.partnership == null), hasLength(1));
  });

  test('a sale and a consignment send what the server reads', () {
    const sale = SaleInput(
      tripId: 12,
      customerId: 3,
      paymentMethodId: 1,
      discount: 50,
      paidAmount: 1000,
      notes: '  ',
      items: [
        SaleLineInput(speciesId: 4, weightKg: 100, pricePerKg: 45),
        SaleLineInput(speciesId: 4, weightKg: 20.5, pricePerKg: 40),
      ],
    );
    expect(sale.toJson(), {
      'trip_id': 12,
      'customer_id': 3,
      'payment_method_id': 1,
      'discount': 50.0,
      'paid_amount': 1000.0,
      'items': [
        {'species_id': 4, 'weight_kg': 100.0, 'price_per_kg': 45.0},
        {'species_id': 4, 'weight_kg': 20.5, 'price_per_kg': 40.0},
      ],
    });
    // Paid in full and no discount: the server defaults them.
    expect(
      const SaleInput(tripId: 1, items: []).toJson().keys,
      isNot(containsAll(['discount', 'paid_amount', 'notes'])),
    );

    const consignment = ConsignmentInput(
      tripId: 12,
      dalalId: 10,
      notes: 'دفعة الصباح',
      items: [ConsignLineInput(speciesId: 4, weightKg: 30)],
    );
    expect(consignment.toJson(), {
      'trip_id': 12,
      'dalal_id': 10,
      'notes': 'دفعة الصباح',
      'items': [
        {'species_id': 4, 'weight_kg': 30.0},
      ],
    });
  });

  test('the dashboard carries period, action items and the trips the home shows', () {
    final d = Dashboard.fromJson(fixtureData('dashboard'));
    expect(d.period, 'month');
    expect(d.actionItems.tripsToStart, d.kpis.tripsScheduled);
    expect(d.actionItems.tripsToSell, d.kpis.tripsForSale);
    expect(d.revenueByMonth, hasLength(6));
    expect(d.scheduledTrips.every((t) => t.phase == TripPhase.scheduled), isTrue);
    expect(d.fleet, isNotEmpty);
    expect(d.fleet!.where((b) => b.trip != null).every((b) => b.trip!.boat?.id == b.id), isTrue);
    expect(d.catchToSell.every((t) => t.phase == TripPhase.forSale), isTrue);
    expect(d.catchToSell.first.availableLines, isNotEmpty);
    expect(d.kpis.previousRevenue, isNotNull);
  });

  test('from a server before 1.10.0 the boats list and the home trips stand in', () {
    final json = fixtureData<Map<String, dynamic>>('dashboard')
      ..remove('fleet')
      ..remove('trips_to_sell')
      ..remove('unpaid_sales');
    final d = Dashboard.fromJson(json);
    expect(d.fleet, isNull);
    expect(d.kpis.collected, isNotNull);

    final boats = [for (final b in fixtureData<List<dynamic>>('boats')) Boat.fromJson(b as Map<String, dynamic>)];
    final fleet = d.fleetFrom(boats);
    expect(fleet.map((b) => b.id), containsAll(boats.map((b) => b.id)));
    // درة فرسان has trip 5 at sea and trip 9 at the counter: at sea wins.
    expect(fleet.firstWhere((b) => b.id == 6).trip?.id, 5);
    expect(fleet.firstWhere((b) => b.id == 1).trip?.id, 16);
    expect(fleet.firstWhere((b) => b.id == 2).trip, isNull);
    expect(d.catchToSell, isNotEmpty);
    expect(d.catchToSell.every((t) => t.phase == TripPhase.forSale), isTrue);
  });

  test('a trip detail brings its catch lines and what is left to sell', () {
    final trip = Trip.fromJson(fixtureData('trip_12'));
    expect(trip.phase, TripPhase.forSale);
    expect(trip.catchRecords, isNotEmpty);
    expect(trip.availableStock, isNotEmpty);
    expect(trip.availableKg, greaterThan(0));
    expect(trip.canSell, isTrue);
  });

  group('trip phase follows the ministry status and the sale status', () {
    Trip trip(String status, [String sale = TripStatus.saleNotStarted]) =>
        Trip(id: 1, tripNumber: 'TR-2026-0001', status: status, saleStatus: sale);

    test('each status lands on its step', () {
      expect(trip(TripStatus.scheduled).phase, TripPhase.scheduled);
      expect(trip(TripStatus.atSea).phase, TripPhase.atSea);
      expect(trip(TripStatus.returned).phase, TripPhase.awaitingCounter);
      expect(trip(TripStatus.awaitingCount).phase, TripPhase.awaitingCounter);
      expect(trip(TripStatus.counting).phase, TripPhase.counting);
      expect(trip(TripStatus.awaitingApproval, TripStatus.saleOpen).phase, TripPhase.forSale);
      expect(trip(TripStatus.approved, TripStatus.saleDone).phase, TripPhase.sold);
      expect(trip(TripStatus.approved).phase, TripPhase.counted);
      expect(trip(TripStatus.cancelled).phase, TripPhase.cancelled);
    });

    test('the step index matches the server progress_step', () {
      for (final row in rows('trips')) {
        final t = Trip.fromJson(row);
        if (t.phase == TripPhase.cancelled) continue;
        expect(t.phase.step, t.progressStep, reason: '${t.tripNumber} ${t.status}');
      }
    });

    test('only the allowed actions are offered', () {
      expect(trip(TripStatus.scheduled).canStart, isTrue);
      expect(trip(TripStatus.scheduled).canCancel, isTrue);
      expect(trip(TripStatus.atSea).canSubmitCatch, isTrue);
      expect(trip(TripStatus.atSea).canCancel, isTrue);
      expect(trip(TripStatus.atSea).canEdit, isFalse);
      expect(trip(TripStatus.awaitingCount).canCancel, isFalse);
    });
  });

  test('payment state reads the server amounts', () {
    expect(const Sale(id: 1, invoiceNumber: 'x', total: 100, paidAmount: 100).paymentState, PaymentState.paid);
    expect(
      const Sale(id: 1, invoiceNumber: 'x', total: 100, paidAmount: 40, remaining: 60).paymentState,
      PaymentState.partial,
    );
    expect(const Sale(id: 1, invoiceNumber: 'x', total: 100, remaining: 100).paymentState, PaymentState.unpaid);
  });

  test('trip input sends UTC times and drops blank text', () {
    final json = TripInput(
      boatId: 3,
      departureTime: DateTime.utc(2026, 10, 18, 4, 30),
      notes: '  ',
      gearType: 'شباك',
    ).toJson();
    expect(json['boat_id'], 3);
    expect(json['departure_time'], '2026-10-18T04:30:00.000Z');
    expect(json['notes'], isNull);
    expect(json['gear_type'], 'شباك');
  });

  test('a forced update compares versions numerically', () {
    const config = AppConfig(minVersion: '1.10.0');
    expect(config.requiresUpdate('1.9.3'), isTrue);
    expect(config.requiresUpdate('1.10.0'), isFalse);
    expect(config.requiresUpdate('2.0.0+7'), isFalse);
  });

  test('notifications find their trip or invoice', () {
    const n = AppNotification(id: 1, payload: {'target': 'sale', 'sale_id': 9, 'trip_id': '4'});
    expect(n.target, 'sale');
    expect(n.saleId, 9);
    expect(n.tripId, 4);
  });
}
