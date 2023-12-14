import 'package:baby_milestones/features/shared/app_button.dart';
import 'package:baby_milestones/app_config/utils/asset_resources.dart';
import 'package:baby_milestones/features/dashboard/widgets/update_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String name = 'Update name';
  String bio = 'Update bio';
  String babyName = 'Update Baby\'s name';
  String age = 'Update Baby\'s age';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage(
                  AssetResources.logo,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
            ),
            SizedBox(height: 15.h),
            Text(
              bio,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
            ),
            SizedBox(height: 15.h),
            Text(
              babyName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
            ),
            SizedBox(height: 20.h),
            Text(
              age,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
            ),
            SizedBox(height: 20.h),
            AppButton(
              text: 'Edit Profile Details',
              onPressed: () {
                setState(() {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateDetails(
                              name: name,
                              bio: bio,
                              babyName: babyName,
                              age: age)));
                });
              },
              width: double.infinity,
              color: Colors.purple,
              textColor: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              borderRadius: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
