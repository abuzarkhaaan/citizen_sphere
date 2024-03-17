import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:citizen_sphere2/view/Login%20Screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:citizen_sphere2/core/constants/assets.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_textfield.dart';
import 'package:get/get.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isChecked = false;

  void savePasswords() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Get.offAll(const LoginScreen());
    }
  }

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
                child: Image.asset(
                  appBarImage,
                  width: 30.sw,
                  height: 361.h,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 37.h),
                    quickSandMediumText(
                      text: 'Set New Password',
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w600,
                      color: AdaptiveTheme.of(context).mode.isLight
                          ? blackColor
                          : whiteColor,
                    ),
                    SizedBox(height: 30.h),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomPasswordTextField(
                              controller: passwordController,
                              isConfirmPassword: false),
                          SizedBox(height: 24.h),
                          CustomPasswordTextField(
                            controller: confirmPasswordController,
                            isConfirmPassword: true,
                            confirmPasswordController: passwordController,
                            label: 'Confirm Password',
                          ),
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
                    SizedBox(height: 40.h),
                    GestureDetector(
                      onTap: savePasswords,
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
                    // RichText(
                    //   textAlign: TextAlign.center,
                    //   text: TextSpan(
                    //     children: [
                    //       TextSpan(
                    //         text: 'Remember Password?',
                    //         style: quickSandStyle(fontSize: 14.sp),
                    //       ),
                    //       WidgetSpan(
                    //         child: GestureDetector(
                    //           onTap: () {
                    //             Get.to(const LoginScreen());
                    //           },
                    //           child: quickSandNormalText(
                    //             text: ' Login',
                    //             fontSize: 14.sp,
                    //             color: greenColor,
                    //             fontWeight: FontWeight.w500,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // )
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
