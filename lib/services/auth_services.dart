import 'dart:async';
import 'dart:convert';

import 'package:f_logs/f_logs.dart';

import '../modules/account/models/user_model.dart';
import '../utils/config.dart';
import '../utils/helper.dart';
import 'local/local_storage.dart';
import 'network/rest_services.dart';

class AuthServices {

  static const API_ACCOUNT = 'account';

  static const PROFILE = 'profile';
// POST saveAccount
  static const API_ACCOUNT_SAVE = "account";

// POST changePassword
  static const API_ACCOUNT_CHANGE_PASSWORD = "account/change-password";

//POST finishPasswordReset
  static const API_ACCOUNT_RESET_FINISH = "account/reset-password/finish";

// POST requestPasswordReset
  static const API_ACCOUNT_RESET_INIT = "account/reset-password/init";

// GET activateAccount
  static const API_ACTIVATE = "activate";

// POST registerAccount
  static const API_REGISTER = "register";

// GET getActiveProfiles
  static const API_PROFILE_INFO = "profile-info";

// POST authorize
//GET isAuthenticated
  static const API_USERS_AUTHENTICATE = "authenticate";

// GET getAuthorities
  static const API_USERS_AUTHORITIES = "users/authorities";


  static Future<bool> login(String _username, String _password, [bool _rememberMe = false]) async {
    var body = jsonEncode({
      "username": _username,
      "password": _password,
      "rememberMe": _rememberMe
    });
    bool result = false;
    try {
      RestServices
          .post(API_USERS_AUTHENTICATE, body)
          .then((d) => _saveToken(d), 
          onError: (e)=>{
            print(e.toString())
          });
      if(await AppStorage.fetch(AUTH_TOKEN) !=null) {
        result =true;
        FLog.info(text: "Token saved!"+result.toString());
      }
    } catch (e) {
      FLog.error(text:e.toString());
    }
    return result;
  }

  static logout() async{
    await AppStorage.delete(AUTH_TOKEN);
  }

  static bool _saveToken(token) {
    String _token = token['id_token'];
    if (_token != null) {
      FLog.info(text: "try save token");
      AppStorage.put(AUTH_TOKEN, _token);
      FLog.info(text: "token saved!");
      
      return true;
    } else
      return false;
  }


  static changePassword(String currentPassword, String newPassword) async {
    //var body = '{"currentPassword": "$currentPassword","newPassword": "$newPassword"}';
  }

  static authorities() {
    
  }

  static activate() async {
    // ?key=
  }

  static resetPasswordFinish(String key, String newPassword) async {
    // var body = '{"key": "$key","newPassword": "$newPassword"}';
  }

  static resetPasswordInit(String email) async {}

  static profileInfo() async {
    var data = await RestServices.fetch(API_ACCOUNT);
    User user = User.fromJson(json.decode(data.toString()));
    return user;
  }

  static register() {
    
  }

  List<User> usersData(String data) {
    final parsed = json.decode(data).cast<Map<String, dynamic>>();
    List<User> lu = parsed.map<User>((json) => User.fromJson(json)).toList();
    return lu;
  }

  Future<User> userProfile() async {
    String profile = await prefs(PROFILE);
    return User.fromJson(json.decode(profile));
  }
}
