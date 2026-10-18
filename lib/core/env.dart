/// Build-time environment, read from `--dart-define-from-file=env/<flavor>.json`.
///
/// Staging is the default so a plain `flutter run` never touches production data.
abstract final class Env {
  static const flavor = String.fromEnvironment('FLAVOR', defaultValue: 'staging');

  static const apiBaseUrl = String.fromEnvironment('API_BASE_URL', defaultValue: 'https://hawat.sa/staging/api/v1');

  static bool get isProduction => flavor == 'production';
}
