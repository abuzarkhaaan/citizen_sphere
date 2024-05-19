import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension CustomTheme on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

class Utils {
  static void flushbarMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.bounceIn,
        flushbarPosition: FlushbarPosition.TOP,
        borderRadius: BorderRadius.circular(5.r),
        margin: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        padding: EdgeInsets.all(15.sp),
        message: message,
        duration: const Duration(seconds: 3),
        backgroundColor: redStarColor,
        reverseAnimationCurve: Curves.easeOut,
        icon: const Icon(
          Icons.error_outline,
          color: whiteColor,
        ),
      )..show(context),
    );
  }

  static void successflushbarMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.bounceIn,
        flushbarPosition: FlushbarPosition.TOP,
        borderRadius: BorderRadius.circular(5.r),
        margin: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        padding: EdgeInsets.all(15.sp),
        message: message,
        duration: const Duration(seconds: 3),
        backgroundColor: greenColor,
        reverseAnimationCurve: Curves.easeOut,
        icon: const Icon(
          Icons.done_outline_rounded,
          color: whiteColor,
        ),
      )..show(context),
    );
  }
}
