import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:citizen_sphere2/core/constants/assets.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_green_button.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_textfield.dart';
import 'package:citizen_sphere2/view/Account%20Verification%20Screen/account_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../view model/firebase_provider.dart';
import '../../view model/sign_up_provider.dart';
import '../Thank You Screen/thankyou_screen.dart';

class RegisterPt2Screen extends StatefulWidget {
  const RegisterPt2Screen({super.key});

  @override
  State<RegisterPt2Screen> createState() => _RegisterPt2ScreenState();
}

class _RegisterPt2ScreenState extends State<RegisterPt2Screen> {
  late SignUpProvider signUpProvider;

  @override
  Widget build(BuildContext context) {
    signUpProvider = Provider.of<SignUpProvider>(context);
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
                      color: AdaptiveTheme.of(context).mode.isLight
                          ? blackColor
                          : whiteColor,
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
                          controller: signUpProvider.bloodGroupController,
                          label: 'Blood Group',
                          isRequired: true,
                          isObscure: false,
                        ),
                        CustomTextField(
                          width: 167.w,
                          keyboardType: TextInputType.number,
                          controller: signUpProvider.weightController,
                          label: 'Height',
                          hintext: 'kg',
                          isRequired: true,
                          isObscure: false,
                        ),
                      ],
                    ),
                    SizedBox(height: 23.h),
                    CustomTextField(
                      keyboardType: TextInputType.number,
                      controller: signUpProvider.heightController,
                      label: 'Weight',
                      isRequired: true,
                      hintext: 'In feet',
                      isObscure: false,
                    ),
                    SizedBox(height: 23.h),
                    CustomTextField(
                      keyboardType: TextInputType.number,
                      controller: signUpProvider.ageController,
                      label: 'Age',
                      isRequired: false,
                      isObscure: false,
                    ),
                    SizedBox(height: 23.h),
                    CustomTextField(
                      keyboardType: TextInputType.text,
                      controller: signUpProvider.diseaseController,
                      label: 'Any Disease?',
                      isRequired: false,
                      isObscure: false,
                    ),
                    SizedBox(height: 35.h),
                    GestureDetector(
                        onTap: () async {
                          var isSignedUp = await signUpProvider.signUp(context);
                          if (isSignedUp == true) {
                            var isDataAdded = await signUpProvider
                                .createUserInfoNode(context);
                            if (isDataAdded) {
                              Provider.of<FirebaseProvider>(context,
                                      listen: false)
                                  .getUserInfoNode();
                              Get.to(const ThankYouScreen());
                            }
                          }
                          // Get.to(const AccountVerificationScreen());
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
