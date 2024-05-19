import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/view%20model/TransactionsListModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/view/Transaction%20History%20Screen/Widgets/transaction_container.dart';
import 'package:provider/provider.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    List transactionList =
        Provider.of<TransactionsListProvider>(context, listen: false)
            .transactionsList;

    return Container(
      width: 1.sw,
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
          SizedBox(height: 20.h),
          Divider(),
          transactionList.isEmpty
              ? Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child: quickSandMediumText(
                    text: 'No Transactions yet!',
                    fontSize: 20.sp,
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                      itemCount: transactionList.length,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return TransactionContainer(
                          status: transactionList[index].status,
                          name: transactionList[index].name,
                          amount: transactionList[index].amount,
                          date: transactionList[index].date,
                        );
                      }),
                ),
        ],
      ),
    );
  }
}
