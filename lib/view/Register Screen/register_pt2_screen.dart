import 'package:citizen_sphere2/core/constants/assets.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_green_button.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_textfield.dart';
import 'package:citizen_sphere2/view/Account%20Verification%20Screen/account_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterPt2Screen extends StatefulWidget {
  const RegisterPt2Screen({super.key});

  @override
  State<RegisterPt2Screen> createState() => _RegisterPt2ScreenState();
}

class _RegisterPt2ScreenState extends State<RegisterPt2Screen> {
  final bloodGroupController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final ageController = TextEditingController();
  final diseaseController = TextEditingController();

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
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 33.w),
                child: Column(
                  children: [
                    quickSandMediumText(
                      text: 'Register!',
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    quickSandMediumText(
                      text: 'Just a few steps and it will be done',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: lightGrayColor,
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      children: [
                        Container(
                          width: 30.w,
                          height: 30.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: lightGreenColor,
                          ),
                          child: Center(
                            child: quickSandTitleText(
                              text: '1',
                              fontSize: 20.sp,
                              color: whiteColor,
                            ),
                          ),
                        ),
                        Container(
                          width: 135.w,
                          height: 1.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2.sp,
                              color: lightGreenColor,
                            ),
                            color: lightGreenColor,
                          ),
                        ),
                        Container(
                          width: 30.w,
                          height: 30.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: greenColor,
                          ),
                          child: Center(
                            child: quickSandTitleText(
                              text: '2',
                              fontSize: 20.sp,
                              color: whiteColor,
                            ),
                          ),
                        ),
                        Container(
                          width: 135.w,
                          height: 1.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2.sp,
                              color: lightGreenColor,
                            ),
                            color: lightGreenColor,
                          ),
                        ),
                        Container(
                          width: 30.w,
                          height: 30.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: lightGreenColor,
                          ),
                          child: Center(
                            child: quickSandTitleText(
                              text: '3',
                              fontSize: 20.sp,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 36.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextField(
                          width: 167.w,
                          keyboardType: TextInputType.name,
                          controller: bloodGroupController,
                          label: 'Blood Group',
                          isRequired: true,
                          isObscure: false,
                        ),
                        CustomTextField(
                          width: 167.w,
                          keyboardType: TextInputType.number,
                          controller: weightController,
                          label: 'Height',
                          hintext: 'kg',
                          isRequired: true,
                          isObscure: false,
                        ),
                      ],
                    ),
                    SizedBox(height: 23.h),
                    CustomTextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: heightController,
                      label: 'Weight',
                      isRequired: true,
                      hintext: 'In feet',
                      isObscure: false,
                    ),
                    SizedBox(height: 23.h),
                    CustomTextField(
                      keyboardType: TextInputType.number,
                      controller: ageController,
                      label: 'Age',
                      isRequired: false,
                      isObscure: false,
                    ),
                    SizedBox(height: 23.h),
                    CustomTextField(
                      keyboardType: TextInputType.number,
                      controller: diseaseController,
                      label: 'Any Disease?',
                      isRequired: false,
                      isObscure: false,
                    ),
                    SizedBox(height: 35.h),
                    GestureDetector(
                        onTap: () {
                          Get.to(const AccountVerificationScreen());
                        },
                        child: const CustomGreenButton(label: 'Continue')),
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
