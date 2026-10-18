import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../api/api_client.dart';
import '../api/api_exception.dart';
import '../l10n.dart';
import '../theme/tokens.dart';
import 'actions.dart';

/// Asks before an action and runs it inside the sheet: the button spins while
/// the request runs, a failure shows in place and can be retried. One
/// Idempotency-Key per opened sheet, so a retry after a lost reply never acts twice.
Future<bool> showActionSheet(
  BuildContext context, {
  required String title,
  String? body,
  required String confirm,
  bool danger = false,
  required Future<void> Function(String idempotencyKey) run,
}) async {
  final done = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    builder: (_) => _ActionSheet(title: title, body: body, confirm: confirm, danger: danger, run: run),
  );
  return done ?? false;
}

class _ActionSheet extends StatefulWidget {
  const _ActionSheet({required this.title, this.body, required this.confirm, required this.danger, required this.run});

  final String title;
  final String? body;
  final String confirm;
  final bool danger;
  final Future<void> Function(String idempotencyKey) run;

  @override
  State<_ActionSheet> createState() => _ActionSheetState();
}

class _ActionSheetState extends State<_ActionSheet> {
  final _key = ApiClient.newIdempotencyKey();
  bool _busy = false;
  String? _error;

  Future<void> _go() async {
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await widget.run(_key);
      await HapticFeedback.lightImpact();
      if (mounted) Navigator.of(context).pop(true);
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.userMessage(context.l10n));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(Hud.gutter, 0, Hud.gutter, Hud.gutter),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(widget.title, style: text.titleMedium),
            if (widget.body != null) ...[
              const SizedBox(height: 8),
              Text(widget.body!, style: text.bodyMedium?.copyWith(color: c.muted)),
            ],
            if (_error != null) ...[
              const SizedBox(height: 12),
              Text(_error!, style: text.bodyMedium?.copyWith(color: c.toneText(Tone.danger))),
            ],
            const SizedBox(height: 20),
            PrimaryButton(label: widget.confirm, danger: widget.danger, busy: _busy, onPressed: _go),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: _busy ? null : () => Navigator.of(context).pop(false),
              style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(Hud.minTouch)),
              child: Text(context.l10n.back),
            ),
          ],
        ),
      ),
    );
  }
}
