import 'package:flutter/material.dart';

import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/status_chip.dart';
import '../data/trip.dart';

extension TripPhaseUi on TripPhase {
  String label(AppLocalizations l) => switch (this) {
    TripPhase.scheduled => l.phaseScheduled,
    TripPhase.atSea => l.phaseAtSea,
    TripPhase.awaitingCounter => l.phaseAwaitingCounter,
    TripPhase.counting => l.phaseCounting,
    TripPhase.forSale => l.phaseForSale,
    TripPhase.sold => l.phaseSold,
    TripPhase.counted => l.phaseCounted,
    TripPhase.cancelled => l.phaseCancelled,
  };

  /// مجدولة muted · في البحر info · العداد warning · للبيع success · مباعة primary · ملغاة danger.
  Tone get tone => switch (this) {
    TripPhase.scheduled => Tone.muted,
    TripPhase.atSea => Tone.info,
    TripPhase.awaitingCounter || TripPhase.counting => Tone.warning,
    TripPhase.forSale || TripPhase.counted => Tone.success,
    TripPhase.sold => Tone.primary,
    TripPhase.cancelled => Tone.danger,
  };

  /// The last step is passed, not just reached.
  bool get isFinished => this == TripPhase.sold || this == TripPhase.counted;
}

extension TripStageUi on TripStage {
  String label(AppLocalizations l) => switch (this) {
    TripStage.scheduled => l.tabScheduled,
    TripStage.inProgress => l.tabInProgress,
    TripStage.forSale => l.tabForSale,
    TripStage.done => l.tabDone,
    TripStage.cancelled => l.tabCancelled,
  };

  String empty(AppLocalizations l) => switch (this) {
    TripStage.scheduled => l.noTripsScheduled,
    TripStage.inProgress => l.noTripsInProgress,
    TripStage.forSale => l.noTripsForSale,
    TripStage.done => l.noTripsDone,
    TripStage.cancelled => l.noTripsCancelled,
  };
}

List<String> tripStepLabels(AppLocalizations l) => [
  l.stepScheduled,
  l.stepAtSea,
  l.stepAwaitingCounter,
  l.stepCounting,
  l.stepForSale,
];

class TripPhaseChip extends StatelessWidget {
  const TripPhaseChip({super.key, required this.trip, this.dense = false});

  final Trip trip;
  final bool dense;

  @override
  Widget build(BuildContext context) =>
      StatusChip(label: trip.phase.label(context.l10n), tone: trip.phase.tone, dense: dense);
}

/// "القارب · الكابتن".
String boatAndCaptain(Trip trip) =>
    [trip.boat?.name, trip.captain?.name].whereType<String>().where((s) => s.isNotEmpty).join(' · ');
