import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:citizen_sphere2/core/constants/assets.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_green_button.dart';
import 'package:citizen_sphere2/view/Home%20Screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ComplaintSuccessfulScreen extends StatelessWidget {
  const ComplaintSuccessfulScreen({super.key});

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
                        color: Theme.of(context).colorScheme.secondaryContainer,
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
                            text: 'Your complaint has been submitted',
                            fontSize: 16.sp,
                            color: AdaptiveTheme.of(context).mode.isLight
                                ? blackColor
                                : whiteColor,
                          ),
                          SizedBox(height: 70.h),
                          GestureDetector(
                            onTap: () {
                              Get.offAll(const HomeScreen());
                            },
                            child:
                                const CustomGreenButton(label: 'Return Home'),
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
