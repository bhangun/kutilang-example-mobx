import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/main.dart';
import '../lib/views/login.dart';
import '../lib/widgets/rounded_button_widget.dart';

void main() {
  // This line enables the extension.
  /* testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget( KutilangApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  }); */

  testWidgets('Widget Test LoginScreen ', (WidgetTester tester) async {

    // Enter text code...
    await tester.pumpWidget(LoginScreen());

    // Enter username 'admin' into the TextField.
    await tester.enterText(find.byKey(Key('user_id')), 'admin');
    expect(find.text('admin'), findsOneWidget);
    // Enter password 'admin' into the TextField.
    await tester.enterText(find.byKey(Key('user_password')), 'admin');
    expect(find.text('admin'), findsOneWidget);
    // Tap the add button.
    await tester.tap(find.byKey(Key('user_sign_button')));

    // Rebuild the widget after the state has changed.
    await tester.pump();

    // Expect to find the item on screen. RoundedButtonWidget
    // expect(find.text('hi'), findsOneWidget);

// Swipe the item to dismiss it.
/*   await tester.drag(find.byType(Dismissible), Offset(500.0, 0.0));

  // Build the widget until the dismiss animation ends.
  await tester.pumpAndSettle();

  // Ensure that the item is no longer on screen.
  expect(find.text('hi'), findsNothing); */


/* In addition to findsOneWidget, flutter_test provides additional matchers for common cases.

findsNothing
Verifies that no widgets are found.
findsWidgets
Verifies that one or more widgets are found.
findsNWidgets
Verifies that a specific number of widgets are found.
matchesGoldenFile
Verifies that a widget’s rendering matches a particular bitmap image (“golden file” testing). */

});

}

