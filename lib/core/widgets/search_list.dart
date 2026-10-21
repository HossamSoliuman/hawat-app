import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/page.dart';
import '../l10n.dart';
import '../theme/tokens.dart';
import 'hud_card.dart';
import 'states.dart';

/// The body of a setup list: a search field (and filters) that stay put, then
/// the rows in one card with pull to refresh and infinite scroll.
class SearchList<T> extends StatelessWidget {
  const SearchList({
    super.key,
    required this.state,
    required this.onRefresh,
    required this.onRetry,
    required this.onLoadMore,
    required this.itemBuilder,
    this.onSearch,
    required this.emptyIcon,
    required this.emptyTitle,
    this.searchHint,
    this.filters,
  });

  final AsyncValue<PagedList<T>> state;
  final Future<void> Function() onRefresh;
  final VoidCallback onRetry;
  final VoidCallback onLoadMore;

  /// Null for a list the server can't search (maintenance).
  final ValueChanged<String>? onSearch;
  final Widget Function(BuildContext context, T item, bool last) itemBuilder;
  final IconData emptyIcon;
  final String emptyTitle;
  final String? searchHint;
  final Widget? filters;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (onSearch != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(Hud.gutter, 10, Hud.gutter, 0),
            child: SearchField(hint: searchHint, onChanged: onSearch!),
          ),
        if (filters != null) Padding(padding: const EdgeInsets.only(top: 10), child: filters),
        Expanded(
          child: RefreshIndicator(
            onRefresh: onRefresh,
            child: state.when(
              skipLoadingOnReload: true,
              loading: () => ListView(
                padding: const EdgeInsets.all(Hud.gutter),
                children: const [Skeleton(child: SkeletonBox(height: 280))],
              ),
              error: (e, _) => ListView(
                children: [ErrorState(error: e, onRetry: onRetry)],
              ),
              data: (page) {
                if (page.isEmpty) {
                  return ListView(
                    children: [EmptyState(icon: emptyIcon, title: emptyTitle)],
                  );
                }
                return NotificationListener<ScrollNotification>(
                  onNotification: (n) {
                    if (n.metrics.extentAfter < 400) onLoadMore();
                    return false;
                  },
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(Hud.gutter, 12, Hud.gutter, Hud.gutter),
                    children: [
                      HudCard(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                        child: Column(
                          children: [
                            for (var i = 0; i < page.items.length; i++)
                              itemBuilder(context, page.items[i], i == page.items.length - 1),
                          ],
                        ),
                      ),
                      LoadMoreFooter(loading: page.loadingMore, error: page.loadMoreError, onRetry: onLoadMore),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

/// A search box that reports what was typed once the typing pauses.
class SearchField extends StatefulWidget {
  const SearchField({super.key, required this.onChanged, this.hint});

  final ValueChanged<String> onChanged;
  final String? hint;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _controller = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _changed(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () => widget.onChanged(value.trim()));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return TextField(
      controller: _controller,
      onChanged: _changed,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: widget.hint ?? l.searchHint,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: _controller.text.isEmpty
            ? null
            : IconButton(
                tooltip: l.clearValue,
                icon: const Icon(Icons.close),
                onPressed: () {
                  _controller.clear();
                  _changed('');
                },
              ),
      ),
    );
  }
}

/// Filter chips in a row that scrolls sideways.
class FilterChips<T> extends StatelessWidget {
  const FilterChips({super.key, required this.options, required this.value, required this.onChanged});

  /// `null` value = "all".
  final List<(T?, String)> options;
  final T? value;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 40,
    child: ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: Hud.gutter),
      children: [
        for (final (option, label) in options)
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 8),
            child: ChoiceChip(label: Text(label), selected: option == value, onSelected: (_) => onChanged(option)),
          ),
      ],
    ),
  );
}

/// One row of a setup list: a leading picture or icon, a title, up to two
/// detail lines, and something at the end (a chip, an amount).
class EntityRow extends StatelessWidget {
  const EntityRow({
    super.key,
    required this.title,
    required this.onTap,
    this.leading,
    this.lines = const [],
    this.trailing,
    this.last = false,
  });

  final String title;
  final VoidCallback onTap;
  final Widget? leading;
  final List<Widget> lines;
  final Widget? trailing;
  final bool last;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 60),
        padding: const EdgeInsets.symmetric(vertical: 11),
        decoration: BoxDecoration(
          border: last ? null : Border(bottom: BorderSide(color: c.hair)),
        ),
        child: Row(
          children: [
            if (leading != null) ...[leading!, const SizedBox(width: 12)],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  for (final line in lines) ...[const SizedBox(height: 3), line],
                ],
              ),
            ),
            if (trailing != null) ...[const SizedBox(width: 12), trailing!],
          ],
        ),
      ),
    );
  }
}
