import 'dart:io' show Platform;

class PlatformUtil {
  PlatformUtil._();

  static bool get isAndroid => Platform.isAndroid;

  static bool get isIOS => Platform.isIOS;
}
