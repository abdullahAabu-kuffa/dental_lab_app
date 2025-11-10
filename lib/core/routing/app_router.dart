//app router
import 'package:dental_lab_app/logic/cubit/register_cubit/register_cubit.dart';
import 'package:dental_lab_app/presentation/screens/auth/login.dart';
import 'package:dental_lab_app/presentation/screens/auth/register.dart';
import 'package:dental_lab_app/presentation/screens/onboarding/onboarding_view.dart';
import 'package:dental_lab_app/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const Login());
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterCubit(),
            child: const Register(),
          ),
        );
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
  static const String registerRoute = 'register';
  static const String homeRoute = '/home';
}
