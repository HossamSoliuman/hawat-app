import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/api_exception.dart';
import '../format/format.dart';
import '../l10n.dart';
import '../models/refs.dart';
import '../theme/tokens.dart';
import 'actions.dart';
import 'form_fields.dart';
import 'hud_card.dart';
import 'section_head.dart';

/// A titled card of fields, spaced evenly.
class FormSection extends StatelessWidget {
  const FormSection({super.key, required this.title, required this.icon, required this.children});

  final String title;
  final IconData icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => HudCard(
    padding: const EdgeInsets.fromLTRB(14, 8, 14, 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHead(title: title, icon: icon),
        const SizedBox(height: 8),
        for (var i = 0; i < children.length; i++) ...[if (i > 0) const SizedBox(height: 14), children[i]],
      ],
    ),
  );
}

/// A text input. [ltr] for numbers, codes, phones and emails typed in Latin.
class FormText extends StatelessWidget {
  const FormText({
    super.key,
    required this.controller,
    this.error,
    this.hint,
    this.ltr = false,
    this.keyboardType,
    this.maxLines = 1,
    this.onChanged,
  });

  final TextEditingController controller;
  final String? error;
  final String? hint;
  final bool ltr;
  final TextInputType? keyboardType;
  final int maxLines;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    keyboardType: keyboardType ?? (maxLines > 1 ? TextInputType.multiline : null),
    textDirection: ltr ? TextDirection.ltr : null,
    textAlign: ltr ? TextAlign.right : TextAlign.start,
    minLines: maxLines > 1 ? 2 : 1,
    maxLines: maxLines,
    onChanged: onChanged,
    decoration: InputDecoration(errorText: error, hintText: hint, hintTextDirection: ltr ? TextDirection.ltr : null),
  );
}

/// A whole number, or with [decimal] a number with up to two decimals.
class NumberField extends StatelessWidget {
  const NumberField({super.key, required this.controller, this.error, this.hint, this.decimal = false});

  final TextEditingController controller;
  final String? error;
  final String? hint;
  final bool decimal;

  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    keyboardType: TextInputType.numberWithOptions(decimal: decimal),
    textDirection: TextDirection.ltr,
    textAlign: TextAlign.right,
    inputFormatters: [if (decimal) DecimalInputFormatter() else IntegerInputFormatter()],
    decoration: InputDecoration(errorText: error, hintText: hint, hintTextDirection: TextDirection.ltr),
  );
}

/// A date picked from the calendar, clearable.
class DateField extends StatelessWidget {
  const DateField({super.key, required this.value, required this.onChanged, this.error});

  final DateTime? value;
  final ValueChanged<DateTime?> onChanged;
  final String? error;

  Future<void> _pick(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: value ?? now,
      firstDate: DateTime(now.year - 40),
      lastDate: DateTime(now.year + 20),
    );
    if (date != null) onChanged(date);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return InkWell(
      onTap: () => _pick(context),
      child: InputDecorator(
        isEmpty: value == null,
        decoration: InputDecoration(
          hintText: l.notSet,
          errorText: error,
          prefixIcon: const Icon(Icons.event_outlined),
          suffixIcon: value == null
              ? null
              : IconButton(tooltip: l.clearValue, icon: const Icon(Icons.close), onPressed: () => onChanged(null)),
        ),
        child: value == null ? null : Text(Fmt.date(value!), style: Theme.of(context).textTheme.bodyLarge),
      ),
    );
  }
}

/// A reference list from `/lookups` (category, type, id type…), with "غير محدد".
class LookupSelect extends StatelessWidget {
  const LookupSelect({super.key, required this.items, required this.value, required this.onChanged, this.error});

  final List<IdName> items;
  final int? value;
  final ValueChanged<int?> onChanged;
  final String? error;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return SearchSelect<int>(
      hint: l.notSet,
      value: value,
      emptyLabel: l.notSet,
      errorText: error,
      options: [
        for (final item in items)
          if (item.id != null) SelectOption(value: item.id!, label: item.name ?? ''),
      ],
      onChanged: onChanged,
    );
  }
}

/// Two short fields side by side.
class FieldPair extends StatelessWidget {
  const FieldPair(this.start, this.end, {super.key});

  final Widget start;
  final Widget end;

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child: start),
      const SizedBox(width: 12),
      Expanded(child: end),
    ],
  );
}

/// A server error for a field drawn without an input (chips).
class FieldError extends StatelessWidget {
  const FieldError(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) => Text(
    message,
    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: HawatColors.of(context).toneText(Tone.danger)),
  );
}

/// One choice among a few fixed values (a status), as chips.
class ChoiceRow<T> extends StatelessWidget {
  const ChoiceRow({super.key, required this.options, required this.value, required this.onChanged, this.label});

  final List<T> options;
  final T? value;
  final ValueChanged<T> onChanged;
  final String Function(T)? label;

  @override
  Widget build(BuildContext context) => Wrap(
    spacing: 8,
    runSpacing: 8,
    children: [
      for (final option in options)
        ChoiceChip(
          label: Text(label?.call(option) ?? '$option'),
          selected: option == value,
          onSelected: (_) => onChanged(option),
        ),
    ],
  );
}

/// Shown when the record changed on another device since the form was filled.
class ConflictBanner extends StatelessWidget {
  const ConflictBanner({super.key, required this.onReload, this.busy = false});

  final VoidCallback onReload;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
      decoration: BoxDecoration(
        color: c.warning.withValues(alpha: .08),
        border: Border.all(color: c.warning.withValues(alpha: .4)),
      ),
      child: Row(
        children: [
          Icon(Icons.sync_problem_outlined, size: 20, color: c.toneText(Tone.warning)),
          const SizedBox(width: 10),
          Expanded(child: Text(l.errorConflict, style: Theme.of(context).textTheme.bodyMedium)),
          const SizedBox(width: 8),
          busy
              ? const SizedBox.square(dimension: 20, child: CircularProgressIndicator(strokeWidth: 2))
              : TextButton(onPressed: onReload, child: Text(l.reload)),
        ],
      ),
    );
  }
}

/// The save plumbing every setup form shares: local checks first, then the
/// request; 422 errors land on their fields, a stale version raises the
/// [ConflictBanner], anything else shows in a snack. The form keeps what was typed.
mixin FormSubmit<W extends ConsumerStatefulWidget> on ConsumerState<W> {
  Map<String, String> errors = const {};
  bool busy = false;
  bool conflict = false;

  void clearError(String key) {
    if (errors.containsKey(key)) setState(() => errors = {...errors}..remove(key));
  }

  /// [fields] are the keys the form shows; an error on any other key goes to a snack.
  Future<bool> submit(
    Future<void> Function() save, {
    required List<String> fields,
    Map<String, String> local = const {},
  }) async {
    final l = context.l10n;
    setState(() {
      errors = local;
      conflict = false;
    });
    if (local.isNotEmpty) return false;
    FocusScope.of(context).unfocus();
    setState(() => busy = true);
    try {
      await save();
      return true;
    } on ValidationException catch (e) {
      setState(() => errors = {for (final entry in e.errors.entries) entry.key: entry.value.first});
      final hidden = e.outside(fields);
      if (hidden != null && mounted) showSnack(context, hidden, error: true);
    } on ConflictException catch (e) {
      if (e.currentVersion != null) {
        setState(() => conflict = true);
      } else if (mounted) {
        showSnack(context, e.userMessage(l), error: true);
      }
    } on ApiException catch (e) {
      if (mounted) showSnack(context, e.userMessage(l), error: true);
    } finally {
      if (mounted) setState(() => busy = false);
    }
    return false;
  }
}
