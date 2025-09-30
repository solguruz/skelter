import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryUtil {
  static const _method = 'getBatteryLevel';
  static const MethodChannel _channel =
      MethodChannel('com.skelter.battery/channel');

  static Future<int?> getBatteryLevel() async {
    try {
      final batteryLevel = await _channel.invokeMethod<int?>(_method);
      return batteryLevel;
    } on PlatformException catch (e) {
      if (e.code == 'UNAVAILABLE') {
        debugPrint('Battery level not available (likely on simulator)');
      }
      rethrow;
    }
  }
}
