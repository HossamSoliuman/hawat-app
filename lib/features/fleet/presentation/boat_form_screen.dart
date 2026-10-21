import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/api/api_client.dart';
import '../../../core/api/resource_repository.dart';
import '../../../core/format/format.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/actions.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/form_section.dart';
import '../../../core/widgets/states.dart';
import '../../../core/widgets/status_chip.dart';
import '../../lookups/data/lookups.dart';
import '../../lookups/data/lookups_repository.dart';
import '../data/fleet.dart';
import '../data/fleet_providers.dart';
import 'fleet_ui.dart';

/// Add or edit a boat in the portal's three sections: التعريف, المواصفات,
/// الرخصة. An edit carries the `version` it was filled from, so a change made
/// on another device in between is caught (409) instead of overwritten.
class BoatFormScreen extends ConsumerStatefulWidget {
  const BoatFormScreen({super.key, this.id});

  final int? id;

  @override
  ConsumerState<BoatFormScreen> createState() => _BoatFormScreenState();
}

class _BoatFormScreenState extends ConsumerState<BoatFormScreen> with FormSubmit {
  final _name = TextEditingController();
  final _nameEn = TextEditingController();
  final _number = TextEditingController();
  final _length = TextEditingController();
  final _width = TextEditingController();
  final _color = TextEditingController();
  final _hull = TextEditingController();
  final _bodyType = TextEditingController();
  final _serial = TextEditingController();
  final _engineType = TextEditingController();
  final _enginePower = TextEditingController();
  final _engineStatus = TextEditingController();
  final _callSign = TextEditingController();
  final _capacity = TextEditingController();
  final _crewCapacity = TextEditingController();
  final _licenseType = TextEditingController();
  final _licenseNumber = TextEditingController();
  final _licenseProcess = TextEditingController();
  final _licenseArea = TextEditingController();
  final _idempotencyKey = ApiClient.newIdempotencyKey();

  int? _portId;
  int? _categoryId;
  int? _typeId;
  int? _captainId;
  String _status = Boat.statusActive;
  String? _licenseStatus;
  DateTime? _licenseDate;
  DateTime? _licenseExpiry;
  DateTime? _nextInspection;
  int? _version;
  bool _filled = false;
  bool _reloading = false;

  bool get _editing => widget.id != null;

  List<TextEditingController> get _controllers => [
    _name,
    _nameEn,
    _number,
    _length,
    _width,
    _color,
    _hull,
    _bodyType,
    _serial,
    _engineType,
    _enginePower,
    _engineStatus,
    _callSign,
    _capacity,
    _crewCapacity,
    _licenseType,
    _licenseNumber,
    _licenseProcess,
    _licenseArea,
  ];

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _fill(Boat boat) {
    _filled = true;
    String num(double? v) => v == null ? '' : Fmt.plain(v);
    final license = boat.license ?? const BoatLicense();
    _name.text = boat.name;
    _nameEn.text = boat.nameEn ?? '';
    _number.text = boat.boatNumber ?? '';
    _length.text = num(boat.lengthM);
    _width.text = num(boat.widthM);
    _color.text = boat.color ?? '';
    _hull.text = boat.hullNumber ?? '';
    _bodyType.text = boat.bodyType ?? '';
    _serial.text = boat.serialNumber ?? '';
    _engineType.text = boat.engineType ?? '';
    _enginePower.text = boat.enginePower ?? '';
    _engineStatus.text = boat.engineStatus ?? '';
    _callSign.text = boat.callSign ?? '';
    _capacity.text = num(boat.capacity);
    _crewCapacity.text = boat.crewCapacity?.toString() ?? '';
    _licenseType.text = license.type ?? '';
    _licenseNumber.text = license.number ?? '';
    _licenseProcess.text = license.process ?? '';
    _licenseArea.text = license.area ?? '';
    _portId = boat.port?.id;
    _categoryId = boat.category?.id;
    _typeId = boat.type?.id;
    _captainId = boat.captain?.id;
    _status = boat.status ?? Boat.statusActive;
    _licenseStatus = license.status;
    _licenseDate = license.date;
    _licenseExpiry = license.expiry;
    _nextInspection = boat.nextInspectionDate;
    _version = boat.version;
  }

  /// The record as it is now on the server; what was typed is replaced.
  Future<void> _reload() async {
    setState(() => _reloading = true);
    try {
      final boat = await ref.refresh(boatDetailProvider(widget.id!).future);
      if (!mounted) return;
      setState(() {
        _fill(boat);
        conflict = false;
        errors = const {};
      });
    } catch (_) {
      // The banner stays; the owner can try again.
    } finally {
      if (mounted) setState(() => _reloading = false);
    }
  }

  Json _body() => {
    'name': Body.text(_name.text),
    'name_en': Body.text(_nameEn.text),
    'boat_number': Body.text(_number.text),
    'port_id': _portId,
    'boat_category_id': _categoryId,
    'boat_type_id': _typeId,
    'captain_id': _captainId,
    'status': _status,
    'length_m': Body.number(_length.text),
    'width_m': Body.number(_width.text),
    'color': Body.text(_color.text),
    'hull_number': Body.text(_hull.text),
    'body_type': Body.text(_bodyType.text),
    'serial_number': Body.text(_serial.text),
    'engine_type': Body.text(_engineType.text),
    'engine_power': Body.text(_enginePower.text),
    'engine_status': Body.text(_engineStatus.text),
    'call_sign': Body.text(_callSign.text),
    'capacity': Body.number(_capacity.text),
    'crew_capacity': Body.integer(_crewCapacity.text),
    'next_inspection_date': Body.date(_nextInspection),
    'license_type': Body.text(_licenseType.text),
    'license_number': Body.text(_licenseNumber.text),
    'license_status': _licenseStatus,
    'license_process': Body.text(_licenseProcess.text),
    'license_area': Body.text(_licenseArea.text),
    'license_date': Body.date(_licenseDate),
    'license_expiry': Body.date(_licenseExpiry),
    'version': ?_version,
  };

  static const _fields = [
    'name',
    'name_en',
    'boat_number',
    'port_id',
    'boat_category_id',
    'boat_type_id',
    'captain_id',
    'status',
    'length_m',
    'width_m',
    'color',
    'hull_number',
    'body_type',
    'serial_number',
    'engine_type',
    'engine_power',
    'engine_status',
    'call_sign',
    'capacity',
    'crew_capacity',
    'next_inspection_date',
    'license_type',
    'license_number',
    'license_status',
    'license_process',
    'license_area',
    'license_date',
    'license_expiry',
  ];

  Future<void> _save() async {
    final l = context.l10n;
    Boat? saved;
    final ok = await submit(
      () async =>
          saved = await ref.read(fleetActionsProvider).saveBoat(widget.id, _body(), idempotencyKey: _idempotencyKey),
      fields: _fields,
      local: {
        if (_name.text.trim().isEmpty) 'name': l.nameRequired,
        if (_number.text.trim().isEmpty) 'boat_number': l.boatNumberRequired,
        if (_portId == null) 'port_id': l.portRequired,
        if (_licenseDate != null && _licenseExpiry != null && _licenseExpiry!.isBefore(_licenseDate!))
          'license_expiry': l.expiryBeforeStart,
      },
    );
    if (!ok || !mounted) return;
    showSnack(context, l.savedDone);
    if (_editing) {
      popOr(context, Routes.boat(widget.id!));
    } else {
      context.pushReplacement(Routes.boat(saved!.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final title = _editing ? l.editBoat : l.newBoat;

    if (_editing) {
      // Watched for as long as the form is open, so a reload after a 409 reads it fresh.
      final boat = ref.watch(boatDetailProvider(widget.id!));
      if (!_filled) {
        return Scaffold(
          appBar: AppBar(title: Text(title)),
          body: boat.when(
            loading: () => const Skeleton(
              child: Padding(padding: EdgeInsets.all(Hud.gutter), child: SkeletonBox(height: 420)),
            ),
            error: (e, _) => ErrorState(error: e, onRetry: () => ref.invalidate(boatDetailProvider(widget.id!))),
            data: (boat) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted && !_filled) setState(() => _fill(boat));
              });
              return const SizedBox.shrink();
            },
          ),
        );
      }
    }

    final lookups = ref.watch(lookupsControllerProvider).value ?? const Lookups();
    final captains = ref.watch(ownerCaptainsProvider).value ?? const <Fisher>[];
    final atSea = _status == Boat.statusAtSea;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      bottomNavigationBar: PinnedAction(
        child: PrimaryButton(label: l.save, busy: busy, onPressed: _save),
      ),
      body: ListView(
        padding: const EdgeInsets.all(Hud.gutter),
        children: [
          if (conflict) ...[ConflictBanner(onReload: _reload, busy: _reloading), const SizedBox(height: Hud.gap)],
          FormSection(
            title: l.sectionIdentity,
            icon: Icons.directions_boat_outlined,
            children: [
              FieldLabel(
                label: l.boatNameLabel,
                required: true,
                child: FormText(controller: _name, error: errors['name'], onChanged: (_) => clearError('name')),
              ),
              FieldLabel(
                label: l.boatNumberLabel,
                required: true,
                child: FormText(
                  controller: _number,
                  ltr: true,
                  error: errors['boat_number'],
                  onChanged: (_) => clearError('boat_number'),
                ),
              ),
              FieldLabel(
                label: l.fieldNameEn,
                child: FormText(controller: _nameEn, ltr: true, error: errors['name_en']),
              ),
              FieldLabel(
                label: l.portLabel,
                required: true,
                child: SearchSelect<int>(
                  hint: l.choosePort,
                  value: _portId,
                  errorText: errors['port_id'],
                  options: [
                    for (final p in lookups.ports)
                      SelectOption(value: p.id, label: p.name, detail: p.governorate?.name),
                  ],
                  onChanged: (id) => setState(() {
                    _portId = id;
                    errors = {...errors}..remove('port_id');
                  }),
                ),
              ),
              FieldLabel(
                label: l.fieldCategory,
                child: LookupSelect(
                  items: lookups.boatCategories,
                  value: _categoryId,
                  error: errors['boat_category_id'],
                  onChanged: (id) => setState(() => _categoryId = id),
                ),
              ),
              FieldLabel(
                label: l.fieldBoatType,
                child: LookupSelect(
                  items: lookups.boatTypes,
                  value: _typeId,
                  error: errors['boat_type_id'],
                  onChanged: (id) => setState(() => _typeId = id),
                ),
              ),
              FieldLabel(
                label: l.fieldCaptain,
                child: SearchSelect<int>(
                  hint: l.fieldCaptain,
                  value: _captainId,
                  emptyLabel: l.noCaptain,
                  errorText: errors['captain_id'],
                  options: [
                    for (final captain in captains)
                      SelectOption(
                        value: captain.id,
                        label: captain.name,
                        detail: captain.boat?.name,
                        trailing: captain.isActive ? null : StatusChip(label: captain.status ?? '', dense: true),
                      ),
                  ],
                  onChanged: (id) => setState(() => _captainId = id),
                ),
              ),
              FieldLabel(
                label: l.statusLabel,
                child: atSea
                    ? Row(
                        children: [
                          StatusChip(label: Boat.statusAtSea, tone: boatStatusTone(Boat.statusAtSea)),
                          const SizedBox(width: 10),
                          Expanded(child: Text(l.statusSetByTrips, style: Theme.of(context).textTheme.bodySmall)),
                        ],
                      )
                    : ChoiceRow<String>(
                        options: Boat.editableStatuses,
                        value: _status,
                        onChanged: (s) => setState(() => _status = s),
                      ),
              ),
              if (errors['status'] != null) FieldError(errors['status']!),
            ],
          ),
          const SizedBox(height: Hud.gap),
          FormSection(
            title: l.sectionSpecs,
            icon: Icons.straighten_outlined,
            children: [
              FieldPair(
                FieldLabel(
                  label: l.fieldLength,
                  child: NumberField(controller: _length, decimal: true, error: errors['length_m']),
                ),
                FieldLabel(
                  label: l.fieldWidth,
                  child: NumberField(controller: _width, decimal: true, error: errors['width_m']),
                ),
              ),
              FieldPair(
                FieldLabel(
                  label: l.fieldCapacity,
                  child: NumberField(controller: _capacity, decimal: true, error: errors['capacity']),
                ),
                FieldLabel(
                  label: l.fieldCrewCapacity,
                  child: NumberField(controller: _crewCapacity, error: errors['crew_capacity']),
                ),
              ),
              FieldLabel(
                label: l.fieldColor,
                child: FormText(controller: _color, error: errors['color']),
              ),
              FieldLabel(
                label: l.fieldHull,
                child: FormText(controller: _hull, ltr: true, error: errors['hull_number']),
              ),
              FieldLabel(
                label: l.fieldBodyType,
                child: FormText(controller: _bodyType, error: errors['body_type']),
              ),
              FieldLabel(
                label: l.fieldSerial,
                child: FormText(controller: _serial, ltr: true, error: errors['serial_number']),
              ),
              FieldLabel(
                label: l.fieldEngineType,
                child: FormText(controller: _engineType, error: errors['engine_type']),
              ),
              FieldPair(
                FieldLabel(
                  label: l.fieldEnginePower,
                  child: FormText(controller: _enginePower, ltr: true, error: errors['engine_power']),
                ),
                FieldLabel(
                  label: l.fieldEngineStatus,
                  child: FormText(controller: _engineStatus, error: errors['engine_status']),
                ),
              ),
              FieldLabel(
                label: l.fieldCallSign,
                child: FormText(controller: _callSign, ltr: true, error: errors['call_sign']),
              ),
              FieldLabel(
                label: l.fieldNextInspection,
                child: DateField(
                  value: _nextInspection,
                  error: errors['next_inspection_date'],
                  onChanged: (d) => setState(() => _nextInspection = d),
                ),
              ),
            ],
          ),
          const SizedBox(height: Hud.gap),
          FormSection(
            title: l.sectionLicense,
            icon: Icons.badge_outlined,
            children: [
              FieldLabel(
                label: l.fieldLicense,
                child: FormText(controller: _licenseNumber, ltr: true, error: errors['license_number']),
              ),
              FieldLabel(
                label: l.fieldLicenseType,
                child: FormText(controller: _licenseType, error: errors['license_type']),
              ),
              FieldLabel(
                label: l.fieldLicenseStatus,
                child: ChoiceRow<String>(
                  options: Boat.licenseStatuses,
                  value: _licenseStatus,
                  onChanged: (s) => setState(() => _licenseStatus = s),
                ),
              ),
              FieldLabel(
                label: l.fieldLicenseProcess,
                child: FormText(controller: _licenseProcess, error: errors['license_process']),
              ),
              FieldLabel(
                label: l.fieldLicenseArea,
                child: FormText(controller: _licenseArea, error: errors['license_area']),
              ),
              FieldLabel(
                label: l.fieldLicenseDate,
                child: DateField(
                  value: _licenseDate,
                  error: errors['license_date'],
                  onChanged: (d) => setState(() => _licenseDate = d),
                ),
              ),
              FieldLabel(
                label: l.fieldLicenseExpiry,
                child: DateField(
                  value: _licenseExpiry,
                  error: errors['license_expiry'],
                  onChanged: (d) => setState(() {
                    _licenseExpiry = d;
                    errors = {...errors}..remove('license_expiry');
                  }),
                ),
              ),
            ],
          ),
          const SizedBox(height: Hud.gutter),
        ],
      ),
    );
  }
}
