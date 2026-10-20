import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/api/api_client.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/format/format.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/actions.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/hud_card.dart';
import '../../../core/widgets/ltr_text.dart';
import '../../../core/widgets/states.dart';
import '../../sales/data/selling_actions.dart';
import '../data/dalal.dart';
import '../data/dalals_repository.dart';
import 'dalal_ui.dart';

/// الدلالون: every active dalal and where the owner stands with each. A tap
/// shows the terms, and proposes a commission unless one is already agreed.
class DalalsScreen extends ConsumerStatefulWidget {
  const DalalsScreen({super.key});

  @override
  ConsumerState<DalalsScreen> createState() => _DalalsScreenState();
}

class _DalalsScreenState extends ConsumerState<DalalsScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final state = ref.watch(dalalsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l.dalalsTitle),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(Hud.gutter, 4, Hud.gutter, 12),
            child: SizedBox(
              height: 48,
              child: TextField(
                onChanged: (value) => setState(() => _query = value.trim()),
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: l.searchDalals,
                  prefixIcon: const Icon(Icons.search),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                ),
              ),
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(dalalsProvider.future),
        child: state.when(
          skipLoadingOnReload: true,
          loading: () => const Skeleton(
            child: Padding(padding: EdgeInsets.all(Hud.gutter), child: SkeletonBox(height: 300)),
          ),
          error: (e, _) => ListView(
            children: [ErrorState(error: e, onRetry: () => ref.invalidate(dalalsProvider))],
          ),
          data: (dalals) {
            final shown = _query.isEmpty ? dalals : dalals.where((d) => d.name.contains(_query)).toList();
            if (shown.isEmpty) {
              return ListView(
                children: [
                  EmptyState(icon: Icons.storefront_outlined, title: _query.isEmpty ? l.noDalals : l.noResults),
                ],
              );
            }
            return ListView(
              padding: const EdgeInsets.all(Hud.gutter),
              children: [
                HudCard(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                  child: Column(
                    children: [
                      for (var i = 0; i < shown.length; i++)
                        _DalalTile(
                          dalal: shown[i],
                          last: i == shown.length - 1,
                          onTap: () => showModalBottomSheet<void>(
                            context: context,
                            isScrollControlled: true,
                            builder: (_) => _DalalSheet(dalal: shown[i]),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _DalalTile extends StatelessWidget {
  const _DalalTile({required this.dalal, required this.last, required this.onTap});

  final Dalal dalal;
  final bool last;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: last ? null : Border(bottom: BorderSide(color: c.hair)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dalal.name, style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w700)),
                  if (dalal.hasAgreement) ...[
                    const SizedBox(height: 3),
                    DalalTermsText(dalal: dalal, style: text.bodySmall),
                  ] else if (dalal.phone != null) ...[
                    const SizedBox(height: 3),
                    LtrText(dalal.phone!, style: text.bodySmall),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 10),
            PartnershipChip(partnership: dalal.partnership),
          ],
        ),
      ),
    );
  }
}

/// The dalal, their phone, the terms, and a request unless already agreed.
class _DalalSheet extends ConsumerStatefulWidget {
  const _DalalSheet({required this.dalal});

  final Dalal dalal;

  @override
  ConsumerState<_DalalSheet> createState() => _DalalSheetState();
}

class _DalalSheetState extends ConsumerState<_DalalSheet> {
  late final _commission = TextEditingController(text: _initial((p) => p.commissionPct));
  late final _wage = TextEditingController(text: _initial((p) => p.wagePct));
  late final _message = TextEditingController(text: widget.dalal.partnership?.message ?? '');
  final _key = ApiClient.newIdempotencyKey();
  bool _busy = false;
  String? _commissionError;
  String? _wageError;
  String? _error;

  String _initial(double Function(Partnership) pick) {
    final p = widget.dalal.partnership;
    return p == null ? '' : Fmt.plain(pick(p));
  }

  @override
  void dispose() {
    _commission.dispose();
    _wage.dispose();
    _message.dispose();
    super.dispose();
  }

  String? _pctError(String text, {required bool required}) {
    final l = context.l10n;
    if (text.isEmpty) return required ? l.commissionRequired : null;
    final value = double.tryParse(text);
    return value == null || value < 0 || value > 100 ? l.pctInvalid : null;
  }

  Future<void> _send() async {
    if (_busy) return;
    final l = context.l10n;
    setState(() {
      _commissionError = _pctError(_commission.text, required: true);
      _wageError = _pctError(_wage.text, required: false);
      _error = null;
    });
    if (_commissionError != null || _wageError != null) return;

    setState(() => _busy = true);
    try {
      await ref
          .read(sellingActionsProvider)
          .propose(
            widget.dalal.id,
            commissionPct: double.parse(_commission.text),
            wagePct: _wage.text.isEmpty ? null : double.parse(_wage.text),
            message: _message.text,
            idempotencyKey: _key,
          );
      unawaited(HapticFeedback.lightImpact());
      if (!mounted) return;
      Navigator.of(context).pop();
      showSnack(context, l.requestSent);
    } on ValidationException catch (e) {
      setState(() {
        _commissionError = e.fieldError('commission_pct');
        _wageError = e.fieldError('wage_pct');
        _error = e.outside(const ['commission_pct', 'wage_pct']);
      });
    } on ApiException catch (e) {
      setState(() => _error = e.userMessage(l));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final dalal = widget.dalal;
    final p = dalal.partnership;
    final phone = dalal.phone;
    final showReason = p != null && p.isRejected && (p.responseNote?.isNotEmpty ?? false);

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(Hud.gutter, 0, Hud.gutter, Hud.gutter + MediaQuery.viewInsetsOf(context).bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(child: Text(dalal.name, style: text.titleMedium)),
                PartnershipChip(partnership: p, dense: false),
              ],
            ),
            const SizedBox(height: 8),
            if (phone != null && phone.isNotEmpty)
              InfoRow(
                label: l.phoneLabel,
                child: InkWell(
                  onTap: () => launchUrl(Uri(scheme: 'tel', path: phone)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LtrText(
                        phone,
                        style: text.bodyMedium?.copyWith(fontWeight: FontWeight.w700, color: c.primary),
                      ),
                      const SizedBox(width: 6),
                      Icon(Icons.call_outlined, size: 18, color: c.primary),
                    ],
                  ),
                ),
              ),
            InfoRow(
              label: l.agreementLabel,
              last: !showReason,
              child: DalalTermsText(dalal: dalal),
            ),
            if (showReason) InfoRow(label: l.rejectReasonLabel, value: p.responseNote, last: true),
            if (p == null || !p.isAccepted) ...[
              const SizedBox(height: 14),
              Text(l.proposalTitle, style: text.titleSmall),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: FieldLabel(
                      label: l.commissionLabel,
                      required: true,
                      child: _PctField(controller: _commission, error: _commissionError),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: FieldLabel(
                      label: l.wageLabel,
                      child: _PctField(controller: _wage, error: _wageError),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              FieldLabel(
                label: l.messageLabel,
                child: TextField(
                  controller: _message,
                  minLines: 2,
                  maxLines: 4,
                  maxLength: 1000,
                  decoration: const InputDecoration(counterText: ''),
                ),
              ),
              if (_error != null) ...[
                const SizedBox(height: 4),
                Text(_error!, style: text.bodyMedium?.copyWith(color: c.toneText(Tone.danger))),
              ],
              const SizedBox(height: 12),
              PrimaryButton(
                label: switch (p) {
                  null => l.sendRequest,
                  _ when p.isRejected => l.resendRequest,
                  _ => l.updateRequest,
                },
                icon: Icons.send_outlined,
                busy: _busy,
                onPressed: _send,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _PctField extends StatelessWidget {
  const _PctField({required this.controller, this.error});

  final TextEditingController controller;
  final String? error;

  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    keyboardType: const TextInputType.numberWithOptions(decimal: true),
    textDirection: TextDirection.ltr,
    textAlign: TextAlign.right,
    inputFormatters: [DecimalInputFormatter()],
    decoration: InputDecoration(errorText: error, errorMaxLines: 2, suffixText: '%'),
  );
}
