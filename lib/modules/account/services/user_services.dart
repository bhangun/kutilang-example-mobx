import 'dart:async';
import 'dart:convert';

import '../../../services/network/rest_services.dart';
import '../../../utils/helper.dart';
import '../models/user_model.dart';

class UserServices {
  // static const API = '/api/';

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

// GET getAllUsers
// POST createUser
// PUT updateUser
  static const API_USERS = "users";

// GET getUser
// DELETE deleteUser
  static const API_USER = "users/";
/* 
  login(String _username, String _password, [bool _rememberMe = false]) {
    var body = jsonEncode({
      "username": _username,
      "password": _password,
      "rememberMe": _rememberMe
    });
    try {
      RestServices
          .post(UserServices.API_USERS_AUTHENTICATE, body)
          .then((d) => _saveToken(d.toString()));
      
    } catch (e) {
      FLog.error(text:e.toString());
    }
  }

  bool _saveToken(var token) {
    String _token = json.decode(token)["id_token"];
    FLog.info(text: _token);
    if (_token != null) {
      SharedPrefServices.saveAuthToken(_token);
      NavigationServices.navigateTo(AppsRoutes.home);
      return true;
    } else
      return false;
  } */

  Future<User> user(String id) async {
    var response = await RestServices.fetch(API_USER + id);
    return User.fromJson(json.decode(response));
  }

  static Future<List<User>> users([var page, var size, var sort]) async {
    var data = await RestServices.fetch(API_USERS);
    return User.listFromString(data);
  }

  //
  static createUser(User user) async {
    //return await restPost(API_USER, user.toJson().toString(), true);
  }

  //
  static updateUser(User user) async {
    //return await restPut(API_USER, user.toJson().toString(), true);
  }

  //
  static deleteUser(String userid) async {
    //return await restDelete(API_USER + userid);
  }

  static changePassword(String currentPassword, String newPassword) async {
    //var body = '{"currentPassword": "$currentPassword","newPassword": "$newPassword"}';
  }

  static authorities() {}

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

  static register() {}

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
