import 'package:shared_preferences/shared_preferences.dart';

/*
    全局缓存
*/
SharedPreferences prefs;

class Pool {
  static String getString(String key) {
    return prefs.getString(key);
  }

  static setCache(String key, dynamic value) {
    prefs.setString(key, value);
  }

  static removeCache(String key) {
    prefs.remove(key); //删除指定键
  }

  static clearCache() {
    prefs.clear(); //清空键值对
  }
}
