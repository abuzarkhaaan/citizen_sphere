import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:citizen_sphere2/core/constants/assets.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_green_button.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_textfield.dart';
import 'package:citizen_sphere2/view%20model/sign_up_provider.dart';
import 'package:citizen_sphere2/view/Forgot%20Password%20OTP%20Verification.dart/forgot_password_otp_verification_screen.dart';
import 'package:citizen_sphere2/view/Login%20Screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController smsController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String phoneNumber = '';
  bool isPhoneValid = false;

  void openSmsDialog(BuildContext context, SignUpProvider model) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: quickSandTitleText(
                text: "Mobile Number",
                textAlign: TextAlign.center,
              ),
            ),
            content: SizedBox(
              height: 150.h,
              child: Column(
                children: [
                  quickSandNormalText(
                    text: "Enter your mobile number to recieve OTP",
                    fontSize: 16.sp,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30.h),
                  SizedBox(
                    height: 70.h,
                    child: IntlPhoneField(
                      controller: smsController,
                      keyboardType: TextInputType.number,
                      showDropdownIcon: false,
                      decoration: InputDecoration(
                        hintText: 'Apna Number Likhiye',
                        hintStyle: quickSandStyle(
                          fontSize: 15.sp,
                          color: blackColor.withOpacity(0.4),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(
                            color: grayColor,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(
                            color: grayColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(
                            color: grayColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(color: greenColor),
                        ),
                      ),
                      initialCountryCode: 'PK',
                      onChanged: (phone) {
                        phoneNumber = phone.completeNumber.toString();
                        debugPrint(phone.completeNumber);
                        isPhoneValid = phone.isValidNumber();
                      },
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  model.verifyPhoneNumber(phoneNumber, false, context);
                },
                child: quickSandMediumText(
                  text: 'OK',
                  fontSize: 20.sp,
                ),
              ),
            ],
          );
        });
  }

  void openEmailDialog(BuildContext context, SignUpProvider model) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: quickSandTitleText(
                text: "Email",
                textAlign: TextAlign.center,
              ),
            ),
            content: SizedBox(
              height: 130.h,
              child: Column(
                children: [
                  quickSandNormalText(
                    text: "Enter your Email to recieve a password reset link",
                    fontSize: 16.sp,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30.h),
                  CustomTextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    label: 'Email',
                    isRequired: true,
                    isObscure: false,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  model.sendForgetPasswordLink(emailController.text, context);
                },
                child: quickSandMediumText(
                  text: 'OK',
                  fontSize: 20.sp,
                ),
              ),
            ],
          );
        });
  }

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
                          text: 'Forgot Password?',
                          fontSize: 36.sp,
                          fontWeight: FontWeight.w600,
                          color: AdaptiveTheme.of(context).mode.isLight
                              ? blackColor
                              : whiteColor,
                        ),
                        quickSandMediumText(
                          text: 'Don\'t worry, it happens.',
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                          color: lightGrayColor,
                        ),
                        quickSandMediumText(
                          text:
                              'Enter your email below to recieve a password reset link.',
                          fontSize: 17.sp,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w600,
                          color: lightGrayColor,
                        ),
                        SizedBox(height: 35.h),
                        GestureDetector(
                          onTap: () {
                            openSmsDialog(context, model);
                          },
                          child: Container(
                            height: 107.h,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.sp)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      quickSandNormalText(
                                        text: 'SMS',
                                        fontSize: 25.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AdaptiveTheme.of(context)
                                                .mode
                                                .isLight
                                            ? blackColor
                                            : whiteColor,
                                      ),
                                      // quickSandNormalText(
                                      //   text: '+9212345678911',
                                      //   fontSize: 18.sp,
                                      //   fontWeight: FontWeight.w600,
                                      //   color: AdaptiveTheme.of(context).mode.isLight
                                      //       ? blackColor
                                      //       : whiteColor,
                                      // ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        GestureDetector(
                          onTap: () {
                            openEmailDialog(context, model);
                          },
                          child: Container(
                            height: 107.h,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.sp)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      quickSandNormalText(
                                        text: 'Email',
                                        fontSize: 25.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AdaptiveTheme.of(context)
                                                .mode
                                                .isLight
                                            ? blackColor
                                            : whiteColor,
                                      ),
                                      // quickSandNormalText(
                                      //   text: 'yourmail@gmail.com',
                                      //   fontSize: 18.sp,
                                      //   fontWeight: FontWeight.w600,
                                      //   color: AdaptiveTheme.of(context).mode.isLight
                                      //       ? blackColor
                                      //       : whiteColor,
                                      //   // color: whiteColor
                                      // ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        // GestureDetector(
                        //     onTap: () {
                        //       Get.to(
                        //           const ForgotPasswordOTPVerificationScreen());
                        //     },
                        //     child: const CustomGreenButton(label: 'Continue')),
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
                                  style: quickSandStyle(
                                    fontSize: 14.sp,
                                    color:
                                        AdaptiveTheme.of(context).mode.isLight
                                            ? blackColor
                                            : whiteColor,
                                  ),
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
        ),
      );
    });
  }
}
