import 'package:flutter/material.dart';

import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/ltr_text.dart';
import '../../../core/widgets/status_chip.dart';
import '../data/sale.dart';

extension PaymentStateUi on PaymentState {
  String label(AppLocalizations l) => switch (this) {
    PaymentState.paid => l.payPaid,
    PaymentState.partial => l.payPartial,
    PaymentState.unpaid => l.payUnpaid,
  };

  Tone get tone => switch (this) {
    PaymentState.paid => Tone.success,
    PaymentState.partial => Tone.warning,
    PaymentState.unpaid => Tone.danger,
  };
}

/// An invoice row: number and customer, total and whether it is collected.
class SaleTile extends StatelessWidget {
  const SaleTile({super.key, required this.sale, required this.onTap, this.showDate = false, this.last = false});

  final Sale sale;
  final VoidCallback onTap;
  final bool showDate;
  final bool last;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final state = sale.paymentState;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 11),
        decoration: BoxDecoration(border: last ? null : Border(bottom: BorderSide(color: c.hair))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sale.customer?.name ?? l.cashCustomer,
                    style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      LtrText(sale.invoiceNumber, style: text.bodySmall),
                      if (showDate && sale.soldAt != null) ...[
                        Text('  ·  ', style: text.bodySmall),
                        Flexible(child: Text(l.when(sale.soldAt!), style: text.bodySmall, overflow: TextOverflow.ellipsis)),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(l.sar(sale.total), style: text.labelLarge),
                const SizedBox(height: 5),
                StatusChip(label: state.label(l), tone: state.tone, dense: true),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
