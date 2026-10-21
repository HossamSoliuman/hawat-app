import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/auth/auth_repository.dart';
import '../../../core/auth/session.dart';
import '../../../core/l10n.dart';
import '../../../core/media/avatar_picker.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/actions.dart';
import '../../../core/widgets/avatar.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/hud_card.dart';
import '../../../core/widgets/ltr_text.dart';
import '../../more/presentation/account_actions.dart';

/// الملف الشخصي: photo, name, phone, email; edit, password, support, logout.
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool _uploading = false;

  Future<void> _changePhoto(bool hasPhoto) async {
    final l = context.l10n;
    final choice = await showPhotoChoices(context, hasPhoto: hasPhoto);
    if (choice == null || !mounted) return;

    final auth = ref.read(authRepositoryProvider);
    setState(() => _uploading = true);
    try {
      if (choice == PhotoChoice.remove) {
        await ref.read(sessionProvider.notifier).updateUser(await auth.removeAvatar());
        if (mounted) showSnack(context, l.photoRemoved);
        return;
      }
      final bytes = await pickAvatar(choice);
      if (bytes == null) return;
      await ref.read(sessionProvider.notifier).updateUser(await auth.uploadAvatar(bytes, 'avatar.jpg'));
      if (mounted) showSnack(context, l.photoUpdated);
    } on ValidationException catch (e) {
      if (mounted) showSnack(context, e.fieldError('avatar') ?? e.userMessage(l), error: true);
    } on ApiException catch (e) {
      if (mounted) showSnack(context, e.userMessage(l), error: true);
    } finally {
      if (mounted) setState(() => _uploading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final user = ref.watch(currentUserProvider);
    if (user == null) return const Scaffold();

    return Scaffold(
      appBar: AppBar(title: Text(l.profileTitle)),
      body: ListView(
        padding: const EdgeInsets.all(Hud.gutter),
        children: [
          HudCard(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                InkWell(
                  onTap: _uploading ? null : () => _changePhoto(user.avatarUrl != null),
                  child: Stack(
                    children: [
                      HudAvatar(name: user.name, url: user.avatarUrl, size: 72),
                      PositionedDirectional(
                        bottom: 0,
                        end: 0,
                        child: Container(
                          width: 26,
                          height: 26,
                          color: c.foreground,
                          alignment: Alignment.center,
                          child: _uploading
                              ? SizedBox.square(
                                  dimension: 14,
                                  child: CircularProgressIndicator(strokeWidth: 2, color: c.background),
                                )
                              : Icon(Icons.photo_camera_outlined, size: 15, color: c.background),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(child: Text(user.name, style: text.titleLarge)),
              ],
            ),
          ),
          const SizedBox(height: Hud.gap),
          HudCard(
            padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
            child: Column(
              children: [
                InfoRow(
                  label: l.phoneLabel,
                  child: LtrText(user.phone, style: text.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
                ),
                InfoRow(label: l.emailLabel, value: user.email, last: true),
              ],
            ),
          ),
          const SizedBox(height: Hud.gap),
          HudCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                MenuRow(icon: Icons.edit_outlined, label: l.editProfile, onTap: () => context.push(Routes.editProfile)),
                MenuRow(
                  icon: Icons.lock_outline,
                  label: l.changePassword,
                  onTap: () => context.push(Routes.changePassword),
                ),
              ],
            ),
          ),
          const SizedBox(height: Hud.gap),
          const AccountActions(),
          const SizedBox(height: Hud.gutter),
          Center(child: AppVersionLabel(style: text.bodySmall)),
        ],
      ),
    );
  }
}
