// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The bell's badge. Refreshed on resume, after reading, and with the home.

@ProviderFor(UnreadCount)
final unreadCountProvider = UnreadCountProvider._();

/// The bell's badge. Refreshed on resume, after reading, and with the home.
final class UnreadCountProvider extends $AsyncNotifierProvider<UnreadCount, int> {
  /// The bell's badge. Refreshed on resume, after reading, and with the home.
  UnreadCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'unreadCountProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$unreadCountHash();

  @$internal
  @override
  UnreadCount create() => UnreadCount();
}

String _$unreadCountHash() => r'27955b03bc1aad77be6ebd03703ae01cc8a79aaa';

/// The bell's badge. Refreshed on resume, after reading, and with the home.

abstract class _$UnreadCount extends $AsyncNotifier<int> {
  FutureOr<int> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<int>, int>;
    final element =
        ref.element as $ClassProviderElement<AnyNotifier<AsyncValue<int>, int>, AsyncValue<int>, Object?, Object?>;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(NotificationsList)
final notificationsListProvider = NotificationsListProvider._();

final class NotificationsListProvider extends $AsyncNotifierProvider<NotificationsList, NotificationsData> {
  NotificationsListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationsListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationsListHash();

  @$internal
  @override
  NotificationsList create() => NotificationsList();
}

String _$notificationsListHash() => r'de459ff7aba810a3a39703b6803166092ced4c43';

abstract class _$NotificationsList extends $AsyncNotifier<NotificationsData> {
  FutureOr<NotificationsData> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<NotificationsData>, NotificationsData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<NotificationsData>, NotificationsData>,
              AsyncValue<NotificationsData>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
