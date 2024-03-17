import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_green_button.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_textfield.dart';
import 'package:citizen_sphere2/utils/theme_extensions.dart';
import 'package:citizen_sphere2/view/Complaints%20Screen/complaint_successful_screen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  File? selectedPdfFile;

  final cnicController = TextEditingController();
  final complaintController = TextEditingController();

  final List<String> options = [
    'PESCO',
    'WAPDA',
    'NADRA',
    'OTHERS',
  ];

  //////PDF Picker///////
  Future<void> pickPDFFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        selectedPdfFile = File(result.files.single.path!);
        setState(() {});
      } else {}
    } catch (error) {
      debugPrint('File picking error: $error');
    }
  }

  String? selectedValue;

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
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: whiteColor,
                    ),
                  ),
                  quickSandNormalText(
                    text: 'Complaints',
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
                padding: EdgeInsets.symmetric(horizontal: 35.w),
                // height: 1.sh,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.sp),
                    topRight: Radius.circular(30.sp),
                  ),
                  color: colorScheme.onPrimary,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 55.h),
                      quickSandTitleText(
                        text: 'NEW COMPLAINT/ REQUESTS',
                        fontSize: 23.sp,
                      ),
                      SizedBox(height: 30.h),
                      CustomTextField(
                        keyboardType: TextInputType.number,
                        controller: cnicController,
                        label: 'CNIC',
                        isRequired: true,
                        isObscure: false,
                      ),
                      SizedBox(height: 20.h),
                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        decoration: InputDecoration(
                          label: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Select Category',
                                  style: quickSandStyle(
                                    fontSize: 14.sp,
                                    color:
                                        AdaptiveTheme.of(context).mode.isLight
                                            ? blackColor
                                            : whiteColor,
                                  ),
                                ),
                                WidgetSpan(
                                  child: quickSandNormalText(
                                    text: ' *',
                                    fontSize: 14.sp,
                                    color: redStarColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          contentPadding: EdgeInsets.only(left: 3.w),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(),
                          ),
                        ),
                        hint: Text(
                          'Select...',
                          style: quickSandStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.normal,
                            color: AdaptiveTheme.of(context).mode.isLight
                                ? blackColor
                                : whiteColor,
                          ),
                        ),
                        items: options
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select an option.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          //Do something when selected item is changed.
                        },
                        onSaved: (value) {
                          selectedValue = value.toString();
                        },
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.only(right: 8),
                        ),
                        iconStyleData: IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: AdaptiveTheme.of(context).mode.isLight
                                ? blackColor
                                : whiteColor,
                          ),
                          iconSize: 24,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        // menuItemStyleData: const MenuItemStyleData(
                        //   padding: EdgeInsets.symmetric(horizontal: 16),
                        // ),
                      ),
                      SizedBox(height: 30.h),
                      CustomTextField(
                        keyboardType: TextInputType.name,
                        controller: complaintController,
                        label: 'Complaint',
                        isRequired: true,
                        isObscure: false,
                        maxlines: 10,
                      ),
                      SizedBox(height: 30.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: pickPDFFile,
                          child: Container(
                            width: 175.w,
                            height: 34.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.sp),
                              border: Border.all(color: grayColor),
                            ),
                            child: selectedPdfFile != null
                                ? Center(
                                    child: SizedBox(
                                      width: 165.w,
                                      height: 34.h,
                                      child: quickSandNormalText(
                                        text: selectedPdfFile!.path
                                            .split('/')
                                            .last,
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        textOverflow: TextOverflow.ellipsis,
                                        color: AdaptiveTheme.of(context)
                                                .mode
                                                .isLight
                                            ? blackColor
                                            : whiteColor,
                                      ),
                                    ),
                                  )
                                : Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Icon(Icons.add),
                                      quickSandNormalText(
                                        text: 'Add Attachments',
                                        color: AdaptiveTheme.of(context)
                                                .mode
                                                .isLight
                                            ? blackColor
                                            : whiteColor,
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      GestureDetector(
                        onTap: () {
                          if (selectedPdfFile != null) {
                            Get.to(const ComplaintSuccessfulScreen());
                          }
                          if (selectedPdfFile == null) {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Center(
                                  child: Text('Attach a file'),
                                ),
                              ),
                            );
                          }

                          // Get.to(page);
                        },
                        child: const CustomGreenButton(label: 'Submit'),
                      ),
                      SizedBox(height: 55.h),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
