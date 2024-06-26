import 'dart:developer';
import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:citizen_sphere2/core/constants/assets.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_green_button.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_textfield.dart';
import 'package:citizen_sphere2/view%20model/sign_up_provider.dart';
import 'package:citizen_sphere2/view/Register%20Screen/register_pt2_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // final PageController _pageController = PageController();


  // int _currentPageIndex = 0;
  late SignUpProvider signUpProvider;


  // @override
  // void dispose() {
  //   firstNameController.dispose();
  //   lastNameController.dispose();
  //   emailController.dispose();
  //   mobileNoController.dispose();
  //   cnicController.dispose();
  //   cityController.dispose();
  //   birthdayController.dispose();
  //
  //   super.dispose();
  // }

  /////CNIC Picker/////
  // File? cnicFront;
  // File? cnicBack;

  @override
  void initState() {
    Provider.of<SignUpProvider>(context,listen: false).resetFields();
    super.initState();
  }

  Future<void> pickCnicFrontImage() async {
    debugPrint('Picking Cnic Image');
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (image == null) {
      return;
    }
    signUpProvider.cnicFront = File(image.path);
    signUpProvider.notifyListeners();
    setState(() {});
  }

  Future<void> pickCnicBackImage() async {
    debugPrint('Picking Cnic Image');
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (image == null) {
      return;
    }
    signUpProvider.cnicBack = File(image.path);
    signUpProvider.notifyListeners();
    setState(() {});
  }

///////////Date Picker
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1947, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        signUpProvider.birthdayController.text =
            '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
        log(selectedDate.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    signUpProvider =  Provider.of<SignUpProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  appBarImage,
                  width: 30.sw,
                  height: 361.h,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 33.w),
                child: Column(
                  children: [
                    quickSandMediumText(
                      text: 'Register!',
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w600,
                      color: AdaptiveTheme.of(context).mode.isLight
                          ? blackColor
                          : whiteColor,
                    ),
                    quickSandMediumText(
                      text: 'Just a few steps and it will be done',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: lightGrayColor,
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      children: [
                        Container(
                          width: 30.w,
                          height: 30.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: greenColor,
                          ),
                          child: Center(
                            child: quickSandTitleText(
                              text: '1',
                              fontSize: 20.sp,
                              color: whiteColor,
                            ),
                          ),
                        ),
                        Container(
                          width: 135.w,
                          height: 1.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2.sp,
                              color: lightGreenColor,
                            ),
                            color: lightGreenColor,
                          ),
                        ),
                        Container(
                          width: 30.w,
                          height: 30.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: lightGreenColor,
                          ),
                          child: Center(
                            child: quickSandTitleText(
                              text: '2',
                              fontSize: 20.sp,
                              color: whiteColor,
                            ),
                          ),
                        ),
                        Container(
                          width: 135.w,
                          height: 1.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2.sp,
                              color: lightGreenColor,
                            ),
                            color: lightGreenColor,
                          ),
                        ),
                        Container(
                          width: 30.w,
                          height: 30.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: lightGreenColor,
                          ),
                          child: Center(
                            child: quickSandTitleText(
                              text: '3',
                              fontSize: 20.sp,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 36.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextField(
                          width: 167.w,
                          keyboardType: TextInputType.name,
                          controller: signUpProvider.firstNameController,
                          label: 'First Name',
                          isRequired: true,
                          isObscure: false,
                        ),
                        CustomTextField(
                          width: 167.w,
                          keyboardType: TextInputType.name,
                          controller: signUpProvider.lastNameController,
                          label: 'Last Name',
                          isRequired: true,
                          isObscure: false,
                        ),
                      ],
                    ),
                    SizedBox(height: 23.h),
                    CustomTextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: signUpProvider.emailController,
                      label: 'Email',
                      isRequired: true,
                      isObscure: false,
                      suffixIcon: const Icon(Icons.email),
                    ),
                    SizedBox(height: 23.h),
                    CustomTextField(
                      keyboardType: TextInputType.name,
                      controller: signUpProvider.passwordController,
                      label: 'Password',
                      isRequired: true,
                      isObscure: true,
                      maxlines: 1,
                      // suffixIcon: const Icon(Icons.email),
                    ),
                    SizedBox(height: 23.h),
                    CustomTextField(
                      keyboardType: TextInputType.number,
                      controller: signUpProvider.mobileNoController,
                      label: 'Mobile No',
                      isRequired: true,
                      isObscure: false,
                    ),
                    SizedBox(height: 23.h),
                    CustomTextField(
                      keyboardType: TextInputType.number,
                      controller: signUpProvider.cnicController,
                      label: 'CNIC',
                      isRequired: true,
                      isObscure: false,
                    ),
                    SizedBox(height: 23.h),
                    CustomTextField(
                      keyboardType: TextInputType.name,
                      controller: signUpProvider.cityController,
                      label: 'City',
                      isRequired: false,
                      isObscure: false,
                      prefixIcon: const Icon(Icons.location_pin),
                    ),
                    SizedBox(height: 23.h),
                    CustomTextField(
                      keyboardType: TextInputType.none,
                      controller: signUpProvider.birthdayController,
                      onTap: () {
                        _selectDate(context);
                      },
                      label: 'Birthday',
                      isRequired: false,
                      isObscure: false,
                      hintext: 'DD/MM/YYYY',
                      suffixIcon: const Icon(Icons.calendar_month),
                    ),
                    SizedBox(height: 23.h),
                    quickSandMediumText(
                      text: 'CNIC Front and Back',
                      fontSize: 20.sp,
                      color: AdaptiveTheme.of(context).mode.isLight
                          ? blackColor
                          : whiteColor,
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: pickCnicFrontImage,
                          child: Container(
                            width: 175.w,
                            height: 89.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.sp),
                              border: Border.all(color: greenColor),
                            ),
                            child: signUpProvider.cnicFront != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(15.sp),
                                    child: Image.file(
                                      signUpProvider.cnicFront!,
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                : Center(
                                    child: quickSandMediumText(
                                        text: 'Front',
                                        color: greenColor,
                                        fontSize: 17.sp),
                                  ),
                          ),
                        ),
                        GestureDetector(
                          onTap: pickCnicBackImage,
                          child: Container(
                            width: 175.w,
                            height: 89.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.sp),
                              border: Border.all(color: greenColor),
                            ),
                            child: signUpProvider.cnicBack != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(15.sp),
                                    child: Image.file(
                                      signUpProvider.cnicBack!,
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                : Center(
                                    child: quickSandMediumText(
                                        text: 'Back',
                                        color: greenColor,
                                        fontSize: 17.sp),
                                  ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 35.h),
                    GestureDetector(
                        onTap: () {
                          Get.to(const RegisterPt2Screen());
                        },
                        child: const CustomGreenButton(label: 'Continue')),
                    SizedBox(height: 35.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
