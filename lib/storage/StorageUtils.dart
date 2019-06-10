import 'package:shared_preferences/shared_preferences.dart';

class StorageUtils {
  static Future get(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.getString(key);
  }

  static Future set(String key, String value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);
  }
}
