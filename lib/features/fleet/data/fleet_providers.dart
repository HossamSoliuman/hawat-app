import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/api_client.dart';
import '../../../core/api/page.dart';
import '../../../core/api/resource_repository.dart';
import '../../../core/providers.dart';
import '../../home/data/dashboard_providers.dart';
import '../../lookups/data/lookups_repository.dart';
import 'fleet.dart';

part 'fleet_providers.g.dart';

/// Captains and crew, plus their photo.
class FishersRepository extends ResourceRepository<Fisher> {
  FishersRepository(ApiClient api, FisherKind kind) : super(api, kind.path, Fisher.fromJson);

  Future<Fisher> uploadAvatar(int id, Uint8List bytes) async {
    final form = FormData.fromMap({'avatar': MultipartFile.fromBytes(bytes, filename: 'avatar.jpg')});
    return one(await api.post('$path/$id/avatar', data: form));
  }

  Future<Fisher> removeAvatar(int id) async => one(await api.delete('$path/$id/avatar'));
}

@Riverpod(keepAlive: true)
ResourceRepository<Boat> boatsRepository(Ref ref) =>
    ResourceRepository(ref.watch(apiClientProvider), '/owner/boats', Boat.fromJson);

@Riverpod(keepAlive: true)
FishersRepository fishersRepository(Ref ref, FisherKind kind) => FishersRepository(ref.watch(apiClientProvider), kind);

@Riverpod(keepAlive: true)
ResourceRepository<Maintenance> maintenanceRepository(Ref ref) =>
    ResourceRepository(ref.watch(apiClientProvider), '/owner/maintenance', Maintenance.fromJson);

@riverpod
class BoatsList extends _$BoatsList {
  @override
  Future<PagedList<Boat>> build({String search = '', String? status}) async => PagedList.first(await _fetch(1));

  Future<PageResult<Boat>> _fetch(int page) =>
      ref.read(boatsRepositoryProvider).list(query: {'search': search, 'status': status}, page: page);

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null) return;
    await loadNextPage(current, _fetch, (next) {
      if (ref.mounted) state = AsyncData(next);
    });
  }
}

@riverpod
class BoatDetail extends _$BoatDetail {
  @override
  Future<Boat> build(int id) => ref.read(boatsRepositoryProvider).get(id);

  void replace(Boat boat) => state = AsyncData(boat);
}

@riverpod
class FishersList extends _$FishersList {
  @override
  Future<PagedList<Fisher>> build(FisherKind kind, {String search = '', int? boatId}) async =>
      PagedList.first(await _fetch(1));

  Future<PageResult<Fisher>> _fetch(int page) =>
      ref.read(fishersRepositoryProvider(kind)).list(query: {'search': search, 'boat_id': boatId}, page: page);

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null) return;
    await loadNextPage(current, _fetch, (next) {
      if (ref.mounted) state = AsyncData(next);
    });
  }
}

@riverpod
class FisherDetail extends _$FisherDetail {
  @override
  Future<Fisher> build(FisherKind kind, int id) => ref.read(fishersRepositoryProvider(kind)).get(id);

  void replace(Fisher fisher) => state = AsyncData(fisher);
}

@riverpod
class MaintenanceList extends _$MaintenanceList {
  @override
  Future<PagedList<Maintenance>> build({int? boatId}) async => PagedList.first(await _fetch(1));

  Future<PageResult<Maintenance>> _fetch(int page) =>
      ref.read(maintenanceRepositoryProvider).list(query: {'boat_id': boatId}, page: page);

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null) return;
    await loadNextPage(current, _fetch, (next) {
      if (ref.mounted) state = AsyncData(next);
    });
  }
}

/// Fleet writes from any screen. Each one reloads what it touched: a captain
/// moves between boats and a crew member changes a boat's setup, so boats,
/// fishers and the trip form's pickers all reload together.
@Riverpod(keepAlive: true)
FleetActions fleetActions(Ref ref) => FleetActions(ref);

class FleetActions {
  FleetActions(this._ref);

  final Ref _ref;

  Future<Boat> saveBoat(int? id, Json body, {required String idempotencyKey}) async {
    final repo = _ref.read(boatsRepositoryProvider);
    final boat = id == null ? await repo.create(body, idempotencyKey: idempotencyKey) : await repo.update(id, body);
    _fleetChanged();
    return boat;
  }

  Future<void> deleteBoat(int id) async {
    await _ref.read(boatsRepositoryProvider).delete(id);
    _fleetChanged();
  }

  Future<Fisher> saveFisher(FisherKind kind, int? id, Json body, {required String idempotencyKey}) async {
    final repo = _ref.read(fishersRepositoryProvider(kind));
    final fisher = id == null ? await repo.create(body, idempotencyKey: idempotencyKey) : await repo.update(id, body);
    _fleetChanged();
    return fisher;
  }

  Future<void> deleteFisher(FisherKind kind, int id) async {
    await _ref.read(fishersRepositoryProvider(kind)).delete(id);
    _fleetChanged();
  }

  Future<Fisher> uploadAvatar(FisherKind kind, int id, Uint8List bytes) async =>
      _photo(kind, await _ref.read(fishersRepositoryProvider(kind)).uploadAvatar(id, bytes));

  Future<Fisher> removeAvatar(FisherKind kind, int id) async =>
      _photo(kind, await _ref.read(fishersRepositoryProvider(kind)).removeAvatar(id));

  Future<Maintenance> saveMaintenance(int? id, Json body, {required String idempotencyKey}) async {
    final repo = _ref.read(maintenanceRepositoryProvider);
    final record = id == null ? await repo.create(body, idempotencyKey: idempotencyKey) : await repo.update(id, body);
    _ref.invalidate(maintenanceListProvider);
    return record;
  }

  Future<void> deleteMaintenance(int id) async {
    await _ref.read(maintenanceRepositoryProvider).delete(id);
    _ref.invalidate(maintenanceListProvider);
  }

  Fisher _photo(FisherKind kind, Fisher fisher) {
    _ref.invalidate(fishersListProvider);
    final detail = fisherDetailProvider(kind, fisher.id);
    if (_ref.exists(detail)) _ref.read(detail.notifier).replace(fisher);
    return fisher;
  }

  void _fleetChanged() {
    _ref
      ..invalidate(boatsListProvider)
      ..invalidate(boatDetailProvider)
      ..invalidate(fishersListProvider)
      ..invalidate(fisherDetailProvider)
      ..invalidate(ownerBoatsProvider)
      ..invalidate(ownerCaptainsProvider);
    refreshHome(_ref);
  }
}
