import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({
    super.key,
    required this.status,
    required this.title,
    required this.description,
    required this.date,
    required this.index,
  });
  final String status;
  final String title;
  final String description;
  final String date;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          if (index == 0)
            Align(
              alignment: Alignment.centerLeft,
              child: quickSandNormalText(
                text: 'Today',
                fontSize: 25.sp,
                fontWeight: FontWeight.w600,
                color: AdaptiveTheme.of(context).mode.isLight
                    ? blackColor
                    : whiteColor,
              ),
            ),
          if (index == 5)
            Align(
              alignment: Alignment.centerLeft,
              child: quickSandNormalText(
                text: 'Yesterday',
                fontSize: 25.sp,
                fontWeight: FontWeight.w600,
                color: AdaptiveTheme.of(context).mode.isLight
                    ? blackColor
                    : whiteColor,
              ),
            ),
          Container(
            width: 1.sw,
            padding: EdgeInsets.only(top: 7.h, left: 23.w, right: 23.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 55.w,
                  height: 55.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (status == 'incoming')
                        ? greenColor.withOpacity(0.25)
                        : (status == 'outgoing')
                            ? orangeColor.withOpacity(0.25)
                            : (status == 'water')
                                ? waterColor.withOpacity(0.25)
                                : (status == 'electricity')
                                    ? electricityColor.withOpacity(0.25)
                                    : recordsColor.withOpacity(0.25),
                  ),
                  child: Center(
                    child: Icon(
                      (status == 'incoming')
                          ? Icons.arrow_downward_rounded
                          : (status == 'outgoing')
                              ? Icons.arrow_upward_rounded
                              : (status == 'water')
                                  ? Icons.water_drop_rounded
                                  : (status == 'electricity')
                                      ? Icons.bolt
                                      : Icons.article_rounded,
                      color: (status == 'incoming')
                          ? greenColor
                          : (status == 'outgoing')
                              ? orangeColor
                              : (status == 'water')
                                  ? waterColor
                                  : (status == 'electricity')
                                      ? electricityColor
                                      : recordsColor,
                      size: (status == 'incoming')
                          ? 40.sp
                          : (status == 'outgoing')
                              ? 40.sp
                              : (status == 'water')
                                  ? 40.sp
                                  : (status == 'electricity')
                                      ? 47.sp
                                      : 38.sp,
                    ),
                  ),
                ),
                SizedBox(
                  width: 265.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          quickSandMediumText(
                            text: title,
                            fontSize: 15.sp,
                            maxLines: 2,
                            fontWeight: FontWeight.w700,
                            color: AdaptiveTheme.of(context).mode.isLight
                                ? blackColor
                                : whiteColor,
                          ),
                          quickSandMediumText(
                            text: date,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: AdaptiveTheme.of(context).mode.isLight
                                ? blackColor
                                : whiteColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        width: 245.w,
                        child: quickSandTitleText(
                          text: description,
                          fontSize: 15.sp,
                          color: anothergrayColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      const Divider(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
