import 'package:citizen_sphere2/core/constants/assets.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_green_button.dart';
import 'package:citizen_sphere2/view/Login%20Screen/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});

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
                    SizedBox(height: 30.h),
                    Container(
                      width: 385.w,
                      height: 380.h,
                      padding: EdgeInsets.all(13.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.sp),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: lightGrayColor.withOpacity(0.5),
                            spreadRadius: 2.sp,
                            blurRadius: 20.sp,
                            offset: Offset(0, 3.sp),
                          ),
                        ],
                        color: whiteColor,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            thankyouIcon,
                            width: 130.w,
                            height: 130.h,
                          ),
                          SizedBox(height: 10.h),
                          quickSandTitleText(
                            text: 'Thank You',
                            fontSize: 28.sp,
                          ),
                          quickSandMediumText(
                            text: 'Your account has been verified',
                            fontSize: 16.sp,
                          ),
                          SizedBox(height: 70.h),
                          GestureDetector(
                            onTap: () {
                              Get.to(const LoginScreen());
                            },
                            child: const CustomGreenButton(label: 'Continue'),
                          ),
                        ],
                      ),
                    )
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
