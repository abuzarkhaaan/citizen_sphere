import 'dart:developer';

import 'package:flutter/material.dart';

class NotificationModel {
  final String title;
  final String date;
  final String description;
  final String status;

  NotificationModel({
    required this.title,
    required this.date,
    required this.description,
    required this.status,
  });
}

class NotificationsListProvider extends ChangeNotifier {
  List<NotificationModel> notificationsList = [];
  void transactionFnc(NotificationModel notificationsDetails) {
    log('in transaction func');
    notificationsList.add(notificationsDetails);
    notifyListeners();
  }
}
