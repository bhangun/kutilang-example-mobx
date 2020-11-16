import 'dart:async';
import 'package:corsac_jwt/corsac_jwt.dart';
import 'package:kutilangExample/services/local/local_storage.dart';
import 'config.dart';

//
setPrefs(String key,String value) {
  AppStorage.put(key, value);
}

//
Future<String> prefs(String key) async {
  return AppStorage.fetch(key);
}

Future<JWT> jwt() async {
  return JWT.parse(await prefs(TOKEN));
}

//
Future<List<String>> roles() async {
  return (await jwt()).getClaim("auth").toString().split(",");
}

Future<bool> isRole(String role) async {
  final List<String> b=await roles();
  return b.contains(role);
}

instantToDate(DateTime date){
  return DateTime.parse(date.toString().substring(0,date.toString().length-1));
}

