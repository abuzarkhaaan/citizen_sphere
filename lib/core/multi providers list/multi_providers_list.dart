import 'package:citizen_sphere2/view%20model/My%20Profile%20View%20Model/my_profile_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => MyProfileViewModel()),
];
