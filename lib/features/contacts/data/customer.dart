import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/models/refs.dart';

part 'customer.freezed.dart';
part 'customer.g.dart';

/// A buyer of the owner's catch (`/owner/customers`).
@freezed
abstract class Customer with _$Customer {
  const factory Customer({
    required int id,
    required String name,
    String? phone,
    String? email,
    IdName? type,
    String? notes,
    String? status,
    @Default(0) int salesCount,
    double? salesTotal,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);
}

/// A supplier the owner buys from (`/owner/vendors`): fuel, ice, gear.
@freezed
abstract class Vendor with _$Vendor {
  const factory Vendor({
    required int id,
    required String name,
    String? phone,
    String? email,
    String? notes,
    String? status,
  }) = _Vendor;

  factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);
}

/// Office staff (`/owner/employees`); crew are fishers, not employees.
@freezed
abstract class Employee with _$Employee {
  const factory Employee({
    required int id,
    required String name,
    String? phone,
    String? email,
    String? idNumber,
    String? nationality,
    IdName? jobTitle,
    String? notes,
    String? status,
  }) = _Employee;

  factory Employee.fromJson(Map<String, dynamic> json) => _$EmployeeFromJson(json);
}

/// Every contact's status on the server.
const contactStatuses = ['نشط', 'غير نشط'];
