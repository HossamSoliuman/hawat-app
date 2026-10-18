import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/config/app_config_provider.dart';
import '../../../core/format/format.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/actions.dart';

/// Call or WhatsApp the support line (numbers from `GET /app/config`).
/// [forgotPassword] words it for the login's "نسيت كلمة المرور؟": until SMS
/// exists, support resets the password from the admin panel.
Future<void> showSupportSheet(BuildContext context, WidgetRef ref, {bool forgotPassword = false}) {
  final config = ref.read(appConfigProvider);
  return showModalBottomSheet<void>(
    context: context,
    builder: (context) {
      final l = context.l10n;
      final c = HawatColors.of(context);
      final text = Theme.of(context).textTheme;
      final phone = config.supportPhone;
      final whatsapp = config.supportWhatsapp;

      Future<void> open(Uri uri) async {
        final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
        if (!ok && context.mounted) showSnack(context, l.errorUnknown, error: true);
      }

      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(Hud.gutter, 0, Hud.gutter, Hud.gutter),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(forgotPassword ? l.forgotTitle : l.supportTitle, style: text.titleMedium),
              const SizedBox(height: 8),
              Text(
                forgotPassword ? l.forgotBody : l.supportBody,
                style: text.bodyMedium?.copyWith(color: c.muted),
              ),
              const SizedBox(height: 20),
              if (phone != null)
                FilledButton.icon(
                  onPressed: () => open(Uri(scheme: 'tel', path: phone)),
                  style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(Hud.primaryButtonHeight)),
                  icon: const Icon(Icons.call_outlined),
                  label: Text('${l.callSupport}  ${Fmt.ltr(phone)}'),
                ),
              if (whatsapp != null) ...[
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: () => open(Uri.parse('https://wa.me/$whatsapp')),
                  style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(Hud.primaryButtonHeight)),
                  icon: const Icon(Icons.chat_outlined),
                  label: Text(l.whatsappSupport),
                ),
              ],
            ],
          ),
        ),
      );
    },
  );
}
