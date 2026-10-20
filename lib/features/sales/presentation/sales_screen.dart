import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/nav_requests.dart';
import '../../../app/router.dart';
import '../../../core/format/format.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/hud_card.dart';
import '../../../core/widgets/states.dart';
import '../data/sale.dart';
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
  DateTimeRange? _period;

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

  Future<void> _pickPeriod() async {
    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year, now.month, now.day),
      initialDateRange: _period,
    );
    if (picked != null && mounted) setState(() => _period = picked);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    ref.listen(salesFilterRequestProvider, (_, request) {
      if (request != null) setState(() => _unpaid = request.value);
    });
    final query = SalesQuery(unpaidOnly: _unpaid, search: _query, from: _period?.start, to: _period?.end);
    final provider = salesListProvider(query);
    final state = ref.watch(provider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l.salesTitle),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(118),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(Hud.gutter, 4, Hud.gutter, 10),
            child: Column(
              children: [
                SizedBox(
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
                const SizedBox(height: 8),
                SizedBox(
                  height: 48,
                  child: Row(
                    children: [
                      FilterChip(
                        label: Text(l.unpaidOnly),
                        selected: _unpaid,
                        onSelected: (value) => setState(() => _unpaid = value),
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: InputChip(
                          avatar: const Icon(Icons.date_range_outlined, size: 18),
                          label: Text(
                            _period == null
                                ? l.periodFilter
                                : '${Fmt.dayMonth(_period!.start)} – ${Fmt.dayMonth(_period!.end)}',
                            overflow: TextOverflow.ellipsis,
                          ),
                          selected: _period != null,
                          showCheckmark: false,
                          onPressed: _pickPeriod,
                          onDeleted: _period == null ? null : () => setState(() => _period = null),
                          deleteButtonTooltipMessage: l.clearValue,
                        ),
                      ),
                    ],
                  ),
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
                    title: _unpaid && _query.isEmpty && _period == null ? l.noUnpaidSales : l.noSalesFound,
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
                  if (salesTotalsOf(page) case final SalesTotals totals) ...[
                    _TotalsHeader(totals: totals),
                    const SizedBox(height: Hud.gap),
                  ],
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

/// Every invoice that matches the filters: how many, their total, what is still due.
class _TotalsHeader extends StatelessWidget {
  const _TotalsHeader({required this.totals});

  final SalesTotals totals;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;

    Widget cell(String label, String value, {Color? color}) => Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: text.labelMedium?.copyWith(color: c.muted), maxLines: 1),
            const SizedBox(height: 6),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: AlignmentDirectional.centerStart,
              child: Text(value, style: text.titleMedium?.copyWith(color: color)),
            ),
          ],
        ),
      ),
    );

    Widget divider() => Container(width: 1, color: c.hair);

    return HudCard(
      padding: EdgeInsets.zero,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            cell(l.totalsInvoices, Fmt.count(totals.count)),
            divider(),
            cell(l.grandTotalLabel, l.sar(totals.total)),
            divider(),
            cell(
              l.remainingLabel,
              l.sar(totals.remaining),
              color: totals.remaining > 0 ? c.toneText(Tone.danger) : c.toneText(Tone.success),
            ),
          ],
        ),
      ),
    );
  }
}
