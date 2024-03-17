import 'package:citizen_sphere2/view/Pay%20Water%20Bill/pay_water_bill_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_green_button.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_textfield.dart';
import 'package:citizen_sphere2/utils/theme_extensions.dart';

class WaterInvoiceNumberScreen extends StatefulWidget {
  const WaterInvoiceNumberScreen({super.key});

  @override
  State<WaterInvoiceNumberScreen> createState() =>
      _WaterInvoiceNumberScreenState();
}

class _WaterInvoiceNumberScreenState extends State<WaterInvoiceNumberScreen> {
  final formKey = GlobalKey<FormState>();
  final invoiceNoController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed
    invoiceNoController.dispose();
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
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: whiteColor,
                    ),
                  ),
                  quickSandNormalText(
                    text: 'Pay Water Bill',
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
                    Container(
                      width: 1.sw,
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.sp),
                        border: Border.all(color: greenColor),
                      ),
                      child: Center(
                        child: quickSandNormalText(
                          text:
                              'Please ensure 6-digit pre-fix “100079” is added before consumer Number',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Form(
                      key: formKey,
                      child: CustomTextField(
                        keyboardType: TextInputType.number,
                        controller: invoiceNoController,
                        label: 'Bill Invoice No.',
                        isRequired: false,
                        isObscure: false,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length < 20 ||
                              value.trim().length > 20) {
                            return 'Enter a valid Reference Number';
                          }
                          if (!value.trim().contains('100079')) {
                            return 'Kindly Add Prefix';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 60.h),
                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          Get.to(const PayWaterBillScreen());
                        }
                      },
                      child: const CustomGreenButton(label: 'Next'),
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
