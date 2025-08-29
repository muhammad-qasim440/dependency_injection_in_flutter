# dependency_injection_in_flutter
a repository to practice the dependency injection in flutter mobile app development 


# Dependency :
Dependency is simply an other class or object that your class needs to work. 
 in code folder: 
  lib/services/auth_service => AuthService = Dependency 
  lib/repository/user_repository => UserRepository = Depends on it

Hint: if we remove AuthService then UserRepository can not function.

# injection:
Injections means providing dependency from outside , instead of creating it inside the class.

example: 

  // Injecting AuthService into UserRepository 
  
  final userRepository = UserRepository(AuthService());
  // without injection
  class UserRepository {
 final AuthService authService=AuthService(); // creates its own dependency
 }
  hint: UserRepository can not use any other AuthService (mock, fake to test). It's hard-wired.
  
# tight coupling:
  A class creates it's own dependencies inside of it.
  DisAdvantage: inflexible, hard to test
  example:
  class PaymentService{
   final StripeApi api = StripeApi(); // tightly coupled
  }
# loose coupling: 
  Dependencies are passed from outside, instead of creating inside the class.
  Advantages: flexible, testable using mock or fake Api's 
  example:
   class PaymentService{
     final PaymentAPI api;
    PaymentService(this.api); // loose coupling
}

# Types of Dependency Injections (DI)

there are 3 common types of DI 
1. Constructor Injection 
2. Property Injection
3. Method Injection

# 1.Constructor Injection:
  in which dependency is passes in a constructor of class. it is preferred technique to use.
  example:
   class UserRepository{
   final AuthService authService;
   UserRepository(this.authService); // constructor Injection
}

# 2.Property Injection:
  in which dependency is set on later.
  example:
   class UserRepository {
  late AuthService authService;
  
}

# 3.Method Injection:
  in which dependency is passed in a method function.
  example:
  class UserRepository(AuthService authService){
   void authenticate(){
  authService.login();
  }
  }
# hint: Constructor injection is most common in flutter because it ensures the object is always initialized with it's required dependencies.





<-------------- Please Read the console logs  to check the prints from the different techniques of Dependency Injections---------------->