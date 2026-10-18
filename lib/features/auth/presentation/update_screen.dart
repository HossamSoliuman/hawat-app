import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/config/app_config_provider.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/actions.dart';
import 'brand.dart';

/// This version is older than `min_version`: nothing else opens until it is updated.
class UpdateScreen extends ConsumerWidget {
  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final storeUrl = ref.watch(appConfigProvider).storeUrl;

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
                  Icon(Icons.system_update_outlined, size: 40, color: c.primary),
                  const SizedBox(height: 14),
                  Text(l.updateRequiredTitle, style: text.headlineSmall, textAlign: TextAlign.center),
                  const SizedBox(height: 10),
                  Text(l.updateRequiredBody, style: text.bodyLarge?.copyWith(color: c.muted), textAlign: TextAlign.center),
                  const SizedBox(height: 28),
                  if (storeUrl != null)
                    PrimaryButton(
                      label: l.updateNow,
                      onPressed: () => launchUrl(Uri.parse(storeUrl), mode: LaunchMode.externalApplication),
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
