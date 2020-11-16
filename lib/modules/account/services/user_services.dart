import 'dart:async';
import 'dart:convert';

import '../../../services/network/rest_services.dart';
import '../models/user_model.dart';

class UserServices {
// GET getAllUsers
// POST createUser
// PUT updateUser
  static const API_USERS = "users";

// GET getUser
// DELETE deleteUser
  static const API_USER = "users/";


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

}
