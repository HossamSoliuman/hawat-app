import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/format/format.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/hud_card.dart';
import '../../trips/data/trip.dart';

/// One line of a sale or a consignment, taken from a trip's available stock.
class StockLineDraft {
  StockLineDraft() : weight = TextEditingController(), price = TextEditingController();

  int? speciesId;
  final TextEditingController weight;
  final TextEditingController price;
  String? speciesError;
  String? weightError;
  String? priceError;

  /// The last typed weight went over what is left and was cut to it.
  bool capped = false;

  double? get kg => double.tryParse(weight.text);

  double? get pricePerKg => double.tryParse(price.text);

  /// kg × price, rounded as the server rounds a line.
  double get total => (((kg ?? 0) * (pricePerKg ?? 0)) * 100).round() / 100;

  bool isBlank({required bool priced}) => speciesId == null && weight.text.isEmpty && (!priced || price.text.isEmpty);

  void clearErrors() {
    speciesError = null;
    weightError = null;
    priceError = null;
  }

  void dispose() {
    weight.dispose();
    price.dispose();
  }
}

/// What a trip still has of each species, shared by the lines that take from it.
class StockLimits {
  StockLimits(List<AvailableLine> lines) : available = {for (final l in lines) l.speciesId: l.availableKg};

  final Map<int, double> available;

  /// What [line] may take: the species' available kg minus the other lines of that species.
  double? capFor(StockLineDraft line, Iterable<StockLineDraft> all) {
    final species = line.speciesId;
    if (species == null) return null;
    final others = all
        .where((other) => !identical(other, line) && other.speciesId == species)
        .fold<double>(0, (sum, other) => sum + (other.kg ?? 0));
    return math.max(0, (available[species] ?? 0) - others);
  }

  /// Per species, what all lines take together beyond what is available (0 when within).
  double overBy(int speciesId, Iterable<StockLineDraft> all) {
    final taken = all.where((l) => l.speciesId == speciesId).fold<double>(0, (sum, l) => sum + (l.kg ?? 0));
    return math.max(0, taken - (available[speciesId] ?? 0));
  }
}

/// A line card: the species (from the trip's stock, with what is left of
/// it), the kg (never above what is left), and for a sale the price per kg
/// and the line total.
class StockLineCard extends StatelessWidget {
  const StockLineCard({
    super.key,
    required this.index,
    required this.line,
    required this.stock,
    required this.cap,
    required this.priced,
    required this.canRemove,
    required this.onChanged,
    required this.onRemove,
  });

  final int index;
  final StockLineDraft line;
  final List<AvailableLine> stock;

  /// What this line may take of its species now, or null before a species is chosen.
  final double? cap;
  final bool priced;
  final bool canRemove;
  final VoidCallback onChanged;
  final VoidCallback onRemove;

  void _setWeight(String text) {
    line.weight.value = TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }

  void _onWeight(String text) {
    final value = double.tryParse(text);
    final limit = cap;
    if (limit != null && value != null && value > limit + 1e-9) {
      _setWeight(Fmt.plain(limit));
      line.capped = true;
    } else {
      line.capped = false;
    }
    line.weightError = null;
    onChanged();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final limit = cap;

    return HudCard(
      brackets: false,
      padding: const EdgeInsets.fromLTRB(12, 10, 6, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 26,
                height: 26,
                margin: const EdgeInsets.only(top: 9),
                alignment: Alignment.center,
                color: c.mutedSurface,
                child: Text('${index + 1}', style: text.labelSmall),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: SearchSelect<int>(
                  hint: l.chooseSpecies,
                  value: line.speciesId,
                  errorText: line.speciesError,
                  options: [
                    for (final s in stock)
                      SelectOption(
                        value: s.speciesId,
                        label: s.species ?? '—',
                        detail: l.availableAmount(l.kg(s.availableKg)),
                      ),
                  ],
                  onChanged: (id) {
                    line
                      ..speciesId = id
                      ..speciesError = null
                      ..capped = false;
                    onChanged();
                  },
                ),
              ),
              SizedBox(
                width: 40,
                height: 44,
                child: IconButton(
                  tooltip: l.removeLine,
                  onPressed: canRemove ? onRemove : null,
                  icon: Icon(Icons.close, size: 20, color: canRemove ? c.muted : c.border),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 36, end: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    controller: line.weight,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.right,
                    inputFormatters: [DecimalInputFormatter()],
                    onChanged: _onWeight,
                    decoration: InputDecoration(
                      labelText: l.weightLabel,
                      errorText: line.weightError,
                      errorMaxLines: 2,
                      suffixIcon: limit == null || limit <= 0
                          ? null
                          : TextButton(
                              onPressed: () => _onWeight(Fmt.plain(limit)),
                              style: TextButton.styleFrom(
                                minimumSize: const Size(40, 32),
                                textStyle: text.labelMedium?.copyWith(fontWeight: FontWeight.w700),
                              ),
                              child: Text(l.useAll),
                            ),
                    ),
                  ),
                ),
                if (priced) ...[
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: line.price,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.right,
                      inputFormatters: [DecimalInputFormatter()],
                      onChanged: (_) {
                        line.priceError = null;
                        onChanged();
                      },
                      decoration: InputDecoration(
                        labelText: l.pricePerKgLabel,
                        errorText: line.priceError,
                        errorMaxLines: 2,
                        suffixText: l.currencySar,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (line.capped && limit != null)
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 36, end: 6, top: 6),
              child: Text(
                l.cappedAt(l.kg(limit)),
                style: text.bodySmall?.copyWith(color: c.toneText(Tone.warning), fontWeight: FontWeight.w600),
              ),
            ),
          if (priced && line.total > 0)
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 36, end: 6, top: 10),
              child: Row(
                children: [
                  Text(l.totalLabel, style: text.bodySmall),
                  const Spacer(),
                  Text(l.sar(line.total), style: text.labelMedium?.copyWith(fontWeight: FontWeight.w700)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// The trip a sale or consignment takes from: boat and captain, number, what is left.
class TripStockStrip extends StatelessWidget {
  const TripStockStrip({super.key, required this.trip, required this.title});

  final Trip trip;
  final String title;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    return HudCard(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: text.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 2),
                Text(Fmt.ltr(trip.tripNumber), style: text.bodySmall),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(l.kg(trip.availableKg), style: text.titleSmall?.copyWith(color: c.toneText(Tone.success))),
        ],
      ),
    );
  }
}
