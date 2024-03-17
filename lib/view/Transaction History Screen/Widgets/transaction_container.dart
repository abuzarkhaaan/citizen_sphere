import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionContainer extends StatelessWidget {
  const TransactionContainer(
      {super.key,
      required this.status,
      required this.name,
      required this.amount,
      required this.date});
  final String status;
  final String name;
  final String amount;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 23.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 55.w,
            height: 55.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // boxShadow: [
              //   BoxShadow(
              //     color: lightGrayColor.withOpacity(0.5),
              //     spreadRadius: 2.sp,
              //     blurRadius: 3.sp,
              //   ),
              // ],
              color: (status == 'outgoing')
                  ? orangeColor.withOpacity(0.25)
                  : (status == 'incoming')
                      ? greenColor.withOpacity(0.25)
                      : blueColor.withOpacity(0.25),
            ),
            child: Icon(
              (status == 'outgoing')
                  ? Icons.arrow_upward_rounded
                  : (status == 'incoming')
                      ? Icons.arrow_downward_rounded
                      : Icons.payment,
              color: (status == 'outgoing')
                  ? orangeColor
                  : (status == 'incoming')
                      ? greenColor
                      : blueColor,
              size: 40.sp,
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
                    SizedBox(
                      width: 180.w,
                      child: quickSandMediumText(
                        text: name,
                        fontSize: 18.sp,
                        maxLines: 2,
                        fontWeight: FontWeight.w700,
                        color: AdaptiveTheme.of(context).mode.isLight
                            ? blackColor
                            : whiteColor,
                      ),
                    ),
                    quickSandMediumText(
                      text: (status == 'outgoing')
                          ? '- Rs.$amount'
                          : (status == 'incoming')
                              ? '+ Rs.$amount'
                              : 'Rs.$amount',
                      fontSize: 16.sp,
                      color: (status == 'outgoing')
                          ? redStarColor
                          : (status == 'incoming')
                              ? greenColor
                              : blueColor,
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                quickSandTitleText(
                  text: date,
                  fontSize: 11.sp,
                  color: anothergrayColor,
                ),
                SizedBox(height: 10.h),
                const Divider(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
