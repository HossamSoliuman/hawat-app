import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_client.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/format/format.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/actions.dart';
import '../../../core/widgets/form_fields.dart';
import '../data/sale.dart';
import '../data/selling_actions.dart';

/// "تحصيل": a payment on what is still due, never more than it.
Future<bool> showCollectSheet(BuildContext context, Sale sale) async {
  final done = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    builder: (_) => _CollectSheet(sale: sale),
  );
  if ((done ?? false) && context.mounted) showSnack(context, context.l10n.paymentRecorded);
  return done ?? false;
}

class _CollectSheet extends ConsumerStatefulWidget {
  const _CollectSheet({required this.sale});

  final Sale sale;

  @override
  ConsumerState<_CollectSheet> createState() => _CollectSheetState();
}

class _CollectSheetState extends ConsumerState<_CollectSheet> {
  late final _amount = TextEditingController(text: Fmt.plain(widget.sale.remaining));
  final _key = ApiClient.newIdempotencyKey();
  bool _busy = false;
  String? _error;

  @override
  void dispose() {
    _amount.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_busy) return;
    final l = context.l10n;
    final amount = double.tryParse(_amount.text) ?? 0;
    final remaining = widget.sale.remaining;
    if (_amount.text.isEmpty || amount <= 0) {
      setState(() => _error = l.amountRequired);
      return;
    }
    if (amount > remaining + 0.004) {
      setState(() => _error = l.amountTooHigh(l.sar(remaining)));
      return;
    }

    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await ref.read(sellingActionsProvider).collect(widget.sale.id, amount, idempotencyKey: _key);
      unawaited(HapticFeedback.lightImpact());
      if (mounted) Navigator.of(context).pop(true);
    } on ValidationException catch (e) {
      setState(() => _error = e.fieldError('amount') ?? e.userMessage(l));
    } on ApiException catch (e) {
      setState(() => _error = e.userMessage(l));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final text = Theme.of(context).textTheme;
    final remaining = widget.sale.remaining;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(Hud.gutter, 0, Hud.gutter, Hud.gutter + MediaQuery.viewInsetsOf(context).bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l.collectTitle, style: text.titleMedium),
            const SizedBox(height: 8),
            InfoRow(label: l.remainingLabel, value: l.sar(remaining), last: true),
            const SizedBox(height: 8),
            FieldLabel(
              label: l.amountLabel,
              required: true,
              child: TextField(
                controller: _amount,
                autofocus: true,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.right,
                inputFormatters: [DecimalInputFormatter()],
                onChanged: (_) => setState(() => _error = null),
                onSubmitted: (_) => _save(),
                decoration: InputDecoration(errorText: _error, errorMaxLines: 2, suffixText: l.currencySar),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: ActionChip(
                label: Text(l.fullRemaining),
                onPressed: () => setState(() {
                  _amount.text = Fmt.plain(remaining);
                  _error = null;
                }),
              ),
            ),
            const SizedBox(height: 16),
            PrimaryButton(label: l.recordPayment, icon: Icons.check, busy: _busy, onPressed: _save),
          ],
        ),
      ),
    );
  }
}
