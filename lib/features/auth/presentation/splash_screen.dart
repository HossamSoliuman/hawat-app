import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/session.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import 'brand.dart';

/// The logo while the saved session and the app config are read. Only stays
/// on screen when the very first launch can't reach the server.
class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider);
    final c = HawatColors.of(context);
    final l = context.l10n;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const BrandLogo(height: 64),
                const SizedBox(height: 32),
                if (session case SessionRestoreFailed(:final error)) ...[
                  Text(l.startupFailedTitle, style: text.titleMedium, textAlign: TextAlign.center),
                  const SizedBox(height: 8),
                  Text(error.userMessage(l), style: text.bodyMedium?.copyWith(color: c.muted), textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                  OutlinedButton.icon(
                    onPressed: () => ref.read(sessionProvider.notifier).restore(),
                    icon: const Icon(Icons.refresh, size: 18),
                    label: Text(l.retry),
                  ),
                ] else
                  const SizedBox(width: 120, child: LinearProgressIndicator(minHeight: 2)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
