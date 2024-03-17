import 'package:citizen_sphere2/view/QR%20Code%20Generator%20Screen/qr_code_generator_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:citizen_sphere2/core/constants/assets.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_green_button.dart';
import 'package:citizen_sphere2/utils/theme_extensions.dart';

class ItsMeScreen extends StatefulWidget {
  const ItsMeScreen({super.key});

  @override
  State<ItsMeScreen> createState() => _ItsMeScreenState();
}

class _ItsMeScreenState extends State<ItsMeScreen> {
  bool isFront = true;
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = context.colorScheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: greenColor,
        body: Column(
          children: [
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Get.offAll(const HomeScreen());
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: whiteColor,
                    ),
                  ),
                  quickSandNormalText(
                    text: 'It\'s Me',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: whiteColor,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(const QrCodeGeneratorScreen());
                    },
                    child: const Icon(
                      Icons.qr_code,
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 55.h),
                // height: 1.sh,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.sp),
                    topRight: Radius.circular(30.sp),
                  ),
                  color: colorScheme.onPrimary,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 228.h,
                      child: isFront
                          ? Image.asset(cnicFront)
                          : Image.asset(cnicBack),
                    ),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFront = !isFront;
                        });
                      },
                      child: quickSandNormalText(
                        text: isFront
                            ? 'Click to see back'
                            : 'Click to see front',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: lightGrayColor,
                      ),
                    ),
                    SizedBox(height: 50.h),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        // Get.to(const HomeScreen());
                        Get.back();
                      },
                      child: const CustomGreenButton(label: 'Return Home'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
