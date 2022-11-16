import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  static late SharedPreferences prefs;

  static Future<void> configurePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  static String get routePage {
    return prefs.getString('route') ?? "filter";
  }

  static String get token {
    return prefs.getString('token') ?? "";
  }

  // SETTER
  static set routePage(String value){
    prefs.setString('route', value);
  }

  static set token(String value){
    prefs.setString('token', value);
  }

}
