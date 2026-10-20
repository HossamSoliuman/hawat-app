import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/models/refs.dart';

part 'consignment.freezed.dart';
part 'consignment.g.dart';

/// Catch sent from a trip into a dalal's stock (`/owner/consignments`).
@freezed
abstract class Consignment with _$Consignment {
  const factory Consignment({
    required int id,
    required String consignmentNumber,
    String? status,
    PersonRef? dalal,
    TripNumberRef? trip,
    @Default(0) double totalKg,
    @Default(<ConsignmentLine>[]) List<ConsignmentLine> items,
    DateTime? sentAt,
    String? notes,
  }) = _Consignment;

  factory Consignment.fromJson(Map<String, dynamic> json) => _$ConsignmentFromJson(json);
}

@freezed
abstract class ConsignmentLine with _$ConsignmentLine {
  const factory ConsignmentLine({required int id, IdName? species, @Default(0) double weightKg}) = _ConsignmentLine;

  factory ConsignmentLine.fromJson(Map<String, dynamic> json) => _$ConsignmentLineFromJson(json);
}

/// The body of `POST /owner/consignments`.
@freezed
abstract class ConsignmentInput with _$ConsignmentInput {
  const factory ConsignmentInput({
    required int tripId,
    required int dalalId,
    String? notes,
    required List<ConsignLineInput> items,
  }) = _ConsignmentInput;
}

@freezed
abstract class ConsignLineInput with _$ConsignLineInput {
  const factory ConsignLineInput({required int speciesId, required double weightKg}) = _ConsignLineInput;
}

extension ConsignmentInputJson on ConsignmentInput {
  Map<String, dynamic> toJson() => {
    'trip_id': tripId,
    'dalal_id': dalalId,
    if (notes?.trim().isNotEmpty ?? false) 'notes': notes!.trim(),
    'items': [
      for (final line in items) {'species_id': line.speciesId, 'weight_kg': line.weightKg},
    ],
  };
}
