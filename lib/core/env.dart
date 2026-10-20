/// Build-time environment, read from `--dart-define-from-file=env/<flavor>.json`.
///
/// Staging is the default so a plain `flutter run` never touches production data.
abstract final class Env {
  static const flavor = String.fromEnvironment('FLAVOR', defaultValue: 'staging');

  static const apiBaseUrl = String.fromEnvironment('API_BASE_URL', defaultValue: 'https://hawat.sa/staging/api/v1');

  /// Demo owner behind the quick login button; never shown in production.
  static const demoPhone = String.fromEnvironment('DEMO_PHONE', defaultValue: '0500000101');

  static const demoPassword = String.fromEnvironment('DEMO_PASSWORD', defaultValue: 'oILMaJtow1fH5PXv');

  static bool get isProduction => flavor == 'production';
}
