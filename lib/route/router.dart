import 'package:flutter/material.dart';
import 'package:hello_app/Screens/homescreen.dart';
import 'package:hello_app/Screens/registration_Screen.dart';
import 'package:hello_app/Screens/welcome_Screen.dart';

class NavRouter{
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
        );
      case "HomeScreen":
        return MaterialPageRoute(
          builder: (_) => HomeScreen()
          
          
        );
      case "RegistrationScreen":
        return MaterialPageRoute(
          builder: (_) => const RegistraionScreen()
          
          
        );
      // case 'OTPSCREEN':
      //   var data = settings.arguments as String;
      //   return MaterialPageRoute(builder: (_) => OtpScreen());
     
      default:
        return null;
    }
  }
}