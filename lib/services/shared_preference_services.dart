import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:kutilangExample/utils/config.dart';



class SharedPrefServices {
  // singleton object
  static final SharedPrefServices _singleton = SharedPrefServices._();

  static SharedPreferences _preferences;
  // A private constructor. Allows us to create instances of SharedPreferenceHelper
  // only from within the SharedPreferenceHelper class itself.
  SharedPrefServices._();

  // factory method to return the same object each time its needed
  factory SharedPrefServices() => _singleton;

  // Singleton accessor
  static Future<SharedPrefServices> get instance async{
    if (_preferences==null)
      _preferences = await SharedPreferences.getInstance();
    return _singleton;
  }

  // General Methods: ----------------------------------------------------------
  String get authToken => _preferences.getString(AUTH_TOKEN);

  static saveAuthToken(String authToken) => _preferences.setString(AUTH_TOKEN, authToken);

  static removeAuthToken() => _preferences.remove(AUTH_TOKEN);

  bool get isLoggedIn => _preferences.getString(AUTH_TOKEN) ?? false;

  setPrefs(String key,String value) => _preferences.setString(key, value);

  String prefs(String key) => _preferences.getString(key);

}
