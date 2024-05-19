import 'dart:developer';
import 'dart:io';

import 'package:citizen_sphere2/auth.dart';
import 'package:citizen_sphere2/main.dart';
import 'package:citizen_sphere2/utils/theme_extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/Forgot Password OTP Verification.dart/forgot_password_otp_verification_screen.dart';
import '../view/Set New Password Screen/set_new_password_screen.dart';

class SignUpProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void changeLoadingState() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final mobileNoController = TextEditingController();
  final cnicController = TextEditingController();
  final cityController = TextEditingController();
  final birthdayController = TextEditingController();

  final bloodGroupController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final ageController = TextEditingController();
  final diseaseController = TextEditingController();

  File? cnicFront;
  File? cnicBack;

  resetFields() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    passwordController.clear();

    mobileNoController.clear();
    cnicController.clear();
    cityController.clear();
    birthdayController.clear();

    bloodGroupController.clear();
    weightController.clear();
    heightController.clear();
    ageController.clear();
    diseaseController.clear();

    cnicFront = null;
    cnicBack = null;
  }

  Future<bool> signUp(BuildContext context) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      return true;
    } catch (e) {
      print("ERROR in sign up = $e");
      if (e.toString().contains("The email address is badly formatted")) {
        MyApp.showToastMessage(context, "Please enter a valid email address");
      } else if (e
          .toString()
          .contains("The email address is already in use by another account")) {
        MyApp.showToastMessage(
            context, "The email address is already in use by another account");
      } else {
        MyApp.showToastMessage(context, "$e");
      }
      return false;
    }
  }

  Future<String?> _uploadFile(File? fileToUpload) async {
    if (fileToUpload == null) return null;

    try {
      // Reference to the Firebase Storage bucket
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('uploads/${fileToUpload!.path.split('/').last}');

      // Upload file to Firebase Storage
      UploadTask uploadTask = storageReference.putFile(fileToUpload!);

      // Get download URL
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String downloadUrl = await storageReference.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      print('Error uploading file: $e');
      return null;
    }
  }

  Future<bool> createUserInfoNode(BuildContext context) async {
    String? frontCnicUrl;
    String? backCnicUrl;

    if (cnicFront != null) {
      MyApp.showToastMessage(context, "Uploading Front Cnic please wait...");
      frontCnicUrl = await _uploadFile(cnicFront);
    }
    if (cnicBack != null) {
      MyApp.showToastMessage(context, "Uploading Back Cnic please wait...");
      backCnicUrl = await _uploadFile(cnicBack);
    }

    DatabaseReference userRef = databaseReference
        .child('users')
        .child(FirebaseAuth.instance.currentUser!.uid);
    var noError = true;

    await userRef.update({
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'email': emailController.text,
      'mobile': mobileNoController.text,
      'cnic': cnicController.text,
      'city': cityController.text,
      'birthday': birthdayController.text,
      'blood_group': bloodGroupController.text,
      'weight': weightController.text,
      'height': heightController.text,
      'age': ageController.text,
      'disease': diseaseController.text,
      'cnic_front_url': frontCnicUrl,
      'cnic_back_url': backCnicUrl,
      "bills": {
        "electricity": {
          "07261120036078": {
            "amount": "25000",
            "company": "Pesco",
            "consumer_name": "Abdullah",
            "due_date": "10-01-2024",
            "month": "Jan 2024",
            "status": "Not Paid"
          },
          "08621136008766": {
            "amount": "32000",
            "company": "Pesco",
            "consumer_name": "Abuzar",
            "due_date": "10-03-2024",
            "month": "March 2024",
            "status": "Not Paid"
          },
          "11368446200443": {
            "amount": "15000",
            "company": "Pesco",
            "consumer_name": "Mustafa",
            "due_date": "10-02-2024",
            "month": "Feb 2024",
            "status": "Not Paid"
          }
        },
      },
    }).catchError((error) {
      MyApp.showToastMessage(context, "Error : $error");
      print('Failed to add node: $error');
      noError = false;
    });

    return noError;
  }

  String _verificationId = '';
  String otp = '';

  // void disposeControllers() {
  //   phoneNumberContoller.dispose();
  // }

  ///Function for Otp verification

  Future<void> verifyPhoneNumber(
      String phoneNumber, bool resend, BuildContext context) async {
    changeLoadingState();
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        changeLoadingState();

        Utils.flushbarMessage('Verification Successful $phoneNumber', context);
      },
      verificationFailed: (FirebaseAuthException e) {
        changeLoadingState();
        log('this is error ===========> ${e.toString()}');

        Utils.flushbarMessage('Verification failed: ${e.message}', context);
      },
      codeSent: (String verificationId, int? resendToken) {
        changeLoadingState();

        _verificationId = verificationId;
        Utils.successflushbarMessage('Otp successfully sent', context);
        Get.to(
          () => ForgotPasswordOTPVerificationScreen(
            phoneNumber: phoneNumber,
          ),
        );

        Utils.successflushbarMessage('Verification code sent', context);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // if (resend != true) setState(ViewState.idle);
        _verificationId = verificationId;
      },
      timeout: const Duration(seconds: 60),
    );
  }

  ///Function for recieving sms code

  Future<void> submitSmsCode(String smsCode, BuildContext context) async {
    changeLoadingState();
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsCode,
      );

      changeLoadingState();
      Get.offAll(() => const SetNewPasswordScreen());
      // if (userSignedIn) {
      //   Get.offAll(() => CustomBottomNavigationBar(pageIndex: 0));
      // } else {
      //   Get.offAll(() => const ShopLocationScreen());
      // }
    } catch (e) {
      // setState(ViewState.idle);

      Utils.flushbarMessage('Error verifying SMS code: $e', context);
    }
  }

  ///////////////////////////////////////////////////////////////////////
  Future<String> forgetPassword(String email, BuildContext context) async {
    try {
      await _auth.sendPasswordResetEmail(
        email: email,
      );
      Utils.successflushbarMessage(
          'A reset password link has been sent to $email', context);
      return "Sucess";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> sendForgetPasswordLink(
      String email, BuildContext context) async {
    changeLoadingState();

    String status = await forgetPassword(
      email,
      context,
    );
    changeLoadingState();
    if (status == "Sucess") {
      return status;
    }
    return status;
  }

  void changePassword(String password, BuildContext context) async {
    //Create an instance of the current user.
    var user = Auth().currentUser;
    changeLoadingState();

    //Pass in the password to updatePassword.
    user!.updatePassword(password).then((_) {
      changeLoadingState();

      Utils.successflushbarMessage('Password Updated Successfully', context);
      print("Successfully changed password");
    }).catchError((error) {
      changeLoadingState();

      Utils.flushbarMessage('Could not update password $error', context);
      print("Password can't be changed" + error.toString());
      //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
    });
  }
}
