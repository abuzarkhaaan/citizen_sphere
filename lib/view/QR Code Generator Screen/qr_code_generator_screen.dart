import 'dart:convert';

import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_green_button.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_textfield.dart';
import 'package:citizen_sphere2/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeGeneratorScreen extends StatefulWidget {
  const QrCodeGeneratorScreen({super.key});

  @override
  State<QrCodeGeneratorScreen> createState() => _QrCodeGeneratorScreenState();
}

class _QrCodeGeneratorScreenState extends State<QrCodeGeneratorScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  String name = '';
  String number = '';
  String jsonString = '';

  void generateQrCode() {
    Map<String, dynamic> jsonData = {
      'name': name,
      'number': number,
    };
    String jsonString = jsonEncode(jsonData);
    debugPrint(jsonString);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              height: 250.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                child: QrImageView(
                  data: jsonString,
                  size: 250.sp,
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
          );
        });
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
              padding: EdgeInsets.symmetric(horizontal: 10.w),
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
                    text: 'QR Code Generator',
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
                width: 1.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.sp),
                    topRight: Radius.circular(30.sp),
                  ),
                  color: colorScheme.onPrimary,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                              keyboardType: TextInputType.name,
                              controller: nameController,
                              label: 'Name',
                              isRequired: true,
                              onChanged: (val) {
                                name = val;
                              },
                              validator: (val) {
                                if (val == null || val.trim().isEmpty) {
                                  return "Enter a valid name";
                                }
                                return null;
                              },
                              isObscure: false),
                          SizedBox(height: 20.h),
                          CustomTextField(
                              keyboardType: TextInputType.number,
                              controller: numberController,
                              label: 'Phone Number',
                              isRequired: true,
                              onChanged: (val) {
                                number = val;
                              },
                              validator: (val) {
                                if (val == null || val.trim().isEmpty) {
                                  return "Enter a valid Phone Number";
                                }
                                return null;
                              },
                              isObscure: false),
                        ],
                      ),
                    ),
                    SizedBox(height: 50.h),
                    GestureDetector(
                      onTap: generateQrCode,
                      child: const CustomGreenButton(label: 'Generate'),
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
