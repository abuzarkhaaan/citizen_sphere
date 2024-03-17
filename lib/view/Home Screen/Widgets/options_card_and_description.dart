import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';

class OptionsCardAndDescription extends StatelessWidget {
  const OptionsCardAndDescription(
      {super.key,
      required this.icon,
      required this.description,
      required this.width,
      required this.height});
  final String icon;
  final String description;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 73.w,
          height: 73.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.sp),
            boxShadow: [
              BoxShadow(
                color: blackColor.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 5,
                // offset: const Offset(0, 12),
              ),
            ],
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
          child: Center(
            child: Image.asset(
              icon,
              width: width,
              height: height,
              color: greenColor,
            ),
          ),
        ),
        SizedBox(height: 5.h),
        SizedBox(
          width: 70.w,
          child: Center(
            child: quickSandMediumText(
              text: description,
              fontSize: 14.sp,
              color: AdaptiveTheme.of(context).mode.isLight
                  ? blackColor
                  : whiteColor,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}

class OptionsCardAndDescription2 extends StatelessWidget {
  const OptionsCardAndDescription2({
    super.key,
    required this.icon,
    required this.description,
    required this.size,
    // required this.height
  });
  final IconData icon;
  final String description;
  final double size;
  // final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 73.w,
          height: 73.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.sp),
            boxShadow: [
              BoxShadow(
                color: blackColor.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 5,
                // offset: const Offset(0, 12),
              ),
            ],
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
          child: Center(
              child: Icon(
            icon,
            size: size,
            color: greenColor,
          )),
        ),
        SizedBox(height: 5.h),
        SizedBox(
          width: 70.w,
          child: Center(
            child: quickSandMediumText(
              text: description,
              fontSize: 14.sp,
              color: AdaptiveTheme.of(context).mode.isLight
                  ? blackColor
                  : whiteColor,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
