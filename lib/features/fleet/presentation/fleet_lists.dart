import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/format/format.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/avatar.dart';
import '../../../core/widgets/ltr_text.dart';
import '../../../core/widgets/search_list.dart';
import '../../../core/widgets/stat_tile.dart';
import '../../../core/widgets/status_chip.dart';
import '../../lookups/data/lookups_repository.dart';
import '../data/fleet.dart';
import '../data/fleet_providers.dart';
import 'fleet_ui.dart';

/// القوارب: status and setup at a glance; a boat opens its readiness card.
class BoatsScreen extends ConsumerStatefulWidget {
  const BoatsScreen({super.key});

  @override
  ConsumerState<BoatsScreen> createState() => _BoatsScreenState();
}

class _BoatsScreenState extends ConsumerState<BoatsScreen> {
  String _search = '';
  String? _status;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final provider = boatsListProvider(search: _search, status: _status);
    return Scaffold(
      appBar: AppBar(
        title: Text(l.boatsTitle),
        actions: const [_AddButton(route: Routes.newBoat)],
      ),
      body: SearchList<Boat>(
        state: ref.watch(provider),
        searchHint: l.searchBoats,
        onSearch: (q) => setState(() => _search = q),
        filters: FilterChips<String>(
          value: _status,
          onChanged: (s) => setState(() => _status = s),
          options: [
            (null, l.allStatuses),
            for (final s in [...Boat.editableStatuses, Boat.statusAtSea]) (s, s),
          ],
        ),
        onRefresh: () => ref.refresh(provider.future),
        onRetry: () => ref.invalidate(provider),
        onLoadMore: () => ref.read(provider.notifier).loadMore(),
        emptyIcon: Icons.directions_boat_outlined,
        emptyTitle: _search.isEmpty && _status == null ? l.noBoats : l.noResults,
        itemBuilder: (context, boat, last) {
          final text = Theme.of(context).textTheme;
          return EntityRow(
            title: boat.name,
            last: last,
            onTap: () => context.push(Routes.boat(boat.id)),
            leading: const ToneIcon(icon: Icons.directions_boat_outlined, size: 36, iconSize: 20),
            lines: [
              if (boat.boatNumber != null) LtrText(boat.boatNumber!, style: text.bodySmall),
              Text(boat.captain?.name ?? l.noCaptain, style: text.bodySmall),
            ],
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                StatusChip(label: boat.status ?? '—', tone: boatStatusTone(boat.status), dense: true),
                const SizedBox(height: 6),
                SetupChip(setup: boat.setup),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// الكباتن / الطاقم: one screen, the kind decides the path. Crew can be
/// narrowed to one boat (from the boat screen).
class FishersScreen extends ConsumerStatefulWidget {
  const FishersScreen({super.key, required this.kind, this.boatId});

  final FisherKind kind;
  final int? boatId;

  @override
  ConsumerState<FishersScreen> createState() => _FishersScreenState();
}

class _FishersScreenState extends ConsumerState<FishersScreen> {
  String _search = '';
  late int? _boatId = widget.boatId;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final crew = widget.kind == FisherKind.crew;
    final provider = fishersListProvider(widget.kind, search: _search, boatId: _boatId);
    final boats = crew ? (ref.watch(ownerBoatsProvider).value ?? const <Boat>[]) : const <Boat>[];

    return Scaffold(
      appBar: AppBar(
        title: Text(crew ? l.crewTitle : l.captainsTitle),
        actions: [_AddButton(route: Routes.newFisher(widget.kind, boatId: _boatId))],
      ),
      body: SearchList<Fisher>(
        state: ref.watch(provider),
        searchHint: l.searchFishers,
        onSearch: (q) => setState(() => _search = q),
        filters: boats.isEmpty
            ? null
            : FilterChips<int>(
                value: _boatId,
                onChanged: (id) => setState(() => _boatId = id),
                options: [(null, l.allBoats), for (final b in boats) (b.id, b.name)],
              ),
        onRefresh: () => ref.refresh(provider.future),
        onRetry: () => ref.invalidate(provider),
        onLoadMore: () => ref.read(provider.notifier).loadMore(),
        emptyIcon: crew ? Icons.groups_outlined : Icons.person_pin_outlined,
        emptyTitle: _search.isNotEmpty ? l.noResults : (crew ? l.noCrew : l.noCaptains),
        itemBuilder: (context, fisher, last) => FisherRow(fisher: fisher, last: last),
      ),
    );
  }
}

/// A captain or crew member: photo, name, role and boat, status when inactive.
class FisherRow extends StatelessWidget {
  const FisherRow({super.key, required this.fisher, this.last = false});

  final Fisher fisher;
  final bool last;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final text = Theme.of(context).textTheme;
    final expired = [fisher.iqamaExpiryDate, fisher.licenseExpiry].any((d) => ExpiryState.of(d) == ExpiryState.expired);
    return EntityRow(
      title: fisher.name,
      last: last,
      onTap: () => context.push(Routes.fisher(fisher.kind, fisher.id)),
      leading: HudAvatar(name: fisher.name, url: fisher.avatarUrl, size: 40),
      lines: [
        Text(
          [
            if (!fisher.isCaptain && fisher.role?.name != null) fisher.role!.name!,
            fisher.boat?.name ?? l.noBoat,
          ].join(' · '),
          style: text.bodySmall,
        ),
        if (fisher.phone != null) LtrText(fisher.phone!, style: text.bodySmall),
      ],
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!fisher.isActive) StatusChip(label: fisher.status ?? '', dense: true),
          if (expired) ...[
            if (!fisher.isActive) const SizedBox(height: 6),
            StatusChip(label: l.documentExpired, tone: Tone.danger, dense: true),
          ],
        ],
      ),
    );
  }
}

/// الصيانة: every record, or one boat's; a row opens its form.
class MaintenanceScreen extends ConsumerStatefulWidget {
  const MaintenanceScreen({super.key, this.boatId});

  final int? boatId;

  @override
  ConsumerState<MaintenanceScreen> createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends ConsumerState<MaintenanceScreen> {
  late int? _boatId = widget.boatId;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final provider = maintenanceListProvider(boatId: _boatId);
    final boats = ref.watch(ownerBoatsProvider).value ?? const <Boat>[];

    return Scaffold(
      appBar: AppBar(
        title: Text(l.maintenanceTitle),
        actions: [_AddButton(route: Routes.newMaintenance(boatId: _boatId))],
      ),
      body: SearchList<Maintenance>(
        state: ref.watch(provider),
        filters: boats.isEmpty
            ? null
            : FilterChips<int>(
                value: _boatId,
                onChanged: (id) => setState(() => _boatId = id),
                options: [(null, l.allBoats), for (final b in boats) (b.id, b.name)],
              ),
        onRefresh: () => ref.refresh(provider.future),
        onRetry: () => ref.invalidate(provider),
        onLoadMore: () => ref.read(provider.notifier).loadMore(),
        emptyIcon: Icons.build_outlined,
        emptyTitle: l.noMaintenance,
        itemBuilder: (context, record, last) => MaintenanceRow(record: record, last: last),
      ),
    );
  }
}

class MaintenanceRow extends StatelessWidget {
  const MaintenanceRow({super.key, required this.record, this.last = false});

  final Maintenance record;
  final bool last;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final text = Theme.of(context).textTheme;
    final cost = record.actualCost ?? record.estimatedCost;
    return EntityRow(
      title: record.type?.name ?? l.maintenanceTitle,
      last: last,
      onTap: () => context.push(Routes.editMaintenance, extra: record),
      leading: const ToneIcon(icon: Icons.build_outlined, size: 36, iconSize: 20),
      lines: [
        Text(
          [record.boat?.name, if (record.date != null) Fmt.date(record.date!)].whereType<String>().join(' · '),
          style: text.bodySmall,
        ),
        if (record.technician != null) Text(record.technician!, style: text.bodySmall),
      ],
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          StatusChip(label: record.status ?? '—', tone: maintenanceTone(record.status), dense: true),
          if (cost != null) ...[const SizedBox(height: 6), Text(l.sar(cost), style: text.labelLarge)],
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({required this.route});

  final String route;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsetsDirectional.only(end: 4),
    child: IconButton(
      tooltip: context.l10n.addAction,
      icon: const Icon(Icons.add),
      onPressed: () => context.push(route),
    ),
  );
}
