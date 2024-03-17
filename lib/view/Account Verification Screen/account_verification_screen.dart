import 'package:citizen_sphere2/core/constants/assets.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_green_button.dart';
import 'package:citizen_sphere2/view/OTP%20Screen/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AccountVerificationScreen extends StatefulWidget {
  const AccountVerificationScreen({super.key});

  @override
  State<AccountVerificationScreen> createState() =>
      _AccountVerificationScreenState();
}

class _AccountVerificationScreenState extends State<AccountVerificationScreen> {
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
                      text: 'Account Verification',
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    quickSandMediumText(
                      text: 'Select which contact details should',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: lightGrayColor,
                    ),
                    quickSandMediumText(
                      text: 'we use to send OTP',
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
                            color: lightGreenColor,
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
                            color: greenColor,
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
                    SizedBox(height: 35.h),
                    Container(
                      height: 107.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                        border: Border.all(color: tealColor),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80.w,
                            height: 80.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: tealColor,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.message,
                                color: greenColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 232.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                quickSandNormalText(
                                  text: 'via SMS:',
                                  fontSize: 14.sp,
                                  color: textgrayColor,
                                ),
                                quickSandNormalText(
                                  text: '+9212345678911',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      height: 107.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                        border: Border.all(color: tealColor),
                        // color: greenColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80.w,
                            height: 80.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: tealColor,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.email,
                                color: greenColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 232.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                quickSandNormalText(
                                  text: 'via Email:',
                                  fontSize: 14.sp,
                                  // color: whiteColor,
                                ),
                                quickSandNormalText(
                                  text: 'yourmail@gmail.com',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  // color: whiteColor
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    GestureDetector(
                        onTap: () {
                          Get.to(const OTPScreen());
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
