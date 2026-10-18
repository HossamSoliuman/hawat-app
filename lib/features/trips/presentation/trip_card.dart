import 'package:flutter/material.dart';

import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/hud_card.dart';
import '../../../core/widgets/ltr_text.dart';
import '../../../core/widgets/step_progress.dart';
import '../data/trip.dart';
import 'trip_ui.dart';

/// A trip in a list: number and status, boat and captain, the key time, the
/// catch once declared, and a five-segment progress bar.
class TripCard extends StatelessWidget {
  const TripCard({super.key, required this.trip, required this.onTap, this.trailing});

  final Trip trip;
  final VoidCallback onTap;

  /// An inline action (the home's "ابدأ").
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final phase = trip.phase;
    final moment = _moment(l);

    return HudCard(
      onTap: onTap,
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: LtrText(
                  trip.tripNumber,
                  style: text.labelLarge?.copyWith(fontSize: 14, color: c.muted),
                ),
              ),
              TripPhaseChip(trip: trip),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            boatAndCaptain(trip).isEmpty ? '—' : boatAndCaptain(trip),
            style: text.titleMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (moment != null || _catchLine(l) != null) ...[
            const SizedBox(height: 4),
            Text(
              [moment, _catchLine(l)].whereType<String>().join('   ·   '),
              style: text.bodySmall,
              maxLines: 2,
            ),
          ],
          if (phase != TripPhase.cancelled) ...[
            const SizedBox(height: 12),
            SegmentProgress(current: phase.step, allDone: phase.isFinished, tone: c.tone(phase.tone == Tone.muted ? Tone.primary : phase.tone)),
          ],
          if (trailing != null) ...[const SizedBox(height: 12), trailing!],
        ],
      ),
    );
  }

  /// The time that matters at this stage.
  String? _moment(AppLocalizations l) {
    return switch (trip.phase) {
      TripPhase.scheduled when trip.departureTime != null => '${l.fieldDepartureTime}: ${l.when(trip.departureTime!)}',
      TripPhase.atSea when trip.startedAt != null => '${l.fieldStartedAt} ${l.when(trip.startedAt!)}',
      TripPhase.awaitingCounter || TripPhase.counting when trip.returnTime != null =>
        '${l.fieldReturnedAt} ${l.when(trip.returnTime!)}',
      TripPhase.cancelled when trip.cancelReason != null => trip.cancelReason,
      _ => null,
    };
  }

  String? _catchLine(AppLocalizations l) {
    if (trip.actualWeightKg != null) return '${l.countedLabel} ${l.kg(trip.actualWeightKg!)}';
    if (trip.captainInputKg != null) return '${l.declaredLabel} ${l.kg(trip.captainInputKg!)}';
    return null;
  }
}

/// Placeholder cards while a list loads.
class TripCardSkeleton extends StatelessWidget {
  const TripCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    return Container(
      height: 128,
      decoration: BoxDecoration(color: c.panel, border: Border.all(color: c.hair)),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [Container(width: 110, height: 12, color: c.mutedSurface), const Spacer(), Container(width: 64, height: 18, color: c.mutedSurface)]),
          const SizedBox(height: 14),
          Container(width: 180, height: 16, color: c.mutedSurface),
          const SizedBox(height: 10),
          Container(width: 140, height: 11, color: c.mutedSurface),
          const Spacer(),
          Container(height: 4, color: c.mutedSurface),
        ],
      ),
    );
  }
}
