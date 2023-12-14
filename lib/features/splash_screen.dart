import 'package:baby_milestones/app_config/navigation/navigation_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_config/utils/asset_resources.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late bool isFirstTime;

  @override
  void initState() {
    super.initState();
    final navigator = Navigator.of(context);
    checkUserFirstTime().then((value) => isFirstTime = value);

    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        navigator.pushReplacementNamed(
            isFirstTime ? AppRoutes.onboardingScreen : AppRoutes.home);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.purple,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(AssetResources.logo,
                    height: 150.h, width: 150.w),
              )
            ],
          )),
    );
  }

  Future<bool> checkUserFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirstTime = prefs.getBool('first_time') ?? true;

    // If it's the first time, update the flag
    if (isFirstTime) {
      prefs.setBool('first_time', false);
    }

    return isFirstTime;
  }
}
