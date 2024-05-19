import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/view%20model/sign_up_provider.dart';
import 'package:citizen_sphere2/view/Forgot%20Password%20Screen/forgot_password_screen.dart';
import 'package:citizen_sphere2/view/Home%20Screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:citizen_sphere2/core/constants/assets.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_green_button.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final forgetPassword = Provider.of<SignUpProvider>(context);
    return ModalProgressHUD(
      inAsyncCall: forgetPassword.isLoading == true,
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
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 33.w),
                  child: Column(
                    children: [
                      quickSandMediumText(
                        text: 'Change Password',
                        fontSize: 36.sp,
                        fontWeight: FontWeight.w600,
                        color: AdaptiveTheme.of(context).mode.isLight
                            ? blackColor
                            : whiteColor,
                      ),
                      SizedBox(height: 36.h),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            CustomPasswordTextField(
                                controller: currentPassword,
                                label: 'Current Password',
                                isConfirmPassword: false),
                            SizedBox(height: 9.h),
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
                            SizedBox(height: 19.h),
                            CustomPasswordTextField(
                                label: 'New Password',
                                controller: newPassword,
                                isConfirmPassword: false),
                            SizedBox(height: 15.h),
                            CustomPasswordTextField(
                                controller: confirmPassword,
                                label: 'Confirm Password',
                                confirmPasswordController: newPassword,
                                isConfirmPassword: true),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   children: [
                            //     Checkbox(
                            //       value: _isChecked,
                            //       onChanged: (bool? value) {
                            //         setState(() {
                            //           _isChecked = value!;
                            //         });
                            //       },
                            //       visualDensity: VisualDensity(
                            //         horizontal: -4.w,
                            //         vertical: -4.h,
                            //       ),
                            //       // fillColor: MaterialStateColor,
                            //     ),
                            //     quickSandNormalText(
                            //       text: "Remember me?",
                            //       fontSize: 17.sp,
                            //       color: AdaptiveTheme.of(context).mode.isLight
                            //           ? blackColor
                            //           : whiteColor,
                            //     )
                            //   ],
                            // )
                          ],
                        ),
                      ),
                      SizedBox(height: 35.h),
                      GestureDetector(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              // Get.to(const HomeScreen());
                              forgetPassword.changePassword(
                                  confirmPassword.text, context);
                            }
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
      ),
    );
  }
}
