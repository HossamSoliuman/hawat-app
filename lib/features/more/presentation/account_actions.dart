import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/auth/session.dart';
import '../../../core/config/app_config_provider.dart';
import '../../../core/env.dart';
import '../../../core/l10n.dart';
import '../../../core/providers.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/actions.dart';
import '../../../core/widgets/hud_card.dart';
import '../../auth/presentation/support_sheet.dart';

/// A tappable row with an icon, in a list card.
class MenuRow extends StatelessWidget {
  const MenuRow({super.key, required this.icon, required this.label, required this.onTap, this.danger = false, this.trailing});

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool danger;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    final color = danger ? c.toneText(Tone.danger) : c.foreground;
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 54),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: c.hair))),
        child: Row(
          children: [
            Icon(icon, size: 22, color: danger ? color : c.muted),
            const SizedBox(width: 14),
            Expanded(child: Text(label, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: color, fontWeight: FontWeight.w600))),
            ?trailing,
            if (!danger) Icon(Icons.chevron_right, color: c.muted),
          ],
        ),
      ),
    );
  }
}

/// Support, terms and privacy (when published), and sign out — shared by the
/// profile and the المزيد hub.
class AccountActions extends ConsumerWidget {
  const AccountActions({super.key, this.includeProfile = false, this.leading = const []});

  final bool includeProfile;
  final List<Widget> leading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final config = ref.watch(appConfigProvider);

    Future<void> open(String url) => launchUrl(Uri.parse(url), mode: LaunchMode.inAppBrowserView);

    return HudCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          ...leading,
          MenuRow(icon: Icons.support_agent, label: l.supportTitle, onTap: () => showSupportSheet(context, ref)),
          if (config.termsUrl != null) MenuRow(icon: Icons.gavel_outlined, label: l.termsTitle, onTap: () => open(config.termsUrl!)),
          if (config.privacyUrl != null)
            MenuRow(icon: Icons.privacy_tip_outlined, label: l.privacyTitle, onTap: () => open(config.privacyUrl!)),
          MenuRow(
            icon: Icons.logout,
            label: l.logout,
            danger: true,
            onTap: () async {
              final ok = await showConfirmSheet(
                context,
                title: l.logoutConfirmTitle,
                body: l.logoutConfirmBody,
                confirm: l.logout,
                danger: true,
              );
              if (ok) await ref.read(sessionProvider.notifier).logout();
            },
          ),
        ],
      ),
    );
  }
}

class AppVersionLabel extends ConsumerWidget {
  const AppVersionLabel({super.key, this.style});

  final TextStyle? style;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final version = ref.watch(appVersionProvider);
    final suffix = Env.isProduction ? '' : ' · ${context.l10n.stagingBadge}';
    return Text('${context.l10n.appVersion(version)}$suffix', style: style);
  }
}
