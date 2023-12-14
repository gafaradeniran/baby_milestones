import 'package:baby_milestones/features/shared/modal_screen.dart';
import 'package:baby_milestones/app_config/utils/asset_resources.dart';
import 'package:baby_milestones/features/milestones/model/milestone_model.dart';
import 'package:baby_milestones/features/milestones/services/provider.dart';
import 'package:baby_milestones/features/milestones/widgets/edit_milestones.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MilestoneCard extends StatelessWidget {
  final Milestone milestone;

  const MilestoneCard(this.milestone, {super.key});

  @override
  Widget build(BuildContext context) {
    DateTime timestamp = DateTime.now();
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Consumer<MilestoneProvider>(
          builder: (context, milestoneProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(5.0),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(milestone.imagePath.isNotEmpty
                      ? milestone.imagePath
                      : AssetResources.onboarding2),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.r),
              child: Text(
                milestone.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.sp),
              child: Text(
                milestone.note,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  'Date: ${formatDate(timestamp)}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.purpleAccent,
                  ),
                ),
                SizedBox(width: 100.w),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    openModalScreen(
                        context, EditMilestone(currentMilestone: milestone));
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    int index = milestoneProvider.getIndex(milestone);
                    showDeleteDialog(context, milestoneProvider, index);
                  },
                ),
              ],
            ),
          ],
        );
      }),
    );
  }

  String formatDate(DateTime dateTime) {
    return DateFormat('d MMM y HH:mm').format(dateTime);
  }

  showDeleteDialog(
      BuildContext context, MilestoneProvider milestoneProvider, int index) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Center(child: Text('Confirm Delete')),
              content:
                  const Text('Are you sure you want to delete this milestone?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    milestoneProvider.deleteMilestone(index);
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Milestone deleted successfully',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                        backgroundColor: Colors.white,
                      ),
                    );
                  },
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
              ],
            ));
  }
}
