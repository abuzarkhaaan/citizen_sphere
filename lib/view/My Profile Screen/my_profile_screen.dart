import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:citizen_sphere2/core/constants/assets.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_green_button.dart';
import 'package:citizen_sphere2/view%20model/My%20Profile%20View%20Model/my_profile_view_model.dart';
import 'package:citizen_sphere2/view/Change%20Password%20Screen/change_password_screen.dart';
import 'package:citizen_sphere2/view/Login%20Screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  bool darkMode = false;
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<MyProfileViewModel>(context);
    return Column(
      children: [
        Container(
          width: 1.sw,
          height: 355.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.sp),
              bottomRight: Radius.circular(20.sp),
            ),
            color: greenColor,
          ),
          child: Column(
            children: [
              SizedBox(height: 35.h),
              quickSandMediumText(
                text: 'My Profile',
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: whiteColor,
              ),
              SizedBox(height: 44.h),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 150.w,
                    height: 143.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                    child: ClipOval(
                      child: profileProvider.pickedImage != null
                          ? Image.file(
                              profileProvider.pickedImage!,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              profileImage,
                              // color: greenColor,
                            ),
                    ),
                  ),
                  Positioned(
                    right: -6.w,
                    bottom: -2.h,
                    child: GestureDetector(
                      onTap: profileProvider.pickImage,
                      child: Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: greenColor,
                            ),
                            color: whiteColor,
                          ),
                          child: const Icon(
                            Icons.image_search,
                            color: greenColor,
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              quickSandNormalText(
                text: 'User',
                color: whiteColor,
                fontSize: 32.sp,
                fontWeight: FontWeight.w600,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 35.h, left: 40.w, right: 40.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.brightness_medium,
                    color: grayColor,
                  ),
                  SizedBox(
                    width: 280.w,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            quickSandNormalText(
                              text: 'Change Theme',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: AdaptiveTheme.of(context).mode.isLight
                                  ? blackColor
                                  : whiteColor,
                            ),
                            Transform.scale(
                              scale: 0.8,
                              child: Switch(
                                value: AdaptiveTheme.of(context).mode.isDark,
                                onChanged: (value) {
                                  if (value) {
                                    AdaptiveTheme.of(context).setDark();
                                  } else {
                                    AdaptiveTheme.of(context).setLight();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: grayColor,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 15.h),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 300,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: EdgeInsets.only(top: 5.h),
                                child: const Divider(
                                  color: lightGrayColor,
                                  endIndent: 150,
                                  indent: 150,
                                  thickness: 3,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            const Divider(
                              color: lightGrayColor,
                              indent: 50,
                              endIndent: 50,
                            ),
                            quickSandTitleText(
                                text: 'Are you sure you want to Logout?',
                                fontSize: 24.sp),
                            SizedBox(
                              height: 150.h,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14.w, vertical: 20.h),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector (
                                      onTap: () async {
                                       await FirebaseAuth.instance.signOut();
                                       Get.offAll(const LoginScreen());
                                      },
                                      child: const CustomGreenButton(
                                        label: 'Yes, Logout',
                                        color: darkGreenColor,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: const CustomGreenButton(
                                        label: 'Cancel',
                                        color: whiteColor,
                                        textColor: blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.logout,
                      color: grayColor,
                    ),
                    SizedBox(
                      height: 55.h,
                      width: 280.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          quickSandNormalText(
                            text: 'Logout',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: AdaptiveTheme.of(context).mode.isLight
                                ? blackColor
                                : whiteColor,
                          ),
                          const Divider(
                            color: grayColor,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              GestureDetector(
                onTap: () {
                  Get.to(const ChangePasswordScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.password,
                      color: grayColor,
                    ),
                    SizedBox(
                      width: 280.w,
                      height: 55.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          quickSandNormalText(
                            text: 'Change Password',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: AdaptiveTheme.of(context).mode.isLight
                                ? blackColor
                                : whiteColor,
                          ),
                          const Divider(
                            color: grayColor,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ],
    );
  }
}
