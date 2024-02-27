// i created the SharedPreferences methods by installing
// the Package and created the two related methods
// cachedDatd() to set and save the data & getCachedData() to read the saved data

import 'package:shared_preferences/shared_preferences.dart';

class AppLocal {
  static String IMAGE_KEY = 'IMAGE';
  static String NAME_KEY = 'NAME';
  static String ISUPLOAD_KEY = 'ISUPLOAD';

  static cacheData(String key, value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is String) {
      prefs.setString(key, value);
    } else if (value is int) {
      prefs.setInt(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else {
      prefs.setStringList(key, value);
    }
  }

  static Future getCachedData(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }
}
