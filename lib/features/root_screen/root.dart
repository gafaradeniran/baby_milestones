import 'package:baby_milestones/features/dashboard/dashboard.dart';
import 'package:baby_milestones/features/milestones/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int currentIndex = 0;
  List<Widget> pages = [const Homepage(), const Dashboard()];
  final List<IconData> icons = [
    Icons.home_filled,
    Icons.person,
  ];
  final List<String> labels = ['Home', 'Dashboard'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: SizedBox(
        child: BottomAppBar(
          elevation: 0,
          child: FittedBox(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  labels.length,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? Colors.purple[500]
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            icons[index],
                            color: currentIndex == index
                                ? Colors.white
                                : Colors.purple[400],
                            // size: 40.h,
                          ),
                          SizedBox(width: 5.h),
                          currentIndex == index
                              ? Text(
                                  labels[index],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 16),
                                )
                              : const Center(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
