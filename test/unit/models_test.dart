import 'package:flutter_test/flutter_test.dart';
import 'package:hawat_app/core/auth/user.dart';
import 'package:hawat_app/core/config/app_config.dart';
import 'package:hawat_app/features/catch_log/data/catch_log.dart';
import 'package:hawat_app/features/fleet/data/fleet.dart';
import 'package:hawat_app/features/home/data/dashboard.dart';
import 'package:hawat_app/features/lookups/data/lookups.dart';
import 'package:hawat_app/features/notifications/data/app_notification.dart';
import 'package:hawat_app/features/sales/data/sale.dart';
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
    expect(rows('captains').map(Captain.fromJson), isNotEmpty);
    expect(rows('catch_log').map(CatchLogEntry.fromJson), isNotEmpty);
    expect(CatchLogSummary.fromJson(fixtureData('catch_summary')).bySpecies, isNotEmpty);
    expect(Sale.fromJson(fixtureData('sale_detail')).items, isNotEmpty);
  });

  test('the dashboard carries period, action items and the trips the home shows', () {
    final d = Dashboard.fromJson(fixtureData('dashboard'));
    expect(d.period, 'month');
    expect(d.actionItems.tripsToStart, d.kpis.tripsScheduled);
    expect(d.actionItems.tripsToSell, d.kpis.tripsForSale);
    expect(d.revenueByMonth, hasLength(6));
    expect(d.scheduledTrips.every((t) => t.phase == TripPhase.scheduled), isTrue);
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
    expect(const Sale(id: 1, invoiceNumber: 'x', total: 100, paidAmount: 40, remaining: 60).paymentState, PaymentState.partial);
    expect(const Sale(id: 1, invoiceNumber: 'x', total: 100, remaining: 100).paymentState, PaymentState.unpaid);
  });

  test('trip input sends UTC times and drops blank text', () {
    final json = TripInput(boatId: 3, departureTime: DateTime.utc(2026, 10, 18, 4, 30), notes: '  ', gearType: 'شباك').toJson();
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
