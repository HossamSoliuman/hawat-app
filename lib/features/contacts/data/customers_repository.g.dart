// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customers_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(customersRepository)
final customersRepositoryProvider = CustomersRepositoryProvider._();

final class CustomersRepositoryProvider
    extends
        $FunctionalProvider<
          CustomersRepository,
          CustomersRepository,
          CustomersRepository
        >
    with $Provider<CustomersRepository> {
  CustomersRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'customersRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$customersRepositoryHash();

  @$internal
  @override
  $ProviderElement<CustomersRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CustomersRepository create(Ref ref) {
    return customersRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CustomersRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CustomersRepository>(value),
    );
  }
}

String _$customersRepositoryHash() =>
    r'50662f18e8274d6d579fa74c4da078a33dcd0803';

@ProviderFor(vendorsRepository)
final vendorsRepositoryProvider = VendorsRepositoryProvider._();

final class VendorsRepositoryProvider
    extends
        $FunctionalProvider<
          ResourceRepository<Vendor>,
          ResourceRepository<Vendor>,
          ResourceRepository<Vendor>
        >
    with $Provider<ResourceRepository<Vendor>> {
  VendorsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vendorsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vendorsRepositoryHash();

  @$internal
  @override
  $ProviderElement<ResourceRepository<Vendor>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ResourceRepository<Vendor> create(Ref ref) {
    return vendorsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResourceRepository<Vendor> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResourceRepository<Vendor>>(value),
    );
  }
}

String _$vendorsRepositoryHash() => r'6cf4d4eae812b88b958b4e477934da5d2530fee6';

@ProviderFor(employeesRepository)
final employeesRepositoryProvider = EmployeesRepositoryProvider._();

final class EmployeesRepositoryProvider
    extends
        $FunctionalProvider<
          ResourceRepository<Employee>,
          ResourceRepository<Employee>,
          ResourceRepository<Employee>
        >
    with $Provider<ResourceRepository<Employee>> {
  EmployeesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'employeesRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$employeesRepositoryHash();

  @$internal
  @override
  $ProviderElement<ResourceRepository<Employee>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ResourceRepository<Employee> create(Ref ref) {
    return employeesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResourceRepository<Employee> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResourceRepository<Employee>>(value),
    );
  }
}

String _$employeesRepositoryHash() =>
    r'f96184a259cb9b00ccf6ffec0489454e0ca1768d';

@ProviderFor(activeCustomers)
final activeCustomersProvider = ActiveCustomersProvider._();

final class ActiveCustomersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Customer>>,
          List<Customer>,
          FutureOr<List<Customer>>
        >
    with $FutureModifier<List<Customer>>, $FutureProvider<List<Customer>> {
  ActiveCustomersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeCustomersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeCustomersHash();

  @$internal
  @override
  $FutureProviderElement<List<Customer>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Customer>> create(Ref ref) {
    return activeCustomers(ref);
  }
}

String _$activeCustomersHash() => r'5f1a98b9f825fd21958db04db8534395a70e44ad';

@ProviderFor(CustomersList)
final customersListProvider = CustomersListFamily._();

final class CustomersListProvider
    extends $AsyncNotifierProvider<CustomersList, PagedList<Customer>> {
  CustomersListProvider._({
    required CustomersListFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'customersListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$customersListHash();

  @override
  String toString() {
    return r'customersListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CustomersList create() => CustomersList();

  @override
  bool operator ==(Object other) {
    return other is CustomersListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$customersListHash() => r'291ba2f30ff727a03f65ad74f44e163119d008d5';

final class CustomersListFamily extends $Family
    with
        $ClassFamilyOverride<
          CustomersList,
          AsyncValue<PagedList<Customer>>,
          PagedList<Customer>,
          FutureOr<PagedList<Customer>>,
          String
        > {
  CustomersListFamily._()
    : super(
        retry: null,
        name: r'customersListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CustomersListProvider call({String search = ''}) =>
      CustomersListProvider._(argument: search, from: this);

  @override
  String toString() => r'customersListProvider';
}

abstract class _$CustomersList extends $AsyncNotifier<PagedList<Customer>> {
  late final _$args = ref.$arg as String;
  String get search => _$args;

  FutureOr<PagedList<Customer>> build({String search = ''});
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<PagedList<Customer>>, PagedList<Customer>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PagedList<Customer>>, PagedList<Customer>>,
              AsyncValue<PagedList<Customer>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(search: _$args));
  }
}

@ProviderFor(VendorsList)
final vendorsListProvider = VendorsListFamily._();

final class VendorsListProvider
    extends $AsyncNotifierProvider<VendorsList, PagedList<Vendor>> {
  VendorsListProvider._({
    required VendorsListFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'vendorsListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$vendorsListHash();

  @override
  String toString() {
    return r'vendorsListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  VendorsList create() => VendorsList();

  @override
  bool operator ==(Object other) {
    return other is VendorsListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$vendorsListHash() => r'621573e27fdc7663fcdbde8b88f1817ff7ba8738';

final class VendorsListFamily extends $Family
    with
        $ClassFamilyOverride<
          VendorsList,
          AsyncValue<PagedList<Vendor>>,
          PagedList<Vendor>,
          FutureOr<PagedList<Vendor>>,
          String
        > {
  VendorsListFamily._()
    : super(
        retry: null,
        name: r'vendorsListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VendorsListProvider call({String search = ''}) =>
      VendorsListProvider._(argument: search, from: this);

  @override
  String toString() => r'vendorsListProvider';
}

abstract class _$VendorsList extends $AsyncNotifier<PagedList<Vendor>> {
  late final _$args = ref.$arg as String;
  String get search => _$args;

  FutureOr<PagedList<Vendor>> build({String search = ''});
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<PagedList<Vendor>>, PagedList<Vendor>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PagedList<Vendor>>, PagedList<Vendor>>,
              AsyncValue<PagedList<Vendor>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(search: _$args));
  }
}

@ProviderFor(EmployeesList)
final employeesListProvider = EmployeesListFamily._();

final class EmployeesListProvider
    extends $AsyncNotifierProvider<EmployeesList, PagedList<Employee>> {
  EmployeesListProvider._({
    required EmployeesListFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'employeesListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$employeesListHash();

  @override
  String toString() {
    return r'employeesListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  EmployeesList create() => EmployeesList();

  @override
  bool operator ==(Object other) {
    return other is EmployeesListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$employeesListHash() => r'f23093a8dbab3381d004ebec3764f0d66966134c';

final class EmployeesListFamily extends $Family
    with
        $ClassFamilyOverride<
          EmployeesList,
          AsyncValue<PagedList<Employee>>,
          PagedList<Employee>,
          FutureOr<PagedList<Employee>>,
          String
        > {
  EmployeesListFamily._()
    : super(
        retry: null,
        name: r'employeesListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  EmployeesListProvider call({String search = ''}) =>
      EmployeesListProvider._(argument: search, from: this);

  @override
  String toString() => r'employeesListProvider';
}

abstract class _$EmployeesList extends $AsyncNotifier<PagedList<Employee>> {
  late final _$args = ref.$arg as String;
  String get search => _$args;

  FutureOr<PagedList<Employee>> build({String search = ''});
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<PagedList<Employee>>, PagedList<Employee>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PagedList<Employee>>, PagedList<Employee>>,
              AsyncValue<PagedList<Employee>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(search: _$args));
  }
}

@ProviderFor(customerDetail)
final customerDetailProvider = CustomerDetailFamily._();

final class CustomerDetailProvider
    extends
        $FunctionalProvider<AsyncValue<Customer>, Customer, FutureOr<Customer>>
    with $FutureModifier<Customer>, $FutureProvider<Customer> {
  CustomerDetailProvider._({
    required CustomerDetailFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'customerDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$customerDetailHash();

  @override
  String toString() {
    return r'customerDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Customer> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Customer> create(Ref ref) {
    final argument = this.argument as int;
    return customerDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CustomerDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$customerDetailHash() => r'c3a7aec84575939f81ac6b6b04bf7fa8916ea70e';

final class CustomerDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Customer>, int> {
  CustomerDetailFamily._()
    : super(
        retry: null,
        name: r'customerDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CustomerDetailProvider call(int id) =>
      CustomerDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'customerDetailProvider';
}

@ProviderFor(vendorDetail)
final vendorDetailProvider = VendorDetailFamily._();

final class VendorDetailProvider
    extends $FunctionalProvider<AsyncValue<Vendor>, Vendor, FutureOr<Vendor>>
    with $FutureModifier<Vendor>, $FutureProvider<Vendor> {
  VendorDetailProvider._({
    required VendorDetailFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'vendorDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$vendorDetailHash();

  @override
  String toString() {
    return r'vendorDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Vendor> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Vendor> create(Ref ref) {
    final argument = this.argument as int;
    return vendorDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is VendorDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$vendorDetailHash() => r'ca28adc471d8bf265797d8e7942c385ae9ed3845';

final class VendorDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Vendor>, int> {
  VendorDetailFamily._()
    : super(
        retry: null,
        name: r'vendorDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VendorDetailProvider call(int id) =>
      VendorDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'vendorDetailProvider';
}

@ProviderFor(employeeDetail)
final employeeDetailProvider = EmployeeDetailFamily._();

final class EmployeeDetailProvider
    extends
        $FunctionalProvider<AsyncValue<Employee>, Employee, FutureOr<Employee>>
    with $FutureModifier<Employee>, $FutureProvider<Employee> {
  EmployeeDetailProvider._({
    required EmployeeDetailFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'employeeDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$employeeDetailHash();

  @override
  String toString() {
    return r'employeeDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Employee> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Employee> create(Ref ref) {
    final argument = this.argument as int;
    return employeeDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is EmployeeDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$employeeDetailHash() => r'63a6ab8b8b8e847ce159ec798cdafa2144005688';

final class EmployeeDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Employee>, int> {
  EmployeeDetailFamily._()
    : super(
        retry: null,
        name: r'employeeDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  EmployeeDetailProvider call(int id) =>
      EmployeeDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'employeeDetailProvider';
}

/// Contact writes; each reloads its list (and the sale form's customers).

@ProviderFor(contactActions)
final contactActionsProvider = ContactActionsProvider._();

/// Contact writes; each reloads its list (and the sale form's customers).

final class ContactActionsProvider
    extends $FunctionalProvider<ContactActions, ContactActions, ContactActions>
    with $Provider<ContactActions> {
  /// Contact writes; each reloads its list (and the sale form's customers).
  ContactActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contactActionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contactActionsHash();

  @$internal
  @override
  $ProviderElement<ContactActions> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ContactActions create(Ref ref) {
    return contactActions(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContactActions value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContactActions>(value),
    );
  }
}

String _$contactActionsHash() => r'dbd09498b4b21249cd5851b65f97d8845ba24d4b';
