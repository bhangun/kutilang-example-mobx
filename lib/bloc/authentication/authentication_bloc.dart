import 'dart:convert';
import 'package:f_logs/f_logs.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:kutilangExample/modules/account/services/user_services.dart';
import 'package:kutilangExample/services/apps_routes.dart';
// import 'package:kutilangExample/services/getIt.dart';
import 'package:kutilangExample/services/navigation.dart';
import 'package:kutilangExample/services/shared_preference_services.dart';

import '../../services/network/rest_services.dart';
import '../../utils/config.dart';

part 'authentication_bloc.g.dart';

class AuthenticationStore = _AuthenticationStore with _$AuthenticationStore;

abstract class _AuthenticationStore with Store {

  @observable
  String username = '';
  @observable
  String userMessage = '';
  @observable
  String password = '';
  @observable
  String passwordMessage = '';
  @observable
  String confirmPassword = '';
  @observable
  String confirmPasswordMessage = '';
  @observable
  bool success = false;
  @observable
  bool loggedIn = false;
  @observable
  bool loading = false;
  @observable
  bool rememberMe = false;
  @observable
  String errorMessage = 'error';
  @observable
  bool showError = false;
  

  //@action
  bool get canLogin => hasErrorsInLogin; //&& username !='' && password !='';

  bool get canRegister =>
      !hasErrorsInRegister &&
      username.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty;
  @computed
  bool get canForgetPassword =>
      !hasErrorInForgotPassword && username.isNotEmpty;

  // error handling:-------------------------------------------------------------------
  @computed
  bool get hasErrorsInLogin => username != '' || password != '';
@computed
  bool get hasErrorsInRegister =>
      username != null || password != null || confirmPassword != null;
@computed
  bool get hasErrorInForgotPassword => username != null;

  // actions:-------------------------------------------------------------------
@action
  void setUserId(String value) {
    username = value;
    _validateUserEmail(value);
  }
@action
  void setPassword(String value) {
    password = value;
    _validatePassword(value);
  }
@action
  void setConfirmPassword(String value) {
    confirmPassword = value;
  }

  void _validateUserEmail(String value) {
    // Regex for email validation
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";

    RegExp regExp = new RegExp(p);

    if (value.isEmpty) {
      userMessage = "Email can't be empty";
    } else if (regExp.hasMatch(value)) {

    }else userMessage = null;
    /* else if (!isEmail(value)) {
      userMessage = 'Please enter a valid email address';
    } */
    /*else {

      showError = true;
      errorMessage = 'Email provided isn\'t valid.Try another email address';
    }*/
  }

  void _validatePassword(String value) {
    if (value.isEmpty) {
      passwordMessage = "Password can't be empty";
    } /* else if (value.length < 6) {
      password = "Password must be at-least 6 characters long";
    }  */
    else {
      passwordMessage = null;
    }
  }
 
  /*void _validateConfirmPassword(String value) {
    if (value.isEmpty) {
      confirmPasswordMessage = "Confirm password can't be empty";
    } else if (value != password) {
      confirmPasswordMessage = "Password doesn't match";
    } else {
      confirmPasswordMessage = null;
    }
    notifyListeners();
  }*/
  @action
  Future register() async {
    loading = true;
  }


  @action
  login() async{
    loading = true;
    success = false;
    loggedIn = false;

    try {
      var body = jsonEncode({"username": username, "password": password, "rememberMe": rememberMe});
      FLog.info(text: 'Auth Body: '+body);
      var response = await RestServices.post(UserServices.API_USERS_AUTHENTICATE, body);
      
      FLog.info(text:response);
      
      if (_saveToken(response)){
        loggedIn = true;
        loading = false;
        success = true;
        NavigationServices.navigateTo(AppsRoutes.home);

      }else if (response.toString().contains("Unauthorized")){
        showError = true;
        errorMessage =  "Username and password doesn't match";
        loading = false;
      } else {
        showError = true;
        errorMessage =  "Something went wrong, please check your network and try again";
        loading = false;
      }

    } catch (e) {
      showError = true;
      errorMessage =  "Something went wrong, please check your network and try again";
      loading = false;
      FLog.info(text:e.toString());
    }

  }

  bool _saveToken(var token) {
    String _token = json.decode(token)["id_token"];
    if (_token != null) {
      SharedPrefServices.saveAuthToken(_token);
      return true;
    } else return false;
  }
  @action
  Future forgotPassword() async {
    loading = true;
  }
  @action
  Future logout() async {
    SharedPreferences.getInstance().then((preference) {
      preference.setBool(IS_LOGGED_IN, false);
    });
    loading = true;
  }
}
