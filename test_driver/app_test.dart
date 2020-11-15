// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Kutilang App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final username = find.byValueKey('user_id');
    final password = find.byValueKey('user_password');
    final login = find.byValueKey('user_sign_button');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts at 0', () async {
    
      await driver.tap(username);  // acquire focus
      await driver.enterText('admin');  // enter text
      await driver.waitFor(find.text('admin'));  // verify text appears on UI
      //expect(await driver.getText(username), "admin");
      await driver.tap(password);  // acquire focus
      await driver.enterText('admin');  // enter another piece of text
      await driver.waitFor(find.text('admin')); 
      //expect(await driver.getText(password), "admin");
      await driver.tap(login); 
      await driver.waitFor(find.text('admin'));
    });
  });
}
