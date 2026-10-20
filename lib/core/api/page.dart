import 'api_client.dart';

/// One page of a `{data, links, meta}` list.
class PageResult<T> {
  const PageResult({
    required this.items,
    required this.page,
    required this.lastPage,
    required this.total,
    this.extra = const {},
  });

  factory PageResult.fromJson(Json json, T Function(Json) item) {
    final meta = (json['meta'] as Map?)?.cast<String, dynamic>() ?? const {};
    final data = (json['data'] as List? ?? const []).cast<Map<dynamic, dynamic>>();
    return PageResult(
      items: [for (final row in data) item(row.cast<String, dynamic>())],
      page: (meta['current_page'] as num?)?.toInt() ?? 1,
      lastPage: (meta['last_page'] as num?)?.toInt() ?? 1,
      total: (meta['total'] as num?)?.toInt() ?? data.length,
      extra: {
        for (final entry in json.entries)
          if (!const {'data', 'links', 'meta'}.contains(entry.key)) entry.key: entry.value,
      },
    );
  }

  final List<T> items;
  final int page;
  final int lastPage;
  final int total;

  /// Keys the list sends beside `data`, `links` and `meta` (the sales `totals`).
  final Json extra;
}

/// An infinite-scroll list: the pages loaded so far, and how loading more went.
class PagedList<T> {
  const PagedList({
    required this.items,
    required this.page,
    required this.lastPage,
    required this.total,
    this.extra = const {},
    this.loadingMore = false,
    this.loadMoreError,
  });

  factory PagedList.first(PageResult<T> page) =>
      PagedList(items: page.items, page: page.page, lastPage: page.lastPage, total: page.total, extra: page.extra);

  final List<T> items;
  final int page;
  final int lastPage;
  final int total;

  /// The first page's extra keys: they describe the whole list, not a page.
  final Json extra;
  final bool loadingMore;
  final Object? loadMoreError;

  bool get hasMore => page < lastPage;

  bool get isEmpty => items.isEmpty;

  PagedList<T> append(PageResult<T> next) => PagedList(
    items: [...items, ...next.items],
    page: next.page,
    lastPage: next.lastPage,
    total: next.total,
    extra: extra,
  );

  PagedList<T> copyWith({List<T>? items, bool? loadingMore, Object? loadMoreError, bool clearError = false}) =>
      PagedList(
        items: items ?? this.items,
        page: page,
        lastPage: lastPage,
        total: total,
        extra: extra,
        loadingMore: loadingMore ?? this.loadingMore,
        loadMoreError: clearError ? null : (loadMoreError ?? this.loadMoreError),
      );
}

/// Loads the next page into a [PagedList]; shared by every list notifier.
Future<PagedList<T>> loadNextPage<T>(
  PagedList<T> current,
  Future<PageResult<T>> Function(int page) fetch,
  void Function(PagedList<T>) emit,
) async {
  if (!current.hasMore || current.loadingMore) return current;
  emit(current.copyWith(loadingMore: true, clearError: true));
  try {
    final next = current.append(await fetch(current.page + 1));
    emit(next);
    return next;
  } catch (e) {
    final failed = current.copyWith(loadingMore: false, loadMoreError: e);
    emit(failed);
    return failed;
  }
}

const perPage = 25;
