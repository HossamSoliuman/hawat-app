// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catch_log_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(catchLogSummary)
final catchLogSummaryProvider = CatchLogSummaryFamily._();

final class CatchLogSummaryProvider
    extends
        $FunctionalProvider<
          AsyncValue<CatchLogSummary>,
          CatchLogSummary,
          FutureOr<CatchLogSummary>
        >
    with $FutureModifier<CatchLogSummary>, $FutureProvider<CatchLogSummary> {
  CatchLogSummaryProvider._({
    required CatchLogSummaryFamily super.from,
    required CatchLogQuery super.argument,
  }) : super(
         retry: null,
         name: r'catchLogSummaryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$catchLogSummaryHash();

  @override
  String toString() {
    return r'catchLogSummaryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<CatchLogSummary> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CatchLogSummary> create(Ref ref) {
    final argument = this.argument as CatchLogQuery;
    return catchLogSummary(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CatchLogSummaryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$catchLogSummaryHash() => r'9b5529727e2267e96b19f34df633a5d4ed9c7b72';

final class CatchLogSummaryFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<CatchLogSummary>, CatchLogQuery> {
  CatchLogSummaryFamily._()
    : super(
        retry: null,
        name: r'catchLogSummaryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CatchLogSummaryProvider call(CatchLogQuery query) =>
      CatchLogSummaryProvider._(argument: query, from: this);

  @override
  String toString() => r'catchLogSummaryProvider';
}

@ProviderFor(CatchLogEntries)
final catchLogEntriesProvider = CatchLogEntriesFamily._();

final class CatchLogEntriesProvider
    extends $AsyncNotifierProvider<CatchLogEntries, PagedList<CatchLogEntry>> {
  CatchLogEntriesProvider._({
    required CatchLogEntriesFamily super.from,
    required CatchLogQuery super.argument,
  }) : super(
         retry: null,
         name: r'catchLogEntriesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$catchLogEntriesHash();

  @override
  String toString() {
    return r'catchLogEntriesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CatchLogEntries create() => CatchLogEntries();

  @override
  bool operator ==(Object other) {
    return other is CatchLogEntriesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$catchLogEntriesHash() => r'f794b6d1c3fca1c3434afa4dec3350f45a8bdff4';

final class CatchLogEntriesFamily extends $Family
    with
        $ClassFamilyOverride<
          CatchLogEntries,
          AsyncValue<PagedList<CatchLogEntry>>,
          PagedList<CatchLogEntry>,
          FutureOr<PagedList<CatchLogEntry>>,
          CatchLogQuery
        > {
  CatchLogEntriesFamily._()
    : super(
        retry: null,
        name: r'catchLogEntriesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CatchLogEntriesProvider call(CatchLogQuery query) =>
      CatchLogEntriesProvider._(argument: query, from: this);

  @override
  String toString() => r'catchLogEntriesProvider';
}

abstract class _$CatchLogEntries
    extends $AsyncNotifier<PagedList<CatchLogEntry>> {
  late final _$args = ref.$arg as CatchLogQuery;
  CatchLogQuery get query => _$args;

  FutureOr<PagedList<CatchLogEntry>> build(CatchLogQuery query);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<PagedList<CatchLogEntry>>,
              PagedList<CatchLogEntry>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<PagedList<CatchLogEntry>>,
                PagedList<CatchLogEntry>
              >,
              AsyncValue<PagedList<CatchLogEntry>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
