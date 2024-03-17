import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sks_ticket_view/sks_ticket_view.dart';
import 'package:citizen_sphere2/core/constants/assets.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';

class QrPaymentTransferedDialog extends StatelessWidget {
  const QrPaymentTransferedDialog(
      {super.key, required this.phoneNo, required this.name});
  final String name;
  final String phoneNo;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: 0.w,
          right: 0.w,
          top: -80.h,
          child: Image.asset(
            transactionDone,
            width: 140.w,
            height: 140.h,
          ),
        ),
        SizedBox(
          height: 400.h,
          width: 1.sw,
          child: Column(
            children: [
              const Spacer(),
              quickSandTitleText(
                text: 'Transaction Successful',
                fontSize: 18.sp,
              ),
              SKSTicketView(
                backgroundPadding:
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
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
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600),
                          quickSandNormalText(
                              text: '20 Feb, 2024',
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: anothergrayColor)
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          quickSandNormalText(
                              text: 'Phone Number',
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600),
                          quickSandNormalText(
                              text: phoneNo,
                              fontSize: 13.sp,
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
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600),
                          quickSandNormalText(
                              text: 'User',
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: anothergrayColor)
                        ],
                      ),
                      SizedBox(height: 13.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          quickSandNormalText(
                              text: 'Receiver',
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600),
                          quickSandNormalText(
                              text: name,
                              fontSize: 13.sp,
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
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600),
                          quickSandNormalText(
                              text: 'Rs. 1000',
                              fontSize: 13.sp,
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
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600),
                          quickSandNormalText(
                              text: 'Rs. 0',
                              fontSize: 13.sp,
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
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600),
                          quickSandNormalText(
                              text: 'Rs. 1000',
                              fontSize: 13.sp,
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
      ],
    ));
  }
}
