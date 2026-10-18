import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers.dart';
import '../../../core/storage/local_store.dart';
import 'dashboard.dart';

part 'dashboard_providers.g.dart';

/// The home, as last seen and how fresh it is.
class HomeData {
  const HomeData({required this.dashboard, required this.savedAt, this.refreshing = false, this.refreshError});

  final Dashboard dashboard;

  /// When this copy came from the server.
  final DateTime savedAt;

  /// A fresh copy is on its way.
  final bool refreshing;

  /// The last refresh failed: the screen shows the saved copy with a banner.
  final Object? refreshError;

  HomeData copyWith({bool? refreshing, Object? refreshError, bool clearError = false}) => HomeData(
    dashboard: dashboard,
    savedAt: savedAt,
    refreshing: refreshing ?? this.refreshing,
    refreshError: clearError ? null : (refreshError ?? this.refreshError),
  );
}

/// The selected period chip, remembered on the device.
@Riverpod(keepAlive: true)
class HomePeriod extends _$HomePeriod {
  @override
  DashboardPeriod build() => DashboardPeriod.parse(ref.read(localStoreProvider).pref<String>(PrefKeys.homePeriod));

  void select(DashboardPeriod period) {
    state = period;
    ref.read(localStoreProvider).setPref(PrefKeys.homePeriod, period.apiValue);
  }
}

/// `GET /owner/dashboard?period=…`, stale-while-revalidate: the saved copy
/// renders at once and the server's copy replaces it.
@riverpod
class DashboardController extends _$DashboardController {
  @override
  Future<HomeData> build(DashboardPeriod period) async {
    final cached = ref.read(localStoreProvider).readJson(CacheKeys.dashboard(period.apiValue));
    if (cached != null) {
      unawaited(Future(refresh));
      return HomeData(dashboard: Dashboard.fromJson(cached.json), savedAt: cached.savedAt, refreshing: true);
    }
    return _fetch();
  }

  Future<HomeData> _fetch() async {
    final json = await ref.read(apiClientProvider).get('/owner/dashboard', query: {'period': period.apiValue});
    final data = (json['data'] as Map).cast<String, dynamic>();
    await ref.read(localStoreProvider).writeJson(CacheKeys.dashboard(period.apiValue), data);
    return HomeData(dashboard: Dashboard.fromJson(data), savedAt: DateTime.now());
  }

  /// Pull to refresh, app resume, and after every action.
  Future<void> refresh() async {
    HomeData? current;
    try {
      current = await future;
    } catch (_) {
      // No copy on screen yet: a failure below shows the error state.
    }
    if (!ref.mounted) return;
    if (current != null) state = AsyncData(current.copyWith(refreshing: true, clearError: true));
    try {
      final fresh = await _fetch();
      if (ref.mounted) state = AsyncData(fresh);
    } catch (e, st) {
      if (!ref.mounted) return;
      state = current != null ? AsyncData(current.copyWith(refreshing: false, refreshError: e)) : AsyncError(e, st);
    }
  }
}

/// Something on the home changed: refresh the open period in place (no
/// flash of the old copy) and drop the saved copies of the others.
void refreshHome(Ref ref) {
  for (final period in DashboardPeriod.values) {
    final provider = dashboardControllerProvider(period);
    if (ref.exists(provider)) {
      ref.read(provider.notifier).refresh();
    } else {
      ref.read(localStoreProvider).remove(CacheKeys.dashboard(period.apiValue));
    }
  }
}

void refreshHomeFromWidget(WidgetRef ref) {
  for (final period in DashboardPeriod.values) {
    final provider = dashboardControllerProvider(period);
    if (ref.exists(provider)) {
      ref.read(provider.notifier).refresh();
    } else {
      ref.read(localStoreProvider).remove(CacheKeys.dashboard(period.apiValue));
    }
  }
}
