import 'package:citizen_sphere2/view%20model/BalanceProvider.dart';
import 'package:citizen_sphere2/view%20model/My%20Profile%20View%20Model/my_profile_view_model.dart';
import 'package:citizen_sphere2/view%20model/NotificationsListProvider.dart';
import 'package:citizen_sphere2/view%20model/TransactionsListModel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../view model/firebase_provider.dart';
import '../../view model/sign_up_provider.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => MyProfileViewModel()),
  ChangeNotifierProvider(create: (_) => SignUpProvider()),
  ChangeNotifierProvider(create: (_) => FirebaseProvider()),
  ChangeNotifierProvider(create: (_) => BalanceProvider()),
  ChangeNotifierProvider(create: (_) => TransactionsListProvider()),
  ChangeNotifierProvider(create: (_) => NotificationsListProvider()),
];
