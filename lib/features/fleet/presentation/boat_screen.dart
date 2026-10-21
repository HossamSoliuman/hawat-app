import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/format/format.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/action_sheet.dart';
import '../../../core/widgets/actions.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/hud_card.dart';
import '../../../core/widgets/ltr_text.dart';
import '../../../core/widgets/section_head.dart';
import '../../../core/widgets/states.dart';
import '../../../core/widgets/status_chip.dart';
import '../data/fleet.dart';
import '../data/fleet_providers.dart';
import 'fleet_lists.dart';
import 'fleet_ui.dart';

/// A boat: the readiness card first (each missing piece with the button that
/// fixes it), then its captain, crew, maintenance, specs and licence.
class BoatScreen extends ConsumerWidget {
  const BoatScreen({super.key, required this.id});

  final int id;

  Future<void> _delete(BuildContext context, WidgetRef ref, Boat boat) async {
    final l = context.l10n;
    final done = await showActionSheet(
      context,
      title: l.deleteTitle(boat.name),
      body: l.deleteBoatBody,
      confirm: l.deleteAction,
      danger: true,
      run: (_) => ref.read(fleetActionsProvider).deleteBoat(boat.id),
    );
    if (!done || !context.mounted) return;
    showSnack(context, l.deletedDone);
    popOr(context, Routes.boats);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final state = ref.watch(boatDetailProvider(id));
    final boat = state.value;

    return Scaffold(
      appBar: AppBar(
        title: Text(boat?.name ?? l.boatTitle),
        actions: [
          if (boat != null)
            PopupMenuButton<String>(
              tooltip: l.moreActions,
              icon: const Icon(Icons.more_vert),
              onSelected: (action) =>
                  action == 'edit' ? context.push(Routes.editBoat(id)) : _delete(context, ref, boat),
              itemBuilder: (_) => [
                PopupMenuItem(value: 'edit', child: Text(l.editBoat)),
                PopupMenuItem(value: 'delete', child: Text(l.deleteAction)),
              ],
            ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref
            ..invalidate(fishersListProvider)
            ..invalidate(maintenanceListProvider)
            ..invalidate(boatDetailProvider(id));
          await ref.read(boatDetailProvider(id).future);
        },
        child: state.when(
          skipLoadingOnReload: true,
          loading: () => const Skeleton(
            child: Padding(padding: EdgeInsets.all(Hud.gutter), child: SkeletonBox(height: 420)),
          ),
          error: (e, _) => ListView(
            children: [ErrorState(error: e, onRetry: () => ref.invalidate(boatDetailProvider(id)))],
          ),
          data: (boat) => ListView(
            padding: const EdgeInsets.all(Hud.gutter),
            children: [
              _Header(boat: boat),
              const SizedBox(height: Hud.gap),
              _Readiness(boat: boat),
              const SizedBox(height: Hud.gap),
              _People(boat: boat),
              const SizedBox(height: Hud.gap),
              _LatestMaintenance(boat: boat),
              const SizedBox(height: Hud.gap),
              _Details(boat: boat),
              const SizedBox(height: Hud.gutter),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.boat});

  final Boat boat;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final text = Theme.of(context).textTheme;
    return HudCard(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(child: Text(boat.name, style: text.titleLarge)),
              StatusChip(label: boat.status ?? '—', tone: boatStatusTone(boat.status)),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              if (boat.boatNumber != null) ...[
                LtrText(boat.boatNumber!, style: text.bodyMedium),
                const SizedBox(width: 12),
              ],
              if (boat.port?.name != null) Flexible(child: Text(boat.port!.name!, style: text.bodyMedium)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _Figure(label: l.tripsLabel, value: Fmt.count(boat.tripsCount)),
              ),
              Expanded(
                child: _Figure(label: l.totalCatchLabel, value: l.kg(boat.totalCatchKg)),
              ),
              Expanded(
                child: _Figure(
                  label: l.fieldCrewCount,
                  value: boat.crewCapacity != null && boat.crewCapacity! > 0
                      ? Fmt.ltr('${boat.crewCount} / ${boat.crewCapacity}')
                      : '${boat.crewCount}',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Figure extends StatelessWidget {
  const _Figure({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: text.labelSmall?.copyWith(color: c.muted)),
        const SizedBox(height: 2),
        Text(value, style: text.titleMedium),
      ],
    );
  }
}

/// `Boat.setup` as a checklist: what blocks the boat, then the warnings,
/// each with the button that fixes it.
class _Readiness extends StatelessWidget {
  const _Readiness({required this.boat});

  final Boat boat;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final setup = boat.setup ?? const BoatSetup();
    final items = [
      for (final item in setup.missing) (item, Tone.warning),
      for (final item in setup.warnings) (item, Tone.info),
    ];

    return HudCard(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHead(title: l.readinessTitle, icon: Icons.fact_check_outlined),
          if (items.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Icon(Icons.check_circle_outline, color: c.toneText(Tone.success)),
                  const SizedBox(width: 10),
                  Expanded(child: Text(l.boatReady, style: text.bodyLarge)),
                ],
              ),
            ),
          for (var i = 0; i < items.length; i++)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                border: i == items.length - 1 ? null : Border(bottom: BorderSide(color: c.hair)),
              ),
              child: Row(
                children: [
                  Icon(
                    items[i].$2 == Tone.warning ? Icons.error_outline : Icons.info_outline,
                    size: 20,
                    color: c.toneText(items[i].$2),
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: Text(items[i].$1.label, style: text.bodyMedium)),
                  const SizedBox(width: 8),
                  Builder(
                    builder: (context) {
                      final fix = setupFix(l, boat, items[i].$1);
                      return OutlinedButton(onPressed: () => context.push(fix.route), child: Text(fix.label));
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// The captain and the crew on this boat.
class _People extends ConsumerWidget {
  const _People({required this.boat});

  final Boat boat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final crew = ref.watch(fishersListProvider(FisherKind.crew, boatId: boat.id));

    return HudCard(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHead(title: l.fieldCaptain, icon: Icons.person_pin_outlined),
          if (boat.captain?.id != null)
            InkWell(
              onTap: () => context.push(Routes.fisher(FisherKind.captain, boat.captain!.id!)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(child: Text(boat.captain!.name ?? '—', style: text.bodyLarge)),
                    if (boat.captain!.phone != null) LtrText(boat.captain!.phone!, style: text.bodySmall),
                    Icon(Icons.chevron_right, color: c.muted),
                  ],
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(l.noCaptain, style: text.bodyMedium?.copyWith(color: c.muted)),
            ),
          const SizedBox(height: 6),
          SectionHead(
            title: l.crewTitle,
            icon: Icons.groups_outlined,
            action: l.addAction,
            onAction: () => context.push(Routes.newFisher(FisherKind.crew, boatId: boat.id)),
          ),
          crew.when(
            loading: () => const Skeleton(child: SkeletonBox(height: 60)),
            error: (e, _) => ErrorState(
              error: e,
              compact: true,
              onRetry: () => ref.invalidate(fishersListProvider(FisherKind.crew, boatId: boat.id)),
            ),
            data: (page) => page.isEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(l.noCrew, style: text.bodyMedium?.copyWith(color: c.muted)),
                  )
                : Column(
                    children: [
                      for (var i = 0; i < page.items.length; i++)
                        FisherRow(fisher: page.items[i], last: i == page.items.length - 1),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class _LatestMaintenance extends ConsumerWidget {
  const _LatestMaintenance({required this.boat});

  final Boat boat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final records = ref.watch(maintenanceListProvider(boatId: boat.id));

    return HudCard(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHead(
            title: l.maintenanceTitle,
            icon: Icons.build_outlined,
            action: l.addAction,
            onAction: () => context.push(Routes.newMaintenance(boatId: boat.id)),
          ),
          records.when(
            loading: () => const Skeleton(child: SkeletonBox(height: 60)),
            error: (e, _) => ErrorState(
              error: e,
              compact: true,
              onRetry: () => ref.invalidate(maintenanceListProvider(boatId: boat.id)),
            ),
            data: (page) {
              if (page.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(l.noMaintenance, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: c.muted)),
                );
              }
              final shown = page.items.take(3).toList();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (var i = 0; i < shown.length; i++) MaintenanceRow(record: shown[i], last: i == shown.length - 1),
                  if (page.total > shown.length)
                    TextButton(
                      onPressed: () => context.push(Routes.maintenance(boatId: boat.id)),
                      child: Text(l.viewAll),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Specs and licence, only the values the owner has filled in.
class _Details extends StatelessWidget {
  const _Details({required this.boat});

  final Boat boat;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    String? m(double? v) => v == null ? null : l.meters(Fmt.ltr(Fmt.plain(v)));
    final specs = <(String, String?)>[
      (l.fieldCategory, boat.category?.name),
      (l.fieldBoatType, boat.type?.name),
      (l.fieldLength, m(boat.lengthM)),
      (l.fieldWidth, m(boat.widthM)),
      (l.fieldCapacity, boat.capacity == null ? null : l.tons(Fmt.ltr(Fmt.plain(boat.capacity!)))),
      (l.fieldCrewCapacity, boat.crewCapacity?.toString()),
      (l.fieldColor, boat.color),
      (l.fieldHull, boat.hullNumber),
      (l.fieldBodyType, boat.bodyType),
      (l.fieldEngineType, boat.engineType),
      (l.fieldEnginePower, boat.enginePower),
      (l.fieldEngineStatus, boat.engineStatus),
      (l.fieldCallSign, boat.callSign),
      (l.fieldSerial, boat.serialNumber),
      (l.fieldNameEn, boat.nameEn),
    ].where((row) => row.$2 != null && row.$2!.isNotEmpty).toList();
    final license = boat.license ?? const BoatLicense();

    return HudCard(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHead(title: l.sectionLicense, icon: Icons.badge_outlined),
          InfoRow(label: l.fieldLicense, child: LtrText(license.number ?? '—')),
          InfoRow(label: l.fieldLicenseType, value: license.type),
          InfoRow(label: l.fieldLicenseStatus, value: license.status),
          InfoRow(label: l.fieldLicenseArea, value: license.area),
          InfoRow(label: l.fieldLicenseDate, value: license.date == null ? null : Fmt.date(license.date!)),
          InfoRow(
            label: l.fieldLicenseExpiry,
            child: ExpiryValue(date: license.expiry),
          ),
          InfoRow(
            label: l.fieldNextInspection,
            last: true,
            child: ExpiryValue(date: boat.nextInspectionDate, pastLabel: l.overdue),
          ),
          const SizedBox(height: 8),
          SectionHead(title: l.sectionSpecs, icon: Icons.straighten_outlined),
          if (specs.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(l.noSpecs, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: c.muted)),
            ),
          for (var i = 0; i < specs.length; i++)
            InfoRow(label: specs[i].$1, value: specs[i].$2, last: i == specs.length - 1),
        ],
      ),
    );
  }
}
