import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/l10n.dart';
import '../../../core/widgets/ltr_text.dart';
import '../../../core/widgets/search_list.dart';
import '../../../core/widgets/stat_tile.dart';
import '../../../core/widgets/status_chip.dart';
import '../data/customer.dart';
import '../data/customers_repository.dart';

/// Customers, vendors and employees: the same list with its own rows.
enum ContactKind {
  customer,
  vendor,
  employee;

  static ContactKind parse(String? value) => values.firstWhere((k) => k.name == value, orElse: () => customer);
}

class CustomersScreen extends ConsumerStatefulWidget {
  const CustomersScreen({super.key});

  @override
  ConsumerState<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends ConsumerState<CustomersScreen> {
  String _search = '';

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final provider = customersListProvider(search: _search);
    return _ContactsScaffold(
      kind: ContactKind.customer,
      title: l.customersTitle,
      child: SearchList<Customer>(
        state: ref.watch(provider),
        searchHint: l.searchContacts,
        onSearch: (q) => setState(() => _search = q),
        onRefresh: () => ref.refresh(provider.future),
        onRetry: () => ref.invalidate(provider),
        onLoadMore: () => ref.read(provider.notifier).loadMore(),
        emptyIcon: Icons.people_outline,
        emptyTitle: _search.isEmpty ? l.noCustomers : l.noResults,
        itemBuilder: (context, customer, last) {
          final text = Theme.of(context).textTheme;
          return EntityRow(
            title: customer.name,
            last: last,
            onTap: () => context.push(Routes.contact(ContactKind.customer, customer.id)),
            leading: const ToneIcon(icon: Icons.person_outline, size: 36, iconSize: 20),
            lines: [
              if (customer.phone != null) LtrText(customer.phone!, style: text.bodySmall),
              if (customer.type?.name != null) Text(customer.type!.name!, style: text.bodySmall),
            ],
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (customer.salesCount > 0) ...[
                  Text(l.sar(customer.salesTotal ?? 0), style: text.labelLarge),
                  const SizedBox(height: 3),
                  Text(l.invoicesCount(customer.salesCount), style: text.bodySmall),
                ],
                if (customer.status != null && customer.status != contactStatuses.first) ...[
                  const SizedBox(height: 4),
                  StatusChip(label: customer.status!, dense: true),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

class VendorsScreen extends ConsumerStatefulWidget {
  const VendorsScreen({super.key});

  @override
  ConsumerState<VendorsScreen> createState() => _VendorsScreenState();
}

class _VendorsScreenState extends ConsumerState<VendorsScreen> {
  String _search = '';

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final provider = vendorsListProvider(search: _search);
    return _ContactsScaffold(
      kind: ContactKind.vendor,
      title: l.vendorsTitle,
      child: SearchList<Vendor>(
        state: ref.watch(provider),
        searchHint: l.searchContacts,
        onSearch: (q) => setState(() => _search = q),
        onRefresh: () => ref.refresh(provider.future),
        onRetry: () => ref.invalidate(provider),
        onLoadMore: () => ref.read(provider.notifier).loadMore(),
        emptyIcon: Icons.storefront_outlined,
        emptyTitle: _search.isEmpty ? l.noVendors : l.noResults,
        itemBuilder: (context, vendor, last) => EntityRow(
          title: vendor.name,
          last: last,
          onTap: () => context.push(Routes.contact(ContactKind.vendor, vendor.id)),
          leading: const ToneIcon(icon: Icons.storefront_outlined, size: 36, iconSize: 20),
          lines: [if (vendor.phone != null) LtrText(vendor.phone!, style: Theme.of(context).textTheme.bodySmall)],
          trailing: _inactiveChip(vendor.status),
        ),
      ),
    );
  }
}

class EmployeesScreen extends ConsumerStatefulWidget {
  const EmployeesScreen({super.key});

  @override
  ConsumerState<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends ConsumerState<EmployeesScreen> {
  String _search = '';

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final provider = employeesListProvider(search: _search);
    return _ContactsScaffold(
      kind: ContactKind.employee,
      title: l.employeesTitle,
      child: SearchList<Employee>(
        state: ref.watch(provider),
        searchHint: l.searchContacts,
        onSearch: (q) => setState(() => _search = q),
        onRefresh: () => ref.refresh(provider.future),
        onRetry: () => ref.invalidate(provider),
        onLoadMore: () => ref.read(provider.notifier).loadMore(),
        emptyIcon: Icons.badge_outlined,
        emptyTitle: _search.isEmpty ? l.noEmployees : l.noResults,
        itemBuilder: (context, employee, last) {
          final text = Theme.of(context).textTheme;
          return EntityRow(
            title: employee.name,
            last: last,
            onTap: () => context.push(Routes.contact(ContactKind.employee, employee.id)),
            leading: const ToneIcon(icon: Icons.badge_outlined, size: 36, iconSize: 20),
            lines: [
              if (employee.jobTitle?.name != null) Text(employee.jobTitle!.name!, style: text.bodySmall),
              if (employee.phone != null) LtrText(employee.phone!, style: text.bodySmall),
            ],
            trailing: _inactiveChip(employee.status),
          );
        },
      ),
    );
  }
}

Widget? _inactiveChip(String? status) =>
    status == null || status == contactStatuses.first ? null : StatusChip(label: status, dense: true);

class _ContactsScaffold extends StatelessWidget {
  const _ContactsScaffold({required this.kind, required this.title, required this.child});

  final ContactKind kind;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(title),
      actions: [
        IconButton(
          tooltip: context.l10n.addAction,
          icon: const Icon(Icons.add),
          onPressed: () => context.push(Routes.newContact(kind)),
        ),
        const SizedBox(width: 4),
      ],
    ),
    body: child,
  );
}
