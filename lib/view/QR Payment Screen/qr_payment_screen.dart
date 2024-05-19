import 'dart:convert';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_green_button.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_textfield.dart';
import 'package:citizen_sphere2/utils/theme_extensions.dart';
import 'package:citizen_sphere2/view%20model/BalanceProvider.dart';
import 'package:citizen_sphere2/view/QR%20Payment%20Screen/Widgets/qr_payment_transfered.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../view model/NotificationsListProvider.dart';
import '../../view model/TransactionsListModel.dart';
import '../Send Money Screen/Widgets/transfer_money_alertbox.dart';

class QrPaymentScreen extends StatefulWidget {
  const QrPaymentScreen({super.key, required this.qrData});
  final String qrData;

  @override
  State<QrPaymentScreen> createState() => _QrPaymentScreenState();
}

class _QrPaymentScreenState extends State<QrPaymentScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = context.colorScheme;
    final notifications = Provider.of<NotificationsListProvider>(context);
    final transactions = Provider.of<TransactionsListProvider>(context);

    Map<String, dynamic> decodedData = jsonDecode(widget.qrData);
    String name = decodedData['name'];
    String number = decodedData['number'];

    debugPrint(name);
    debugPrint(number);
    return Consumer<BalanceProvider>(builder: (context, model, child) {
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
                      text: 'QR Scan Payment',
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 35.w, vertical: 55.h),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: quickSandTitleText(
                                text: 'Name:', fontSize: 20.sp),
                          ),
                          SizedBox(
                            width: 200.w,
                            child: quickSandMediumText(
                              text: name,
                              fontSize: 20.sp,
                              color: AdaptiveTheme.of(context).mode.isLight
                                  ? blackColor
                                  : whiteColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: quickSandTitleText(
                                text: 'Phone No:', fontSize: 20.sp),
                          ),
                          SizedBox(
                            width: 200.w,
                            child: quickSandMediumText(
                              text: number,
                              fontSize: 20.sp,
                              color: AdaptiveTheme.of(context).mode.isLight
                                  ? blackColor
                                  : whiteColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Form(
                        key: formKey,
                        child: CustomTextField(
                            keyboardType: TextInputType.number,
                            controller: amountController,
                            label: 'Amount',
                            isRequired: true,
                            validator: (val) {
                              if (val == null || val.trim().isEmpty) {
                                return "Enter a valid amount";
                              }
                              return null;
                            },
                            isObscure: false),
                      ),
                      SizedBox(height: 50.h),
                      GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: SizedBox(
                                    height: 220.h,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 5.h),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              quickSandMediumText(
                                                text: 'AMOUNT',
                                                fontSize: 14.sp,
                                                color: AdaptiveTheme.of(context)
                                                        .mode
                                                        .isLight
                                                    ? blackColor
                                                    : whiteColor,
                                              ),
                                              quickSandMediumText(
                                                text:
                                                    'Rs. ${amountController.text}',
                                                fontSize: 14.sp,
                                                color: AdaptiveTheme.of(context)
                                                        .mode
                                                        .isLight
                                                    ? blackColor
                                                    : whiteColor,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 15.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              quickSandMediumText(
                                                text: 'FEES',
                                                fontSize: 14.sp,
                                                color: AdaptiveTheme.of(context)
                                                        .mode
                                                        .isLight
                                                    ? blackColor
                                                    : whiteColor,
                                              ),
                                              quickSandMediumText(
                                                text: 'Rs. 0',
                                                fontSize: 14.sp,
                                                color: AdaptiveTheme.of(context)
                                                        .mode
                                                        .isLight
                                                    ? blackColor
                                                    : whiteColor,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 15.h),
                                          const Divider(),
                                          SizedBox(height: 15.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              quickSandMediumText(
                                                text: 'TOTAL AMOUNT',
                                                fontSize: 14.sp,
                                                color: AdaptiveTheme.of(context)
                                                        .mode
                                                        .isLight
                                                    ? blackColor
                                                    : whiteColor,
                                              ),
                                              quickSandMediumText(
                                                text:
                                                    'Rs. ${amountController.text}',
                                                fontSize: 14.sp,
                                                color: AdaptiveTheme.of(context)
                                                        .mode
                                                        .isLight
                                                    ? blackColor
                                                    : whiteColor,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 25.h),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                              bool success =
                                                  model.deductBalance(int.parse(
                                                      amountController.text));
                                              success
                                                  ? notifications
                                                      .transactionFnc(
                                                      NotificationModel(
                                                        title: 'Money Sent',
                                                        date: DateFormat(
                                                                'HH:mm')
                                                            .format(
                                                                DateTime.now()),
                                                        description:
                                                            'You sent $name Rs. ${amountController.text}',
                                                        status: 'outgoing',
                                                      ),
                                                    )
                                                  : null;
                                              success
                                                  ? transactions.transactionFnc(
                                                      TransactionModel(
                                                        name: name,
                                                        amount: amountController
                                                            .text,
                                                        date: DateFormat(
                                                                'HH:mm')
                                                            .format(
                                                                DateTime.now()),
                                                        status: 'outgoing',
                                                      ),
                                                    )
                                                  : null;
                                              success
                                                  ? showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return TransferMoneyDialogBox(
                                                          number: number,
                                                          amount:
                                                              amountController
                                                                  .text,
                                                          receiver: name,
                                                          sender: 'Mustafa',
                                                        );
                                                      },
                                                    )
                                                  : showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          content: SizedBox(
                                                            height: 220.h,
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          10.w,
                                                                      vertical:
                                                                          5.h),
                                                              child: Column(
                                                                children: [
                                                                  SizedBox(
                                                                      height:
                                                                          20.h),
                                                                  quickSandNormalText(
                                                                      text:
                                                                          'Insuffient Balance Amount!',
                                                                      fontSize:
                                                                          20.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      color:
                                                                          blackColor),
                                                                  SizedBox(
                                                                      height:
                                                                          20.h),
                                                                  quickSandNormalText(
                                                                      text:
                                                                          'Try another amount',
                                                                      fontSize:
                                                                          20.sp,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      color:
                                                                          blackColor),
                                                                  SizedBox(
                                                                      height:
                                                                          20.h),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child:
                                                                        const CustomGreenButton(
                                                                      label:
                                                                          'Close',
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );

                                              success
                                                  ? Utils.successflushbarMessage(
                                                      'Rs.${amountController.text} sent to $name',
                                                      context)
                                                  : Utils.flushbarMessage(
                                                      'Unsufficient Balance',
                                                      context);
                                              // showDialog(
                                              //   context: context,
                                              //   builder:
                                              //       (BuildContext context) {
                                              //     return QrPaymentTransferedDialog(
                                              //       phoneNo: number,
                                              //       name: name,
                                              //     );
                                              //   },
                                              // );
                                            },
                                            child: const CustomGreenButton(
                                                label: 'Send Money'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: const CustomGreenButton(label: 'Pay'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
