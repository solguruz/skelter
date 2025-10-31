import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:skelter/presentation/force_update/constants/force_update_constants.dart';

class RemoteConfigService {
  static RemoteConfigService? _instance;

  factory RemoteConfigService() {
    return _instance ??= RemoteConfigService._internal();
  }

  RemoteConfigService._internal();

  bool _isInitialized = false;

  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      await FirebaseRemoteConfig.instance.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 30),
          minimumFetchInterval: Duration.zero,
        ),
      );

      await FirebaseRemoteConfig.instance.setDefaults(const {
        kRemoteConfigAppLatestVersionKey: '1.0.0',
        kRemoteConfigMandatoryAppVersionKey: '1.0.0',
      });

      final activated = await FirebaseRemoteConfig.instance.fetchAndActivate();
      debugPrint('[RemoteConfig] Fetch and activate: $activated');

      _logCurrentValues();
      _isInitialized = true;

      FirebaseRemoteConfig.instance.onConfigUpdated.listen((_) async {
        await FirebaseRemoteConfig.instance.activate();

        _logCurrentValues();
      });
    } catch (e) {
      debugPrint('[RemoteConfig] Initialization error: $e');
    }
  }

  String getString(String key, {String defaultValue = ''}) {
    try {
      final value = FirebaseRemoteConfig.instance.getString(key);
      return value.isNotEmpty ? value : defaultValue;
    } catch (e) {
      debugPrint('[RemoteConfig] Error getting string for key $key: $e');
      return defaultValue;
    }
  }

  void _logCurrentValues() {
    debugPrint('[RemoteConfig] MandatoryAppVersion: '
        '${getString(kRemoteConfigMandatoryAppVersionKey)}');

    debugPrint('[RemoteConfig] AppLatestVersion: '
        '${getString(kRemoteConfigAppLatestVersionKey)}');
  }
}
