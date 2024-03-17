import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/utils/theme_extensions.dart';
import 'package:citizen_sphere2/view/Records%20Screen/Widgets/criminal_records.dart';
import 'package:citizen_sphere2/view/Records%20Screen/Widgets/medical_records.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {});
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = context.colorScheme;

    return SafeArea(
      child: Scaffold(
        backgroundColor: greenColor,
        body: Column(
          children: [
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Get.offAll(const HomeScreen());
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: whiteColor,
                    ),
                  ),
                  quickSandNormalText(
                    text: 'Records',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: whiteColor,
                  ),
                  const Icon(
                    Icons.arrow_back_ios_new,
                    color: greenColor,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 55.h),
                // height: 1.sh,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.sp),
                    topRight: Radius.circular(30.sp),
                  ),
                  color: colorScheme.onPrimary,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      // width: 500.w,
                      child: TabBar(
                        controller: _tabController,
                        isScrollable: true,
                        padding: const EdgeInsets.all(0),
                        labelPadding: EdgeInsets.symmetric(
                          horizontal: 25.w,
                        ),
                        onTap: (val) {
                          currentIndex = val;
                          setState(() {});
                        },
                        tabs: [
                          Center(
                            child: quickSandNormalText(
                              text: 'Medical',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: _tabController.index == 0
                                  ? greenColor
                                  : AdaptiveTheme.of(context).mode.isLight
                                      ? blackColor
                                      : whiteColor,
                            ),
                          ),
                          Center(
                            child: quickSandNormalText(
                              text: 'Criminal',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: _tabController.index == 1
                                  ? greenColor
                                  : AdaptiveTheme.of(context).mode.isLight
                                      ? blackColor
                                      : whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: const [
                          MedicalRecords(),
                          CriminalRecords(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
