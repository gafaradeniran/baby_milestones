import 'package:baby_milestones/features/milestones/home.dart';
import 'package:baby_milestones/features/onboarding/onboarding_screen.dart';
import 'package:baby_milestones/features/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initial = "/";
  static const home = "/home";
  static const onboardingScreen = "/onboardingScreen";
  static const dashboardScreen = "/dashboardScreen";
  static const milestonesScreen = "/milestonesScreen";

  static Route? routes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.initial:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case AppRoutes.onboardingScreen:
        return MaterialPageRoute(
            builder: ((context) => const OnboardingScreen()));

      //homescreen
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => const Homepage());

      // case AppRoutes.dashboardScreen:
      //   return MaterialPageRoute(builder: (context) => const Homepage());

      // case AppRoutes.milestonesScreen:
      //   return MaterialPageRoute(builder: (context) => const Homepage());

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('No page found'),
            ),
          ),
        );
    }
  }
}
