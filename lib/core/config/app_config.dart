import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_config.freezed.dart';
part 'app_config.g.dart';

/// `GET /app/config`: forced update, support numbers, SMS availability.
@freezed
abstract class AppConfig with _$AppConfig {
  const AppConfig._();

  const factory AppConfig({
    @Default('1.0.0') String minVersion,
    @Default('1.0.0') String latestVersion,
    String? storeUrl,
    @Default(false) bool smsEnabled,
    String? supportPhone,
    String? supportWhatsapp,
    String? joinUrl,
    String? privacyUrl,
    String? termsUrl,
  }) = _AppConfig;

  factory AppConfig.fromJson(Map<String, dynamic> json) => _$AppConfigFromJson(json);

  /// Used when the server can't be reached on the very first launch: the
  /// support line printed on the landing page.
  static const fallback = AppConfig(
    supportPhone: '0595233393',
    supportWhatsapp: '966595233393',
    joinUrl: 'https://hawat.sa/#register',
    storeUrl: 'https://play.google.com/store/apps/details?id=sa.hawat.app',
  );

  /// True when [current] is older than [minVersion] (`1.2.0` vs `1.10.0` compares numerically).
  bool requiresUpdate(String current) => compareVersions(current, minVersion) < 0;
}

int compareVersions(String a, String b) {
  List<int> parts(String v) => v.split('+').first.split('-').first.split('.').map((p) => int.tryParse(p) ?? 0).toList();
  final x = parts(a);
  final y = parts(b);
  for (var i = 0; i < 3; i++) {
    final l = i < x.length ? x[i] : 0;
    final r = i < y.length ? y[i] : 0;
    if (l != r) return l.compareTo(r);
  }
  return 0;
}
