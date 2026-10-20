import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/format/format.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/hud_card.dart';
import '../../../core/widgets/ltr_text.dart';
import '../../../core/widgets/states.dart';
import '../../lookups/data/lookups.dart';
import '../../lookups/data/lookups_repository.dart';
import '../data/stock.dart';
import '../data/stock_repository.dart';

/// حركات الصنف: the ledger, newest first. In (catch counted, returns) is
/// green, out (sales, consignments) red, with the balance after each line.
class StockMovementsScreen extends ConsumerStatefulWidget {
  const StockMovementsScreen({super.key, this.speciesId});

  final int? speciesId;

  @override
  ConsumerState<StockMovementsScreen> createState() => _StockMovementsScreenState();
}

class _StockMovementsScreenState extends ConsumerState<StockMovementsScreen> {
  late int? _speciesId = widget.speciesId;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final lookups = ref.watch(lookupsControllerProvider).value ?? const Lookups();
    final provider = stockMovementsProvider(_speciesId);
    final state = ref.watch(provider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l.movementsTitle),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(Hud.gutter, 4, Hud.gutter, 12),
            child: SearchSelect<int>(
              hint: l.allSpecies,
              title: l.speciesLabel,
              value: _speciesId,
              emptyLabel: l.allSpecies,
              options: [for (final s in lookups.species) SelectOption(value: s.id, label: s.name)],
              onChanged: (id) => setState(() => _speciesId = id),
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
                children: [EmptyState(icon: Icons.swap_vert, title: l.noMovements)],
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
                          _MovementTile(movement: page.items[i], last: i == page.items.length - 1),
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

class _MovementTile extends StatelessWidget {
  const _MovementTile({required this.movement, required this.last});

  final StockMovement movement;
  final bool last;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final tone = movement.isIn ? Tone.success : Tone.danger;
    final signed = movement.isIn ? '+${Fmt.kg(movement.weightKg)}' : Fmt.kg(movement.weightKg);
    final notes = movement.notes?.trim();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 11),
      decoration: BoxDecoration(
        border: last ? null : Border(bottom: BorderSide(color: c.hair)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movement.species ?? '—', style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: 3),
                Wrap(
                  spacing: 6,
                  children: [
                    if (movement.type != null) Text(movement.type!, style: text.bodySmall),
                    if (movement.tripNumber != null) ...[
                      Text('·', style: text.bodySmall),
                      LtrText(movement.tripNumber!, style: text.bodySmall),
                    ],
                  ],
                ),
                if (notes != null && notes.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(Fmt.isolateCodes(notes), style: text.bodySmall),
                ],
                if (movement.createdAt != null) ...[
                  const SizedBox(height: 2),
                  Text(l.when(movement.createdAt!), style: text.bodySmall),
                ],
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(l.amountKg(Fmt.ltr(signed)), style: text.labelLarge?.copyWith(color: c.toneText(tone))),
              const SizedBox(height: 4),
              Text(l.balanceAfter(l.kg(movement.balanceAfter)), style: text.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}
