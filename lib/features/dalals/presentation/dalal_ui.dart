import 'package:flutter/material.dart';

import '../../../core/format/format.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/status_chip.dart';
import '../data/dalal.dart';

/// معتمد · بانتظار الرد · مرفوض · بلا اتفاق.
class PartnershipChip extends StatelessWidget {
  const PartnershipChip({super.key, required this.partnership, this.dense = true});

  final Partnership? partnership;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final p = partnership;
    final (label, tone) = switch (p) {
      null => (l.noAgreement, Tone.muted),
      _ when p.isAccepted => (l.agreementAccepted, Tone.success),
      _ when p.isRejected => (l.agreementRejected, Tone.danger),
      _ => (l.agreementPending, Tone.warning),
    };
    return StatusChip(label: label, tone: tone, dense: dense);
  }
}

/// "عمولة 5% · أجور 2%" when agreed, else "بلا اتفاق" (the dalal then takes nothing).
class DalalTermsText extends StatelessWidget {
  const DalalTermsText({super.key, required this.dalal, this.style});

  final Dalal dalal;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final p = dalal.partnership;
    final text = p != null && p.isAccepted
        ? l.agreementTerms(Fmt.pct(p.commissionPct), Fmt.pct(p.wagePct))
        : l.noAgreement;
    return Text(
      text,
      textAlign: TextAlign.end,
      style: style ?? Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
    );
  }
}
