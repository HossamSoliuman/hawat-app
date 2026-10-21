import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/api/api_client.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/format/format.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/actions.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/hud_card.dart';
import '../../../core/widgets/section_head.dart';
import '../../../core/widgets/states.dart';
import '../../../core/widgets/status_chip.dart';
import '../../dalals/data/dalal.dart';
import '../../dalals/data/dalals_repository.dart';
import '../../dalals/presentation/dalal_ui.dart';
import '../../sales/data/selling_actions.dart';
import '../../sales/presentation/stock_lines.dart';
import '../../trips/data/trip.dart';
import '../../trips/data/trips_providers.dart';
import '../../trips/presentation/trip_ui.dart';
import '../data/consignment.dart';

/// Send a trip's catch to a dalal's stock: the dalal (with the agreed
/// commission, if any), the kg of each species (never more than is left),
/// then a summary and "إرسال".
class ConsignScreen extends ConsumerStatefulWidget {
  const ConsignScreen({super.key, required this.tripId});

  final int tripId;

  @override
  ConsumerState<ConsignScreen> createState() => _ConsignScreenState();
}

class _ConsignScreenState extends ConsumerState<ConsignScreen> {
  int? _dalalId;
  String? _dalalError;
  final List<StockLineDraft> _lines = [StockLineDraft()];
  String? _linesError;
  final _notes = TextEditingController();
  final _idempotencyKey = ApiClient.newIdempotencyKey();

  @override
  void dispose() {
    for (final line in _lines) {
      line.dispose();
    }
    _notes.dispose();
    super.dispose();
  }

  List<StockLineDraft> get _filled => _lines.where((line) => !line.isBlank(priced: false)).toList();

  double get _totalKg => _filled.fold<double>(0, (sum, line) => sum + (line.kg ?? 0));

  bool _validate(StockLimits limits) {
    final l = context.l10n;
    var ok = true;
    setState(() {
      _dalalError = _dalalId == null ? l.dalalRequired : null;
      if (_dalalError != null) ok = false;
      _linesError = null;
      for (final line in _lines) {
        line.clearErrors();
      }
      final filled = _filled;
      if (filled.isEmpty) {
        _linesError = l.catchEmpty;
        ok = false;
      }
      for (final line in filled) {
        final species = line.speciesId;
        if (species == null) {
          line.speciesError = l.lineSpeciesRequired;
          ok = false;
        }
        if (line.weight.text.isEmpty) {
          line.weightError = l.lineWeightRequired;
          ok = false;
        } else if ((line.kg ?? 0) <= 0) {
          line.weightError = l.lineWeightInvalid;
          ok = false;
        } else if (species != null && limits.overBy(species, filled) > 0.004) {
          line.weightError = l.lineOverAvailable(l.kg(limits.available[species] ?? 0));
          ok = false;
        }
      }
    });
    return ok;
  }

  Future<void> _review(Trip trip, List<Dalal> dalals) async {
    FocusScope.of(context).unfocus();
    if (!_validate(StockLimits(trip.availableLines))) return;
    final sent = _filled;
    final dalal = dalals.firstWhere((d) => d.id == _dalalId);
    final result = await showModalBottomSheet<Object>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _SummarySheet(
        dalal: dalal,
        input: ConsignmentInput(
          tripId: trip.id,
          dalalId: dalal.id,
          notes: _notes.text,
          items: [for (final line in sent) ConsignLineInput(speciesId: line.speciesId!, weightKg: line.kg!)],
        ),
        speciesNames: {for (final s in trip.availableLines) s.speciesId: s.species ?? '—'},
        idempotencyKey: _idempotencyKey,
      ),
    );
    if (!mounted) return;
    if (result is Consignment) {
      showSnack(context, context.l10n.consignSent);
      context.pushReplacement(Routes.consignment(result.id));
    } else if (result is ValidationException) {
      _applyErrors(result, sent);
    }
  }

  void _applyErrors(ValidationException e, List<StockLineDraft> sent) {
    final item = RegExp(r'^items\.(\d+)\.(\w+)$');
    String? other;
    setState(() {
      for (final entry in e.errors.entries) {
        final message = entry.value.firstOrNull;
        if (message == null) continue;
        final match = item.firstMatch(entry.key);
        final index = match == null ? null : int.parse(match[1]!);
        if (index != null && index < sent.length) {
          if (match![2] == 'species_id') {
            sent[index].speciesError = message;
          } else {
            sent[index].weightError = message;
          }
        } else if (entry.key == 'dalal_id') {
          _dalalError = message;
        } else if (entry.key.startsWith('items')) {
          _linesError = message;
        } else {
          other ??= message;
        }
      }
    });
    if (other != null) {
      showSnack(context, other!, error: true);
      ref.invalidate(tripDetailProvider(widget.tripId));
    }
  }

  void _addLine() => setState(() => _lines.add(StockLineDraft()));

  void _removeLine(StockLineDraft line) {
    setState(() {
      _lines.remove(line);
      if (_lines.isEmpty) _lines.add(StockLineDraft());
    });
    line.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final tripState = ref.watch(tripDetailProvider(widget.tripId));
    final dalalsState = ref.watch(dalalsProvider);
    final dalals = dalalsState.value ?? const <Dalal>[];
    final trip = tripState.value;
    final sellable = trip != null && trip.canSell && trip.availableLines.isNotEmpty;

    Widget body;
    if (trip == null) {
      body = tripState.hasError
          ? ErrorState(error: tripState.error!, onRetry: () => ref.invalidate(tripDetailProvider(widget.tripId)))
          : const Skeleton(
              child: Padding(padding: EdgeInsets.all(Hud.gutter), child: SkeletonBox(height: 320)),
            );
    } else if (!sellable) {
      body = EmptyState(icon: Icons.inventory_2_outlined, title: l.notSellable);
    } else {
      final limits = StockLimits(trip.availableLines);
      body = ListView(
        padding: const EdgeInsets.all(Hud.gutter),
        children: [
          TripStockStrip(trip: trip, title: boatAndCaptain(trip).isEmpty ? '—' : boatAndCaptain(trip)),
          const SizedBox(height: Hud.gap),
          HudCard(
            padding: const EdgeInsets.fromLTRB(14, 8, 14, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SectionHead(title: l.dalalLabel, icon: Icons.storefront_outlined),
                const SizedBox(height: 8),
                if (dalalsState.hasError && dalals.isEmpty)
                  ErrorState(error: dalalsState.error!, compact: true, onRetry: () => ref.invalidate(dalalsProvider))
                else
                  SearchSelect<int>(
                    hint: dalalsState.isLoading ? '…' : l.chooseDalal,
                    title: l.chooseDalal,
                    value: _dalalId,
                    errorText: _dalalError,
                    options: [
                      for (final dalal in dalals)
                        SelectOption(
                          value: dalal.id,
                          label: dalal.name,
                          detail: dalal.hasAgreement
                              ? l.commissionShort(Fmt.pct(dalal.partnership!.commissionPct))
                              : l.noAgreement,
                          trailing: dalal.partnership?.isPending ?? false
                              ? StatusChip(label: l.agreementPending, tone: Tone.warning, dense: true)
                              : null,
                        ),
                    ],
                    onChanged: (id) => setState(() {
                      _dalalId = id;
                      _dalalError = null;
                    }),
                  ),
              ],
            ),
          ),
          const SizedBox(height: Hud.gap),
          for (var i = 0; i < _lines.length; i++) ...[
            StockLineCard(
              index: i,
              line: _lines[i],
              stock: trip.availableLines,
              cap: limits.capFor(_lines[i], _lines),
              priced: false,
              canRemove: _lines.length > 1 || !_lines[i].isBlank(priced: false),
              onChanged: () => setState(() => _linesError = null),
              onRemove: () => _removeLine(_lines[i]),
            ),
            const SizedBox(height: 10),
          ],
          if (_linesError != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(_linesError!, style: text.bodyMedium?.copyWith(color: c.toneText(Tone.danger))),
            ),
          OutlinedButton.icon(
            onPressed: _addLine,
            style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(Hud.buttonHeight)),
            icon: const Icon(Icons.add),
            label: Text(l.addSpecies),
          ),
          const SizedBox(height: Hud.gap),
          HudCard(
            padding: const EdgeInsets.fromLTRB(14, 8, 14, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SectionHead(title: l.fieldNotes, icon: Icons.notes_outlined),
                const SizedBox(height: 8),
                TextField(controller: _notes, minLines: 2, maxLines: 4),
              ],
            ),
          ),
          const SizedBox(height: Hud.gutter),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(l.consignTitle)),
      bottomNavigationBar: !sellable
          ? null
          : PinnedAction(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(l.totalLabel, style: text.bodyMedium?.copyWith(color: c.muted)),
                      const Spacer(),
                      Text(l.kg(_totalKg), style: text.titleMedium),
                    ],
                  ),
                  const SizedBox(height: 10),
                  PrimaryButton(label: l.reviewConsign, onPressed: () => _review(trip, dalals)),
                ],
              ),
            ),
      body: body,
    );
  }
}

/// Per-species totals, the dalal and their terms, then the sending itself.
/// Pops with the [Consignment] on success, or the [ValidationException] for
/// the form to show on its fields.
class _SummarySheet extends ConsumerStatefulWidget {
  const _SummarySheet({
    required this.dalal,
    required this.input,
    required this.speciesNames,
    required this.idempotencyKey,
  });

  final Dalal dalal;
  final ConsignmentInput input;
  final Map<int, String> speciesNames;
  final String idempotencyKey;

  @override
  ConsumerState<_SummarySheet> createState() => _SummarySheetState();
}

class _SummarySheetState extends ConsumerState<_SummarySheet> {
  bool _busy = false;
  String? _error;

  Future<void> _send() async {
    if (_busy) return;
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      final consignment = await ref
          .read(sellingActionsProvider)
          .consign(widget.input, idempotencyKey: widget.idempotencyKey);
      unawaited(HapticFeedback.mediumImpact());
      if (mounted) Navigator.of(context).pop(consignment);
    } on ValidationException catch (e) {
      if (mounted) Navigator.of(context).pop(e);
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.userMessage(context.l10n));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;

    final totals = <int, double>{};
    for (final line in widget.input.items) {
      totals[line.speciesId] = (totals[line.speciesId] ?? 0) + line.weightKg;
    }
    final total = totals.values.fold<double>(0, (a, b) => a + b);

    return SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * .85),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(Hud.gutter, 0, Hud.gutter, Hud.gutter),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(l.consignSummaryTitle, style: text.titleMedium),
              const SizedBox(height: 10),
              InfoRow(label: l.dalalLabel, value: widget.dalal.name),
              InfoRow(
                label: l.agreementLabel,
                child: DalalTermsText(dalal: widget.dalal),
              ),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (final entry in totals.entries)
                      InfoRow(
                        label: widget.speciesNames[entry.key] ?? '—',
                        child: Text(l.kg(entry.value), style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w700)),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Text(l.totalLabel, style: text.titleSmall),
                    const Spacer(),
                    Text(l.kg(total), style: text.titleLarge),
                  ],
                ),
              ),
              Text(l.consignSummaryNote, style: text.bodySmall?.copyWith(height: 1.6)),
              if (_error != null) ...[
                const SizedBox(height: 10),
                Text(_error!, style: text.bodyMedium?.copyWith(color: c.toneText(Tone.danger))),
              ],
              const SizedBox(height: 16),
              PrimaryButton(
                label: l.consignConfirm,
                icon: Icons.local_shipping_outlined,
                busy: _busy,
                onPressed: _send,
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: _busy ? null : () => Navigator.of(context).pop(),
                style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(Hud.buttonHeight)),
                child: Text(l.editCatch),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
