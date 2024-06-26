import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/view/Records%20Screen/Widgets/edit_medical_records_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../view model/firebase_provider.dart';

class MedicalRecords extends StatefulWidget {
  const MedicalRecords({super.key});

  @override
  State<MedicalRecords> createState() => _MedicalRecordsState();
}

class _MedicalRecordsState extends State<MedicalRecords> {
  @override
  Widget build(BuildContext context) {
    FirebaseProvider firebaseProvider =  Provider.of<FirebaseProvider>(context);
    return Column(
      children: [
        SizedBox(height: 37.h),
        Align(
          alignment: Alignment.centerLeft,
          child: quickSandTitleText(
            text: 'Hi User',
            fontSize: 30.sp,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            quickSandTitleText(
              text: 'View your medical records',
              fontSize: 15.sp,
              color: lightGrayColor,
            ),
            GestureDetector(
              onTap: () {
                Get.to(const EditMedicalRecordScreen());
              },
              child: const Icon(Icons.edit),
            ),
          ],
        ),
        SizedBox(height: 18.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 175.w,
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
                    text: 'Name',
                    fontSize: 14.sp,
                  ),
                  quickSandTitleText(
                      text: firebaseProvider.firstName, fontSize: 18.sp, color: lightGrayColor),
                ],
              ),
            ),
            Container(
              width: 175.w,
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
                    text: 'Blood Group',
                    fontSize: 14.sp,
                  ),
                  quickSandTitleText(
                      text: firebaseProvider.bloodGroup, fontSize: 18.sp, color: lightGrayColor),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 175.w,
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
                    text: 'Weight',
                    fontSize: 14.sp,
                  ),
                  quickSandTitleText(
                      text: "${firebaseProvider.weight} Kg", fontSize: 18.sp, color: lightGrayColor),
                ],
              ),
            ),
            Container(
              width: 175.w,
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
                    text: 'Height',
                    fontSize: 14.sp,
                  ),
                  quickSandTitleText(
                      text: '${firebaseProvider.height}\'', fontSize: 18.sp, color: lightGrayColor),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 175.w,
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
                    text: 'Age',
                    fontSize: 14.sp,
                  ),
                  quickSandTitleText(
                      text: firebaseProvider.age, fontSize: 18.sp, color: lightGrayColor),
                ],
              ),
            ),
            Container(
              width: 175.w,
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
                    text: 'Disease',
                    fontSize: 14.sp,
                  ),
                  quickSandTitleText(
                      text: firebaseProvider.disease, fontSize: 18.sp, color: lightGrayColor),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
