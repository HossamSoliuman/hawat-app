import 'package:flutter/material.dart';

import '../../../app/router.dart';
import '../../../core/format/format.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/status_chip.dart';
import '../data/fleet.dart';

Tone boatStatusTone(String? status) => switch (status) {
  'نشط' => Tone.success,
  'في البحر' => Tone.info,
  'صيانة' => Tone.warning,
  _ => Tone.muted,
};

Tone maintenanceTone(String? status) => switch (status) {
  'مكتملة' => Tone.success,
  'معلقة' => Tone.warning,
  _ => Tone.muted,
};

/// A boat's setup in one chip: ready, or how many things are missing.
class SetupChip extends StatelessWidget {
  const SetupChip({super.key, required this.setup});

  final BoatSetup? setup;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final s = setup;
    if (s == null) return const SizedBox.shrink();
    if (!s.ready) return StatusChip(label: l.setupMissingCount(s.missing.length), tone: Tone.warning, dense: true);
    if (s.warnings.isNotEmpty) {
      return StatusChip(label: l.setupWarningsCount(s.warnings.length), tone: Tone.info, dense: true);
    }
    return StatusChip(label: l.setupReady, tone: Tone.success, dense: true);
  }
}

/// How close a document is to its end: expired, ending within 30 days, or fine.
enum ExpiryState {
  none,
  valid,
  soon,
  expired;

  static ExpiryState of(DateTime? expiry, {DateTime? now}) {
    if (expiry == null) return none;
    final today = DateUtils.dateOnly(now ?? DateTime.now());
    final end = DateUtils.dateOnly(expiry.toLocal());
    if (end.isBefore(today)) return expired;
    if (end.difference(today).inDays <= 30) return soon;
    return valid;
  }
}

/// An expiry date with its state beside it.
class ExpiryValue extends StatelessWidget {
  const ExpiryValue({super.key, required this.date, this.pastLabel});

  final DateTime? date;

  /// What a date in the past means here: منتهية for a document, متأخر for an inspection.
  final String? pastLabel;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final text = Theme.of(context).textTheme;
    if (date == null) return Text('—', style: text.bodyMedium?.copyWith(fontWeight: FontWeight.w600));
    final state = ExpiryState.of(date);
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      alignment: WrapAlignment.end,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(Fmt.date(date!), style: text.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
        if (state == ExpiryState.expired) StatusChip(label: pastLabel ?? l.expired, tone: Tone.danger, dense: true),
        if (state == ExpiryState.soon) StatusChip(label: l.expiringSoon, tone: Tone.warning, dense: true),
      ],
    );
  }
}

/// Where each setup item is fixed, and what the button says.
({String label, String route}) setupFix(AppLocalizations l, Boat boat, SetupItem item) => switch (item.key) {
  'captain' => (label: l.fixAssignCaptain, route: Routes.editBoat(boat.id)),
  'captain_inactive' when boat.captain?.id != null => (
    label: l.fixOpenCaptain,
    route: Routes.fisher(FisherKind.captain, boat.captain!.id!),
  ),
  'crew' => (label: l.fixAddCrew, route: Routes.newFisher(FisherKind.crew, boatId: boat.id)),
  'crew_over_capacity' => (label: l.fixReviewCrew, route: Routes.fishers(FisherKind.crew, boatId: boat.id)),
  'license_expired' => (label: l.fixRenewLicense, route: Routes.editBoat(boat.id)),
  _ => (label: l.fixEditBoat, route: Routes.editBoat(boat.id)),
};
