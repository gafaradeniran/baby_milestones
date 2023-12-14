import 'package:baby_milestones/features/shared/app_button.dart';
import 'package:baby_milestones/features/shared/custom_textfield.dart';
import 'package:baby_milestones/features/shared/modal_screen.dart';
import 'package:baby_milestones/app_config/utils/asset_resources.dart';
import 'package:baby_milestones/features/milestones/services/provider.dart';
import 'package:baby_milestones/features/milestones/widgets/create_milestone.dart';
import 'package:baby_milestones/features/milestones/widgets/milestone_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController searchControlller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final milestoneProvider = Provider.of<MilestoneProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: ClipRRect(
            child: Column(
              children: [
                20.verticalSpace,
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.35),
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.purple,
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          child: Image.asset(AssetResources.logo),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      'Welcome,',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: Colors.purple),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                CustomTextField(
                  controller: searchControlller,
                  suffixIcon: const Icon(Icons.search, color: Colors.black),
                  label: 'Search milestones',
                  onChanged: (v) {
                    if (v!.isNotEmpty) {
                      setState(() {});
                    } else {
                      setState(() {});
                    }
                  },
                ),
                SizedBox(height: 15.h),
                Container(
                  width: double.maxFinite,
                  height: 150.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purple.shade300,
                      image: const DecorationImage(
                          image: AssetImage(
                        AssetResources.onboarding2,
                      ))),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'want to create your first milestone?',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        AppButton(
                          text: 'Start now',
                          onPressed: () {
                            openModalScreen(
                              context,
                              const CreateMilestone(),
                            );
                          },
                          borderRadius: 10,
                          color: Colors.purple,
                          textColor: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          width: 100.w,
                        )
                      ],
                    ),
                  ),
                ),
                20.verticalSpace,
                Container(
                  padding: const EdgeInsets.all(6.0),
                  margin: const EdgeInsets.symmetric(vertical: 12.0),
                  width: double.infinity,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade200,
                  ),
                  child: const Text(
                    'Your Milestones',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                milestoneProvider.milestones.isEmpty
                    ? const Center(
                        child: Text(
                            'You do not have milestones yet, create your first milestone with the "start now" button above.',
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      )
                    : Expanded(
                        child: ListView.builder(
                          reverse: true,
                          itemCount: milestoneProvider.milestones.length,
                          itemBuilder: (context, index) {
                            return MilestoneCard(
                                milestoneProvider.milestones[index]);
                          },
                        ),
                      ),
                50.verticalSpace,
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          onPressed: () {
            openModalScreen(
              context,
              const CreateMilestone(),
            );
          },
          child: Icon(Icons.add_circle, color: Colors.purple, size: 70.r),
        ),
      ),
    );
  }
}
