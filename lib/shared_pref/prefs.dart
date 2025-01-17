import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferencesAsync _prefs;

  // call this method from initState() function of mainApp().
  static SharedPreferencesAsync init() => _prefs = SharedPreferencesAsync();

  //sets
  static Future<void> setBool(String key, {required bool value}) async =>
      await _prefs.setBool(key, value);

  static Future<void> setDouble(String key, double value) async =>
      await _prefs.setDouble(key, value);

  static Future<void> setInt(String key, int value) async =>
      await _prefs.setInt(key, value);

  static Future<void> setString(String key, String value) async =>
      await _prefs.setString(key, value);

  static Future<void> setStringList(String key, List<String> value) async =>
      await _prefs.setStringList(key, value);

  //gets
  static Future<bool?> getBool(String key) async => await _prefs.getBool(key);

  static Future<double?> getDouble(String key) async =>
      await _prefs.getDouble(key);

  static Future<int?> getInt(String key) async => await _prefs.getInt(key);

  static Future<String?> getString(String key) async =>
      await _prefs.getString(key);

  static Future<List<String>?> getStringList(String key) async =>
      await _prefs.getStringList(key);

  //deletes..
  static Future<void> remove(String key) async => await _prefs.remove(key);

  static Future<void> clear() async => await _prefs.clear();
}
