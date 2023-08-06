import 'package:flutter/material.dart';
import 'package:food_ox/features/auth/presentation/login_screen.dart';
import 'package:food_ox/features/auth/presentation/sign_up_screen.dart';
import 'package:food_ox/features/categries/presentation/breakfast_screen.dart';
import 'package:food_ox/features/categries/presentation/lunch_screen.dart';
import 'package:food_ox/features/splash/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'splashScreen':
        return PageTransition(
          child: const SplashScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 200),
        );
      case 'loginScreen':
        return PageTransition(
          child: const LoginScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 200),
        );
      case 'signupScreen':
        return PageTransition(
          child: const SignUpScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 200),
        );
      case 'breakfastScreen':
        return PageTransition(
          child: const BreakFastScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 200),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    // todo check my usage
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          // todo move this string to strings manager
          title: const Text(
            '',
          ),
        ),
        // todo move this string to strings manager
        body: const Center(
          child: Text(
            '',
          ),
        ),
      ),
    );
  }
}
