import 'dart:developer';

import 'package:flutter/material.dart';

class BalanceProvider extends ChangeNotifier {
  int balanceAmount = 50000;

  bool deductBalance(int deductAmount) {
    log('in deduct balance');
    log(deductAmount.toString());
    if (deductAmount <= balanceAmount) {
      int temp = balanceAmount - deductAmount;
      log('this is temp ============> ${temp.toString()}');
      balanceAmount = temp;
      log('this is balance ===========> ${balanceAmount.toString()}');
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}
