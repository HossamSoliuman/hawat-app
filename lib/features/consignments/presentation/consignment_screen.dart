import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/router.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/hud_card.dart';
import '../../../core/widgets/ltr_text.dart';
import '../../../core/widgets/section_head.dart';
import '../../../core/widgets/states.dart';
import '../../../core/widgets/status_chip.dart';
import '../data/consignment.dart';
import '../data/consignments_repository.dart';

/// One consignment: the dalal (a tap to call), its trip, the kg of each species.
class ConsignmentScreen extends ConsumerWidget {
  const ConsignmentScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final state = ref.watch(consignmentDetailProvider(id));
    final consignment = state.value;

    return Scaffold(
      appBar: AppBar(title: consignment == null ? Text(l.consignmentsTitle) : LtrText(consignment.consignmentNumber)),
      body: state.when(
        loading: () => const Skeleton(
          child: Padding(padding: EdgeInsets.all(Hud.gutter), child: SkeletonBox(height: 360)),
        ),
        error: (e, _) => e is NotFoundException
            ? EmptyState(icon: Icons.search_off, title: l.errorNotFound)
            : ErrorState(error: e, onRetry: () => ref.invalidate(consignmentDetailProvider(id))),
        data: (consignment) => RefreshIndicator(
          onRefresh: () => ref.refresh(consignmentDetailProvider(id).future),
          child: ListView(
            padding: const EdgeInsets.all(Hud.gutter),
            children: [
              _Header(consignment: consignment),
              const SizedBox(height: Hud.gap),
              _Lines(consignment: consignment),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.consignment});

  final Consignment consignment;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final phone = consignment.dalal?.phone;

    return HudCard(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(child: Text(consignment.dalal?.name ?? '—', style: text.titleMedium)),
              if (consignment.status != null) StatusChip(label: consignment.status!, tone: Tone.info),
            ],
          ),
          const SizedBox(height: 6),
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
          if (consignment.trip != null)
            InfoRow(
              label: l.tripLabel,
              child: InkWell(
                onTap: () => context.push(Routes.trip(consignment.trip!.id)),
                child: LtrText(
                  consignment.trip!.tripNumber,
                  style: text.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: c.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          if (consignment.sentAt != null) InfoRow(label: l.dateLabel, value: l.when(consignment.sentAt!)),
          if (consignment.notes?.trim().isNotEmpty ?? false) InfoRow(label: l.fieldNotes, value: consignment.notes),
          InfoRow(
            label: l.totalLabel,
            last: true,
            child: Text(l.kg(consignment.totalKg), style: text.titleMedium),
          ),
        ],
      ),
    );
  }
}

class _Lines extends StatelessWidget {
  const _Lines({required this.consignment});

  final Consignment consignment;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final text = Theme.of(context).textTheme;
    final items = consignment.items;
    return HudCard(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHead(title: l.invoiceLines, icon: Icons.set_meal_outlined),
          for (var i = 0; i < items.length; i++)
            InfoRow(
              label: items[i].species?.name ?? '—',
              last: i == items.length - 1,
              child: Text(l.kg(items[i].weightKg), style: text.bodyMedium?.copyWith(fontWeight: FontWeight.w700)),
            ),
        ],
      ),
    );
  }
}
