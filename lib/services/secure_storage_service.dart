// NOTE: This service is NOT used by default in this app.
// The app now uses SharedPreferences for storage.
// Use SecureStorageService if you need to store sensitive data securely
// FlutterSecureStorage provides encrypted storage
// If you want to use this, you must explicitly call it in your code.
// For more info: https://pub.dev/packages/flutter_secure_storage

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  factory SecureStorageService() => _instance;

  SecureStorageService._();

  static final SecureStorageService _instance = SecureStorageService._();

  static const _true = 'true';
  static const _false = 'false';

  final _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  Future<void> setBool(String key, {required bool value}) async {
    await _storage.write(key: key, value: value ? _true : _false);
  }

  Future<void> setString(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> getString(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> clear() async => await _storage.deleteAll();
}
