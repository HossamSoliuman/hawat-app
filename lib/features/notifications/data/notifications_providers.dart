import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/page.dart';
import '../../../core/auth/session.dart';
import '../../../core/providers.dart';
import 'app_notification.dart';

part 'notifications_providers.g.dart';

/// The bell's badge. Refreshed on resume, after reading, and with the home.
@Riverpod(keepAlive: true)
class UnreadCount extends _$UnreadCount {
  @override
  Future<int> build() async {
    if (ref.watch(currentUserProvider.select((u) => u?.id)) == null) return 0;
    final json = await ref.read(apiClientProvider).get('/notifications/unread-count');
    return ((json['data'] as Map)['unread_count'] as num).toInt();
  }

  void set(int count) => state = AsyncData(count < 0 ? 0 : count);
}

/// Unread first (all of them, up to 100), then the earlier ones page by page.
class NotificationsData {
  const NotificationsData({required this.unread, required this.earlier});

  final List<AppNotification> unread;
  final PagedList<AppNotification> earlier;

  NotificationsData copyWith({List<AppNotification>? unread, PagedList<AppNotification>? earlier}) =>
      NotificationsData(unread: unread ?? this.unread, earlier: earlier ?? this.earlier);
}

@riverpod
class NotificationsList extends _$NotificationsList {
  @override
  Future<NotificationsData> build() async {
    final api = ref.read(apiClientProvider);
    final unreadJson = api.get('/notifications', query: {'unread': true, 'per_page': 100});
    final first = await _fetchEarlier(1);
    final unread = PageResult.fromJson(await unreadJson, AppNotification.fromJson).items;
    ref.read(unreadCountProvider.notifier).set(unread.length);
    return NotificationsData(unread: unread, earlier: PagedList.first(first));
  }

  /// The full list, read ones only: the unread already sit in the first section.
  Future<PageResult<AppNotification>> _fetchEarlier(int page) async {
    final json = await ref.read(apiClientProvider).get('/notifications', query: {'page': page, 'per_page': perPage});
    final result = PageResult.fromJson(json, AppNotification.fromJson);
    return PageResult(
      items: result.items.where((n) => n.read).toList(),
      page: result.page,
      lastPage: result.lastPage,
      total: result.total,
    );
  }

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null) return;
    await loadNextPage(current.earlier, _fetchEarlier, (next) {
      if (ref.mounted) state = AsyncData(current.copyWith(earlier: next));
    });
  }

  /// Marks one read: it moves from the new section to the top of the earlier one.
  Future<void> markRead(AppNotification notification) async {
    if (notification.read) return;
    final current = state.value;
    if (current != null) {
      final read = notification.copyWith(read: true);
      state = AsyncData(
        current.copyWith(
          unread: current.unread.where((n) => n.id != notification.id).toList(),
          earlier: current.earlier.copyWith(items: [read, ...current.earlier.items]),
        ),
      );
      ref.read(unreadCountProvider.notifier).set(current.unread.length - 1);
    }
    try {
      await ref.read(apiClientProvider).post('/notifications/${notification.id}/read');
    } catch (_) {
      // Opening the target matters more; the next load shows the true state.
    }
  }

  Future<void> markAllRead() async {
    await ref.read(apiClientProvider).post('/notifications/read-all');
    final current = state.value;
    if (current != null && ref.mounted) {
      state = AsyncData(
        current.copyWith(
          unread: const [],
          earlier: current.earlier.copyWith(
            items: [...current.unread.map((n) => n.copyWith(read: true)), ...current.earlier.items],
          ),
        ),
      );
    }
    ref.read(unreadCountProvider.notifier).set(0);
  }
}
