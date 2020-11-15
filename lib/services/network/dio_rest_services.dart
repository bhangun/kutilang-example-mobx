import 'package:dio/dio.dart';
import 'package:f_logs/f_logs.dart';
import 'package:kutilangExmaple/services/shared_preference_services.dart';
import 'package:kutilangExmaple/utils/config.dart';


class RestDioServices {

  static Dio dio = Dio()
    ..options.baseUrl = BASE_URL
    ..options.connectTimeout = TIMEOUT_CONNECTION
    ..options.receiveTimeout = TIMEOUT_RECEIVE
    ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
    ..interceptors.add(LogInterceptor(responseBody: true))
    ..interceptors.add(InterceptorsWrapper(onRequest: (Options options) async {
      // getting shared pref instance
      var prefs = await SharedPrefServices.instance;

      // getting token
      var token = prefs.authToken;

      if (token != null) {
        options.headers = {'Authorization': 'Bearer $token'};
        options.headers.putIfAbsent('Authorization', () => token);

      } else {
        FLog.debug(text: 'Auth token is null');
      }
    }));


  // Get:-----------------------------------------------------------------------
   Future<dynamic> fetch(String uri) async {
    try {
      final Response response = await dio.get(uri);
      return response.data;
    } catch (e) {
      FLog.error(text: e.toString());
      throw e;
    }
  }

  // Post:----------------------------------------------------------------------
   Future<dynamic> post(String uri, dynamic data) async {
    try {
      final Response response = await dio.post(uri, data: data);
      return response.data;
    } catch (e) {
      FLog.error(text: e.toString());
      throw e;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> delete(String uri, dynamic data) async {
    try {
      final Response response = await dio.delete(uri, data: data);
      return response.data;
    } catch (e) {
      FLog.error(text: e.toString());
      throw e;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> put(String uri, dynamic data) async {
    try {
      final Response response = await dio.put(uri, data: data);
      return response.data;
    } catch (e) {
      FLog.error(text: e.toString());
      throw e;
    }
  }

}
