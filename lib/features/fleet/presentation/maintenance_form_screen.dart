import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/router.dart';
import '../../../core/api/api_client.dart';
import '../../../core/api/resource_repository.dart';
import '../../../core/format/format.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/action_sheet.dart';
import '../../../core/widgets/actions.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/form_section.dart';
import '../../../core/widgets/ltr_text.dart';
import '../../lookups/data/lookups.dart';
import '../../lookups/data/lookups_repository.dart';
import '../data/fleet.dart';
import '../data/fleet_providers.dart';

/// Add or edit a maintenance record. The server has no single-record read, so
/// an edit gets the row from the list it was opened from.
class MaintenanceFormScreen extends ConsumerStatefulWidget {
  const MaintenanceFormScreen({super.key, this.record, this.boatId});

  final Maintenance? record;
  final int? boatId;

  @override
  ConsumerState<MaintenanceFormScreen> createState() => _MaintenanceFormScreenState();
}

class _MaintenanceFormScreenState extends ConsumerState<MaintenanceFormScreen> with FormSubmit {
  late final Maintenance? _record = widget.record;
  late final _technician = TextEditingController(text: _record?.technician ?? '');
  late final _estimated = TextEditingController(text: _plain(_record?.estimatedCost));
  late final _actual = TextEditingController(text: _plain(_record?.actualCost));
  late final _description = TextEditingController(text: _record?.description ?? '');
  final _idempotencyKey = ApiClient.newIdempotencyKey();

  late int? _boatId = _record?.boat?.id ?? widget.boatId;
  late int? _typeId = _record?.type?.id;
  late DateTime? _date = _record?.date ?? DateUtils.dateOnly(DateTime.now());
  late String _status = _record?.status ?? Maintenance.statuses.first;

  static String _plain(double? v) => v == null ? '' : Fmt.plain(v);

  bool get _editing => _record != null;

  @override
  void dispose() {
    for (final c in [_technician, _estimated, _actual, _description]) {
      c.dispose();
    }
    super.dispose();
  }

  Json _body() => {
    'boat_id': _boatId,
    'maintenance_type_id': _typeId,
    'date': Body.date(_date),
    'technician': Body.text(_technician.text),
    'estimated_cost': Body.number(_estimated.text),
    'actual_cost': Body.number(_actual.text),
    'description': Body.text(_description.text),
    'status': _status,
  };

  static const _fields = [
    'boat_id',
    'maintenance_type_id',
    'date',
    'technician',
    'estimated_cost',
    'actual_cost',
    'description',
    'status',
  ];

  Future<void> _save() async {
    final l = context.l10n;
    final ok = await submit(
      () => ref.read(fleetActionsProvider).saveMaintenance(_record?.id, _body(), idempotencyKey: _idempotencyKey),
      fields: _fields,
      local: {if (_boatId == null) 'boat_id': l.boatRequired, if (_date == null) 'date': l.dateRequired},
    );
    if (!ok || !mounted) return;
    showSnack(context, l.savedDone);
    popOr(context, Routes.maintenance());
  }

  Future<void> _delete() async {
    final l = context.l10n;
    final done = await showActionSheet(
      context,
      title: l.deleteMaintenanceTitle,
      body: l.deleteBody,
      confirm: l.deleteAction,
      danger: true,
      run: (_) => ref.read(fleetActionsProvider).deleteMaintenance(_record!.id),
    );
    if (!done || !mounted) return;
    showSnack(context, l.deletedDone);
    popOr(context, Routes.maintenance());
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final lookups = ref.watch(lookupsControllerProvider).value ?? const Lookups();
    final boats = ref.watch(ownerBoatsProvider).value ?? const <Boat>[];
    final expense = _record?.expense;

    return Scaffold(
      appBar: AppBar(
        title: Text(_editing ? l.editMaintenance : l.newMaintenance),
        actions: [
          if (_editing) IconButton(tooltip: l.deleteAction, icon: const Icon(Icons.delete_outline), onPressed: _delete),
          const SizedBox(width: 4),
        ],
      ),
      bottomNavigationBar: PinnedAction(
        child: PrimaryButton(label: l.save, busy: busy, onPressed: _save),
      ),
      body: ListView(
        padding: const EdgeInsets.all(Hud.gutter),
        children: [
          FormSection(
            title: l.maintenanceTitle,
            icon: Icons.build_outlined,
            children: [
              FieldLabel(
                label: l.fieldBoat,
                required: true,
                child: SearchSelect<int>(
                  hint: l.chooseBoat,
                  value: _boatId,
                  errorText: errors['boat_id'],
                  options: [for (final b in boats) SelectOption(value: b.id, label: b.name, detail: b.boatNumber)],
                  onChanged: (id) => setState(() {
                    _boatId = id;
                    errors = {...errors}..remove('boat_id');
                  }),
                ),
              ),
              FieldLabel(
                label: l.maintenanceTypeLabel,
                child: LookupSelect(
                  items: lookups.maintenanceTypes,
                  value: _typeId,
                  error: errors['maintenance_type_id'],
                  onChanged: (id) => setState(() => _typeId = id),
                ),
              ),
              FieldLabel(
                label: l.dateLabel,
                required: true,
                child: DateField(
                  value: _date,
                  error: errors['date'],
                  onChanged: (d) => setState(() {
                    _date = d;
                    errors = {...errors}..remove('date');
                  }),
                ),
              ),
              FieldLabel(
                label: l.technicianLabel,
                child: FormText(controller: _technician, error: errors['technician']),
              ),
              FieldPair(
                FieldLabel(
                  label: l.estimatedCostLabel,
                  child: NumberField(controller: _estimated, decimal: true, error: errors['estimated_cost']),
                ),
                FieldLabel(
                  label: l.actualCostLabel,
                  child: NumberField(controller: _actual, decimal: true, error: errors['actual_cost']),
                ),
              ),
              FieldLabel(
                label: l.statusLabel,
                child: ChoiceRow<String>(
                  options: Maintenance.statuses,
                  value: _status,
                  onChanged: (s) => setState(() => _status = s),
                ),
              ),
              if (errors['status'] != null) FieldError(errors['status']!),
              FieldLabel(
                label: l.descriptionLabel,
                child: FormText(controller: _description, maxLines: 4, error: errors['description']),
              ),
            ],
          ),
          if (expense != null) ...[
            const SizedBox(height: Hud.gap),
            _ExpenseNote(expense: expense),
          ] else if (_status == Maintenance.statuses[1]) ...[
            const SizedBox(height: Hud.gap),
            Text(l.maintenanceExpenseHint, style: Theme.of(context).textTheme.bodySmall),
          ],
          const SizedBox(height: Hud.gutter),
        ],
      ),
    );
  }
}

/// The expense the server posted from this record when it was completed.
class _ExpenseNote extends StatelessWidget {
  const _ExpenseNote({required this.expense});

  final MaintenanceExpense expense;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: c.info.withValues(alpha: .07),
        border: Border.all(color: c.info.withValues(alpha: .35)),
      ),
      child: Row(
        children: [
          Icon(Icons.receipt_long_outlined, size: 20, color: c.toneText(Tone.info)),
          const SizedBox(width: 10),
          Expanded(child: Text(l.maintenanceExpensePosted, style: text.bodyMedium)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (expense.expenseNumber != null) LtrText(expense.expenseNumber!, style: text.bodySmall),
              Text(l.sar(expense.total), style: text.labelLarge),
            ],
          ),
        ],
      ),
    );
  }
}
