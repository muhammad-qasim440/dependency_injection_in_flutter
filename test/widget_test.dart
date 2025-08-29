// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:dependency_injection_in_flutter/reposittories/user_repository.dart';
import 'package:dependency_injection_in_flutter/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dependency_injection_in_flutter/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final authService=AuthService();
    /// constructor Injection
    // final userRepository=UserRepository(authService);
    // await tester.pumpWidget( MyApp(userRepository));

    /// Property Injection
    // final userRepository1=UserRepository1();
    //       userRepository1.setAuthService(authService);
    // await tester.pumpWidget( MyApp(userRepository1));
    /// Method Injection
    final userRepository2=UserRepository2();
    await tester.pumpWidget( MyApp(userRepository2));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
