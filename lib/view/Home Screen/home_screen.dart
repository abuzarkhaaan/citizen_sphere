import 'package:citizen_sphere2/view/My%20Profile%20Screen/my_profile_screen.dart';
import 'package:citizen_sphere2/view/Notification%20Screen/notification_screen.dart';
import 'package:citizen_sphere2/view/Transaction%20History%20Screen/transaction_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/view/Home%20Screen/Widgets/home_screen_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomNavIndex = 0;
  final List<IconData> _selectedIcons = [
    Icons.home,
    Icons.assessment,
    Icons.notification_add,
    Icons.account_circle,
  ];

  List<Widget> screens = [
    const HomeScreenWidget(),
    const TransactionHistoryScreen(),
    const NotificationScreen(),
    const MyProfileScreen(),
  ];

  // void _onItemTapped(index) {
  //   setState(() {
  //     _bottomNavIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape: const CircleBorder(),
          backgroundColor: greenColor,
          child: Icon(
            Icons.qr_code,
            color: whiteColor,
            size: 40.sp,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: _selectedIcons,
          iconSize: 40.sp,
          inactiveColor: whiteColor,
          activeColor: Theme.of(context).colorScheme.inversePrimary,
          backgroundColor: greenColor,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.smoothEdge,
          // leftCornerRadius: 32,
          // rightCornerRadius: 32,
          onTap: (index) => setState(() => _bottomNavIndex = index),
          //other params
        ),
        body: screens[_bottomNavIndex],
      ),
    );
  }
}
