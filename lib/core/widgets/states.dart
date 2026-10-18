import 'package:flutter/material.dart';

import '../api/api_exception.dart';
import '../l10n.dart';
import '../theme/tokens.dart';

/// Nothing to show: an icon, one line, and an optional action.
class EmptyState extends StatelessWidget {
  const EmptyState({super.key, required this.icon, required this.title, this.action, this.onAction, this.compact = false});

  final IconData icon;
  final String title;
  final String? action;
  final VoidCallback? onAction;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: compact ? 20 : 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: compact ? 28 : 36, color: c.muted.withValues(alpha: .7)),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: c.muted, fontWeight: FontWeight.w600),
          ),
          if (action != null) ...[
            const SizedBox(height: 14),
            OutlinedButton(onPressed: onAction, child: Text(action!)),
          ],
        ],
      ),
    );
  }
}

/// A failed load: what went wrong, and a retry.
class ErrorState extends StatelessWidget {
  const ErrorState({super.key, required this.error, required this.onRetry, this.compact = false});

  final Object error;
  final VoidCallback onRetry;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    final l = context.l10n;
    final message = error is ApiException ? (error as ApiException).userMessage(l) : l.errorUnknown;
    final offline = error is NetworkException;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: compact ? 20 : 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(offline ? Icons.cloud_off_outlined : Icons.error_outline, size: compact ? 28 : 36, color: c.muted),
          const SizedBox(height: 10),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: c.foreground),
          ),
          const SizedBox(height: 14),
          OutlinedButton.icon(onPressed: onRetry, icon: const Icon(Icons.refresh, size: 18), label: Text(l.retry)),
        ],
      ),
    );
  }
}

/// Shown above a screen that is showing its saved copy because the refresh failed.
class OfflineBanner extends StatelessWidget {
  const OfflineBanner({super.key, this.savedAt, this.onRetry});

  final DateTime? savedAt;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    final l = context.l10n;
    final text = savedAt == null ? l.offlineSaved : l.offlineSavedAt(l.when(savedAt!));
    return Material(
      color: Color.alphaBlend(c.warning.withValues(alpha: .12), c.background),
      child: InkWell(
        onTap: onRetry,
        child: Container(
          constraints: const BoxConstraints(minHeight: 40),
          padding: const EdgeInsets.symmetric(horizontal: Hud.gutter, vertical: 8),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: c.warning.withValues(alpha: .35)))),
          child: Row(
            children: [
              Icon(Icons.cloud_off_outlined, size: 18, color: c.toneText(Tone.warning)),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(color: c.toneText(Tone.warning)),
                ),
              ),
              if (onRetry != null) Icon(Icons.refresh, size: 18, color: c.toneText(Tone.warning)),
            ],
          ),
        ),
      ),
    );
  }
}

/// A pulsing placeholder while the first load runs; never a full-screen spinner.
class Skeleton extends StatefulWidget {
  const Skeleton({super.key, required this.child});

  final Widget child;

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
    opacity: Tween<double>(begin: .45, end: 1).animate(_controller),
    child: ExcludeSemantics(child: widget.child),
  );
}

class SkeletonBox extends StatelessWidget {
  const SkeletonBox({super.key, this.width, required this.height});

  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) =>
      Container(width: width, height: height, color: HawatColors.of(context).mutedSurface);
}

/// The footer of an infinite list: a spinner while the next page loads, or a retry.
class LoadMoreFooter extends StatelessWidget {
  const LoadMoreFooter({super.key, required this.loading, this.error, required this.onRetry});

  final bool loading;
  final Object? error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Padding(
        padding: EdgeInsets.all(20),
        child: Center(child: SizedBox.square(dimension: 22, child: CircularProgressIndicator(strokeWidth: 2))),
      );
    }
    if (error != null) {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: TextButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh, size: 18),
            label: Text(context.l10n.loadMoreFailed),
          ),
        ),
      );
    }
    return const SizedBox(height: 24);
  }
}
