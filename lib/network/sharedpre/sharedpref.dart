import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences? sharePre;

  static init() async {
    sharePre = await SharedPreferences.getInstance();
  }

  static dynamic getData({required String key}) {
    return sharePre!.get(key);
  }

  static dynamic removeData({required String key}) {
    return sharePre!.remove(key);
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharePre!.setString(key, value);
    if (value is bool) return await sharePre!.setBool(key, value);
    if (value is int) {
      return await sharePre!.setInt(key, value);
    } else {
      return await sharePre!.setDouble(key, value);
    }
  }
}
