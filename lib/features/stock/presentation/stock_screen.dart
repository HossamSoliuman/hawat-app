import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/hud_card.dart';
import '../../../core/widgets/states.dart';
import '../data/stock.dart';
import '../data/stock_repository.dart';

/// المخزون: what the owner holds of each species, heaviest first. A tap
/// opens that species' movements.
class StockScreen extends ConsumerWidget {
  const StockScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final state = ref.watch(stockProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l.stockScreenTitle),
        actions: [
          IconButton(
            tooltip: l.movementsTitle,
            icon: const Icon(Icons.swap_vert),
            onPressed: () => context.push(Routes.stockMovements()),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(stockProvider.future),
        child: state.when(
          skipLoadingOnReload: true,
          loading: () => const Skeleton(
            child: Padding(padding: EdgeInsets.all(Hud.gutter), child: SkeletonBox(height: 320)),
          ),
          error: (e, _) => ListView(
            children: [ErrorState(error: e, onRetry: () => ref.invalidate(stockProvider))],
          ),
          data: (lines) {
            final shown = lines.where((line) => line.weightKg > 0.004).toList();
            if (shown.isEmpty) {
              return ListView(
                children: [EmptyState(icon: Icons.inventory_2_outlined, title: l.noStock)],
              );
            }
            return ListView(
              padding: const EdgeInsets.all(Hud.gutter),
              children: [_StockCard(lines: shown)],
            );
          },
        ),
      ),
    );
  }
}

class _StockCard extends StatelessWidget {
  const _StockCard({required this.lines});

  final List<StockLine> lines;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final total = lines.fold<double>(0, (sum, line) => sum + line.weightKg);
    final max = lines.first.weightKg;

    return HudCard(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(child: Text(l.totalStock, style: text.titleSmall)),
              Text(l.kg(total), style: text.titleMedium),
            ],
          ),
          const SizedBox(height: 6),
          for (var i = 0; i < lines.length; i++)
            InkWell(
              onTap: () => context.push(Routes.stockMovements(speciesId: lines[i].speciesId)),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: c.hair)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            lines[i].species ?? '—',
                            style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                        Text(l.kg(lines[i].weightKg), style: text.labelLarge),
                        const SizedBox(width: 4),
                        Icon(Icons.chevron_right, size: 20, color: c.muted),
                      ],
                    ),
                    if (lines[i].nameSci != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        lines[i].nameSci!,
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.end,
                        style: text.bodySmall?.copyWith(fontStyle: FontStyle.italic),
                      ),
                    ],
                    const SizedBox(height: 8),
                    LayoutBuilder(
                      builder: (context, constraints) => Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Container(
                          height: 6,
                          width: constraints.maxWidth * (max <= 0 ? 0 : (lines[i].weightKg / max).clamp(.02, 1)),
                          color: c.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
