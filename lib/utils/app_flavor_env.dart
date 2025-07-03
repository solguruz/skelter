enum AppFlavor { dev, prod, stage }

class AppConfig {
  static const _app_flavor = 'APP_FLAVOR';
  static const _dev = 'dev';
  static const _prod = 'prod';
  static const _stage = 'stage';

  /// Fetch app flavor from environment variables (`dart-define`)
  static AppFlavor get appFlavor {
    const flavor = String.fromEnvironment(_app_flavor, defaultValue: _prod);
    switch (flavor.toLowerCase()) {
      case _dev:
        return AppFlavor.dev;
      case _stage:
        return AppFlavor.stage;
      default:
        return AppFlavor.prod;
    }
  }
}
