@Tags(['e2e'])
library;

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hawat_app/core/api/api_client.dart';
import 'package:hawat_app/core/api/api_exception.dart';
import 'package:hawat_app/core/auth/auth_repository.dart';
import 'package:hawat_app/features/fleet/data/fleet.dart';
import 'package:hawat_app/features/home/data/dashboard.dart';
import 'package:hawat_app/features/lookups/data/lookups.dart';
import 'package:hawat_app/features/trips/data/trip.dart';
import 'package:hawat_app/features/trips/data/trips_repository.dart';

/// The whole trip cycle against a real server, through the app's own
/// repositories: create → start → deliver the catch → the port's counter
/// counts it → the trip is for sale with the counted kg.
///
/// Runs only when pointed at a server with test accounts (never production):
///   HAWAT_E2E_API=http://hawat.test/api/v1 HAWAT_E2E_OWNER=0500000001 \
///   HAWAT_E2E_COUNTER=0500000003 HAWAT_E2E_PASSWORD=... flutter test --tags e2e
void main() {
  final env = Platform.environment;
  final base = env['HAWAT_E2E_API'];
  final skip = base == null ? 'set HAWAT_E2E_API to run against a test server' : null;

  Future<(ApiClient, String)> signIn(String phone) async {
    String? token;
    final client = ApiClient(baseUrl: base!, tokenProvider: () => token, onUnauthorized: () {}, dio: Dio());
    final result = await AuthRepository(client)
        .login(phone: phone, password: env['HAWAT_E2E_PASSWORD'] ?? '', deviceName: 'e2e');
    token = result.token;
    return (client, result.token);
  }

  test('a trip runs from creation to sale', () async {
    final (owner, _) = await signIn(env['HAWAT_E2E_OWNER'] ?? '0500000001');
    final (counter, _) = await signIn(env['HAWAT_E2E_COUNTER'] ?? '0500000003');
    final trips = TripsRepository(owner);

    final counterPort = ((await counter.get('/auth/me'))['data'] as Map)['port'] as Map;
    final lookups = Lookups.fromJson((await owner.get('/lookups'))['data'] as Map<String, dynamic>);
    final boat = Boat.fromJson(
      ((await owner.get('/owner/boats', query: {'per_page': 1}))['data'] as List).first as Map<String, dynamic>,
    );
    final before = Dashboard.fromJson(
      (await owner.get('/owner/dashboard', query: {'period': 'today'}))['data'] as Map<String, dynamic>,
    );
    expect(before.period, 'today');

    // 1. New trip at the counter's port; the same key twice creates one trip.
    final key = ApiClient.newIdempotencyKey();
    final input = TripInput(boatId: boat.id, departurePortId: counterPort['id'] as int, plannedDays: 2);
    final created = await trips.create(input, idempotencyKey: key);
    final replay = await trips.create(input, idempotencyKey: key);
    expect(replay.id, created.id);
    expect(created.phase, TripPhase.scheduled);

    // 2. Start → at sea.
    final started = await trips.start(created.id, idempotencyKey: ApiClient.newIdempotencyKey());
    expect(started.phase, TripPhase.atSea);
    final scheduledNow = (await trips.list(stage: TripStage.scheduled)).items.map((t) => t.id);
    expect(scheduledNow, isNot(contains(created.id)));
    expect((await trips.list(stage: TripStage.inProgress)).items.map((t) => t.id), contains(created.id));

    // 3. Deliver the catch → waits for the counter.
    final a = lookups.species[0].id;
    final b = lookups.species[1].id;
    final delivered = await trips.submitCatch(created.id, [
      CatchLineInput(speciesId: a, weightKg: 100),
      CatchLineInput(speciesId: b, weightKg: 40.5, notes: 'صندوق إضافي'),
    ], idempotencyKey: ApiClient.newIdempotencyKey());
    expect(delivered.phase, TripPhase.awaitingCounter);
    expect(delivered.captainInputKg, 140.5);

    // A second catch is refused with an Arabic message.
    await expectLater(
      trips.submitCatch(created.id, [
        CatchLineInput(speciesId: a, weightKg: 1),
      ], idempotencyKey: ApiClient.newIdempotencyKey()),
      throwsA(isA<ValidationException>()),
    );

    // 4. The port's counter receives and counts.
    await counter.post('/counter/trips/${created.id}/receive', idempotencyKey: ApiClient.newIdempotencyKey());
    await counter.post(
      '/counter/trips/${created.id}/count',
      data: {
        'items': [
          {'species_id': a, 'weight_kg': 98},
          {'species_id': b, 'weight_kg': 40},
        ],
      },
      idempotencyKey: ApiClient.newIdempotencyKey(),
    );

    // 5. For sale, with the counted kg and what is available.
    final counted = await trips.get(created.id);
    expect(counted.phase, TripPhase.forSale);
    expect(counted.actualWeightKg, 138);
    expect(counted.availableKg, 138);
    expect((await trips.list(stage: TripStage.forSale)).items.map((t) => t.id), contains(created.id));

    final after = Dashboard.fromJson(
      (await owner.get('/owner/dashboard', query: {'period': 'today'}))['data'] as Map<String, dynamic>,
    );
    expect(after.kpis.catchKg, before.kpis.catchKg + 138);
    expect(after.actionItems.tripsToSell, before.actionItems.tripsToSell + 1);
  }, skip: skip);

  test('cancelling needs a reason and only works before the catch', () async {
    final (owner, _) = await signIn(env['HAWAT_E2E_OWNER'] ?? '0500000001');
    final trips = TripsRepository(owner);
    final boat = Boat.fromJson(
      ((await owner.get('/owner/boats', query: {'per_page': 1}))['data'] as List).first as Map<String, dynamic>,
    );

    final trip = await trips.create(TripInput(boatId: boat.id), idempotencyKey: ApiClient.newIdempotencyKey());
    await expectLater(
      trips.cancel(trip.id, '', idempotencyKey: ApiClient.newIdempotencyKey()),
      throwsA(isA<ValidationException>().having((e) => e.fieldError('reason'), 'reason', isNotNull)),
    );
    final cancelled = await trips.cancel(trip.id, 'سوء الأحوال الجوية', idempotencyKey: ApiClient.newIdempotencyKey());
    expect(cancelled.phase, TripPhase.cancelled);
    expect(cancelled.cancelReason, 'سوء الأحوال الجوية');
  }, skip: skip);
}
