import 'dart:io';

import 'package:baby_milestones/app_config/shared/app_button.dart';
import 'package:baby_milestones/app_config/shared/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class EditMilestone extends StatefulWidget {
  final String currentTitle, currentNote, img;
  const EditMilestone(
      {super.key,
      required this.currentTitle,
      required this.currentNote,
      required this.img});

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
    titleController.text = widget.currentTitle;
    noteController.text = widget.currentNote;
    img = widget.img;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text('Edit This Milestone'),
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
                        image: AssetImage(img!),
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
              onPressed: () {},
              borderRadius: 15,
              color: Colors.purple,
              width: double.infinity,
            ),
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
