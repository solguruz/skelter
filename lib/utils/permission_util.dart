import 'dart:io' show Platform;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  static Future<bool> hasStoragePermission() async {
    try {
      if (Platform.isIOS) return true;
      if (Platform.isAndroid) {
        final sdkVersion = await _getAndroidSdkVersion();
        if (sdkVersion >= 33) return true;
        final status = await Permission.storage.request();
        return status.isGranted;
      }
      return false;
    } catch (e) {
      debugPrint('Error checking storage permission: $e');
      return false;
    }
  }

  static Future<bool> hasCameraPermission() async {
    final status = await Permission.camera.request();
    return status.isGranted;
  }

  static Future<bool> hasLocationPermission() async {
    final status = await Permission.location.request();
    return status.isGranted;
  }

  static Future<bool> hasMicrophonePermission() async {
    final status = await Permission.microphone.request();
    return status.isGranted;
  }

  static Future<bool> hasContactsPermission() async {
    final status = await Permission.contacts.request();
    return status.isGranted;
  }

  /// Retrieves the Android SDK version.
  /// Used internally to check which storage permission to request.
  static Future<int> _getAndroidSdkVersion() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final androidInfo = await deviceInfoPlugin.androidInfo;
    return androidInfo.version.sdkInt;
  }
}
