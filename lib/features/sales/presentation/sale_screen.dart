import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/router.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/format/format.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/actions.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/hud_card.dart';
import '../../../core/widgets/ltr_text.dart';
import '../../../core/widgets/section_head.dart';
import '../../../core/widgets/states.dart';
import '../../../core/widgets/status_chip.dart';
import '../data/sale.dart';
import '../data/sales_providers.dart';
import 'sale_tile.dart';

/// One invoice: who bought, the lines, the totals, what is still due, and the
/// printable A4 invoice (a signed page) to open or share on WhatsApp.
class SaleScreen extends ConsumerWidget {
  const SaleScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final state = ref.watch(saleDetailProvider(id));
    final sale = state.value;

    return Scaffold(
      appBar: AppBar(title: sale == null ? Text(l.invoiceTitle) : LtrText(sale.invoiceNumber)),
      bottomNavigationBar: sale?.invoiceUrl == null ? null : _InvoiceActions(sale: sale!),
      body: state.when(
        loading: () => const Skeleton(child: Padding(padding: EdgeInsets.all(Hud.gutter), child: SkeletonBox(height: 420))),
        error: (e, _) => e is NotFoundException
            ? EmptyState(icon: Icons.search_off, title: l.errorNotFound)
            : ErrorState(error: e, onRetry: () => ref.invalidate(saleDetailProvider(id))),
        data: (sale) => RefreshIndicator(
          onRefresh: () => ref.refresh(saleDetailProvider(id).future),
          child: ListView(
            padding: const EdgeInsets.all(Hud.gutter),
            children: [
              _Header(sale: sale),
              const SizedBox(height: Hud.gap),
              _Lines(sale: sale),
              const SizedBox(height: Hud.gap),
              _Totals(sale: sale),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.sale});

  final Sale sale;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final text = Theme.of(context).textTheme;
    final state = sale.paymentState;
    return HudCard(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(child: Text(sale.customer?.name ?? l.cashCustomer, style: text.titleMedium)),
              StatusChip(label: state.label(l), tone: state.tone),
            ],
          ),
          const SizedBox(height: 6),
          if (sale.soldAt != null) InfoRow(label: l.dateLabel, value: l.when(sale.soldAt!)),
          if (sale.trip != null)
            InfoRow(
              label: l.tripLabel,
              child: InkWell(
                onTap: () => context.push(Routes.trip(sale.trip!.id)),
                child: LtrText(
                  sale.trip!.tripNumber,
                  style: text.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: HawatColors.of(context).primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          InfoRow(label: l.paymentMethodLabel, value: sale.paymentMethod?.name, last: true),
        ],
      ),
    );
  }
}

class _Lines extends StatelessWidget {
  const _Lines({required this.sale});

  final Sale sale;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    return HudCard(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHead(title: l.invoiceLines, icon: Icons.set_meal_outlined),
          for (var i = 0; i < sale.items.length; i++)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                border: i == sale.items.length - 1 ? null : Border(bottom: BorderSide(color: c.hair)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(sale.items[i].species?.name ?? '—', style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w700)),
                        const SizedBox(height: 2),
                        Text(
                          '${l.kg(sale.items[i].weightKg)}  ×  ${l.pricePerKg(Fmt.ltr(Fmt.money(sale.items[i].pricePerKg)))}',
                          style: text.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Text(l.sar(sale.items[i].total), style: text.labelLarge),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _Totals extends StatelessWidget {
  const _Totals({required this.sale});

  final Sale sale;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    return HudCard(
      padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
      child: Column(
        children: [
          InfoRow(label: l.subtotalLabel, value: l.sar(sale.subtotal)),
          if (sale.discount > 0) InfoRow(label: l.discountLabel, value: l.sar(sale.discount)),
          InfoRow(
            label: l.grandTotalLabel,
            child: Text(l.sar(sale.total), style: text.titleMedium),
          ),
          InfoRow(label: l.paidLabel, value: l.sar(sale.paidAmount), last: sale.remaining <= 0),
          if (sale.remaining > 0)
            InfoRow(
              label: l.remainingLabel,
              last: true,
              child: Text(l.sar(sale.remaining), style: text.titleSmall?.copyWith(color: c.toneText(Tone.danger))),
            ),
        ],
      ),
    );
  }
}

class _InvoiceActions extends StatelessWidget {
  const _InvoiceActions({required this.sale});

  final Sale sale;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final url = sale.invoiceUrl!;
    return PinnedAction(
      child: Row(
        children: [
          Expanded(
            child: PrimaryButton(
              label: l.openInvoice,
              icon: Icons.description_outlined,
              onPressed: () async {
                final ok = await launchUrl(Uri.parse(url), mode: LaunchMode.inAppBrowserView);
                if (!ok && context.mounted) showSnack(context, l.errorUnknown, error: true);
              },
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            height: Hud.primaryButtonHeight,
            child: OutlinedButton.icon(
              onPressed: () => SharePlus.instance.share(ShareParams(text: l.shareInvoiceText(sale.invoiceNumber, url))),
              icon: const Icon(Icons.share_outlined),
              label: Text(l.shareInvoice),
            ),
          ),
        ],
      ),
    );
  }
}
