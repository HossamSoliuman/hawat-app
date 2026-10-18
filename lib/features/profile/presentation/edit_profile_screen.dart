import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/auth/auth_repository.dart';
import '../../../core/auth/session.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/actions.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/hud_card.dart';

/// Name and email. The phone is the login, so only the admin changes it.
class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  late final _name = TextEditingController(text: ref.read(currentUserProvider)?.name ?? '');
  late final _email = TextEditingController(text: ref.read(currentUserProvider)?.email ?? '');
  bool _busy = false;
  Map<String, String> _errors = const {};

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final l = context.l10n;
    final email = _email.text.trim();
    setState(() {
      _errors = {
        if (_name.text.trim().isEmpty) 'name': l.nameRequired,
        if (email.isNotEmpty && !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email)) 'email': l.emailInvalid,
      };
    });
    if (_errors.isNotEmpty) return;

    setState(() => _busy = true);
    try {
      final user = await ref.read(authRepositoryProvider).updateProfile(name: _name.text.trim(), email: email);
      await ref.read(sessionProvider.notifier).updateUser(user);
      if (!mounted) return;
      showSnack(context, l.profileSaved);
      context.canPop() ? context.pop() : context.go(Routes.profile);
    } on ValidationException catch (e) {
      setState(() => _errors = {for (final entry in e.errors.entries) entry.key: entry.value.first});
    } on ApiException catch (e) {
      if (mounted) showSnack(context, e.userMessage(l), error: true);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l.editProfile)),
      bottomNavigationBar: PinnedAction(
        child: PrimaryButton(label: l.save, busy: _busy, onPressed: _save),
      ),
      body: ListView(
        padding: const EdgeInsets.all(Hud.gutter),
        children: [
          HudCard(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FieldLabel(
                  label: l.nameLabel,
                  required: true,
                  child: TextField(
                    controller: _name,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(errorText: _errors['name']),
                  ),
                ),
                const SizedBox(height: 14),
                FieldLabel(
                  label: l.emailLabel,
                  child: TextField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.right,
                    onSubmitted: (_) => _save(),
                    decoration: InputDecoration(errorText: _errors['email']),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
