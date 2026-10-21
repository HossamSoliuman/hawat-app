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
import '../../../core/providers.dart';
import '../../../core/storage/local_store.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/actions.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/hud_card.dart';
import '../../../core/widgets/ltr_text.dart';
import '../../../core/widgets/states.dart';
import '../../lookups/data/lookups.dart';
import '../../lookups/data/lookups_repository.dart';
import '../data/trip.dart';
import '../data/trips_providers.dart';
import 'trip_ui.dart';

/// The boat is back: one line per species (kg, an optional note), a running
/// total, a summary, then "تسليم المصيد" → the trip waits for the counter.
/// Lines are kept on the device until they are delivered, so a weak signal
/// at the port or a closed app never loses them.
class CatchScreen extends ConsumerStatefulWidget {
  const CatchScreen({super.key, required this.tripId});

  final int tripId;

  @override
  ConsumerState<CatchScreen> createState() => _CatchScreenState();
}

class _Line {
  _Line({this.speciesId, String weight = '', String notes = ''})
    : weight = TextEditingController(text: weight),
      notes = TextEditingController(text: notes),
      showNotes = notes.isNotEmpty;

  int? speciesId;
  final TextEditingController weight;
  final TextEditingController notes;
  bool showNotes;
  String? speciesError;
  String? weightError;

  double? get kg => double.tryParse(weight.text);

  Map<String, dynamic> toJson() => {'species_id': speciesId, 'weight': weight.text, 'notes': notes.text};

  void dispose() {
    weight.dispose();
    notes.dispose();
  }
}

class _CatchScreenState extends ConsumerState<CatchScreen> {
  final List<_Line> _lines = [];
  final _idempotencyKey = ApiClient.newIdempotencyKey();
  Timer? _saveDraft;
  String? _formError;

  LocalStore get _store => ref.read(localStoreProvider);

  @override
  void initState() {
    super.initState();
    final draft = _store.readJson(CacheKeys.catchDraft(widget.tripId));
    final saved = (draft?.json['lines'] as List?)?.cast<Map>() ?? const [];
    for (final line in saved) {
      _lines.add(
        _Line(
          speciesId: line['species_id'] as int?,
          weight: line['weight'] as String? ?? '',
          notes: line['notes'] as String? ?? '',
        ),
      );
    }
    if (_lines.isEmpty) _lines.add(_Line());
  }

  @override
  void dispose() {
    _saveDraft?.cancel();
    for (final line in _lines) {
      line.dispose();
    }
    super.dispose();
  }

  void _changed() {
    setState(() => _formError = null);
    _saveDraft?.cancel();
    _saveDraft = Timer(const Duration(milliseconds: 400), () {
      _store.writeJson(CacheKeys.catchDraft(widget.tripId), {
        'lines': [for (final l in _lines) l.toJson()],
      });
    });
  }

  void _addLine() {
    setState(() => _lines.add(_Line()));
    _changed();
  }

  void _removeLine(_Line line) {
    setState(() {
      _lines.remove(line);
      if (_lines.isEmpty) _lines.add(_Line());
    });
    line.dispose();
    _changed();
  }

  double get _total => _lines.fold(0, (sum, line) => sum + (line.kg ?? 0));

  bool _validate() {
    final l = context.l10n;
    var ok = true;
    final filled = _lines.where((line) => line.speciesId != null || line.weight.text.isNotEmpty).toList();
    setState(() {
      for (final line in _lines) {
        line
          ..speciesError = null
          ..weightError = null;
      }
      for (final line in filled) {
        if (line.speciesId == null) {
          line.speciesError = l.lineSpeciesRequired;
          ok = false;
        }
        if (line.weight.text.isEmpty) {
          line.weightError = l.lineWeightRequired;
          ok = false;
        } else if ((line.kg ?? 0) <= 0) {
          line.weightError = l.lineWeightInvalid;
          ok = false;
        }
      }
      if (filled.isEmpty) {
        _formError = l.catchEmpty;
        ok = false;
      }
    });
    return ok;
  }

  /// Lines as sent: blank ones dropped. The server merges repeated species.
  List<CatchLineInput> _payload() => [
    for (final line in _lines)
      if (line.speciesId != null && (line.kg ?? 0) > 0)
        CatchLineInput(speciesId: line.speciesId!, weightKg: line.kg!, notes: line.notes.text),
  ];

  Future<void> _review(Trip trip, Lookups lookups) async {
    FocusScope.of(context).unfocus();
    if (!_validate()) return;
    final delivered = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _SummarySheet(
        trip: trip,
        lines: _payload(),
        speciesNames: {for (final s in lookups.species) s.id: s.name},
        idempotencyKey: _idempotencyKey,
      ),
    );
    if (delivered != true || !mounted) return;
    _saveDraft?.cancel();
    await _store.remove(CacheKeys.catchDraft(widget.tripId));
    if (!mounted) return;
    showSnack(context, context.l10n.catchSubmitted);
    if (context.canPop()) {
      context.pop();
    } else {
      context.go(Routes.trip(widget.tripId));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final tripState = ref.watch(tripDetailProvider(widget.tripId));
    final lookups = ref.watch(lookupsControllerProvider).value ?? const Lookups();
    final trip = tripState.value;

    return Scaffold(
      appBar: AppBar(title: Text(l.catchTitle)),
      bottomNavigationBar: trip == null || !trip.canSubmitCatch
          ? null
          : PinnedAction(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(l.totalLabel, style: text.bodyMedium?.copyWith(color: c.muted)),
                      const Spacer(),
                      Text(l.kg(_total), style: text.titleMedium),
                    ],
                  ),
                  const SizedBox(height: 10),
                  PrimaryButton(label: l.reviewCatch, onPressed: () => _review(trip, lookups)),
                ],
              ),
            ),
      body: tripState.when(
        loading: () => const Skeleton(
          child: Padding(padding: EdgeInsets.all(Hud.gutter), child: SkeletonBox(height: 260)),
        ),
        error: (e, _) => ErrorState(error: e, onRetry: () => ref.invalidate(tripDetailProvider(widget.tripId))),
        data: (trip) {
          if (!trip.canSubmitCatch) {
            // Delivered from another device meanwhile, or no longer at sea.
            return EmptyState(icon: Icons.task_alt, title: trip.phase.label(l));
          }
          return ListView(
            padding: const EdgeInsets.all(Hud.gutter),
            children: [
              HudCard(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(boatAndCaptain(trip), style: text.titleMedium),
                          const SizedBox(height: 2),
                          LtrText(trip.tripNumber, style: text.bodySmall),
                        ],
                      ),
                    ),
                    TripPhaseChip(trip: trip),
                  ],
                ),
              ),
              const SizedBox(height: Hud.gap),
              for (var i = 0; i < _lines.length; i++) ...[
                _LineCard(
                  index: i,
                  line: _lines[i],
                  species: lookups.species,
                  canRemove: _lines.length > 1 || _lines[i].speciesId != null || _lines[i].weight.text.isNotEmpty,
                  onChanged: _changed,
                  onRemove: () => _removeLine(_lines[i]),
                ),
                const SizedBox(height: 10),
              ],
              if (_formError != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(_formError!, style: text.bodyMedium?.copyWith(color: c.toneText(Tone.danger))),
                ),
              OutlinedButton.icon(
                onPressed: _addLine,
                style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(Hud.buttonHeight)),
                icon: const Icon(Icons.add),
                label: Text(l.addSpecies),
              ),
              const SizedBox(height: Hud.gutter),
            ],
          );
        },
      ),
    );
  }
}

class _LineCard extends StatelessWidget {
  const _LineCard({
    required this.index,
    required this.line,
    required this.species,
    required this.canRemove,
    required this.onChanged,
    required this.onRemove,
  });

  final int index;
  final _Line line;
  final List<Species> species;
  final bool canRemove;
  final VoidCallback onChanged;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);

    return HudCard(
      brackets: false,
      padding: const EdgeInsets.fromLTRB(12, 10, 6, 8),
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
                child: Text('${index + 1}', style: Theme.of(context).textTheme.labelSmall),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 3,
                child: SearchSelect<int>(
                  hint: l.chooseSpecies,
                  value: line.speciesId,
                  errorText: line.speciesError,
                  options: [for (final s in species) SelectOption(value: s.id, label: s.name)],
                  onChanged: (id) {
                    line
                      ..speciesId = id
                      ..speciesError = null;
                    onChanged();
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: TextField(
                  controller: line.weight,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.right,
                  inputFormatters: [DecimalInputFormatter()],
                  onChanged: (_) {
                    line.weightError = null;
                    onChanged();
                  },
                  decoration: InputDecoration(
                    hintText: l.unitKg,
                    errorText: line.weightError,
                    suffixText: line.weight.text.isEmpty ? null : l.unitKg,
                  ),
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
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 36, end: 6, top: 6),
            child: line.showNotes
                ? TextField(
                    controller: line.notes,
                    maxLength: 500,
                    onChanged: (_) => onChanged(),
                    decoration: InputDecoration(hintText: l.noteLabel, counterText: '', isDense: true),
                  )
                : Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: TextButton.icon(
                      onPressed: () {
                        line.showNotes = true;
                        onChanged();
                      },
                      style: TextButton.styleFrom(
                        minimumSize: const Size(48, 36),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      icon: const Icon(Icons.add, size: 16),
                      label: Text(l.addNote),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

/// Per-species totals (repeated species merged, as the server will) and the delivery.
class _SummarySheet extends ConsumerStatefulWidget {
  const _SummarySheet({
    required this.trip,
    required this.lines,
    required this.speciesNames,
    required this.idempotencyKey,
  });

  final Trip trip;
  final List<CatchLineInput> lines;
  final Map<int, String> speciesNames;
  final String idempotencyKey;

  @override
  ConsumerState<_SummarySheet> createState() => _SummarySheetState();
}

class _SummarySheetState extends ConsumerState<_SummarySheet> {
  bool _busy = false;
  String? _error;

  Future<void> _deliver() async {
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await ref
          .read(tripActionsProvider)
          .submitCatch(widget.trip.id, widget.lines, idempotencyKey: widget.idempotencyKey);
      unawaited(HapticFeedback.mediumImpact());
      if (mounted) Navigator.of(context).pop(true);
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
    for (final line in widget.lines) {
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
              Text(l.catchSummaryTitle, style: text.titleMedium),
              const SizedBox(height: 10),
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
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Text(l.totalLabel, style: text.titleSmall),
                    const Spacer(),
                    Text(l.kg(total), style: text.titleLarge),
                  ],
                ),
              ),
              Text(l.catchSummaryNote, style: text.bodySmall?.copyWith(height: 1.6)),
              if (_error != null) ...[
                const SizedBox(height: 10),
                Text(_error!, style: text.bodyMedium?.copyWith(color: c.toneText(Tone.danger))),
              ],
              const SizedBox(height: 16),
              PrimaryButton(label: l.submitCatch, icon: Icons.check, busy: _busy, onPressed: _deliver),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: _busy ? null : () => Navigator.of(context).pop(false),
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
