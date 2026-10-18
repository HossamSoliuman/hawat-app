import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../l10n.dart';
import '../theme/tokens.dart';

/// The primary action pinned at the bottom of a screen, in the thumb zone.
class PinnedAction extends StatelessWidget {
  const PinnedAction({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: c.background,
        border: Border(top: BorderSide(color: c.hair)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(padding: const EdgeInsets.fromLTRB(Hud.gutter, 10, Hud.gutter, 10), child: child),
      ),
    );
  }
}

/// A full-width 52dp button that shows a spinner while [busy].
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.busy = false,
    this.icon,
    this.danger = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool busy;
  final IconData? icon;
  final bool danger;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    final style = FilledButton.styleFrom(
      minimumSize: const Size.fromHeight(Hud.primaryButtonHeight),
      backgroundColor: danger ? c.danger : null,
      foregroundColor: danger ? Colors.white : null,
    );
    final child = busy
        ? SizedBox.square(
            dimension: 22,
            child: CircularProgressIndicator(strokeWidth: 2.4, color: danger ? Colors.white : c.onPrimary),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[Icon(icon, size: 20), const SizedBox(width: 8)],
              Flexible(child: Text(label, overflow: TextOverflow.ellipsis)),
            ],
          );
    return FilledButton(
      onPressed: busy ? () {} : onPressed,
      style: style,
      child: AnimatedSwitcher(duration: Hud.fast, child: child),
    );
  }
}

/// A yes/no question in a bottom sheet. Resolves true only on confirm.
Future<bool> showConfirmSheet(
  BuildContext context, {
  required String title,
  String? body,
  required String confirm,
  bool danger = false,
}) async {
  final result = await showModalBottomSheet<bool>(
    context: context,
    builder: (context) {
      final text = Theme.of(context).textTheme;
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(Hud.gutter, 0, Hud.gutter, Hud.gutter),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(title, style: text.titleMedium),
              if (body != null) ...[
                const SizedBox(height: 8),
                Text(body, style: text.bodyMedium?.copyWith(color: HawatColors.of(context).muted)),
              ],
              const SizedBox(height: 20),
              PrimaryButton(
                label: confirm,
                danger: danger,
                onPressed: () {
                  HapticFeedback.lightImpact();
                  Navigator.of(context).pop(true);
                },
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: () => Navigator.of(context).pop(false),
                style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(Hud.minTouch)),
                child: Text(context.l10n.back),
              ),
            ],
          ),
        ),
      );
    },
  );
  return result ?? false;
}

/// A short message at the bottom of the screen.
void showSnack(BuildContext context, String message, {bool error = false}) {
  final c = HawatColors.of(context);
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              error ? Icons.error_outline : Icons.check_circle_outline,
              size: 20,
              color: error ? c.danger : c.success,
            ),
            const SizedBox(width: 10),
            Expanded(child: Text(message)),
          ],
        ),
      ),
    );
}
