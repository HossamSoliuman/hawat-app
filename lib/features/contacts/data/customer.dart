import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer.freezed.dart';
part 'customer.g.dart';

/// A buyer of the owner's catch (`/owner/customers`).
@freezed
abstract class Customer with _$Customer {
  const factory Customer({required int id, required String name, String? phone, String? status}) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);
}
