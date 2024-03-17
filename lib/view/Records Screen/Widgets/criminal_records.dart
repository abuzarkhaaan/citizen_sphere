import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CriminalRecords extends StatefulWidget {
  const CriminalRecords({super.key});

  @override
  State<CriminalRecords> createState() => _CriminalRecordsState();
}

class _CriminalRecordsState extends State<CriminalRecords> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 37.h),
          Container(
            width: 1.sw,
            height: 89.h,
            padding: EdgeInsets.symmetric(
              horizontal: 17.w,
              vertical: 15.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.sp),
              border: Border.all(color: greenColor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                quickSandTitleText(
                  text: 'Section 144',
                  fontSize: 18.sp,
                ),
                quickSandTitleText(
                  text: '21 Feb, 2024',
                  fontSize: 14.sp,
                  color: lightGrayColor,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            width: 1.sw,
            height: 89.h,
            padding: EdgeInsets.symmetric(
              horizontal: 17.w,
              vertical: 15.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.sp),
              border: Border.all(color: greenColor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                quickSandTitleText(
                  text: 'Section 142',
                  fontSize: 18.sp,
                ),
                quickSandTitleText(
                  text: '21 Feb, 2024',
                  fontSize: 14.sp,
                  color: lightGrayColor,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            width: 1.sw,
            height: 89.h,
            padding: EdgeInsets.symmetric(
              horizontal: 17.w,
              vertical: 15.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.sp),
              border: Border.all(color: greenColor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                quickSandTitleText(
                  text: 'Section 127',
                  fontSize: 18.sp,
                ),
                quickSandTitleText(
                  text: '21 Feb, 2024',
                  fontSize: 14.sp,
                  color: lightGrayColor,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            width: 1.sw,
            height: 89.h,
            padding: EdgeInsets.symmetric(
              horizontal: 17.w,
              vertical: 15.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.sp),
              border: Border.all(color: greenColor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                quickSandTitleText(
                  text: 'Section 144',
                  fontSize: 18.sp,
                ),
                quickSandTitleText(
                  text: '21 Feb, 2024',
                  fontSize: 14.sp,
                  color: lightGrayColor,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            width: 1.sw,
            height: 89.h,
            padding: EdgeInsets.symmetric(
              horizontal: 17.w,
              vertical: 15.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.sp),
              border: Border.all(color: greenColor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                quickSandTitleText(
                  text: 'Section 142',
                  fontSize: 18.sp,
                ),
                quickSandTitleText(
                  text: '21 Feb, 2024',
                  fontSize: 14.sp,
                  color: lightGrayColor,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            width: 1.sw,
            height: 89.h,
            padding: EdgeInsets.symmetric(
              horizontal: 17.w,
              vertical: 15.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.sp),
              border: Border.all(color: greenColor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                quickSandTitleText(
                  text: 'Section 127',
                  fontSize: 18.sp,
                ),
                quickSandTitleText(
                  text: '21 Feb, 2024',
                  fontSize: 14.sp,
                  color: lightGrayColor,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
