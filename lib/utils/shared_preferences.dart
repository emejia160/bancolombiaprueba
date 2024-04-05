
import 'package:shared_preferences/shared_preferences.dart';
class SharedPreferenceUtils {

  static Future<bool> putStringList(String key, List<String> list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setStringList(key, list);
  }

  static Future<List<String>> getStringList(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(key);
    if (list != null) {
      return list;
    } else {
      return [];
    }
  }
}