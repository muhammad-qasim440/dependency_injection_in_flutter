import 'package:dependency_injection_in_flutter/services/auth_service.dart';

/// Types of Dependency Injection
/// 1. Constructor Injection ( most common)

class UserRepository{

  // final AuthService _authService=AuthService(); /// this is tight coupling means a class creates its own dependency ( disadvantage => hard to test , inflexible)
  final AuthService authService; /// this is loose coupling : in which dependencies are passed from outside ( advantages => flexible , testable means in this technique we can pass the mock or fake dependencies to perform testing)
  UserRepository(this.authService); /// this is the constructor injection type of Dependency Injection

  void authenticate(){
    authService.login();
  }
}

/// 2. Property Injection ( set dependency later )

class UserRepository1 {
  late AuthService authService;

  void setAuthService(AuthService service){
    authService = service;
  }

   void authenticate(){
   print('from Property Injection');
   authService.login();
   }
}

/// 3. Method  Injection

class UserRepository2{
  void authenticate(AuthService authService){
    print('from method Injection');
    authService.login();
  }
}
