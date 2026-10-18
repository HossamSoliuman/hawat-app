import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/api/api_exception.dart';
import '../../../core/auth/session.dart';
import '../../../core/config/app_config_provider.dart';
import '../../../core/format/format.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/actions.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/hud_card.dart';
import 'brand.dart';
import 'support_sheet.dart';

/// Phone and password, one button. No onboarding, no sign-up form: new
/// owners request an account from the landing page.
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _phone = TextEditingController();
  final _password = TextEditingController();
  final _passwordFocus = FocusNode();
  bool _obscure = true;
  bool _busy = false;
  String? _phoneError;
  String? _passwordError;
  String? _formError;

  @override
  void dispose() {
    _phone.dispose();
    _password.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final l = context.l10n;
    final phone = Phone.normalize(_phone.text);
    setState(() {
      _phoneError = phone.isEmpty ? l.phoneRequired : (Phone.isValid(phone) ? null : l.phoneInvalid);
      _passwordError = _password.text.isEmpty ? l.passwordRequired : null;
      _formError = null;
    });
    if (_phoneError != null || _passwordError != null) return;

    FocusScope.of(context).unfocus();
    setState(() => _busy = true);
    try {
      await ref.read(sessionProvider.notifier).login(phone: phone, password: _password.text);
      unawaited(HapticFeedback.lightImpact());
    } on ValidationException catch (e) {
      setState(() {
        _phoneError = e.fieldError('phone');
        _passwordError = e.fieldError('password');
        if (_phoneError == null && _passwordError == null) _formError = e.userMessage(l);
      });
    } on ApiException catch (e) {
      setState(() => _formError = e.userMessage(l));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _requestAccount() async {
    final url = ref.read(appConfigProvider).joinUrl;
    if (url == null) return;
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final expired = switch (ref.watch(sessionProvider)) {
      SignedOut(:final expired) => expired,
      _ => false,
    };
    final notice = _formError ?? (expired ? l.sessionExpired : null);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: Hud.gutter, vertical: 24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: AutofillGroup(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Center(child: BrandLogo(height: 56)),
                    const SizedBox(height: 10),
                    const Center(child: EnvironmentBadge()),
                    const SizedBox(height: 22),
                    HudCard(
                      padding: const EdgeInsets.fromLTRB(18, 20, 18, 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(l.loginTitle, style: text.headlineSmall),
                          const SizedBox(height: 18),
                          if (notice != null) ...[_Notice(message: notice), const SizedBox(height: 14)],
                          FieldLabel(
                            label: l.phoneLabel,
                            child: TextField(
                              controller: _phone,
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.right,
                              autofillHints: const [AutofillHints.telephoneNumber, AutofillHints.username],
                              inputFormatters: [PhoneInputFormatter()],
                              onSubmitted: (_) => _passwordFocus.requestFocus(),
                              onChanged: (_) => _phoneError == null ? null : setState(() => _phoneError = null),
                              decoration: InputDecoration(
                                hintText: l.phoneHint,
                                hintTextDirection: TextDirection.ltr,
                                errorText: _phoneError,
                                prefixIcon: const Icon(Icons.phone_iphone),
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          FieldLabel(
                            label: l.passwordLabel,
                            child: TextField(
                              controller: _password,
                              focusNode: _passwordFocus,
                              obscureText: _obscure,
                              textInputAction: TextInputAction.done,
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.right,
                              autofillHints: const [AutofillHints.password],
                              onSubmitted: (_) => _submit(),
                              onChanged: (_) => _passwordError == null ? null : setState(() => _passwordError = null),
                              decoration: InputDecoration(
                                errorText: _passwordError,
                                prefixIcon: const Icon(Icons.lock_outline),
                                suffixIcon: IconButton(
                                  tooltip: _obscure ? l.showPassword : l.hidePassword,
                                  onPressed: () => setState(() => _obscure = !_obscure),
                                  icon: Icon(_obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: TextButton(
                              onPressed: () => showSupportSheet(context, ref, forgotPassword: true),
                              child: Text(l.forgotPassword),
                            ),
                          ),
                          const SizedBox(height: 6),
                          PrimaryButton(label: l.loginButton, busy: _busy, onPressed: _submit),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(l.noAccount, style: text.bodyMedium?.copyWith(color: c.muted)),
                        TextButton(onPressed: _requestAccount, child: Text(l.requestAccount)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Notice extends StatelessWidget {
  const _Notice({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: c.danger.withValues(alpha: .07),
        border: Border.all(color: c.danger.withValues(alpha: .35)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.error_outline, size: 18, color: c.toneText(Tone.danger)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: c.toneText(Tone.danger)),
            ),
          ),
        ],
      ),
    );
  }
}
