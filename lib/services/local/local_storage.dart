import 'package:f_logs/f_logs.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class AppStorage {

static final _storage = FlutterSecureStorage();
  // Singleton instance
  static final AppStorage _singleton = AppStorage._();

  // A private constructor. Allows us to create instances of AppDatabase
  // only from within the AppStorage class itself.
  AppStorage._();

  // Singleton accessor
  static AppStorage get instance {
    print("???????????instance??????????????");
    //if(_storage ==null)
     // _storage =  new FlutterSecureStorage();
    print("???????????--------??????????????");
    FLog.info(text: "<><><><><><><><><><>< "+_storage.toString());
    return _singleton;
  }

  // Database object accessor
  static get i async {
    return FlutterSecureStorage();
  }

  // Read value 
  static Future<String> fetch(String key) async{
    return  await _storage.read(key: key);
  }

  // Read all values
  static Future<Map<String, String>> fetchAll() async{
    return await _storage.readAll();
  }

  // Delete value 
  static delete(String key) async{
    await _storage.delete(key: key);
  }

  // Delete all 
  static deleteAll() async{
    await _storage.deleteAll();
  }

  // Write value 
  static put(String key, String value) async{
    
    await _storage.write(key: key, value: value);
  }
}