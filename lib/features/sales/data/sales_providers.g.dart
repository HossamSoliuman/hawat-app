// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// `GET /owner/sales`: newest first, optionally only the invoices with money still due.

@ProviderFor(SalesList)
final salesListProvider = SalesListFamily._();

/// `GET /owner/sales`: newest first, optionally only the invoices with money still due.
final class SalesListProvider
    extends $AsyncNotifierProvider<SalesList, PagedList<Sale>> {
  /// `GET /owner/sales`: newest first, optionally only the invoices with money still due.
  SalesListProvider._({
    required SalesListFamily super.from,
    required SalesQuery super.argument,
  }) : super(
         retry: null,
         name: r'salesListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$salesListHash();

  @override
  String toString() {
    return r'salesListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SalesList create() => SalesList();

  @override
  bool operator ==(Object other) {
    return other is SalesListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$salesListHash() => r'21bd4b299e1c21b46fe7eb29ed2be0fee3413091';

/// `GET /owner/sales`: newest first, optionally only the invoices with money still due.

final class SalesListFamily extends $Family
    with
        $ClassFamilyOverride<
          SalesList,
          AsyncValue<PagedList<Sale>>,
          PagedList<Sale>,
          FutureOr<PagedList<Sale>>,
          SalesQuery
        > {
  SalesListFamily._()
    : super(
        retry: null,
        name: r'salesListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// `GET /owner/sales`: newest first, optionally only the invoices with money still due.

  SalesListProvider call(SalesQuery query) =>
      SalesListProvider._(argument: query, from: this);

  @override
  String toString() => r'salesListProvider';
}

/// `GET /owner/sales`: newest first, optionally only the invoices with money still due.

abstract class _$SalesList extends $AsyncNotifier<PagedList<Sale>> {
  late final _$args = ref.$arg as SalesQuery;
  SalesQuery get query => _$args;

  FutureOr<PagedList<Sale>> build(SalesQuery query);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<PagedList<Sale>>, PagedList<Sale>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PagedList<Sale>>, PagedList<Sale>>,
              AsyncValue<PagedList<Sale>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}

/// One invoice with its lines.

@ProviderFor(SaleDetail)
final saleDetailProvider = SaleDetailFamily._();

/// One invoice with its lines.
final class SaleDetailProvider
    extends $AsyncNotifierProvider<SaleDetail, Sale> {
  /// One invoice with its lines.
  SaleDetailProvider._({
    required SaleDetailFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'saleDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$saleDetailHash();

  @override
  String toString() {
    return r'saleDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SaleDetail create() => SaleDetail();

  @override
  bool operator ==(Object other) {
    return other is SaleDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$saleDetailHash() => r'1bd798ed3885b62b068b266cf8f44e213e8431ec';

/// One invoice with its lines.

final class SaleDetailFamily extends $Family
    with
        $ClassFamilyOverride<
          SaleDetail,
          AsyncValue<Sale>,
          Sale,
          FutureOr<Sale>,
          int
        > {
  SaleDetailFamily._()
    : super(
        retry: null,
        name: r'saleDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// One invoice with its lines.

  SaleDetailProvider call(int id) =>
      SaleDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'saleDetailProvider';
}

/// One invoice with its lines.

abstract class _$SaleDetail extends $AsyncNotifier<Sale> {
  late final _$args = ref.$arg as int;
  int get id => _$args;

  FutureOr<Sale> build(int id);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Sale>, Sale>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Sale>, Sale>,
              AsyncValue<Sale>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
