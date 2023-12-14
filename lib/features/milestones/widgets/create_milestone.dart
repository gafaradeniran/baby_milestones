import 'dart:io';

import 'package:baby_milestones/features/shared/app_button.dart';
import 'package:baby_milestones/features/shared/custom_textfield.dart';
import 'package:baby_milestones/features/milestones/model/milestone_model.dart';
import 'package:baby_milestones/features/milestones/services/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreateMilestone extends StatefulWidget {
  const CreateMilestone({super.key});

  @override
  State<CreateMilestone> createState() => _CreateMilestoneState();
}

class _CreateMilestoneState extends State<CreateMilestone> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  File? _selectedImage;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final milestoneProvider = Provider.of<MilestoneProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text(
              'Create New Milestone',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.h),
            Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: titleController,
                      label: 'title',
                      hint: 'Milestone title',
                    ),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      controller: noteController,
                      hint: 'Add descriptive note for your milestone',
                      label: 'milestone note',
                      maxLines: 5,
                    ),
                    SizedBox(height: 16.h),
                    _selectedImage != null
                        ? Image.file(
                            _selectedImage!,
                            height: 100,
                            width: 100,
                            color: Colors.grey,
                          )
                        : const SizedBox.shrink(),
                    AppButton(
                      onPressed: _pickImage,
                      text: 'Pick Image',
                      borderRadius: 5,
                    ),
                    SizedBox(height: 16.h),
                    AppButton(
                      text: 'Create My Milestone',
                      textColor: Colors.white,
                      fontSize: 16.sp,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          Milestone milestone = Milestone(
                            title: titleController.text,
                            note: noteController.text,
                            imagePath: _selectedImage?.path ?? '',
                          );
                          milestoneProvider.addMilestone(milestone);
                        }
                        Navigator.pop(context);
                      },
                      borderRadius: 15,
                      color: Colors.purple,
                      width: double.infinity,
                    )
                  ],
                )),
          ],
        ),
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
}
