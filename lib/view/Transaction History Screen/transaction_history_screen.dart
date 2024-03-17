import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/view/Transaction%20History%20Screen/Widgets/transaction_container.dart';
import 'package:citizen_sphere2/view/Transaction%20History%20Screen/Widgets/transaction_model.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 33.h,
        left: 15.w,
        right: 15.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          quickSandMediumText(
            text: 'Transactions',
            fontSize: 30.sp,
            fontWeight: FontWeight.w800,
            color: AdaptiveTheme.of(context).mode.isLight
                ? blackColor
                : whiteColor,
          ),
          SizedBox(height: 24.h),
          Expanded(
            child: ListView.builder(
                itemCount: transactionModel.length,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return TransactionContainer(
                    status: transactionModel[index].status,
                    name: transactionModel[index].name,
                    amount: transactionModel[index].amount,
                    date: transactionModel[index].date,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
