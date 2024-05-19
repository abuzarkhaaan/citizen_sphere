import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_green_button.dart';
import 'package:citizen_sphere2/core/helper%20widgets/custom_textfield.dart';
import 'package:citizen_sphere2/utils/theme_extensions.dart';
import 'package:citizen_sphere2/view%20model/firebase_provider.dart';
import 'package:citizen_sphere2/view/Pay%20Electricity%20Bill/pay_electricity_bill_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../view model/BillModel.dart';

class ElectricityInvoiceNumberScreen extends StatefulWidget {
  const ElectricityInvoiceNumberScreen({super.key});

  @override
  State<ElectricityInvoiceNumberScreen> createState() =>
      _ElectricityInvoiceNumberScreenState();
}

class _ElectricityInvoiceNumberScreenState
    extends State<ElectricityInvoiceNumberScreen> {
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
    FirebaseProvider firebaseProvider = Provider.of<FirebaseProvider>(context);
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
                    text: 'Pay Electricity Bill',
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
                              value.trim().length < 14 ||
                              value.trim().length > 14) {
                            return 'Enter a valid Reference Number';
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
                          BillModelClass? billObj = getBillObject(
                              invoiceNoController.text.trim(),
                              firebaseProvider);
                          if (billObj != null) {
                            Get.to(PayElectricityBillScreen(billObj));
                          } else {
                            MyApp.showToastMessage(context, "Bill not found");
                          }
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

  BillModelClass? getBillObject(
      String refNumber, FirebaseProvider firebaseProvider) {
    for (var obj in firebaseProvider.listOfBills) {
      print("refNumber = $refNumber and database = ${obj.refNumber}");
      if (obj.refNumber == refNumber) {
        return obj;
      }
    }
    return null;
  }
}
