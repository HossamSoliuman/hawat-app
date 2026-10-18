import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/nav_requests.dart';
import '../../../app/router.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/hud_card.dart';
import '../../../core/widgets/states.dart';
import '../data/sales_providers.dart';
import 'sale_tile.dart';

/// المبيعات: newest invoices first, search, and "غير المحصّلة" to collect.
class SalesScreen extends ConsumerStatefulWidget {
  const SalesScreen({super.key, this.unpaidOnly = false});

  final bool unpaidOnly;

  @override
  ConsumerState<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends ConsumerState<SalesScreen> {
  late bool _unpaid = widget.unpaidOnly;
  final _search = TextEditingController();
  Timer? _debounce;
  String _query = '';

  @override
  void didUpdateWidget(SalesScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Opened again from the home's unpaid row.
    if (widget.unpaidOnly != oldWidget.unpaidOnly) setState(() => _unpaid = widget.unpaidOnly);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _search.dispose();
    super.dispose();
  }

  void _onSearch(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      if (mounted) setState(() => _query = value.trim());
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    ref.listen(salesFilterRequestProvider, (_, request) {
      if (request != null) setState(() => _unpaid = request.value);
    });
    final query = SalesQuery(unpaidOnly: _unpaid, search: _query);
    final provider = salesListProvider(query);
    final state = ref.watch(provider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l.salesTitle),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(Hud.gutter, 4, Hud.gutter, 12),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: TextField(
                      controller: _search,
                      onChanged: _onSearch,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        hintText: l.searchSales,
                        prefixIcon: const Icon(Icons.search),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: Text(l.unpaidOnly),
                  selected: _unpaid,
                  onSelected: (value) => setState(() => _unpaid = value),
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                ),
              ],
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(provider.future),
        child: state.when(
          skipLoadingOnReload: true,
          loading: () => const Skeleton(
            child: Padding(padding: EdgeInsets.all(Hud.gutter), child: SkeletonBox(height: 360)),
          ),
          error: (e, _) => ListView(
            children: [ErrorState(error: e, onRetry: () => ref.invalidate(provider))],
          ),
          data: (page) {
            if (page.isEmpty) {
              return ListView(
                children: [
                  EmptyState(
                    icon: _unpaid ? Icons.task_alt : Icons.receipt_long_outlined,
                    title: _unpaid && _query.isEmpty ? l.noUnpaidSales : l.noSalesFound,
                  ),
                ],
              );
            }
            return NotificationListener<ScrollNotification>(
              onNotification: (n) {
                if (n.metrics.extentAfter < 400) ref.read(provider.notifier).loadMore();
                return false;
              },
              child: ListView(
                padding: const EdgeInsets.all(Hud.gutter),
                children: [
                  HudCard(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                    child: Column(
                      children: [
                        for (var i = 0; i < page.items.length; i++)
                          SaleTile(
                            sale: page.items[i],
                            showDate: true,
                            last: i == page.items.length - 1,
                            onTap: () => context.push(Routes.sale(page.items[i].id)),
                          ),
                      ],
                    ),
                  ),
                  LoadMoreFooter(
                    loading: page.loadingMore,
                    error: page.loadMoreError,
                    onRetry: () => ref.read(provider.notifier).loadMore(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
