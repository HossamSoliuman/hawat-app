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
import '../../../core/widgets/states.dart';
import '../../lookups/data/lookups.dart';
import '../../lookups/data/lookups_repository.dart';
import '../data/customer.dart';
import '../data/customers_repository.dart';
import 'contacts_screens.dart';

/// Add or edit a customer, vendor or employee. Editing opens straight from
/// the list row, and delete sits in the app bar.
class ContactFormScreen extends ConsumerStatefulWidget {
  const ContactFormScreen({super.key, required this.kind, this.id});

  final ContactKind kind;
  final int? id;

  @override
  ConsumerState<ContactFormScreen> createState() => _ContactFormScreenState();
}

class _ContactFormScreenState extends ConsumerState<ContactFormScreen> with FormSubmit {
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  final _idNumber = TextEditingController();
  final _nationality = TextEditingController();
  final _notes = TextEditingController();
  final _idempotencyKey = ApiClient.newIdempotencyKey();

  int? _typeId;
  String _status = contactStatuses.first;
  String _shownName = '';
  bool _filled = false;

  bool get _editing => widget.id != null;

  ContactKind get _kind => widget.kind;

  @override
  void dispose() {
    for (final c in [_name, _phone, _email, _idNumber, _nationality, _notes]) {
      c.dispose();
    }
    super.dispose();
  }

  void _fill(Object record) {
    _filled = true;
    switch (record) {
      case final Customer c:
        _set(c.name, c.phone, c.email, c.notes, c.status);
        _typeId = c.type?.id;
      case final Vendor v:
        _set(v.name, v.phone, v.email, v.notes, v.status);
      case final Employee e:
        _set(e.name, e.phone, e.email, e.notes, e.status);
        _typeId = e.jobTitle?.id;
        _idNumber.text = e.idNumber ?? '';
        _nationality.text = e.nationality ?? '';
    }
  }

  void _set(String name, String? phone, String? email, String? notes, String? status) {
    _shownName = name;
    _name.text = name;
    _phone.text = phone ?? '';
    _email.text = email ?? '';
    _notes.text = notes ?? '';
    _status = status ?? contactStatuses.first;
  }

  Json _body() => {
    'name': Body.text(_name.text),
    'phone': Body.text(_phone.text),
    'email': Body.text(_email.text),
    'notes': Body.text(_notes.text),
    'status': _status,
    if (_kind == ContactKind.customer) 'customer_type_id': _typeId,
    if (_kind == ContactKind.employee) ...{
      'job_title_id': _typeId,
      'id_number': Body.text(_idNumber.text),
      'nationality': Body.text(_nationality.text),
    },
  };

  static const _fields = [
    'name',
    'phone',
    'email',
    'notes',
    'status',
    'customer_type_id',
    'job_title_id',
    'id_number',
    'nationality',
  ];

  Future<void> _save() async {
    final l = context.l10n;
    final phone = _phone.text.trim();
    final email = _email.text.trim();
    final ok = await submit(
      () async {
        final actions = ref.read(contactActionsProvider);
        final body = _body();
        switch (_kind) {
          case ContactKind.customer:
            await actions.saveCustomer(widget.id, body, idempotencyKey: _idempotencyKey);
          case ContactKind.vendor:
            await actions.saveVendor(widget.id, body, idempotencyKey: _idempotencyKey);
          case ContactKind.employee:
            await actions.saveEmployee(widget.id, body, idempotencyKey: _idempotencyKey);
        }
      },
      fields: _fields,
      local: {
        if (_name.text.trim().isEmpty) 'name': l.nameRequired,
        if (phone.isNotEmpty && !Phone.isValid(phone)) 'phone': l.phoneInvalid,
        if (email.isNotEmpty && !email.contains('@')) 'email': l.emailInvalid,
      },
    );
    if (!ok || !mounted) return;
    showSnack(context, l.savedDone);
    popOr(context, Routes.contacts(_kind));
  }

  Future<void> _delete() async {
    final l = context.l10n;
    final actions = ref.read(contactActionsProvider);
    final done = await showActionSheet(
      context,
      title: l.deleteTitle(_shownName),
      body: l.deleteBody,
      confirm: l.deleteAction,
      danger: true,
      run: (_) => switch (_kind) {
        ContactKind.customer => actions.deleteCustomer(widget.id!),
        ContactKind.vendor => actions.deleteVendor(widget.id!),
        ContactKind.employee => actions.deleteEmployee(widget.id!),
      },
    );
    if (!done || !mounted) return;
    showSnack(context, l.deletedDone);
    popOr(context, Routes.contacts(_kind));
  }

  String _title(AppLocalizations l) => switch (_kind) {
    ContactKind.customer => _editing ? l.editCustomer : l.newCustomer,
    ContactKind.vendor => _editing ? l.editVendor : l.newVendor,
    ContactKind.employee => _editing ? l.editEmployee : l.newEmployee,
  };

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;

    if (_editing && !_filled) {
      final AsyncValue<Object> record = switch (_kind) {
        ContactKind.customer => ref.watch(customerDetailProvider(widget.id!)),
        ContactKind.vendor => ref.watch(vendorDetailProvider(widget.id!)),
        ContactKind.employee => ref.watch(employeeDetailProvider(widget.id!)),
      };
      return Scaffold(
        appBar: AppBar(title: Text(_title(l))),
        body: record.when(
          loading: () => const Skeleton(
            child: Padding(padding: EdgeInsets.all(Hud.gutter), child: SkeletonBox(height: 360)),
          ),
          error: (e, _) => ErrorState(
            error: e,
            onRetry: () => ref.invalidate(switch (_kind) {
              ContactKind.customer => customerDetailProvider(widget.id!),
              ContactKind.vendor => vendorDetailProvider(widget.id!),
              ContactKind.employee => employeeDetailProvider(widget.id!),
            }),
          ),
          data: (record) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted && !_filled) setState(() => _fill(record));
            });
            return const SizedBox.shrink();
          },
        ),
      );
    }

    final lookups = ref.watch(lookupsControllerProvider).value ?? const Lookups();
    final types = switch (_kind) {
      ContactKind.customer => lookups.customerTypes,
      ContactKind.employee => lookups.jobTitles,
      ContactKind.vendor => const <Never>[],
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(_title(l)),
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
            title: l.sectionContact,
            icon: Icons.person_outline,
            children: [
              FieldLabel(
                label: l.nameLabel,
                required: true,
                child: FormText(controller: _name, error: errors['name'], onChanged: (_) => clearError('name')),
              ),
              if (_kind != ContactKind.vendor)
                FieldLabel(
                  label: _kind == ContactKind.customer ? l.customerTypeLabel : l.jobTitleLabel,
                  child: SearchSelect<int>(
                    hint: l.notSet,
                    value: _typeId,
                    emptyLabel: l.notSet,
                    errorText: errors['customer_type_id'] ?? errors['job_title_id'],
                    options: [
                      for (final t in types)
                        if (t.id != null) SelectOption(value: t.id!, label: t.name ?? ''),
                    ],
                    onChanged: (id) => setState(() => _typeId = id),
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
              if (_kind == ContactKind.employee) ...[
                FieldLabel(
                  label: l.idNumberLabel,
                  child: FormText(
                    controller: _idNumber,
                    ltr: true,
                    keyboardType: TextInputType.number,
                    error: errors['id_number'],
                  ),
                ),
                FieldLabel(
                  label: l.nationalityLabel,
                  child: FormText(controller: _nationality, error: errors['nationality']),
                ),
              ],
              FieldLabel(
                label: l.statusLabel,
                child: ChoiceRow<String>(
                  options: contactStatuses,
                  value: _status,
                  onChanged: (s) => setState(() => _status = s),
                ),
              ),
              FieldLabel(
                label: l.fieldNotes,
                child: FormText(controller: _notes, maxLines: 4, error: errors['notes']),
              ),
            ],
          ),
          const SizedBox(height: Hud.gutter),
        ],
      ),
    );
  }
}
