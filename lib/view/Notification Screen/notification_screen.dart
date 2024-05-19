import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/view%20model/NotificationsListProvider.dart';
import 'package:citizen_sphere2/view/Notification%20Screen/Widgets/notification_container.dart';
import 'package:citizen_sphere2/view/Notification%20Screen/Widgets/notification_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List notificationList =
        Provider.of<NotificationsListProvider>(context, listen: false)
            .notificationsList;
    return Container(
      width: 1.sw,
      child: Padding(
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
            notificationList.isEmpty
                ? Padding(
                    padding: EdgeInsets.only(top: 100.h),
                    child: quickSandMediumText(
                      text: 'No Notifications yet!',
                      fontSize: 20.sp,
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: notificationList.length,
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
                            status: notificationList[index].status,
                            title: notificationList[index].title,
                            description: notificationList[index].description,
                            date: notificationList[index].date,
                            index: index,
                          );
                        }),
                  ),
          ],
        ),
      ),
    );
  }
}
