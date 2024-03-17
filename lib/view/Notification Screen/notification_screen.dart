import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/view/Notification%20Screen/Widgets/notification_container.dart';
import 'package:citizen_sphere2/view/Notification%20Screen/Widgets/notification_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
            text: 'Notifications',
            fontSize: 30.sp,
            fontWeight: FontWeight.w800,
            color: AdaptiveTheme.of(context).mode.isLight
                ? blackColor
                : whiteColor,
          ),
          SizedBox(height: 24.h),
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: notificationModel.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  // if (index == 0) {
                  //   return Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: quickSandNormalText(
                  //       text: 'Today',
                  //       fontSize: 25.sp,
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   );
                  // }
                  // if (index == 3) {
                  //   return Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: quickSandNormalText(
                  //       text: 'Yesterday',
                  //       fontSize: 25.sp,
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   );
                  // }
                  return NotificationContainer(
                    status: notificationModel[index].status,
                    title: notificationModel[index].title,
                    description: notificationModel[index].description,
                    date: notificationModel[index].date,
                    unread: notificationModel[index].undread,
                    index: index,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
