import 'dart:io';

import 'package:baby_milestones/features/shared/app_button.dart';
import 'package:baby_milestones/features/shared/custom_textfield.dart';
import 'package:baby_milestones/app_config/utils/asset_resources.dart';
import 'package:baby_milestones/features/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class UpdateDetails extends StatefulWidget {
  final String name, bio, babyName, age;
  const UpdateDetails({
    super.key,
    required this.name,
    required this.bio,
    required this.babyName,
    required this.age,
  });

  @override
  State<UpdateDetails> createState() => _EditMilestoneState();
}

class _EditMilestoneState extends State<UpdateDetails> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController babyController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String? img;
  File? _selectedImage;
  final ImagePicker _imagePicker = ImagePicker();
  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    bioController.text = widget.bio;
    babyController.text = widget.babyName;
    ageController.text = widget.age;
  }

  @override
  void dispose() {
    nameController.dispose();
    bioController.dispose();
    babyController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile Info'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              20.verticalSpace,
              CustomTextField(
                controller: nameController,
                label: 'full name',
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                controller: bioController,
                label: 'bio',
                maxLines: 5,
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                controller: babyController,
                label: 'Baby\'s name',
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                controller: ageController,
                label: 'Baby\'s age',
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
                          image: AssetImage(img ?? AssetResources.logo),
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
                text: 'Update Profile',
                textColor: Colors.white,
                fontSize: 16.sp,
                onPressed: () {
                  setState(() {
                    _updateProfile();
                  });
                },
                borderRadius: 15,
                color: Colors.purple,
                width: double.infinity,
              ),
            ],
          ),
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

  void _updateProfile() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Dashboard()));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Proflie updated successfully',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
