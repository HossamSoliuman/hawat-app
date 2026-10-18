import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/api/api_exception.dart';
import '../../../core/auth/auth_repository.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/actions.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/hud_card.dart';

/// Current password, then the new one twice. Other devices are signed out;
/// this one stays in.
class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  ConsumerState<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  final _current = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();
  bool _busy = false;
  bool _obscure = true;
  Map<String, String> _errors = const {};

  @override
  void dispose() {
    _current.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final l = context.l10n;
    setState(() {
      _errors = {
        if (_current.text.isEmpty) 'current_password': l.passwordRequired,
        if (_password.text.length < 8) 'password': l.passwordMin,
        if (_confirm.text != _password.text) 'password_confirmation': l.passwordsMismatch,
      };
    });
    if (_errors.isNotEmpty) return;

    setState(() => _busy = true);
    try {
      await ref
          .read(authRepositoryProvider)
          .changePassword(current: _current.text, password: _password.text, confirmation: _confirm.text);
      if (!mounted) return;
      showSnack(context, l.passwordChanged);
      context.pop();
    } on ValidationException catch (e) {
      setState(() => _errors = {for (final entry in e.errors.entries) entry.key: entry.value.first});
    } on ApiException catch (e) {
      if (mounted) showSnack(context, e.userMessage(l), error: true);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Widget _field(String label, TextEditingController controller, String key, {TextInputAction action = TextInputAction.next}) {
    final l = context.l10n;
    return FieldLabel(
      label: label,
      child: TextField(
        controller: controller,
        obscureText: _obscure,
        textInputAction: action,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.right,
        onSubmitted: action == TextInputAction.done ? (_) => _save() : null,
        decoration: InputDecoration(
          errorText: _errors[key],
          suffixIcon: IconButton(
            tooltip: _obscure ? l.showPassword : l.hidePassword,
            onPressed: () => setState(() => _obscure = !_obscure),
            icon: Icon(_obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l.changePassword)),
      bottomNavigationBar: PinnedAction(child: PrimaryButton(label: l.save, busy: _busy, onPressed: _save)),
      body: ListView(
        padding: const EdgeInsets.all(Hud.gutter),
        children: [
          HudCard(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _field(l.currentPassword, _current, 'current_password'),
                const SizedBox(height: 14),
                _field(l.newPassword, _password, 'password'),
                const SizedBox(height: 14),
                _field(l.confirmPassword, _confirm, 'password_confirmation', action: TextInputAction.done),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
