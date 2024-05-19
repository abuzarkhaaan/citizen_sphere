import 'dart:developer';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:citizen_sphere2/view%20model/BalanceProvider.dart';
import 'package:citizen_sphere2/view%20model/NotificationsListProvider.dart';
import 'package:citizen_sphere2/view%20model/TransactionsListModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:citizen_sphere2/core/constants/assets.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_green_button.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_textfield.dart';
import 'package:citizen_sphere2/view/Send%20Money%20Screen/Widgets/transfer_money_alertbox.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../utils/theme_extensions.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final notifications = Provider.of<NotificationsListProvider>(context);
    final transactions = Provider.of<TransactionsListProvider>(context);

    final screenHeight = MediaQuery.of(context).size.height;
    log(screenHeight.toString());
    return Consumer<BalanceProvider>(builder: (context, model, child) {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: screenHeight - 100.w,
              child: Padding(
                padding: EdgeInsets.only(left: 35.w, top: 20.h, right: 35.w),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 27.w, vertical: 17.h),
                      width: 1.sw,
                      height: 150.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.sp),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5.sp,
                              spreadRadius: 1.sp,
                              color: grayColor.withOpacity(0.5),
                              offset: const Offset(0, 5))
                        ],
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).colorScheme.primaryContainer,
                            Theme.of(context).colorScheme.primaryContainer,
                            // greenColor.withOpacity(.4),
                            // whiteColor,
                            // whiteColor,
                            greenColor.withOpacity(.8),
                            greenColor.withOpacity(.9),
                            greenColor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomRight,
                        ),
                        color: whiteColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          quickSandMediumText(
                            text: 'Balance',
                            fontSize: 16.sp,
                            color: AdaptiveTheme.of(context).mode.isLight
                                ? blackColor
                                : whiteColor,
                          ),
                          quickSandMediumText(
                            text:
                                'Rs ${Provider.of<BalanceProvider>(context).balanceAmount}'
                                    .toString(),
                            fontSize: 35.sp,
                            color: AdaptiveTheme.of(context).mode.isLight
                                ? blackColor
                                : whiteColor,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: quickSandNormalText(
                        text: 'SEND TO',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: AdaptiveTheme.of(context).mode.isLight
                            ? blackColor
                            : whiteColor,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            keyboardType: TextInputType.name,
                            controller: nameController,
                            label: 'Name',
                            isRequired: true,
                            isObscure: false,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Enter a valid name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15.h),
                          CustomTextField(
                            keyboardType: TextInputType.number,
                            controller: numberController,
                            label: 'Phone Number',
                            isRequired: true,
                            isObscure: false,
                            validator: (val) {
                              if (val == null) {
                                return 'Enter a valid number';
                              }
                              if (val.trim().length != 11 &&
                                  val.trim().length != 13) {
                                return 'Number should be of 11 or 13(+92) digits';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15.h),
                          CustomTextField(
                            keyboardType: TextInputType.number,
                            controller: amountController,
                            label: 'Amount',
                            isRequired: true,
                            isObscure: false,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Enter a valid amount';
                              }

                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
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
                                            bool success = model.deductBalance(
                                                int.parse(
                                                    amountController.text));
                                            success
                                                ? notifications.transactionFnc(
                                                    NotificationModel(
                                                      title: 'Money Sent',
                                                      date: DateFormat('HH:mm')
                                                          .format(
                                                              DateTime.now()),
                                                      description:
                                                          'You sent ${nameController.text} Rs. ${amountController.text}',
                                                      status: 'outgoing',
                                                    ),
                                                  )
                                                : null;
                                            success
                                                ? transactions.transactionFnc(
                                                    TransactionModel(
                                                      name: nameController.text,
                                                      amount:
                                                          amountController.text,
                                                      date: DateFormat('HH:mm')
                                                          .format(
                                                              DateTime.now()),
                                                      status: 'outgoing',
                                                    ),
                                                  )
                                                : null;
                                            success
                                                ? showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return TransferMoneyDialogBox(
                                                        number: numberController
                                                            .text,
                                                        amount: amountController
                                                            .text,
                                                        receiver:
                                                            nameController.text,
                                                        sender: 'Mustafa',
                                                      );
                                                    },
                                                  )
                                                : showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
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
                                                    'Rs.${amountController.text} sent to ${nameController.text}',
                                                    context)
                                                : Utils.flushbarMessage(
                                                    'Unsufficient Balance',
                                                    context);
                                          },
                                          child: const CustomGreenButton(
                                            label: 'Send Money',
                                          ),
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
                      child: const CustomGreenButton(label: 'Send'),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
