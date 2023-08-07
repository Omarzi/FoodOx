import 'package:flutter/material.dart';
import 'package:food_ox/features/auth/presentation/login_screen.dart';
import 'package:food_ox/features/auth/presentation/sign_up_screen.dart';
import 'package:food_ox/features/categries/presentation/breakfast_screen.dart';
import 'package:food_ox/features/layout/home/presentation/from_home_to_breakfast_screen.dart';
import 'package:food_ox/features/layout/home/presentation/from_home_to_drink_screen.dart';
import 'package:food_ox/features/layout/home/presentation/from_home_to_lunch_screen.dart';
import 'package:food_ox/features/layout/home/presentation/home_screen.dart';
import 'package:food_ox/features/layout/layout.dart';
import 'package:food_ox/features/layout/recommended/presentation/edit_recommended_screen.dart';
import 'package:food_ox/features/schedule/presentation/edit_schedule_screen.dart';
import 'package:food_ox/features/schedule/presentation/schedule_screen.dart';
import 'package:food_ox/features/splash/landing_screen.dart';
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
      case RoutePath.breakFastScreen:
        final whereFrom = settings.arguments as String;
        return PageTransition(
          child:  BreakFastScreen(whereFrom:whereFrom ),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 200),
        );
      case RoutePath.layoutScreen:
        return PageTransition(
          child: const LayoutScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 200),
        );
      case RoutePath.homeScreen:
        return PageTransition(
          child: const HomeScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 200),
        );
      case RoutePath.scheduleScreen:
        return PageTransition(
          child: ScheduleScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 200),
        );
        case RoutePath.fromHomeToBreakFastScreen:
        return PageTransition(
          child: FromHomeToBreakFastScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 200),
        );
        case RoutePath.fromHomeToLunchScreen:
        return PageTransition(
          child: FromHomeToLunchScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 200),
        );
        case RoutePath.fromHomeToDrinkScreen:
        return PageTransition(
          child: FromHomeToDrinkScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 200),
        );
        case RoutePath.editScheduleScreen:
        return PageTransition(
          child: EditScheduleScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 200),
        );
        case RoutePath.editRecommendedScreen:
        return PageTransition(
          child: EditRecommendedScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 200),
        ); case RoutePath.landingScreen:
        return PageTransition(
          child: LandingScreen(),
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

class RoutePath {
  static const String layoutScreen = 'LayoutScreen';
  static const String homeScreen = 'HomeScreen';
  static const String landingScreen = 'LandingScreen';
  static const String scheduleScreen = 'ScheduleScreen';
  static const String editScheduleScreen = 'EditScheduleScreen';
  static const String breakFastScreen = 'BreakFastScreen';
  static const String fromHomeToBreakFastScreen = 'FromHomeToBreakFastScreen';
  static const String fromHomeToLunchScreen = 'FromHomeToLunchScreen';
  static const String fromHomeToDrinkScreen = 'FromHomeToDrinkScreen';
  static const String editRecommendedScreen = 'EditRecommendedScreen';
}
