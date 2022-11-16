import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  static late SharedPreferences prefs;

  static Future<void> configurePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  static String get routePage {
    return prefs.getString('route') ?? "filter";
  }

  static List<String> get favorites {
    return prefs.getStringList('favorites') ?? [];
  }

  // SETTER
  static set routePage(String value){
    prefs.setString('route', value);
  }

  static set favorites(List<String> value){
    prefs.setStringList('favorites', value);
  }

}
