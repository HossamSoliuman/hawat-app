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
import '../../sales/data/selling_actions.dart';
import '../data/customer.dart';

/// "زبون جديد" without leaving the sale: a name and, if known, a phone.
Future<Customer?> showQuickCustomerSheet(BuildContext context) => showModalBottomSheet<Customer>(
  context: context,
  isScrollControlled: true,
  builder: (_) => const _QuickCustomerSheet(),
);

class _QuickCustomerSheet extends ConsumerStatefulWidget {
  const _QuickCustomerSheet();

  @override
  ConsumerState<_QuickCustomerSheet> createState() => _QuickCustomerSheetState();
}

class _QuickCustomerSheetState extends ConsumerState<_QuickCustomerSheet> {
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _key = ApiClient.newIdempotencyKey();
  bool _busy = false;
  String? _nameError;
  String? _phoneError;
  String? _error;

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final l = context.l10n;
    final name = _name.text.trim();
    final phone = _phone.text;
    setState(() {
      _nameError = name.isEmpty ? l.nameRequired : null;
      _phoneError = phone.isNotEmpty && !Phone.isValid(phone) ? l.phoneInvalid : null;
      _error = null;
    });
    if (_nameError != null || _phoneError != null) return;

    setState(() => _busy = true);
    try {
      final customer = await ref
          .read(sellingActionsProvider)
          .addCustomer(name: name, phone: phone.isEmpty ? null : phone, idempotencyKey: _key);
      unawaited(HapticFeedback.lightImpact());
      if (mounted) Navigator.of(context).pop(customer);
    } on ValidationException catch (e) {
      setState(() {
        _nameError = e.fieldError('name');
        _phoneError = e.fieldError('phone');
        _error = e.outside(const ['name', 'phone']);
      });
    } on ApiException catch (e) {
      setState(() => _error = e.userMessage(l));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(Hud.gutter, 0, Hud.gutter, Hud.gutter + MediaQuery.viewInsetsOf(context).bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l.newCustomer, style: text.titleMedium),
            const SizedBox(height: 14),
            FieldLabel(
              label: l.nameLabel,
              required: true,
              child: TextField(
                controller: _name,
                autofocus: true,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(errorText: _nameError),
              ),
            ),
            const SizedBox(height: 14),
            FieldLabel(
              label: l.phoneLabel,
              child: TextField(
                controller: _phone,
                keyboardType: TextInputType.phone,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.right,
                inputFormatters: [PhoneInputFormatter()],
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _save(),
                decoration: InputDecoration(
                  hintText: l.phoneHint,
                  hintTextDirection: TextDirection.ltr,
                  errorText: _phoneError,
                ),
              ),
            ),
            if (_error != null) ...[
              const SizedBox(height: 12),
              Text(_error!, style: text.bodyMedium?.copyWith(color: c.toneText(Tone.danger))),
            ],
            const SizedBox(height: 18),
            PrimaryButton(label: l.addCustomer, busy: _busy, onPressed: _save),
          ],
        ),
      ),
    );
  }
}
