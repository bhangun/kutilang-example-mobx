import 'package:dio/dio.dart';
import 'package:f_logs/f_logs.dart';
import 'package:kutilangExample/services/shared_preference_services.dart';
import 'package:kutilangExample/utils/config.dart';


class RestServices {

  static Dio dio = Dio()
    ..options.baseUrl = API
    ..options.connectTimeout = TIMEOUT_CONNECTION
    ..options.receiveTimeout = TIMEOUT_RECEIVE
    // ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
    ..interceptors.add(LogInterceptor(responseBody: true))
    ..interceptors.add(InterceptorsWrapper(onRequest: (Options options) async {
        // getting shared pref instance
       /*  var prefs = await SharedPrefServices.instance;

        // getting token
        var token = prefs.authToken;
        options.headers.putIfAbsent('Authorization', () => token);

        if (token != null) {
          options.headers = {'Authorization': 'Bearer $token'};
          

        } else {
          FLog.info(text: 'Auth token is null');
        } */
      }
    ))
    // requestLock.lock()-> If no token, request token firstly and lock this interceptor
    // to prevent other request enter this interceptor.
    // ..interceptors.requestLock.lock()
    ;


  // Get:-----------------------------------------------------------------------
  static Future<dynamic> fetch(String uri) async {
    try {
      final Response response = await dio.get(uri);
      FLog.info(text: response.toString());
      return response.data;
    } catch (e) {
      FLog.error(text: e.toString());
      throw e;
    }
  }

  // Post:----------------------------------------------------------------------
  static Future<dynamic> post(String uri, dynamic data) async {
    try {
      final Response response = await dio.post(uri, data: data);
      FLog.info(text:uri+ response.data);
      return response.data;
    } catch (e) {
      FLog.error(text: e.toString());
      throw e;
    }
  }

  // Post:----------------------------------------------------------------------
  static Future<dynamic> delete(String uri, dynamic data) async {
    try {
      final Response response = await dio.delete(uri, data: data);
      return response.data;
    } catch (e) {
      FLog.error(text: e.toString());
      throw e;
    }
  }

  // Post:----------------------------------------------------------------------
  static Future<dynamic> put(String uri, dynamic data) async {
    try {
      final Response response = await dio.put(uri, data: data);
      return response.data;
    } catch (e) {
      FLog.error(text: e.toString());
      throw e;
    }
  }

}
