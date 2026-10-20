import 'package:freezed_annotation/freezed_annotation.dart';

part 'dalal.freezed.dart';
part 'dalal.g.dart';

/// An active dalal and the owner's request to deal with them, if one was sent.
@freezed
abstract class Dalal with _$Dalal {
  const Dalal._();

  const factory Dalal({required int id, required String name, String? phone, Partnership? partnership}) = _Dalal;

  factory Dalal.fromJson(Map<String, dynamic> json) => _$DalalFromJson(json);

  /// Accepted terms are taken from every sale of the owner's catch; none = nothing taken.
  bool get hasAgreement => partnership?.isAccepted ?? false;
}

/// The commission and wages the owner proposed, and the dalal's answer.
@freezed
abstract class Partnership with _$Partnership {
  const Partnership._();

  const factory Partnership({
    required int id,
    @Default(0) double commissionPct,
    @Default(0) double wagePct,
    String? message,
    @Default(Partnership.pending) String status,
    String? statusLabel,
    String? responseNote,
    DateTime? respondedAt,
  }) = _Partnership;

  factory Partnership.fromJson(Map<String, dynamic> json) => _$PartnershipFromJson(json);

  static const pending = 'pending';
  static const accepted = 'accepted';
  static const rejected = 'rejected';

  bool get isAccepted => status == accepted;

  bool get isPending => status == pending;

  bool get isRejected => status == rejected;
}
