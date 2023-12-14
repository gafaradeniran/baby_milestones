import 'dart:io';

import 'package:baby_milestones/app_config/utils/asset_resources.dart';
import 'package:baby_milestones/features/shared/app_button.dart';
import 'package:baby_milestones/features/shared/custom_textfield.dart';
import 'package:baby_milestones/features/milestones/model/milestone_model.dart';
import 'package:baby_milestones/features/milestones/services/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditMilestone extends StatefulWidget {
  final Milestone currentMilestone;
  const EditMilestone({
    super.key,
    required this.currentMilestone,
  });

  @override
  State<EditMilestone> createState() => _EditMilestoneState();
}

class _EditMilestoneState extends State<EditMilestone> {
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  String? img;
  File? _selectedImage;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.currentMilestone.title;
    noteController.text = widget.currentMilestone.note;
  }

  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Consumer<MilestoneProvider>(
            builder: (context, milestoneProvider, child) {
          return Column(
            children: [
              const Text('Edit This Milestone',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 20.h),
              CustomTextField(
                controller: titleController,
                label: 'title',
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                controller: noteController,
                label: 'milestone note',
                maxLines: 5,
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(5.0),
                      height: 100,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(img ?? AssetResources.onboarding2),
                          fit: BoxFit.cover,
                        ),
                      )),
                  SizedBox(width: 16.h),
                  AppButton(
                    onPressed: _pickImage,
                    text: 'Pick Image',
                    borderRadius: 7,
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              AppButton(
                text: 'Update Milestone',
                textColor: Colors.white,
                fontSize: 16.sp,
                onPressed: () {
                  _updateMilestone(milestoneProvider);
                },
                borderRadius: 15,
                color: Colors.purple,
                width: double.infinity,
              ),
            ],
          );
        }),
      ),
    );
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _updateMilestone(MilestoneProvider milestoneProvider) {
    Milestone updatedMilestone = Milestone(
      title: titleController.text,
      note: noteController.text,
      imagePath: _selectedImage?.path ?? widget.currentMilestone.imagePath,
    );
    int index =
        context.read<MilestoneProvider>().getIndex(widget.currentMilestone);
    context.read<MilestoneProvider>().updateMilestone(index, updatedMilestone);

    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Milestone updated successfully',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
