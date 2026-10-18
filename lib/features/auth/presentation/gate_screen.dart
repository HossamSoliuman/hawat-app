import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/session.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/actions.dart';
import 'brand.dart';

/// Signed in with a role this version doesn't serve yet (dalal, counter…).
class GateScreen extends ConsumerWidget {
  const GateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final role = ref.watch(currentUserProvider)?.role?.name ?? '';

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(child: BrandLogo(height: 52)),
                  const SizedBox(height: 32),
                  Text(l.gateTitle, style: text.headlineSmall, textAlign: TextAlign.center),
                  const SizedBox(height: 10),
                  Text(
                    l.gateBody(role),
                    style: text.bodyLarge?.copyWith(color: c.muted),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 28),
                  PrimaryButton(
                    label: l.logout,
                    icon: Icons.logout,
                    onPressed: () => ref.read(sessionProvider.notifier).logout(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
