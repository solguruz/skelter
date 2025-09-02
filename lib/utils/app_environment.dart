import 'dart:async';
import 'dart:io';

class AppEnvironment {
  static bool get isTestEnvironment {
    return Platform.environment.containsKey('FLUTTER_TEST') ||
        Platform.environment.containsKey('PATROL_ENABLED') ||
        Zone.current[#test.declarer] != null;
  }
}
