import 'dart:io';

class AppEnvironment {
  static bool get isTestEnvironment {
    return Platform.environment.containsKey('FLUTTER_TEST');
  }
}
