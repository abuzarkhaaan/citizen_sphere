import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:citizen_sphere2/core/constants/assets.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/view%20model/firebase_provider.dart';
import 'package:citizen_sphere2/view/Login%20Screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'Home Screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    if (FirebaseAuth.instance.currentUser != null) {
      Provider.of<FirebaseProvider>(context,listen: false).getUserInfoNode();
    }
    Timer(const Duration(seconds: 3), () async {
      if (FirebaseAuth.instance.currentUser != null) {
        Get.offAll(const HomeScreen());
      } else {
        Get.to(
          const LoginScreen(),
        );
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              appLogo,
              width: 120.w,
              height: 148.h,
            ),
          ),
          quickSandNormalText(
            text: 'CITIZEN',
            fontSize: 40.sp,
            color: AdaptiveTheme.of(context).mode.isLight
                ? blackColor
                : whiteColor,
          ),
          quickSandNormalText(
            text: 'Sphere',
            fontSize: 26.sp,
            color: AdaptiveTheme.of(context).mode.isLight
                ? blackColor
                : whiteColor,
          ),
        ],
      ),
    );
  }
}
