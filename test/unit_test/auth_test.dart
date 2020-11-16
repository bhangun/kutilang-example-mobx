import 'package:flutter_driver/driver_extension.dart';
import 'package:kutilangExample/services/local/local_storage.dart';
import 'package:kutilangExample/services/network/rest_services.dart';
import 'package:test/test.dart';

import '../../lib/modules/account/services/user_services.dart';
import '../../lib/utils/config.dart';


void main() {
  const login_data = '{"username": "admin", "password": "admin", "rememberMe": false}';

  group('RestServices', () {
    // This line enables the extension.
    enableFlutterDriverExtension();
    test('Token save to storage', () async{
     expect(await RestServices.post(UserServices.API_USERS_AUTHENTICATE,login_data), containsValue('id_token'));// AppStorage.fetch(TOKEN)); //
       /* await RestServices.post(UserServices.API_USERS_AUTHENTICATE,login_data);
       print(await AppStorage.fetch(TOKEN)); */
    });

   /*  test('value should be decremented', () {
       final counter = Counter();

      counter.decrement();

      expect(counter.value, -1); 
    }); */
  });
}
