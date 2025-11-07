//app router
import 'package:dental_lab_app/presentation/screens/login/login.dart';
import 'package:dental_lab_app/presentation/screens/onboarding/onboarding_view.dart';
import 'package:dental_lab_app/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const Login());
      case Routes.homeRoute:
      default:
        return null;
    }
  }
}

//the routes of screens
class Routes {
  Routes._();

  static const String initialRoute = '/';
  static const String onBoardingRoute = 'onBoarding';
  static const String loginRoute = 'login';
  static const String homeRoute = '/home';
}
