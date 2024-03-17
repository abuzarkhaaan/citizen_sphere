import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:citizen_sphere2/core/constants/assets.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_green_button.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_textfield.dart';
import 'package:get/get.dart';

class EditMedicalRecordScreen extends StatefulWidget {
  const EditMedicalRecordScreen({super.key});

  @override
  State<EditMedicalRecordScreen> createState() =>
      _EditMedicalRecordScreenState();
}

class _EditMedicalRecordScreenState extends State<EditMedicalRecordScreen> {
  final formKey = GlobalKey<FormState>();
  final bloodGroup = TextEditingController();
  final weight = TextEditingController();
  final height = TextEditingController();
  final age = TextEditingController();
  final disease = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  appBarImage,
                  width: 30.sw,
                  height: 361.h,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 33.w),
                child: Column(
                  children: [
                    SizedBox(height: 15.h),
                    quickSandMediumText(
                      text: 'Edit Medical Records',
                      fontSize: 34.sp,
                      fontWeight: FontWeight.w600,
                      color: AdaptiveTheme.of(context).mode.isLight
                          ? blackColor
                          : whiteColor,
                    ),
                    quickSandMediumText(
                      text: 'Just a few steps',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: lightGrayColor,
                    ),
                    SizedBox(height: 36.h),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            keyboardType: TextInputType.name,
                            controller: bloodGroup,
                            label: 'Blood Group',
                            isRequired: true,
                            isObscure: false,
                          ),
                          SizedBox(height: 15.h),
                          CustomTextField(
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true, signed: true),
                            controller: weight,
                            label: 'Weight',
                            isRequired: true,
                            isObscure: false,
                          ),
                          SizedBox(height: 15.h),
                          CustomTextField(
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true, signed: true),
                            controller: height,
                            label: 'Height',
                            isRequired: true,
                            isObscure: false,
                          ),
                          SizedBox(height: 15.h),
                          CustomTextField(
                            keyboardType: TextInputType.number,
                            controller: age,
                            label: 'Age',
                            isRequired: true,
                            isObscure: false,
                          ),
                          SizedBox(height: 15.h),
                          CustomTextField(
                            keyboardType: TextInputType.name,
                            controller: disease,
                            label: 'Any Disease?',
                            isRequired: false,
                            isObscure: false,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 35.h),
                    GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            Get.back();
                          }
                        },
                        child: const CustomGreenButton(label: 'Submit')),
                    SizedBox(height: 35.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
