import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
import '../../../core/widgets/step_progress.dart';
import '../../sales/presentation/sale_tile.dart';
import '../data/trip.dart';
import '../data/trips_providers.dart';
import 'trip_actions_ui.dart';
import 'trip_ui.dart';

/// One trip: where it stands, its details, its catch, what is left to sell,
/// and the single next action pinned at the bottom.
class TripScreen extends ConsumerWidget {
  const TripScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final provider = tripDetailProvider(id);
    final state = ref.watch(provider);
    final trip = state.value;

    return Scaffold(
      appBar: AppBar(
        title: trip == null ? null : LtrText(trip.tripNumber),
        actions: [if (trip != null && (trip.canEdit || trip.canCancel)) _TripMenu(trip: trip)],
      ),
      bottomNavigationBar: trip == null ? null : _NextAction(trip: trip),
      body: state.when(
        skipLoadingOnReload: true,
        loading: () => const _TripSkeleton(),
        error: (error, _) => error is NotFoundException
            ? EmptyState(icon: Icons.search_off, title: l.errorNotFound)
            : ErrorState(error: error, onRetry: () => ref.invalidate(provider)),
        data: (trip) => RefreshIndicator(
          onRefresh: () => ref.refresh(provider.future),
          child: ListView(
            padding: const EdgeInsets.all(Hud.gutter),
            children: [
              _StatusCard(trip: trip),
              const SizedBox(height: Hud.gap),
              _InfoCard(trip: trip),
              const SizedBox(height: Hud.gap),
              _CatchCard(trip: trip),
              if (trip.availableLines.isNotEmpty && trip.phase == TripPhase.forSale) ...[
                const SizedBox(height: Hud.gap),
                _AvailableCard(trip: trip),
              ],
              if (trip.saleStatus != TripStatus.saleNotStarted) ...[
                const SizedBox(height: Hud.gap),
                _TripSalesCard(tripId: trip.id),
              ],
              const SizedBox(height: Hud.gutter),
            ],
          ),
        ),
      ),
    );
  }
}

class _TripMenu extends ConsumerWidget {
  const _TripMenu({required this.trip});

  final Trip trip;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    return PopupMenuButton<String>(
      tooltip: l.tripActionsMenu,
      icon: const Icon(Icons.more_vert),
      onSelected: (value) {
        if (value == 'edit') context.push(Routes.editTrip(trip.id));
        if (value == 'cancel') cancelTripFlow(context, ref, trip);
      },
      itemBuilder: (_) => [
        if (trip.canEdit)
          PopupMenuItem(
            value: 'edit',
            child: Row(
              children: [const Icon(Icons.edit_outlined, size: 20), const SizedBox(width: 12), Text(l.menuEditTrip)],
            ),
          ),
        if (trip.canCancel)
          PopupMenuItem(
            value: 'cancel',
            child: Row(
              children: [
                Icon(Icons.cancel_outlined, size: 20, color: c.danger),
                const SizedBox(width: 12),
                Text(l.menuCancelTrip, style: TextStyle(color: c.toneText(Tone.danger))),
              ],
            ),
          ),
      ],
    );
  }
}

class _StatusCard extends StatelessWidget {
  const _StatusCard({required this.trip});

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final phase = trip.phase;

    return HudCard(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(child: Text(boatAndCaptain(trip), style: text.titleMedium, maxLines: 2)),
              const SizedBox(width: 8),
              TripPhaseChip(trip: trip),
            ],
          ),
          const SizedBox(height: 18),
          StepProgress(
            labels: tripStepLabels(l),
            current: phase.step,
            allDone: phase.isFinished,
            dimmed: phase == TripPhase.cancelled,
          ),
          if (phase == TripPhase.cancelled && trip.cancelReason != null) ...[
            const SizedBox(height: 14),
            Text(
              '${l.cancelReasonLabel}: ${trip.cancelReason}',
              style: text.bodyMedium?.copyWith(color: c.toneText(Tone.danger), fontWeight: FontWeight.w600),
            ),
          ],
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.trip});

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final rows = <(String, String?, Widget?)>[
      (l.fieldBoat, [trip.boat?.name, trip.boat?.boatNumber].whereType<String>().join(' · '), null),
      (l.fieldCaptain, null, _Captain(trip: trip)),
      (l.fieldDeparturePort, trip.departurePort?.name, null),
      (l.fieldReturnPort, trip.returnPort?.name ?? trip.departurePort?.name, null),
      (l.fieldTripType, trip.tripType?.name, null),
      (l.fieldGear, trip.gearType, null),
      (l.fieldLicense, trip.licenseNumber == null ? null : Fmt.ltr(trip.licenseNumber!), null),
      (l.fieldCrewCount, Fmt.count(trip.crewCount), null),
      (l.fieldPlannedDuration, trip.plannedDays == null ? null : l.daysCount(trip.plannedDays!), null),
      if (trip.startedAt == null)
        (l.fieldDepartureTime, trip.departureTime == null ? l.notSet : l.when(trip.departureTime!), null),
      if (trip.startedAt != null) (l.fieldStartedAt, l.when(trip.startedAt!), null),
      if (trip.returnTime != null) (l.fieldReturnedAt, l.when(trip.returnTime!), null),
      if (trip.durationHours != null) (l.fieldDuration, l.hoursValue(Fmt.ltr(Fmt.kg(trip.durationHours!))), null),
      if (trip.counter?.name != null) (l.fieldCounter, trip.counter!.name, null),
      if (trip.notes?.trim().isNotEmpty ?? false) (l.fieldNotes, trip.notes, null),
    ];

    return HudCard(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHead(title: l.sectionTripInfo, icon: Icons.assignment_outlined),
          const SizedBox(height: 4),
          for (var i = 0; i < rows.length; i++)
            InfoRow(label: rows[i].$1, value: rows[i].$2, last: i == rows.length - 1, child: rows[i].$3),
        ],
      ),
    );
  }
}

class _Captain extends StatelessWidget {
  const _Captain({required this.trip});

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final name = trip.captain?.name;
    final phone = trip.captain?.phone;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            name ?? '—',
            textAlign: TextAlign.end,
            style: text.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        if (phone != null && phone.isNotEmpty)
          SizedBox(
            width: 36,
            height: 28,
            child: IconButton(
              padding: EdgeInsets.zero,
              iconSize: 18,
              tooltip: phone,
              onPressed: () => launchUrl(Uri(scheme: 'tel', path: phone)),
              icon: Icon(Icons.call_outlined, color: HawatColors.of(context).primary),
            ),
          ),
      ],
    );
  }
}

class _CatchCard extends StatelessWidget {
  const _CatchCard({required this.trip});

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final records = trip.catchRecords;
    final head = text.labelSmall?.copyWith(color: c.muted);
    final counted = records.any((r) => r.countedKg != null);

    Widget cell(String value, {TextStyle? style, int flex = 2, bool end = true}) => Expanded(
      flex: flex,
      child: Text(value, textAlign: end ? TextAlign.end : TextAlign.start, style: style),
    );

    return HudCard(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHead(title: l.sectionCatch, icon: Icons.set_meal_outlined),
          if (records.isEmpty && trip.captainInputKg == null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Text(l.noCatchYet, style: text.bodyMedium?.copyWith(color: c.muted)),
            )
          else if (records.isEmpty)
            // Older trips carry the totals without species lines.
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Wrap(
                spacing: 18,
                runSpacing: 6,
                children: [
                  _Total(label: l.declaredLabel, value: l.kg(trip.captainInputKg!)),
                  if (trip.actualWeightKg != null) _Total(label: l.countedLabel, value: l.kg(trip.actualWeightKg!)),
                ],
              ),
            )
          else ...[
            const SizedBox(height: 6),
            Row(
              children: [
                cell(l.speciesLabel, style: head, flex: 4, end: false),
                cell(l.declaredLabel, style: head),
                if (counted) cell(l.countedLabel, style: head),
              ],
            ),
            for (final record in records)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: c.hair)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        cell(
                          record.species?.name ?? '—',
                          style: text.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                          flex: 4,
                          end: false,
                        ),
                        cell(Fmt.ltr(Fmt.kg(record.declaredKg)), style: text.bodyMedium),
                        if (counted)
                          cell(
                            record.countedKg == null ? '—' : Fmt.ltr(Fmt.kg(record.countedKg!)),
                            style: text.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
                          ),
                      ],
                    ),
                    if ((record.captainNotes ?? record.counterNotes)?.isNotEmpty ?? false)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(record.captainNotes ?? record.counterNotes!, style: text.bodySmall),
                      ),
                  ],
                ),
              ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 18,
              runSpacing: 6,
              children: [
                if (trip.captainInputKg != null) _Total(label: l.declaredLabel, value: l.kg(trip.captainInputKg!)),
                if (trip.actualWeightKg != null) _Total(label: l.countedLabel, value: l.kg(trip.actualWeightKg!)),
                if (trip.diffKg != null && trip.actualWeightKg != null)
                  _Total(label: l.differenceLabel, value: l.kg(trip.diffKg!)),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _Total extends StatelessWidget {
  const _Total({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: '$label  ', style: text.bodySmall),
          TextSpan(text: value, style: text.labelLarge),
        ],
      ),
    );
  }
}

class _AvailableCard extends StatelessWidget {
  const _AvailableCard({required this.trip});

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final text = Theme.of(context).textTheme;
    final lines = trip.availableLines;
    return HudCard(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHead(title: l.sectionAvailable, icon: Icons.inventory_2_outlined),
          for (var i = 0; i < lines.length; i++)
            InfoRow(
              label: lines[i].species ?? '—',
              last: i == lines.length - 1,
              child: Text(l.kg(lines[i].availableKg), style: text.bodyMedium?.copyWith(fontWeight: FontWeight.w700)),
            ),
        ],
      ),
    );
  }
}

class _TripSalesCard extends ConsumerWidget {
  const _TripSalesCard({required this.tripId});

  final int tripId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final state = ref.watch(tripSalesProvider(tripId));

    return HudCard(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
      child: state.when(
        loading: () => const Padding(
          padding: EdgeInsets.all(20),
          child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
        ),
        error: (e, _) => ErrorState(error: e, compact: true, onRetry: () => ref.invalidate(tripSalesProvider(tripId))),
        data: (result) {
          final (sales, consignments) = result;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SectionHead(title: l.sectionTripSales, icon: Icons.receipt_long_outlined),
              if (sales.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(l.noSalesYet, style: text.bodyMedium?.copyWith(color: c.muted)),
                ),
              for (final sale in sales) SaleTile(sale: sale, onTap: () => context.push(Routes.sale(sale.id))),
              if (consignments.isNotEmpty) ...[
                const SizedBox(height: 8),
                SectionHead(title: l.sectionConsignments, icon: Icons.local_shipping_outlined),
                for (final item in consignments)
                  InfoRow(
                    label: item.dalal?.name ?? '—',
                    child: Text(l.kg(item.totalKg), style: text.bodyMedium?.copyWith(fontWeight: FontWeight.w700)),
                  ),
              ],
            ],
          );
        },
      ),
    );
  }
}

/// The single next step for this trip, in the thumb zone.
class _NextAction extends ConsumerWidget {
  const _NextAction({required this.trip});

  final Trip trip;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final c = HawatColors.of(context);

    Widget info(IconData icon, String message, Tone tone) => PinnedAction(
      child: Container(
        constraints: const BoxConstraints(minHeight: Hud.minTouch),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: c.tone(tone).withValues(alpha: .08),
          border: Border.all(color: c.tone(tone).withValues(alpha: .35)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: c.toneText(tone)),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: Theme.of(context).textTheme.bodyMedium
                    ?.copyWith(color: c.toneText(tone), fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );

    return switch (trip.phase) {
      TripPhase.scheduled => PinnedAction(
        child: PrimaryButton(
          label: l.actionStartTrip,
          icon: Icons.play_arrow,
          onPressed: () => startTripFlow(context, ref, trip),
        ),
      ),
      TripPhase.atSea => PinnedAction(
        child: PrimaryButton(
          label: l.actionSubmitCatch,
          icon: Icons.scale_outlined,
          onPressed: () => context.push(Routes.submitCatch(trip.id)),
        ),
      ),
      TripPhase.awaitingCounter => info(
        Icons.hourglass_top,
        trip.countingPort == null ? l.waitingCounter : l.waitingCounterAt(trip.countingPort!),
        Tone.warning,
      ),
      TripPhase.counting => info(Icons.fact_check_outlined, l.countingNow, Tone.warning),
      TripPhase.forSale when trip.availableLines.isNotEmpty => info(
        Icons.inventory_2_outlined,
        l.availableForSale(Fmt.ltr(Fmt.kg(trip.availableKg))),
        Tone.success,
      ),
      _ => const SizedBox.shrink(),
    };
  }
}

class _TripSkeleton extends StatelessWidget {
  const _TripSkeleton();

  @override
  Widget build(BuildContext context) => const Skeleton(
    child: Padding(
      padding: EdgeInsets.all(Hud.gutter),
      child: Column(
        children: [
          SkeletonBox(height: 140),
          SizedBox(height: Hud.gap),
          SkeletonBox(height: 320),
          SizedBox(height: Hud.gap),
          SkeletonBox(height: 120),
        ],
      ),
    ),
  );
}
