import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  CachHelper._();
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setOpened() async {
    await prefs.setBool('isOpened', true);
  }

  static getOpened() {
    return prefs.getBool('isOpened') ?? false;
  }

  static Future<bool> setLoggdIn() async {
    return await prefs.setBool('loggedIn', true);
  }

  static getLoggdIn() {
    return prefs.getBool('loggedIn') ?? false;
  }
}
