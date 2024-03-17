import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_green_button.dart';
import 'package:citizen_sphere2/view/Pay%20Water%20Bill/Widgets/paid_water_bill_dialog.dart';
import 'package:citizen_sphere2/utils/theme_extensions.dart';

class PayWaterBillScreen extends StatefulWidget {
  const PayWaterBillScreen({super.key});

  @override
  State<PayWaterBillScreen> createState() => _PayWaterBillScreenState();
}

class _PayWaterBillScreenState extends State<PayWaterBillScreen> {
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
              padding: EdgeInsets.symmetric(horizontal: 10.w),
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
                    text: 'Pay Water Bill',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: whiteColor,
                  ),
                  const Icon(
                    Icons.arrow_back_ios_new,
                    color: greenColor,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 55.h),
                // height: 1.sh,
                width: 1.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.sp),
                    topRight: Radius.circular(30.sp),
                  ),
                  color: colorScheme.onPrimary,
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.water_drop_outlined,
                      size: 70,
                      color: waterColor,
                    ),
                    SizedBox(height: 15.h),
                    quickSandNormalText(
                      text: 'Your Water Bill is Due',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 15.h),
                    quickSandNormalText(
                      text: 'Rs. 5000',
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const PaidWaterBillDialogBox();
                          },
                        );
                      },
                      child: const CustomGreenButton(label: 'Pay Now'),
                    ),
                    SizedBox(height: 30.h),
                    const Divider(
                      color: lightGrayColor,
                      thickness: 2,
                    ),
                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: quickSandNormalText(
                        text: 'Bill Details',
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            quickSandNormalText(
                              text: 'Company Name',
                              fontSize: 15.sp,
                            ),
                            SizedBox(height: 3.h),
                            quickSandNormalText(
                              text: 'WSSP',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: 25.h),
                            quickSandNormalText(
                              text: 'Billing Month',
                              fontSize: 15.sp,
                            ),
                            SizedBox(height: 3.h),
                            quickSandNormalText(
                              text: 'Feb 2024',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: 25.h),
                            quickSandNormalText(
                              text: 'Consumer Name',
                              fontSize: 15.sp,
                            ),
                            SizedBox(height: 3.h),
                            quickSandNormalText(
                              text: 'Mustafa',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            quickSandNormalText(
                              text: 'Reference No',
                              fontSize: 15.sp,
                            ),
                            SizedBox(height: 3.h),
                            quickSandNormalText(
                              text: '12345678901234',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: 25.h),
                            quickSandNormalText(
                              text: 'Bill Status',
                              fontSize: 15.sp,
                            ),
                            SizedBox(height: 3.h),
                            quickSandNormalText(
                              text: 'Not Paid',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: 25.h),
                            quickSandNormalText(
                              text: 'Due Date',
                              fontSize: 15.sp,
                            ),
                            SizedBox(height: 3.h),
                            quickSandNormalText(
                              text: '10 Feb 2024',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        )
                      ],
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
