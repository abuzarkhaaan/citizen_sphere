import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sks_ticket_view/sks_ticket_view.dart';
// import 'package:flutter_ticket_view/ticketview.dart';

class RoughScreen extends StatefulWidget {
  const RoughScreen({super.key});

  @override
  State<RoughScreen> createState() => _RoughScreenState();
}

class _RoughScreenState extends State<RoughScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 1.sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.h,
            ),
            SKSTicketView(
              backgroundPadding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              backgroundColor: greenColor,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20.h, horizontal: 0.w),
              drawArc: false,
              triangleAxis: Axis.vertical,
              borderRadius: 6,
              drawDivider: true,
              trianglePos: .55,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 20.h,
                ),
                // height: 300.h,
                width: 320.w,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        quickSandNormalText(
                            text: 'Date',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600),
                        quickSandNormalText(
                            text: '20 Feb, 2024',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: anothergrayColor)
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        quickSandNormalText(
                            text: 'Reference Number',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600),
                        quickSandNormalText(
                            text: '#54463873456',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: anothergrayColor)
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        quickSandNormalText(
                            text: 'Sender',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600),
                        quickSandNormalText(
                            text: 'User',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: anothergrayColor)
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        quickSandNormalText(
                            text: 'Receiver',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600),
                        quickSandNormalText(
                            text: 'Ahsan Yousafzai',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: anothergrayColor)
                      ],
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        quickSandNormalText(
                            text: 'Transfer Amount',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600),
                        quickSandNormalText(
                            text: 'Rs. 1000',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: anothergrayColor)
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        quickSandNormalText(
                            text: 'Transfer Charges',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600),
                        quickSandNormalText(
                            text: 'Rs. 0',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: anothergrayColor)
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        quickSandNormalText(
                            text: 'Total Amount',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600),
                        quickSandNormalText(
                            text: 'Rs. 1000',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: greenColor)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // body: TicketView(
      //   backgroundPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      //   backgroundColor: Color(0xFF8F1299),
      //   contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 0),
      //   drawArc: false,
      //   triangleAxis: Axis.vertical,
      //   borderRadius: 6,
      //   drawDivider: true,
      //   trianglePos: .5,
      //   child: Container(
      //     height: 200.h,
      //     width: 100.w,
      //   ),
      // ),
    );
  }
}
