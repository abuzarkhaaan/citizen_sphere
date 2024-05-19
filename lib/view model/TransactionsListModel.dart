import 'package:flutter/material.dart';

class TransactionModel {
  final String name;
  final String amount;
  final String date;
  final String status;

  TransactionModel({
    required this.name,
    required this.amount,
    required this.date,
    required this.status,
  });
}

class TransactionsListProvider extends ChangeNotifier {
  List<TransactionModel> transactionsList = [];
  void transactionFnc(TransactionModel transactionDetails) {
    transactionsList.add(transactionDetails);
    notifyListeners();
  }
}
