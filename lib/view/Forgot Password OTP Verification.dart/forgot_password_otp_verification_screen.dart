import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:citizen_sphere2/view%20model/sign_up_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:citizen_sphere2/core/constants/assets.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_green_button.dart';
import 'package:citizen_sphere2/view/Set%20New%20Password%20Screen/set_new_password_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class ForgotPasswordOTPVerificationScreen extends StatefulWidget {
  const ForgotPasswordOTPVerificationScreen({
    super.key,
    required this.phoneNumber,
  });
  final String phoneNumber;

  @override
  State<ForgotPasswordOTPVerificationScreen> createState() =>
      _ForgotPasswordOTPVerificationScreenState();
}

class _ForgotPasswordOTPVerificationScreenState
    extends State<ForgotPasswordOTPVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpProvider>(builder: (context, model, child) {
      return ModalProgressHUD(
        inAsyncCall: model.isLoading == true,
        child: SafeArea(
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
                          text: 'OTP Verification',
                          fontSize: 36.sp,
                          fontWeight: FontWeight.w600,
                          color: AdaptiveTheme.of(context).mode.isLight
                              ? blackColor
                              : whiteColor,
                        ),
                        quickSandMediumText(
                          text: 'Enter the OTP sent to',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: lightGrayColor,
                        ),
                        quickSandMediumText(
                          text: widget.phoneNumber,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: lightGrayColor,
                        ),
                        SizedBox(height: 14.h),
                        OtpTextField(
                          numberOfFields: 6,
                          margin: EdgeInsets.symmetric(horizontal: 2.w),
                          showFieldAsBox: true,
                          enabledBorderColor:
                              Theme.of(context).colorScheme.inversePrimary,
                          focusedBorderColor:
                              Theme.of(context).colorScheme.primary,
                          fieldWidth: 45,
                          onCodeChanged: (value) {
                            //TODO ADD FUNCTION HERE
                          },
                          onSubmit: (value) {
                            model.otp = value;

                            //TODO ADD FUNCTION HERE
                          },
                        ),
                        SizedBox(height: 20.h),
                        quickSandMediumText(
                          text: '00:30 Sec',
                          fontSize: 14.sp,
                          color: AdaptiveTheme.of(context).mode.isLight
                              ? blackColor
                              : whiteColor,
                          // fontWeight: FontWeight,
                          // color: lightGrayColor,
                        ),
                        SizedBox(height: 20.h),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Did\'t receive code?',
                                style: quickSandStyle(
                                  fontSize: 14.sp,
                                  color: AdaptiveTheme.of(context).mode.isLight
                                      ? blackColor
                                      : whiteColor,
                                ),
                              ),
                              WidgetSpan(
                                child: quickSandNormalText(
                                  text: ' Re-send',
                                  fontSize: 14.sp,
                                  color: greenColor,
                                  // textAlign: TextAlign.end,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 60.h),
                        GestureDetector(
                            onTap: () {
                              model.submitSmsCode(model.otp, context);
                              // Get.to(const SetNewPasswordScreen());
                            },
                            child: const CustomGreenButton(
                                label: 'Set New Password')),
                        SizedBox(height: 20.h),
                        // GestureDetector(
                        //   onTap: () {
                        //     Get.to(const LoginScreen());
                        //   },
                        //   child: RichText(
                        //     textAlign: TextAlign.center,
                        //     text: TextSpan(
                        //       children: [
                        //         TextSpan(
                        //           text: 'Remember Password?',
                        //           style: quickSandStyle(fontSize: 14.sp),
                        //         ),
                        //         WidgetSpan(
                        //           child: GestureDetector(
                        //             // onTap: () {
                        //             //   Get.to(const RegisterScreen());
                        //             // },
                        //             child: quickSandNormalText(
                        //               text: ' Login Now',
                        //               fontSize: 14.sp,
                        //               color: greenColor,
                        //               fontWeight: FontWeight.w500,
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: 35.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
