import 'package:baby_milestones/app_config/navigation/navigation_routes.dart';
import 'package:baby_milestones/features/shared/app_button.dart';
import 'package:baby_milestones/features/onboarding/model/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return buildOnboardingPage(
                onboardingData[index].title,
                onboardingData[index].subtitle,
                onboardingData[index].image,
              );
            },
          ),
          Positioned(
            bottom: 100.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => containerIndicator(index),
              ),
            ),
          ),
          if (_currentPage == onboardingData.length - 1)
            Positioned(
                bottom: 20.h,
                left: 20.w,
                right: 20.w,
                child: AppButton(
                  text: 'Go to Home',
                  fontSize: 16.sp,
                  textColor: Colors.white,
                  fontWeight: FontWeight.w600,
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.home);
                  },
                  borderRadius: 15,
                  color: Colors.purple,
                )),
        ],
      ),
    );
  }

  Widget buildOnboardingPage(String title, String subtitle, String img) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: Image.asset(img, fit: BoxFit.contain),
          ),
          SizedBox(height: 30.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget containerIndicator(int index) {
    return Container(
      height: 8,
      width: 8,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? Colors.purple : Colors.grey,
      ),
    );
  }
}
