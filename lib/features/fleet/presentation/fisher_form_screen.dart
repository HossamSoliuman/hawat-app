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
import '../../lookups/data/lookups.dart';
import '../../lookups/data/lookups_repository.dart';
import '../data/fleet.dart';
import '../data/fleet_providers.dart';

/// Add or edit a captain or crew member. The photo is set on their screen
/// once saved. An edit carries `version`, so a stale form gets a 409.
class FisherFormScreen extends ConsumerStatefulWidget {
  const FisherFormScreen({super.key, required this.kind, this.id, this.boatId});

  final FisherKind kind;
  final int? id;

  /// The boat to put a new crew member on (from the boat's setup card).
  final int? boatId;

  @override
  ConsumerState<FisherFormScreen> createState() => _FisherFormScreenState();
}

class _FisherFormScreenState extends ConsumerState<FisherFormScreen> with FormSubmit {
  final _name = TextEditingController();
  final _nationalId = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  final _nationality = TextEditingController();
  final _experience = TextEditingController();
  final _license = TextEditingController();
  final _idempotencyKey = ApiClient.newIdempotencyKey();

  int? _idTypeId;
  int? _roleId;
  late int? _boatId = widget.boatId;
  int? _portId;
  DateTime? _iqamaIssue;
  DateTime? _iqamaExpiry;
  DateTime? _licenseDate;
  DateTime? _licenseExpiry;
  String _status = Fisher.statusActive;
  int? _version;
  bool _filled = false;
  bool _reloading = false;

  bool get _editing => widget.id != null;

  bool get _crew => widget.kind == FisherKind.crew;

  @override
  void dispose() {
    for (final c in [_name, _nationalId, _phone, _email, _nationality, _experience, _license]) {
      c.dispose();
    }
    super.dispose();
  }

  void _fill(Fisher f) {
    _filled = true;
    _name.text = f.name;
    _nationalId.text = f.nationalId ?? '';
    _phone.text = f.phone ?? '';
    _email.text = f.email ?? '';
    _nationality.text = f.nationality ?? '';
    _experience.text = f.experienceYears > 0 ? '${f.experienceYears}' : '';
    _license.text = f.licenseNumber ?? '';
    _idTypeId = f.idType?.id;
    _roleId = f.role?.id;
    _boatId = f.boat?.id;
    _portId = f.port?.id;
    _iqamaIssue = f.iqamaIssueDate;
    _iqamaExpiry = f.iqamaExpiryDate;
    _licenseDate = f.licenseDate;
    _licenseExpiry = f.licenseExpiry;
    _status = f.status ?? Fisher.statusActive;
    _version = f.version;
  }

  Future<void> _reload() async {
    setState(() => _reloading = true);
    try {
      final fisher = await ref.refresh(fisherDetailProvider(widget.kind, widget.id!).future);
      if (!mounted) return;
      setState(() {
        _fill(fisher);
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
    'national_id': Body.text(_nationalId.text),
    'phone': Body.text(_phone.text),
    'email': Body.text(_email.text),
    'nationality': Body.text(_nationality.text),
    'experience_years': Body.integer(_experience.text),
    'id_type_id': _idTypeId,
    if (_crew) 'fisher_role_id': _roleId,
    'boat_id': _boatId,
    'port_id': _portId,
    'iqama_issue_date': Body.date(_iqamaIssue),
    'iqama_expiry_date': Body.date(_iqamaExpiry),
    'license_number': Body.text(_license.text),
    'license_date': Body.date(_licenseDate),
    'license_expiry': Body.date(_licenseExpiry),
    'status': _status,
    'version': ?_version,
  };

  static const _fields = [
    'name',
    'national_id',
    'phone',
    'email',
    'nationality',
    'experience_years',
    'id_type_id',
    'fisher_role_id',
    'boat_id',
    'port_id',
    'iqama_issue_date',
    'iqama_expiry_date',
    'license_number',
    'license_date',
    'license_expiry',
    'status',
  ];

  Future<void> _save() async {
    final l = context.l10n;
    final phone = _phone.text.trim();
    final email = _email.text.trim();
    bool before(DateTime? end, DateTime? start) => start != null && end != null && end.isBefore(start);
    Fisher? saved;
    final ok = await submit(
      () async => saved = await ref
          .read(fleetActionsProvider)
          .saveFisher(widget.kind, widget.id, _body(), idempotencyKey: _idempotencyKey),
      fields: _fields,
      local: {
        if (_name.text.trim().isEmpty) 'name': l.nameRequired,
        if (_nationalId.text.trim().isEmpty) 'national_id': l.nationalIdRequired,
        if (phone.isNotEmpty && !Phone.isValid(phone)) 'phone': l.phoneInvalid,
        if (email.isNotEmpty && !email.contains('@')) 'email': l.emailInvalid,
        if (_boatId == null && _portId == null) 'port_id': l.portOrBoatRequired,
        if (before(_iqamaExpiry, _iqamaIssue)) 'iqama_expiry_date': l.expiryBeforeStart,
        if (before(_licenseExpiry, _licenseDate)) 'license_expiry': l.expiryBeforeStart,
      },
    );
    if (!ok || !mounted) return;
    showSnack(context, l.savedDone);
    if (_editing) {
      popOr(context, Routes.fisher(widget.kind, widget.id!));
    } else {
      context.pushReplacement(Routes.fisher(widget.kind, saved!.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final title = switch ((_crew, _editing)) {
      (true, true) => l.editCrewMember,
      (true, false) => l.newCrewMember,
      (false, true) => l.editCaptain,
      (false, false) => l.newCaptain,
    };

    if (_editing) {
      final fisher = ref.watch(fisherDetailProvider(widget.kind, widget.id!));
      if (!_filled) {
        return Scaffold(
          appBar: AppBar(title: Text(title)),
          body: fisher.when(
            loading: () => const Skeleton(
              child: Padding(padding: EdgeInsets.all(Hud.gutter), child: SkeletonBox(height: 420)),
            ),
            error: (e, _) =>
                ErrorState(error: e, onRetry: () => ref.invalidate(fisherDetailProvider(widget.kind, widget.id!))),
            data: (fisher) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted && !_filled) setState(() => _fill(fisher));
              });
              return const SizedBox.shrink();
            },
          ),
        );
      }
    }

    final lookups = ref.watch(lookupsControllerProvider).value ?? const Lookups();
    final boats = ref.watch(ownerBoatsProvider).value ?? const <Boat>[];

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
            icon: Icons.person_outline,
            children: [
              FieldLabel(
                label: l.nameLabel,
                required: true,
                child: FormText(controller: _name, error: errors['name'], onChanged: (_) => clearError('name')),
              ),
              FieldLabel(
                label: l.nationalIdLabel,
                required: true,
                child: FormText(
                  controller: _nationalId,
                  ltr: true,
                  keyboardType: TextInputType.number,
                  error: errors['national_id'],
                  onChanged: (_) => clearError('national_id'),
                ),
              ),
              FieldLabel(
                label: l.idTypeLabel,
                child: LookupSelect(
                  items: lookups.idTypes,
                  value: _idTypeId,
                  error: errors['id_type_id'],
                  onChanged: (id) => setState(() => _idTypeId = id),
                ),
              ),
              if (_crew)
                FieldLabel(
                  label: l.crewRoleLabel,
                  child: LookupSelect(
                    items: lookups.fisherRoles,
                    value: _roleId,
                    error: errors['fisher_role_id'],
                    onChanged: (id) => setState(() => _roleId = id),
                  ),
                ),
              FieldPair(
                FieldLabel(
                  label: l.nationalityLabel,
                  child: FormText(controller: _nationality, error: errors['nationality']),
                ),
                FieldLabel(
                  label: l.experienceLabel,
                  child: NumberField(controller: _experience, error: errors['experience_years']),
                ),
              ),
              FieldLabel(
                label: l.phoneLabel,
                child: TextField(
                  controller: _phone,
                  keyboardType: TextInputType.phone,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.right,
                  inputFormatters: [PhoneInputFormatter()],
                  onChanged: (_) => clearError('phone'),
                  decoration: InputDecoration(
                    hintText: l.phoneHint,
                    hintTextDirection: TextDirection.ltr,
                    errorText: errors['phone'],
                  ),
                ),
              ),
              FieldLabel(
                label: l.emailLabel,
                child: FormText(
                  controller: _email,
                  ltr: true,
                  keyboardType: TextInputType.emailAddress,
                  error: errors['email'],
                ),
              ),
              FieldLabel(
                label: l.statusLabel,
                child: ChoiceRow<String>(
                  options: Fisher.statuses,
                  value: _status,
                  onChanged: (s) => setState(() => _status = s),
                ),
              ),
            ],
          ),
          const SizedBox(height: Hud.gap),
          FormSection(
            title: l.sectionAssignment,
            icon: Icons.directions_boat_outlined,
            children: [
              FieldLabel(
                label: l.fieldBoat,
                child: SearchSelect<int>(
                  hint: l.chooseBoat,
                  value: _boatId,
                  emptyLabel: l.noBoat,
                  errorText: errors['boat_id'],
                  options: [for (final b in boats) SelectOption(value: b.id, label: b.name, detail: b.boatNumber)],
                  onChanged: (id) => setState(() {
                    _boatId = id;
                    errors = {...errors}..remove('port_id');
                  }),
                ),
              ),
              FieldLabel(
                label: l.portLabel,
                required: _boatId == null,
                child: SearchSelect<int>(
                  hint: _boatId == null ? l.choosePort : l.portOfBoat,
                  value: _portId,
                  emptyLabel: _boatId == null ? null : l.portOfBoat,
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
            ],
          ),
          const SizedBox(height: Hud.gap),
          FormSection(
            title: l.sectionDocuments,
            icon: Icons.event_note_outlined,
            children: [
              FieldPair(
                FieldLabel(
                  label: l.iqamaIssueLabel,
                  child: DateField(
                    value: _iqamaIssue,
                    error: errors['iqama_issue_date'],
                    onChanged: (d) => setState(() => _iqamaIssue = d),
                  ),
                ),
                FieldLabel(
                  label: l.iqamaExpiryLabel,
                  child: DateField(
                    value: _iqamaExpiry,
                    error: errors['iqama_expiry_date'],
                    onChanged: (d) => setState(() {
                      _iqamaExpiry = d;
                      errors = {...errors}..remove('iqama_expiry_date');
                    }),
                  ),
                ),
              ),
              FieldLabel(
                label: l.fishingLicenseLabel,
                child: FormText(controller: _license, ltr: true, error: errors['license_number']),
              ),
              FieldPair(
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
              ),
            ],
          ),
          const SizedBox(height: Hud.gutter),
        ],
      ),
    );
  }
}
