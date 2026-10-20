import 'dart:async';
import 'dart:math' as math;

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
import '../../../core/widgets/step_progress.dart';
import '../../contacts/data/customer.dart';
import '../../contacts/data/customers_repository.dart';
import '../../contacts/presentation/quick_customer_sheet.dart';
import '../../lookups/data/lookups.dart';
import '../../lookups/data/lookups_repository.dart';
import '../../trips/data/trip.dart';
import '../../trips/data/trips_providers.dart';
import '../../trips/presentation/trip_ui.dart';
import '../data/sale.dart';
import '../data/selling_actions.dart';
import 'stock_lines.dart';

/// Selling a trip's catch, one short step at a time: the customer, the lines
/// (never more than the trip has), the payment, then a review and
/// "إنهاء البيع". The running total stays pinned at the bottom.
class SaleFormScreen extends ConsumerStatefulWidget {
  const SaleFormScreen({super.key, required this.tripId});

  final int tripId;

  @override
  ConsumerState<SaleFormScreen> createState() => _SaleFormScreenState();
}

class _SaleFormScreenState extends ConsumerState<SaleFormScreen> {
  static const _customerStep = 0;
  static const _linesStep = 1;
  static const _paymentStep = 2;
  static const _reviewStep = 3;

  int _step = _customerStep;

  int? _customerId;
  final List<Customer> _addedCustomers = [];
  String? _customerError;

  final List<StockLineDraft> _lines = [StockLineDraft()];
  String? _linesError;

  /// The lines of the last submit, in the order sent, so `items.N` finds its card.
  List<StockLineDraft> _sent = const [];

  int? _methodId;
  String? _methodError;
  final _discount = TextEditingController();
  final _paid = TextEditingController();
  final _notes = TextEditingController();
  bool _paidInFull = true;
  String? _discountError;
  String? _paidError;

  /// One per screen: a retry after a lost reply never sells twice.
  final _idempotencyKey = ApiClient.newIdempotencyKey();
  bool _busy = false;

  @override
  void dispose() {
    for (final line in _lines) {
      line.dispose();
    }
    _discount.dispose();
    _paid.dispose();
    _notes.dispose();
    super.dispose();
  }

  static double _round2(double value) => (value * 100).round() / 100;

  List<StockLineDraft> get _filled => _lines.where((line) => !line.isBlank(priced: true)).toList();

  double get _subtotal => _round2(_filled.fold<double>(0, (sum, line) => sum + line.total));

  double get _discountValue => math.min(double.tryParse(_discount.text) ?? 0, _subtotal);

  double get _total => _round2(_subtotal - _discountValue);

  double get _paidValue => _paidInFull ? _total : math.min(double.tryParse(_paid.text) ?? 0, _total);

  double get _remaining => _round2(_total - _paidValue);

  int? _effectiveMethod(Lookups lookups) =>
      _methodId ?? lookups.paymentMethods.where((m) => m.id != null).firstOrNull?.id;

  void _changed() => setState(() => _linesError = null);

  void _go(int step) {
    FocusScope.of(context).unfocus();
    setState(() => _step = step);
  }

  bool _validateLines(StockLimits limits) {
    final l = context.l10n;
    var ok = true;
    setState(() {
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
        if (line.price.text.isEmpty) {
          line.priceError = l.linePriceRequired;
          ok = false;
        } else if ((line.pricePerKg ?? 0) <= 0) {
          line.priceError = l.linePriceInvalid;
          ok = false;
        }
      }
    });
    return ok;
  }

  bool _validatePayment() {
    final l = context.l10n;
    setState(() {
      final discount = double.tryParse(_discount.text) ?? 0;
      _discountError = discount > _subtotal + 0.004 ? l.discountTooHigh : null;
      if (_paidInFull) {
        _paidError = null;
      } else if (_paid.text.isEmpty) {
        _paidError = l.paidAmountRequired;
      } else {
        _paidError = (double.tryParse(_paid.text) ?? 0) > _total + 0.004 ? l.paidTooHigh : null;
      }
    });
    return _discountError == null && _paidError == null;
  }

  Future<void> _next(StockLimits limits, Lookups lookups) async {
    switch (_step) {
      case _customerStep:
        _go(_linesStep);
      case _linesStep:
        if (_validateLines(limits)) _go(_paymentStep);
      case _paymentStep:
        if (_validatePayment()) _go(_reviewStep);
      default:
        await _submit(lookups);
    }
  }

  Future<void> _submit(Lookups lookups) async {
    if (_busy) return;
    final l = context.l10n;
    final filled = _filled;
    _sent = filled;
    final input = SaleInput(
      tripId: widget.tripId,
      customerId: _customerId,
      paymentMethodId: _effectiveMethod(lookups),
      discount: _discountValue > 0 ? _discountValue : null,
      paidAmount: _paidInFull ? null : _paidValue,
      notes: _notes.text,
      items: [
        for (final line in filled)
          SaleLineInput(speciesId: line.speciesId!, weightKg: line.kg!, pricePerKg: line.pricePerKg!),
      ],
    );

    setState(() => _busy = true);
    try {
      final sale = await ref.read(sellingActionsProvider).sell(input, idempotencyKey: _idempotencyKey);
      unawaited(HapticFeedback.mediumImpact());
      if (!mounted) return;
      showSnack(context, l.saleCreated);
      context.pushReplacement(Routes.sale(sale.id));
    } on ValidationException catch (e) {
      _applyErrors(e);
    } on ApiException catch (e) {
      if (mounted) showSnack(context, e.userMessage(l), error: true);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  /// The server's 422, field by field, on the step that shows the field.
  void _applyErrors(ValidationException e) {
    int? target;
    void at(int step) => target = math.min(target ?? step, step);
    String? tripError;
    final item = RegExp(r'^items\.(\d+)\.(\w+)$');

    setState(() {
      for (final entry in e.errors.entries) {
        final message = entry.value.firstOrNull;
        if (message == null) continue;
        final match = item.firstMatch(entry.key);
        if (match != null) {
          final index = int.parse(match[1]!);
          final line = index < _sent.length ? _sent[index] : null;
          switch (match[2]) {
            case _ when line == null:
              _linesError = message;
            case 'species_id':
              line.speciesError = message;
            case 'price_per_kg':
              line.priceError = message;
            default:
              line.weightError = message;
          }
          at(_linesStep);
        } else {
          switch (entry.key) {
            case 'items':
              _linesError = message;
              at(_linesStep);
            case 'customer_id':
              _customerError = message;
              at(_customerStep);
            case 'discount':
              _discountError = message;
              at(_paymentStep);
            case 'paid_amount':
              _paidError = message;
              at(_paymentStep);
            case 'payment_method_id' || 'payment_status_id':
              _methodError = message;
              at(_paymentStep);
            default:
              tripError ??= message;
          }
        }
      }
      if (target != null) _step = target!;
    });

    if (tripError != null) {
      showSnack(context, tripError!, error: true);
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

  Future<void> _addCustomer() async {
    final customer = await showQuickCustomerSheet(context);
    if (customer == null || !mounted) return;
    showSnack(context, context.l10n.customerAdded);
    setState(() {
      _addedCustomers.add(customer);
      _customerId = customer.id;
      _customerError = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final tripState = ref.watch(tripDetailProvider(widget.tripId));
    final lookups = ref.watch(lookupsControllerProvider).value ?? const Lookups();
    final trip = tripState.value;

    Widget body;
    if (trip == null) {
      body = tripState.hasError
          ? ErrorState(error: tripState.error!, onRetry: () => ref.invalidate(tripDetailProvider(widget.tripId)))
          : const Skeleton(
              child: Padding(padding: EdgeInsets.all(Hud.gutter), child: SkeletonBox(height: 320)),
            );
    } else if (!trip.canSell || trip.availableLines.isEmpty) {
      body = EmptyState(icon: Icons.inventory_2_outlined, title: l.notSellable);
    } else {
      body = _form(trip, lookups);
    }

    final sellable = trip != null && trip.canSell && trip.availableLines.isNotEmpty;

    return PopScope(
      canPop: _step == _customerStep && !_busy,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop && _step > _customerStep && !_busy) _go(_step - 1);
      },
      child: Scaffold(
        appBar: AppBar(title: Text(l.newSaleTitle)),
        bottomNavigationBar: sellable ? _bottomBar(StockLimits(trip.availableLines), lookups) : null,
        body: body,
      ),
    );
  }

  Widget _form(Trip trip, Lookups lookups) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(Hud.gutter, 12, Hud.gutter, 14),
          decoration: BoxDecoration(
            color: c.panel,
            border: Border(bottom: BorderSide(color: c.hair)),
          ),
          child: StepProgress(labels: [l.stepCustomer, l.stepLines, l.stepPayment, l.stepReview], current: _step),
        ),
        Expanded(
          child: AnimatedSwitcher(
            duration: Hud.fast,
            child: KeyedSubtree(
              key: ValueKey(_step),
              child: ListView(
                padding: const EdgeInsets.all(Hud.gutter),
                children: [
                  TripStockStrip(trip: trip, title: boatAndCaptain(trip).isEmpty ? '—' : boatAndCaptain(trip)),
                  const SizedBox(height: Hud.gap),
                  ...switch (_step) {
                    _customerStep => _customerStepView(),
                    _linesStep => _linesStepView(trip),
                    _paymentStep => _paymentStepView(lookups),
                    _ => _reviewStepView(trip, lookups),
                  },
                  const SizedBox(height: Hud.gutter),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _customerStepView() {
    final l = context.l10n;
    final customers = ref.watch(activeCustomersProvider);
    final list = [
      ...?customers.value,
      for (final added in _addedCustomers)
        if (!(customers.value ?? const <Customer>[]).any((c) => c.id == added.id)) added,
    ];

    return [
      HudCard(
        padding: const EdgeInsets.fromLTRB(14, 8, 14, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHead(title: l.stepCustomer, icon: Icons.person_outline),
            const SizedBox(height: 8),
            if (customers.hasError && list.isEmpty)
              ErrorState(error: customers.error!, compact: true, onRetry: () => ref.invalidate(activeCustomersProvider))
            else
              SearchSelect<int>(
                hint: customers.isLoading ? '…' : l.chooseCustomer,
                title: l.chooseCustomer,
                value: _customerId,
                emptyLabel: l.cashCustomer,
                errorText: _customerError,
                options: [
                  for (final customer in list)
                    SelectOption(value: customer.id, label: customer.name, detail: customer.phone),
                ],
                onChanged: (id) => setState(() {
                  _customerId = id;
                  _customerError = null;
                }),
              ),
            const SizedBox(height: 8),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: TextButton.icon(
                onPressed: _addCustomer,
                style: TextButton.styleFrom(minimumSize: const Size(48, Hud.minTouch)),
                icon: const Icon(Icons.person_add_alt_1_outlined, size: 20),
                label: Text(l.newCustomer),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> _linesStepView(Trip trip) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final limits = StockLimits(trip.availableLines);
    return [
      for (var i = 0; i < _lines.length; i++) ...[
        StockLineCard(
          index: i,
          line: _lines[i],
          stock: trip.availableLines,
          cap: limits.capFor(_lines[i], _lines),
          priced: true,
          canRemove: _lines.length > 1 || !_lines[i].isBlank(priced: true),
          onChanged: _changed,
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
        style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(Hud.minTouch)),
        icon: const Icon(Icons.add),
        label: Text(l.addSpecies),
      ),
    ];
  }

  List<Widget> _paymentStepView(Lookups lookups) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final method = _effectiveMethod(lookups);

    return [
      HudCard(
        padding: const EdgeInsets.fromLTRB(14, 8, 14, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHead(title: l.stepPayment, icon: Icons.payments_outlined),
            const SizedBox(height: 8),
            FieldLabel(
              label: l.paymentMethodLabel,
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final m in lookups.paymentMethods)
                    if (m.id != null)
                      ChoiceChip(
                        label: Text(m.name ?? ''),
                        selected: m.id == method,
                        onSelected: (_) => setState(() {
                          _methodId = m.id;
                          _methodError = null;
                        }),
                      ),
                ],
              ),
            ),
            if (_methodError != null) ...[
              const SizedBox(height: 6),
              Text(_methodError!, style: text.bodySmall?.copyWith(color: c.toneText(Tone.danger))),
            ],
            const SizedBox(height: 14),
            FieldLabel(
              label: l.discountLabel,
              child: _MoneyField(
                controller: _discount,
                error: _discountError,
                onChanged: () => setState(() => _discountError = null),
              ),
            ),
            const SizedBox(height: 8),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(l.paidInFull, style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w600)),
              value: _paidInFull,
              onChanged: (value) => setState(() {
                _paidInFull = value;
                _paidError = null;
              }),
            ),
            if (!_paidInFull)
              FieldLabel(
                label: l.paidAmountLabel,
                required: true,
                child: _MoneyField(
                  controller: _paid,
                  error: _paidError,
                  hint: '0',
                  onChanged: () => setState(() => _paidError = null),
                ),
              ),
            const SizedBox(height: 6),
            InfoRow(label: l.grandTotalLabel, value: l.sar(_total)),
            InfoRow(
              label: l.remainingLabel,
              last: true,
              child: Text(
                l.sar(_remaining),
                style: text.titleSmall?.copyWith(color: _remaining > 0 ? c.toneText(Tone.danger) : null),
              ),
            ),
          ],
        ),
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
    ];
  }

  List<Widget> _reviewStepView(Trip trip, Lookups lookups) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final names = {for (final s in trip.availableLines) s.speciesId: s.species};
    final customer = [
      ...?ref.watch(activeCustomersProvider).value,
      ..._addedCustomers,
    ].where((c) => c.id == _customerId).firstOrNull;
    final method = lookups.paymentMethods.where((m) => m.id == _effectiveMethod(lookups)).firstOrNull;
    final lines = _filled;

    return [
      HudCard(
        padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
        child: Column(
          children: [
            InfoRow(label: l.customerLabel, value: customer?.name ?? l.cashCustomer),
            InfoRow(label: l.paymentMethodLabel, value: method?.name, last: _notes.text.trim().isEmpty),
            if (_notes.text.trim().isNotEmpty) InfoRow(label: l.fieldNotes, value: _notes.text.trim(), last: true),
          ],
        ),
      ),
      const SizedBox(height: Hud.gap),
      HudCard(
        padding: const EdgeInsets.fromLTRB(14, 8, 14, 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHead(title: l.invoiceLines, icon: Icons.set_meal_outlined),
            for (var i = 0; i < lines.length; i++)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: i == lines.length - 1 ? null : Border(bottom: BorderSide(color: c.hair)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            names[lines[i].speciesId] ?? '—',
                            style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${l.kg(lines[i].kg ?? 0)}  ×  ${l.pricePerKg(Fmt.ltr(Fmt.money(lines[i].pricePerKg ?? 0)))}',
                            style: text.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Text(l.sar(lines[i].total), style: text.labelLarge),
                  ],
                ),
              ),
          ],
        ),
      ),
      const SizedBox(height: Hud.gap),
      HudCard(
        padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
        child: Column(
          children: [
            InfoRow(label: l.subtotalLabel, value: l.sar(_subtotal)),
            if (_discountValue > 0) InfoRow(label: l.discountLabel, value: l.sar(_discountValue)),
            InfoRow(
              label: l.grandTotalLabel,
              child: Text(l.sar(_total), style: text.titleMedium),
            ),
            InfoRow(label: l.paidLabel, value: l.sar(_paidValue), last: _remaining <= 0),
            if (_remaining > 0)
              InfoRow(
                label: l.remainingLabel,
                last: true,
                child: Text(l.sar(_remaining), style: text.titleSmall?.copyWith(color: c.toneText(Tone.danger))),
              ),
          ],
        ),
      ),
    ];
  }

  Widget _bottomBar(StockLimits limits, Lookups lookups) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final last = _step == _reviewStep;

    return PinnedAction(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_step > _customerStep) ...[
            Row(
              children: [
                Text(l.grandTotalLabel, style: text.bodyMedium?.copyWith(color: c.muted)),
                const Spacer(),
                Text(l.sar(_total), style: text.titleMedium),
              ],
            ),
            const SizedBox(height: 10),
          ],
          Row(
            children: [
              if (_step > _customerStep) ...[
                SizedBox(
                  height: Hud.primaryButtonHeight,
                  child: OutlinedButton(onPressed: _busy ? null : () => _go(_step - 1), child: Text(l.back)),
                ),
                const SizedBox(width: 10),
              ],
              Expanded(
                child: PrimaryButton(
                  label: last ? l.finishSale : l.nextStep,
                  icon: last ? Icons.check : null,
                  busy: _busy,
                  onPressed: () => _next(limits, lookups),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MoneyField extends StatelessWidget {
  const _MoneyField({required this.controller, required this.onChanged, this.error, this.hint});

  final TextEditingController controller;
  final VoidCallback onChanged;
  final String? error;
  final String? hint;

  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    keyboardType: const TextInputType.numberWithOptions(decimal: true),
    textDirection: TextDirection.ltr,
    textAlign: TextAlign.right,
    inputFormatters: [DecimalInputFormatter()],
    onChanged: (_) => onChanged(),
    decoration: InputDecoration(
      errorText: error,
      hintText: hint,
      hintTextDirection: TextDirection.ltr,
      suffixText: context.l10n.currencySar,
    ),
  );
}
