import 'package:citizen_sphere2/view/Its%20Me%20Screen/its_me_screen.dart';
import 'package:citizen_sphere2/view/Pay%20Electricity%20Bill/pay_electricity_bill_invoice_number_screen.dart';
import 'package:citizen_sphere2/view/Pay%20Water%20Bill/pay_water_bill_invoice_no_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:citizen_sphere2/core/constants/assets.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/view/Home%20Screen/Widgets/options_card_and_description.dart';
import 'package:citizen_sphere2/view/Send%20Money%20Screen/send_money_screen.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(
          top: 30.h,
          left: 38.w,
          right: 38.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 236.h,
              width: 1.sw,
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 16.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    10.0), // Adjust the value for more or less rounding
                gradient: LinearGradient(
                  colors: [
                    whiteColor,
                    whiteColor,
                    greenColor.withOpacity(.8),
                    greenColor.withOpacity(.9),
                    greenColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: blackColor.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 18,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  quickSandMediumText(
                    text: 'Balance',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  quickSandMediumText(
                    text: 'Rs. 5000',
                    fontSize: 48.sp,
                  ),
                  SizedBox(height: 44.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            const SendMoneyScreen(),
                          );
                        },
                        child: Container(
                          width: 300.w,
                          height: 51.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.sp),
                            border: Border.all(color: tealColor),
                            color: whiteColor,
                          ),
                          child: Center(
                            child: quickSandMediumText(
                              text: 'SEND',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: greenColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 28.h),
            quickSandMediumText(
              text: 'DIGITAL ID',
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 11.h),
            GestureDetector(
              onTap: () {
                Get.to(const ItsMeScreen());
              },
              child: OptionsCardAndDescription(
                icon: itsMeIcon,
                description: 'Its Me',
                width: 30.w,
                height: 25.h,
              ),
            ),
            SizedBox(height: 28.h),
            quickSandMediumText(
              text: 'FEDERAL SERVICES',
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 11.h),
            OptionsCardAndDescription(
              icon: federalServicesIcon,
              description: 'Federal Services',
              width: 38.w,
              height: 60.h,
            ),
            SizedBox(height: 28.h),
            quickSandMediumText(
              text: 'BILL PAYMENT',
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 11.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(const ElectricityInvoiceNumberScreen());
                  },
                  child: OptionsCardAndDescription(
                    icon: electricityIcon,
                    description: 'Electricity Bill',
                    width: 35.w,
                    height: 30.h,
                  ),
                ),
                SizedBox(width: 20.w),
                GestureDetector(
                  onTap: () {
                    Get.to(const WaterInvoiceNumberScreen());
                  },
                  child: OptionsCardAndDescription(
                    icon: waterIcon,
                    description: 'Water Bill',
                    width: 33.w,
                    height: 27.h,
                  ),
                ),
                // SizedBox(width: 20.w),
                // OptionsCardAndDescription(
                //   icon: expensesIcon,
                //   description: 'Expenses',
                //   width: 40.w,
                //   height: 35.h,
                // ),
              ],
            ),
            SizedBox(height: 28.h),
            quickSandMediumText(
              text: 'RECORDS',
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 11.h),
            OptionsCardAndDescription(
              icon: recordsIcon,
              description: 'Personal Records',
              width: 30.w,
              height: 25.h,
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
