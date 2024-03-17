import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGreenButton extends StatelessWidget {
  const CustomGreenButton({
    super.key,
    this.width,
    this.height,
    this.radius,
    required this.label,
    this.color,
    this.textColor,
  });
  final double? width;
  final double? height;
  final double? radius;
  final String label;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 1.sw,
      height: height ?? 45.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(radius ?? 20.sp),
        ),
        color: color ?? greenColor,
      ),
      child: Center(
        child: quickSandNormalText(
            text: label,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
            color: textColor ?? whiteColor),
      ),
    );
  }
}
