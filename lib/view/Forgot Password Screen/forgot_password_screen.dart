import 'package:citizen_sphere2/core/constants/assets.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_green_button.dart';
import 'package:citizen_sphere2/view/Forgot%20Password%20OTP%20Verification.dart/forgot_password_otp_verification_screen.dart';
import 'package:citizen_sphere2/view/Login%20Screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
                      text: 'Forgot Password?',
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    quickSandMediumText(
                      text: 'Don\'t worry, it happens. Please Select',
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                      color: lightGrayColor,
                    ),
                    quickSandMediumText(
                      text: 'which details should we use to send OTP?',
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                      color: lightGrayColor,
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
                          Get.to(const ForgotPasswordOTPVerificationScreen());
                        },
                        child: const CustomGreenButton(label: 'Continue')),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: () {
                        Get.to(const LoginScreen());
                      },
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Remember Password?',
                              style: quickSandStyle(fontSize: 14.sp),
                            ),
                            WidgetSpan(
                              child: GestureDetector(
                                // onTap: () {
                                //   Get.to(const RegisterScreen());
                                // },
                                child: quickSandNormalText(
                                  text: ' Login Now',
                                  fontSize: 14.sp,
                                  color: greenColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
