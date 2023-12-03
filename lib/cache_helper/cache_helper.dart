import 'package:shared_preferences/shared_preferences.dart';

class cacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> putDataMode(
      {required String key, required bool value}) async {
    return await sharedPreferences?.setBool(key, value);
  }

  static dynamic getData({required String key}) {
    return sharedPreferences?.get(key) ?? false;
  }

  static Future<bool?>? saveData(
      {required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences?.setString(key, value);
    }
    if (value is bool) {
      return await sharedPreferences?.setBool(key, value);
    }
    if (value is int) {
      return await sharedPreferences?.setInt(key, value);
    }
    return await sharedPreferences?.setDouble(key, value);
  }
}
