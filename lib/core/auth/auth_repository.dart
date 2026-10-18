import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../api/api_client.dart';
import '../providers.dart';
import 'user.dart';

part 'auth_repository.g.dart';

class LoginResult {
  const LoginResult(this.token, this.user);

  final String token;
  final AppUser user;
}

/// `/auth/*`: sign in and out, and the account itself.
class AuthRepository {
  const AuthRepository(this._api);

  final ApiClient _api;

  Future<LoginResult> login({required String phone, required String password, String? deviceName}) async {
    final json = await _api.post(
      '/auth/login',
      data: {'phone': phone, 'password': password, 'device_name': ?deviceName},
    );
    final data = (json['data'] as Map).cast<String, dynamic>();
    return LoginResult(data['token'] as String, AppUser.fromJson((data['user'] as Map).cast<String, dynamic>()));
  }

  Future<AppUser> me() async => _user(await _api.get('/auth/me'));

  Future<void> logout() => _api.post('/auth/logout');

  Future<AppUser> updateProfile({required String name, String? email}) async =>
      _user(await _api.put('/auth/me', data: {'name': name, 'email': (email?.trim().isEmpty ?? true) ? null : email}));

  Future<void> changePassword({required String current, required String password, required String confirmation}) =>
      _api.post(
        '/auth/change-password',
        data: {'current_password': current, 'password': password, 'password_confirmation': confirmation},
      );

  Future<AppUser> uploadAvatar(Uint8List bytes, String filename) async {
    final form = FormData.fromMap({'avatar': MultipartFile.fromBytes(bytes, filename: filename)});
    return _user(await _api.post('/auth/avatar', data: form));
  }

  Future<AppUser> removeAvatar() async => _user(await _api.delete('/auth/avatar'));

  static AppUser _user(Json json) => AppUser.fromJson((json['data'] as Map).cast<String, dynamic>());
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) => AuthRepository(ref.watch(apiClientProvider));
