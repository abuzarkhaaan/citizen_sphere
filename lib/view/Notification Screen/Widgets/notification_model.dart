class NotificationModel {
  final String title;
  final String date;
  final String description;
  final bool undread;
  final String status;

  NotificationModel({
    required this.title,
    required this.date,
    required this.description,
    required this.undread,
    required this.status,
  });
}

List<NotificationModel> notificationModel = [
  NotificationModel(
    title: 'Money Received',
    date: '1h',
    description: 'Abuzar sent you Rs. 2000.',
    undread: true,
    status: 'incoming',
  ),
  NotificationModel(
    title: 'Electricity Bill',
    date: '1h',
    description: 'Your Electricity Bill amount 25,000 has been paid',
    undread: true,
    status: 'electricity',
  ),
  NotificationModel(
    title: 'Water Bill',
    date: '1h',
    description: 'Your Water Bill amount 5,000 has been paid',
    undread: false,
    status: 'water',
  ),
  NotificationModel(
    title: 'Money Sent',
    date: '2h',
    description: 'You sent Ahsan Rs. 1000',
    undread: false,
    status: 'outgoing',
  ),
  NotificationModel(
    title: 'Medical Records',
    date: '3h',
    description: 'Your Medical Record has been changed.',
    undread: false,
    status: 'records',
  ),
  NotificationModel(
    title: 'Money Received',
    date: 'Yesterday',
    description: 'Abuzar sent you Rs. 2000.',
    undread: false,
    status: 'incoming',
  ),
  NotificationModel(
    title: 'Electricity Bill',
    date: 'Yesterday',
    description: 'Your Electricity Bill amount 25,000 has been paid',
    undread: false,
    status: 'electricity',
  ),
  NotificationModel(
    title: 'Water Bill',
    date: 'Yesterday',
    description: 'Your Water Bill amount 5,000 has been paid',
    undread: false,
    status: 'water',
  ),
  NotificationModel(
    title: 'Money Sent',
    date: 'Yesterday',
    description: 'You sent Ahsan Rs. 1000',
    undread: false,
    status: 'outgoing',
  ),
  NotificationModel(
    title: 'Medical Records',
    date: 'Yesterday',
    description: 'Your Medical Record has been changed.',
    undread: false,
    status: 'records',
  ),
];
