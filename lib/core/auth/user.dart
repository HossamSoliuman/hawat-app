import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// The signed-in account (`GET /auth/me`).
@freezed
abstract class AppUser with _$AppUser {
  const AppUser._();

  const factory AppUser({
    required int id,
    required String name,
    required String phone,
    String? email,
    UserRole? role,
    @Default(true) bool active,
    String? avatarUrl,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);

  /// Version 1 lets only boat owners in; the shell is ready for other roles.
  bool get isOwner => role?.key == 'owner';
}

@freezed
abstract class UserRole with _$UserRole {
  const factory UserRole({required String key, required String name}) = _UserRole;

  factory UserRole.fromJson(Map<String, dynamic> json) => _$UserRoleFromJson(json);
}
