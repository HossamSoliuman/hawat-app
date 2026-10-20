// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selling_actions.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Selling from any screen: a sale, a payment, a consignment, a request to a
/// dalal, a new customer. Each one reloads what it changed (the trip, its
/// stock, the lists, the home), so no screen shows an old figure.

@ProviderFor(sellingActions)
final sellingActionsProvider = SellingActionsProvider._();

/// Selling from any screen: a sale, a payment, a consignment, a request to a
/// dalal, a new customer. Each one reloads what it changed (the trip, its
/// stock, the lists, the home), so no screen shows an old figure.

final class SellingActionsProvider
    extends $FunctionalProvider<SellingActions, SellingActions, SellingActions>
    with $Provider<SellingActions> {
  /// Selling from any screen: a sale, a payment, a consignment, a request to a
  /// dalal, a new customer. Each one reloads what it changed (the trip, its
  /// stock, the lists, the home), so no screen shows an old figure.
  SellingActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sellingActionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sellingActionsHash();

  @$internal
  @override
  $ProviderElement<SellingActions> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SellingActions create(Ref ref) {
    return sellingActions(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SellingActions value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SellingActions>(value),
    );
  }
}

String _$sellingActionsHash() => r'5cbe96ff6772f7130b02ce7726b4d219b4a36db0';
