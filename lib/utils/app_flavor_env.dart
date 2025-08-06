import 'package:flutter_dotenv/flutter_dotenv.dart';

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

  static String get baseUrl {
    switch (appFlavor) {
      case AppFlavor.dev:
        return dotenv.env['DEV_API_BASE_URL'] ?? '';
      case AppFlavor.stage:
        return dotenv.env['STAGE_API_BASE_URL'] ?? '';
      case AppFlavor.prod:
        return dotenv.env['PROD_API_BASE_URL'] ?? '';
    }
  }
}
