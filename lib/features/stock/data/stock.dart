import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock.freezed.dart';
part 'stock.g.dart';

/// What the owner holds of one species (`GET /owner/stock`, the home's الأسماك المتوفرة).
@freezed
abstract class StockLine with _$StockLine {
  const factory StockLine({required int speciesId, String? species, String? nameSci, @Default(0) double weightKg}) =
      _StockLine;

  factory StockLine.fromJson(Map<String, dynamic> json) => _$StockLineFromJson(json);
}

/// One line of the stock ledger: in (+) or out (−), and the balance after it.
@freezed
abstract class StockMovement with _$StockMovement {
  const StockMovement._();

  const factory StockMovement({
    required int id,
    String? species,
    String? tripNumber,
    String? type,
    @Default(0) double weightKg,
    @Default(0) double balanceAfter,
    String? user,
    String? notes,
    DateTime? createdAt,
  }) = _StockMovement;

  factory StockMovement.fromJson(Map<String, dynamic> json) => _$StockMovementFromJson(json);

  bool get isIn => weightKg >= 0;
}
