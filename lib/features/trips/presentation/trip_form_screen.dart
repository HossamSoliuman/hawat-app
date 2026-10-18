import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/api/api_client.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/format/format.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/actions.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/hud_card.dart';
import '../../../core/widgets/section_head.dart';
import '../../../core/widgets/states.dart';
import '../../../core/widgets/status_chip.dart';
import '../../fleet/data/fleet.dart';
import '../../lookups/data/lookups.dart';
import '../../lookups/data/lookups_repository.dart';
import '../data/trip.dart';
import '../data/trips_providers.dart';

/// New trip (→ مجدولة) or edit a scheduled one. Picking a boat brings its
/// captain, port, crew and licence as defaults, and shows its setup warnings
/// (advisory only: the server never refuses a trip for them).
class TripFormScreen extends ConsumerStatefulWidget {
  const TripFormScreen({super.key, this.tripId});

  final int? tripId;

  @override
  ConsumerState<TripFormScreen> createState() => _TripFormScreenState();
}

class _TripFormScreenState extends ConsumerState<TripFormScreen> {
  final _plannedDays = TextEditingController();
  final _crewCount = TextEditingController();
  final _license = TextEditingController();
  final _notes = TextEditingController();
  final _idempotencyKey = ApiClient.newIdempotencyKey();

  int? _boatId;
  int? _captainId;
  int? _departurePortId;
  int? _returnPortId;
  int? _tripTypeId;
  String? _gearType;
  DateTime? _departureTime;

  bool _initialized = false;
  bool _busy = false;
  Map<String, String> _errors = const {};

  bool get _editing => widget.tripId != null;

  @override
  void dispose() {
    _plannedDays.dispose();
    _crewCount.dispose();
    _license.dispose();
    _notes.dispose();
    super.dispose();
  }

  void _fillFrom(Trip trip) {
    _initialized = true;
    _boatId = trip.boat?.id;
    _captainId = trip.captain?.id;
    _departurePortId = trip.departurePort?.id;
    _returnPortId = trip.returnPort?.id;
    _tripTypeId = trip.tripType?.id;
    _gearType = trip.gearType;
    _departureTime = trip.departureTime;
    _plannedDays.text = trip.plannedDays?.toString() ?? '';
    _crewCount.text = trip.crewCount.toString();
    _license.text = trip.licenseNumber ?? '';
    _notes.text = trip.notes ?? '';
  }

  TripInput _input() => TripInput(
    boatId: _boatId,
    captainId: _captainId,
    departurePortId: _departurePortId,
    returnPortId: _returnPortId,
    tripTypeId: _tripTypeId,
    crewCount: int.tryParse(_crewCount.text),
    departureTime: _departureTime,
    plannedDays: int.tryParse(_plannedDays.text),
    gearType: _gearType,
    licenseNumber: _license.text,
    notes: _notes.text,
  );

  Map<String, String> _validate() {
    final l = context.l10n;
    final days = int.tryParse(_plannedDays.text);
    final crew = int.tryParse(_crewCount.text);
    return {
      if (_boatId == null) 'boat_id': l.boatRequired,
      if (_plannedDays.text.isNotEmpty && (days == null || days < 1 || days > 90)) 'planned_days': l.plannedDaysInvalid,
      if (_crewCount.text.isNotEmpty && (crew == null || crew < 0 || crew > 200)) 'crew_count': l.crewCountInvalid,
    };
  }

  Future<void> _save() async {
    final l = context.l10n;
    final errors = _validate();
    setState(() => _errors = errors);
    if (errors.isNotEmpty) return;

    FocusScope.of(context).unfocus();
    setState(() => _busy = true);
    try {
      final actions = ref.read(tripActionsProvider);
      if (_editing) {
        await actions.update(widget.tripId!, _input());
        if (!mounted) return;
        showSnack(context, l.tripSaved);
        context.pop();
      } else {
        final trip = await actions.create(_input(), idempotencyKey: _idempotencyKey);
        if (!mounted) return;
        showSnack(context, l.tripCreated);
        context.pushReplacement(Routes.trip(trip.id));
      }
    } on ValidationException catch (e) {
      setState(() {
        _errors = {for (final entry in e.errors.entries) entry.key: entry.value.first};
      });
      final hidden = e.outside(_fieldKeys);
      if (hidden != null && mounted) showSnack(context, hidden, error: true);
    } on ApiException catch (e) {
      if (mounted) showSnack(context, e.userMessage(l), error: true);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  static const _fieldKeys = [
    'boat_id',
    'captain_id',
    'departure_port_id',
    'return_port_id',
    'trip_type_id',
    'crew_count',
    'departure_time',
    'planned_days',
    'gear_type',
    'license_number',
    'notes',
  ];

  Future<void> _pickDepartureTime() async {
    final now = DateTime.now();
    final initial = _departureTime?.toLocal() ?? now;
    final date = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: now.subtract(const Duration(days: 7)),
      lastDate: now.add(const Duration(days: 120)),
    );
    if (date == null || !mounted) return;
    final time = await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(initial));
    if (time == null) return;
    setState(() {
      _departureTime = DateTime(date.year, date.month, date.day, time.hour, time.minute);
      _errors = {..._errors}..remove('departure_time');
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;

    if (_editing && !_initialized) {
      final trip = ref.watch(tripDetailProvider(widget.tripId!));
      return Scaffold(
        appBar: AppBar(title: Text(l.editTripTitle)),
        body: trip.when(
          loading: () => const Skeleton(
            child: Padding(padding: EdgeInsets.all(Hud.gutter), child: SkeletonBox(height: 400)),
          ),
          error: (e, _) => ErrorState(error: e, onRetry: () => ref.invalidate(tripDetailProvider(widget.tripId!))),
          data: (trip) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted && !_initialized) setState(() => _fillFrom(trip));
            });
            return const SizedBox.shrink();
          },
        ),
      );
    }

    final boatsState = ref.watch(ownerBoatsProvider);
    final captains = ref.watch(ownerCaptainsProvider).value ?? const <Captain>[];
    final lookups = ref.watch(lookupsControllerProvider).value ?? const Lookups();
    final boats = boatsState.value ?? const <Boat>[];
    final boat = boats.where((b) => b.id == _boatId).firstOrNull;

    return Scaffold(
      appBar: AppBar(title: Text(_editing ? l.editTripTitle : l.newTripTitle)),
      bottomNavigationBar: PinnedAction(
        child: PrimaryButton(label: l.saveTrip, busy: _busy, onPressed: _save),
      ),
      body: ListView(
        padding: const EdgeInsets.all(Hud.gutter),
        children: [
          _Section(
            title: l.sectionBoatCaptain,
            icon: Icons.directions_boat_outlined,
            children: [
              FieldLabel(
                label: l.fieldBoat,
                required: true,
                child: boatsState.hasError && boats.isEmpty
                    ? ErrorState(
                        error: boatsState.error!,
                        compact: true,
                        onRetry: () => ref.invalidate(ownerBoatsProvider),
                      )
                    : SearchSelect<int>(
                        hint: boatsState.isLoading ? '…' : l.chooseBoat,
                        title: l.chooseBoat,
                        value: _boatId,
                        errorText: _errors['boat_id'],
                        enabled: boats.isNotEmpty,
                        options: [
                          for (final b in boats)
                            SelectOption(
                              value: b.id,
                              label: b.name,
                              detail: b.boatNumber,
                              trailing: b.isActive
                                  ? null
                                  : StatusChip(label: b.status ?? '', tone: Tone.warning, dense: true),
                            ),
                        ],
                        onChanged: (id) => setState(() {
                          _boatId = id;
                          if (!_editing) _captainId = null;
                          _errors = {..._errors}..remove('boat_id');
                        }),
                      ),
              ),
              if (boatsState.hasValue && boats.isEmpty) _Note(message: l.noBoatsYet, tone: Tone.warning),
              if (boat?.setup case final BoatSetup setup when !setup.ready || setup.warnings.isNotEmpty)
                _SetupNote(setup: setup),
              FieldLabel(
                label: l.fieldCaptain,
                child: SearchSelect<int>(
                  hint: l.fieldCaptain,
                  value: _captainId,
                  errorText: _errors['captain_id'],
                  emptyLabel: _editing
                      ? l.noCaptain
                      : (boat?.captain?.name != null ? '${l.captainOfBoat} (${boat!.captain!.name})' : l.captainOfBoat),
                  options: [
                    for (final captain in captains)
                      SelectOption(
                        value: captain.id,
                        label: captain.name,
                        detail: captain.boat?.name,
                        enabled: captain.isActive,
                        trailing: captain.isActive ? null : StatusChip(label: captain.status ?? '', dense: true),
                      ),
                  ],
                  onChanged: (id) => setState(() => _captainId = id),
                ),
              ),
            ],
          ),
          const SizedBox(height: Hud.gap),
          _Section(
            title: l.sectionPortsTime,
            icon: Icons.anchor_outlined,
            children: [
              FieldLabel(
                label: l.fieldDeparturePort,
                child: SearchSelect<int>(
                  hint: l.fieldDeparturePort,
                  value: _departurePortId,
                  errorText: _errors['departure_port_id'],
                  emptyLabel: _editing
                      ? l.notSet
                      : (boat?.port?.name != null ? '${l.portOfBoat} (${boat!.port!.name})' : l.portOfBoat),
                  options: _portOptions(lookups.ports),
                  onChanged: (id) => setState(() => _departurePortId = id),
                ),
              ),
              FieldLabel(
                label: l.fieldReturnPort,
                child: SearchSelect<int>(
                  hint: l.fieldReturnPort,
                  value: _returnPortId,
                  errorText: _errors['return_port_id'],
                  emptyLabel: l.sameAsDeparture,
                  options: _portOptions(lookups.ports),
                  onChanged: (id) => setState(() => _returnPortId = id),
                ),
              ),
              FieldLabel(
                label: l.fieldDepartureTime,
                child: InkWell(
                  onTap: _pickDepartureTime,
                  child: InputDecorator(
                    isEmpty: _departureTime == null,
                    decoration: InputDecoration(
                      hintText: l.departureOnStart,
                      errorText: _errors['departure_time'],
                      prefixIcon: const Icon(Icons.event_outlined),
                      suffixIcon: _departureTime == null
                          ? null
                          : IconButton(
                              tooltip: l.clearValue,
                              icon: const Icon(Icons.close),
                              onPressed: () => setState(() => _departureTime = null),
                            ),
                    ),
                    child: _departureTime == null
                        ? null
                        : Text(Fmt.dateTime(_departureTime!), style: Theme.of(context).textTheme.bodyLarge),
                  ),
                ),
              ),
              FieldLabel(
                label: l.fieldPlannedDays,
                child: _NumberField(controller: _plannedDays, error: _errors['planned_days']),
              ),
            ],
          ),
          const SizedBox(height: Hud.gap),
          _Section(
            title: l.sectionPermit,
            icon: Icons.badge_outlined,
            children: [
              FieldLabel(
                label: l.fieldTripType,
                child: SearchSelect<int>(
                  hint: l.fieldTripType,
                  value: _tripTypeId,
                  errorText: _errors['trip_type_id'],
                  emptyLabel: l.notSet,
                  options: [
                    for (final type in lookups.tripTypes)
                      if (type.id != null) SelectOption(value: type.id!, label: type.name ?? ''),
                  ],
                  onChanged: (id) => setState(() => _tripTypeId = id),
                ),
              ),
              FieldLabel(
                label: l.fieldGear,
                child: SearchSelect<String>(
                  hint: l.fieldGear,
                  value: _gearType,
                  errorText: _errors['gear_type'],
                  emptyLabel: l.notSet,
                  options: [
                    for (final gear in lookups.gearTypes)
                      if (gear.name != null) SelectOption(value: gear.name!, label: gear.name!),
                    if (_gearType != null && !lookups.gearTypes.any((g) => g.name == _gearType))
                      SelectOption(value: _gearType!, label: _gearType!),
                  ],
                  onChanged: (name) => setState(() => _gearType = name),
                ),
              ),
              FieldLabel(
                label: l.fieldLicense,
                child: TextField(
                  controller: _license,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: _editing ? null : boat?.license?.number,
                    hintTextDirection: TextDirection.ltr,
                    errorText: _errors['license_number'],
                  ),
                ),
              ),
              FieldLabel(
                label: l.fieldCrewCount,
                child: _NumberField(
                  controller: _crewCount,
                  error: _errors['crew_count'],
                  hint: _editing || boat == null ? null : '${boat.crewCount}',
                ),
              ),
            ],
          ),
          const SizedBox(height: Hud.gap),
          _Section(
            title: l.fieldNotes,
            icon: Icons.notes_outlined,
            children: [
              TextField(
                controller: _notes,
                minLines: 2,
                maxLines: 5,
                decoration: InputDecoration(errorText: _errors['notes']),
              ),
            ],
          ),
          const SizedBox(height: Hud.gutter),
        ],
      ),
    );
  }

  List<SelectOption<int>> _portOptions(List<Port> ports) => [
    for (final port in ports) SelectOption(value: port.id, label: port.name, detail: port.governorate?.name),
  ];
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.icon, required this.children});

  final String title;
  final IconData icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => HudCard(
    padding: const EdgeInsets.fromLTRB(14, 8, 14, 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHead(title: title, icon: icon),
        const SizedBox(height: 8),
        for (var i = 0; i < children.length; i++) ...[if (i > 0) const SizedBox(height: 14), children[i]],
      ],
    ),
  );
}

class _NumberField extends StatelessWidget {
  const _NumberField({required this.controller, this.error, this.hint});

  final TextEditingController controller;
  final String? error;
  final String? hint;

  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    keyboardType: TextInputType.number,
    textDirection: TextDirection.ltr,
    textAlign: TextAlign.right,
    inputFormatters: [IntegerInputFormatter()],
    decoration: InputDecoration(errorText: error, hintText: hint, hintTextDirection: TextDirection.ltr),
  );
}

class _SetupNote extends StatelessWidget {
  const _SetupNote({required this.setup});

  final BoatSetup setup;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final items = [...setup.missing, ...setup.warnings];
    return _Note(
      tone: setup.ready ? Tone.info : Tone.warning,
      title: setup.ready ? l.setupWarnings : l.setupNotReady,
      message: [...items.map((i) => '• ${i.label}'), if (!setup.ready) l.setupAdvisory].join('\n'),
    );
  }
}

class _Note extends StatelessWidget {
  const _Note({required this.message, this.title, this.tone = Tone.info});

  final String? title;
  final String message;
  final Tone tone;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: c.tone(tone).withValues(alpha: .07),
        border: Border.all(color: c.tone(tone).withValues(alpha: .35)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, size: 18, color: c.toneText(tone)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null) ...[
                  Text(title!, style: text.labelLarge?.copyWith(color: c.toneText(tone))),
                  const SizedBox(height: 4),
                ],
                Text(message, style: text.bodyMedium?.copyWith(height: 1.6)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
