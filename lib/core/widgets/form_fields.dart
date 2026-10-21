import 'package:flutter/material.dart';

import '../l10n.dart';
import '../theme/tokens.dart';

/// A field label above its input, as on the web portal's forms.
class FieldLabel extends StatelessWidget {
  const FieldLabel({super.key, required this.label, required this.child, this.required = false});

  final String label;
  final Widget child;
  final bool required;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text.rich(
            TextSpan(
              text: label,
              children: [
                if (required)
                  TextSpan(
                    text: ' *',
                    style: TextStyle(color: c.danger),
                  ),
              ],
            ),
            style: Theme.of(context).textTheme.labelMedium?.copyWith(color: c.muted),
          ),
        ),
        child,
      ],
    );
  }
}

/// One option in a [SearchSelect].
class SelectOption<T> {
  const SelectOption({required this.value, required this.label, this.detail, this.trailing, this.enabled = true});

  final T value;
  final String label;

  /// A second piece shown at the end of the row (a boat number, a captain).
  final String? detail;
  final Widget? trailing;
  final bool enabled;
}

/// A field that opens a searchable list in a bottom sheet. [emptyLabel] is
/// the "no choice" row (e.g. "كابتن القارب"), shown first when given.
class SearchSelect<T> extends StatelessWidget {
  const SearchSelect({
    super.key,
    required this.options,
    required this.value,
    required this.onChanged,
    required this.hint,
    this.emptyLabel,
    this.errorText,
    this.title,
    this.enabled = true,
  });

  final List<SelectOption<T>> options;
  final T? value;
  final ValueChanged<T?> onChanged;
  final String hint;
  final String? emptyLabel;
  final String? errorText;
  final String? title;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    final selected = options.where((o) => o.value == value).firstOrNull;
    final text = Theme.of(context).textTheme;
    final shown = selected?.label ?? (value == null ? emptyLabel : null);

    return InkWell(
      onTap: enabled ? () => _open(context) : null,
      child: InputDecorator(
        isEmpty: shown == null,
        decoration: InputDecoration(
          hintText: hint,
          errorText: errorText,
          enabled: enabled,
          suffixIcon: Icon(Icons.expand_more, size: 20, color: c.muted),
        ),
        child: shown == null
            ? null
            : Row(
                children: [
                  Expanded(
                    child: Text(
                      shown,
                      style: text.bodyLarge?.copyWith(color: selected == null ? c.muted : c.foreground),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (selected?.detail != null) ...[
                    const SizedBox(width: 8),
                    Text(selected!.detail!, style: text.bodySmall),
                  ],
                ],
              ),
      ),
    );
  }

  Future<void> _open(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final result = await showModalBottomSheet<_Picked<T>>(
      context: context,
      isScrollControlled: true,
      builder: (context) =>
          _SearchSheet<T>(options: options, selected: value, title: title ?? hint, emptyLabel: emptyLabel),
    );
    if (result != null) onChanged(result.value);
  }
}

class _Picked<T> {
  const _Picked(this.value);

  final T? value;
}

class _SearchSheet<T> extends StatefulWidget {
  const _SearchSheet({required this.options, required this.selected, required this.title, this.emptyLabel});

  final List<SelectOption<T>> options;
  final T? selected;
  final String title;
  final String? emptyLabel;

  @override
  State<_SearchSheet<T>> createState() => _SearchSheetState<T>();
}

class _SearchSheetState<T> extends State<_SearchSheet<T>> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    final l = context.l10n;
    final text = Theme.of(context).textTheme;
    final q = _query.trim();
    final filtered = q.isEmpty
        ? widget.options
        : widget.options.where((o) => o.label.contains(q) || (o.detail?.contains(q) ?? false)).toList();
    final showSearch = widget.options.length > 7;
    final height = MediaQuery.sizeOf(context).height * .8;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: height),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(Hud.gutter, 0, Hud.gutter, 10),
                child: Text(widget.title, style: text.titleMedium),
              ),
              if (showSearch)
                Padding(
                  padding: const EdgeInsets.fromLTRB(Hud.gutter, 0, Hud.gutter, 8),
                  child: TextField(
                    autofocus: false,
                    onChanged: (v) => setState(() => _query = v),
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(hintText: l.searchHint, prefixIcon: const Icon(Icons.search)),
                  ),
                ),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(bottom: 12),
                  children: [
                    if (widget.emptyLabel != null && q.isEmpty)
                      _row(context, c, widget.emptyLabel!, null, widget.selected == null, () {
                        Navigator.of(context).pop(_Picked<T>(null));
                      }),
                    for (final option in filtered)
                      _row(
                        context,
                        c,
                        option.label,
                        option.detail,
                        option.value == widget.selected,
                        option.enabled ? () => Navigator.of(context).pop(_Picked<T>(option.value)) : null,
                        trailing: option.trailing,
                      ),
                    if (filtered.isEmpty)
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          l.noResults,
                          textAlign: TextAlign.center,
                          style: text.bodyMedium?.copyWith(color: c.muted),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _row(
    BuildContext context,
    HawatColors c,
    String label,
    String? detail,
    bool selected,
    VoidCallback? onTap, {
    Widget? trailing,
  }) {
    final text = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 48),
        padding: const EdgeInsets.symmetric(horizontal: Hud.gutter, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? c.primary.withValues(alpha: .08) : null,
          border: Border(bottom: BorderSide(color: c.hair)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: text.bodyLarge?.copyWith(
                  color: onTap == null ? c.muted : c.foreground,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ),
            if (detail != null) ...[const SizedBox(width: 8), Text(detail, style: text.bodySmall)],
            if (trailing != null) ...[const SizedBox(width: 8), trailing],
            if (selected) ...[const SizedBox(width: 8), Icon(Icons.check, size: 20, color: c.primary)],
          ],
        ),
      ),
    );
  }
}

/// A label and its value on one row, for details screens.
class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.label, this.value, this.child, this.last = false});

  final String label;
  final String? value;
  final Widget? child;
  final bool last;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 11),
      decoration: BoxDecoration(
        border: last ? null : Border(bottom: BorderSide(color: c.hair)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(label, style: text.bodyMedium?.copyWith(color: c.muted)),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 6,
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child:
                  child ??
                  Text(
                    value ?? '—',
                    textAlign: TextAlign.end,
                    style: text.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
