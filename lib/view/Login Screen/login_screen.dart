import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:citizen_sphere2/core/constants/assets.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_textfield.dart';
import 'package:citizen_sphere2/view/Forgot%20Password%20Screen/forgot_password_screen.dart';
import 'package:citizen_sphere2/view/Home%20Screen/home_screen.dart';
import 'package:citizen_sphere2/view/Register%20Screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  // height: 370.h,
                  child: Image.asset(
                    appBarImage,
                    width: 30.sw,
                    height: 361.h,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 37.h),
                    quickSandMediumText(
                      text: 'Welcome Back',
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w600,
                      color: AdaptiveTheme.of(context).mode.isLight
                          ? blackColor
                          : whiteColor,
                    ),
                    SizedBox(height: 38.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 1.h,
                          width: 120.w,
                          color: AdaptiveTheme.of(context).mode.isLight
                              ? blackColor
                              : whiteColor,
                        ),
                        quickSandMediumText(
                          text: ' Sign in ',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: AdaptiveTheme.of(context).mode.isLight
                              ? blackColor
                              : whiteColor,
                        ),
                        Container(
                          height: 1.h,
                          width: 120.w,
                          color: AdaptiveTheme.of(context).mode.isLight
                              ? blackColor
                              : whiteColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomEmailTextField(controller: emailController),
                          SizedBox(height: 24.h),
                          CustomPasswordTextField(
                              controller: passwordController,
                              isConfirmPassword: false),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Checkbox(
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                },
                                visualDensity: VisualDensity(
                                  horizontal: -4.w,
                                  vertical: -4.h,
                                ),
                                // fillColor: MaterialStateColor,
                              ),
                              quickSandNormalText(
                                text: "Remember me?",
                                fontSize: 17.sp,
                                color: AdaptiveTheme.of(context).mode.isLight
                                    ? blackColor
                                    : whiteColor,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    GestureDetector(
                      onTap: () {
                        Get.to(const HomeScreen());
                      },
                      child: Container(
                        width: 1.sw,
                        height: 45.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.sp),
                          ),
                          color: greenColor,
                        ),
                        child: Center(
                          child: quickSandMediumText(
                            text: 'Sign In',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(const ForgotPasswordScreen());
                        },
                        child: quickSandMediumText(
                          text: 'Forgot Password?',
                          fontSize: 13.sp,
                          color: AdaptiveTheme.of(context).mode.isLight
                              ? blackColor
                              : whiteColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    RichText(
                      // textAlign: TextAlign,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Don\'t have an account?',
                            style: quickSandStyle(
                              fontSize: 14.sp,
                              color: AdaptiveTheme.of(context).mode.isLight
                                  ? blackColor
                                  : whiteColor,
                            ),
                          ),
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: () {
                                Get.to(const RegisterScreen());
                              },
                              child: quickSandNormalText(
                                text: ' Register Now',
                                fontSize: 14.sp,
                                color: greenColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
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
