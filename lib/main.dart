import 'package:dependency_injection_in_flutter/reposittories/user_repository.dart';
import 'package:dependency_injection_in_flutter/services/auth_service.dart';
import 'package:flutter/material.dart';


/// manual Injection
void main() {
  final authService=AuthService();

  /// constructor Injection
  // final userRepository= UserRepository( authService);
  // runApp(MyApp(userRepository,));

/// Property Injection
//   final userRepository1=UserRepository1();
//   userRepository1.setAuthService(authService);
//   runApp(MyApp(userRepository1,));
  /// Method Injection
  final userRepository2=UserRepository2();
  runApp(MyApp(userRepository2,));
}

class MyApp extends StatelessWidget {
  /// constructor Injection
  // final UserRepository userRepository;
  //  const MyApp(this.userRepository, {super.key});
   /// Property Injection
  //  final UserRepository1 userRepository1;
  //  const MyApp(this.userRepository1, {super.key});
  /// Method Injection
  final UserRepository2 userRepository2;
  const MyApp(this.userRepository2, {super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// constructor Injection
      // home: MyHomePage(userRepository: userRepository,),
      /// Property Injection
      // home: MyHomePage(userRepository1: userRepository1,),
      /// Method Injection
      home: MyHomePage(userRepository2: userRepository2,),
    );
  }
}

class MyHomePage extends StatelessWidget {
  /// constructor Injection
  // final UserRepository userRepository;
  // const MyHomePage({super.key, required this.userRepository});
  /// Property Injection
  // final UserRepository1 userRepository1;
  // const MyHomePage({super.key, required this.userRepository1});
  /// Method Injection
  final UserRepository2 userRepository2;
  const MyHomePage({super.key, required this.userRepository2});
  @override
  Widget build(BuildContext context) {
    /// constructor Injection
    // userRepository.authenticate();
    /// Property Injection
    // userRepository1.authenticate();
    /// Method Injection
    final authService=AuthService();
    userRepository2.authenticate(authService);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Screen '),
          ],
        ),
      ),
    );
  }
}
