// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consignments_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(consignmentsRepository)
final consignmentsRepositoryProvider = ConsignmentsRepositoryProvider._();

final class ConsignmentsRepositoryProvider
    extends
        $FunctionalProvider<
          ConsignmentsRepository,
          ConsignmentsRepository,
          ConsignmentsRepository
        >
    with $Provider<ConsignmentsRepository> {
  ConsignmentsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'consignmentsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$consignmentsRepositoryHash();

  @$internal
  @override
  $ProviderElement<ConsignmentsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ConsignmentsRepository create(Ref ref) {
    return consignmentsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConsignmentsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConsignmentsRepository>(value),
    );
  }
}

String _$consignmentsRepositoryHash() =>
    r'd446e35ec094b0dca3262b45b545e0c53f367535';

/// Every consignment, newest first.

@ProviderFor(ConsignmentsList)
final consignmentsListProvider = ConsignmentsListProvider._();

/// Every consignment, newest first.
final class ConsignmentsListProvider
    extends $AsyncNotifierProvider<ConsignmentsList, PagedList<Consignment>> {
  /// Every consignment, newest first.
  ConsignmentsListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'consignmentsListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$consignmentsListHash();

  @$internal
  @override
  ConsignmentsList create() => ConsignmentsList();
}

String _$consignmentsListHash() => r'a4821dcc2f2dd588e65a71653b0953be64bd5dac';

/// Every consignment, newest first.

abstract class _$ConsignmentsList
    extends $AsyncNotifier<PagedList<Consignment>> {
  FutureOr<PagedList<Consignment>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<PagedList<Consignment>>, PagedList<Consignment>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<PagedList<Consignment>>,
                PagedList<Consignment>
              >,
              AsyncValue<PagedList<Consignment>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(ConsignmentDetail)
final consignmentDetailProvider = ConsignmentDetailFamily._();

final class ConsignmentDetailProvider
    extends $AsyncNotifierProvider<ConsignmentDetail, Consignment> {
  ConsignmentDetailProvider._({
    required ConsignmentDetailFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'consignmentDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$consignmentDetailHash();

  @override
  String toString() {
    return r'consignmentDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ConsignmentDetail create() => ConsignmentDetail();

  @override
  bool operator ==(Object other) {
    return other is ConsignmentDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$consignmentDetailHash() => r'c7de3ec7e4c8099983a90fa38946de335fe66ac1';

final class ConsignmentDetailFamily extends $Family
    with
        $ClassFamilyOverride<
          ConsignmentDetail,
          AsyncValue<Consignment>,
          Consignment,
          FutureOr<Consignment>,
          int
        > {
  ConsignmentDetailFamily._()
    : super(
        retry: null,
        name: r'consignmentDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ConsignmentDetailProvider call(int id) =>
      ConsignmentDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'consignmentDetailProvider';
}

abstract class _$ConsignmentDetail extends $AsyncNotifier<Consignment> {
  late final _$args = ref.$arg as int;
  int get id => _$args;

  FutureOr<Consignment> build(int id);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Consignment>, Consignment>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Consignment>, Consignment>,
              AsyncValue<Consignment>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
