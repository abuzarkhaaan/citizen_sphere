import 'dart:async';
import 'dart:io';

import 'package:citizen_sphere2/main.dart';
import 'package:citizen_sphere2/view%20model/BillModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FirebaseProvider extends ChangeNotifier {



  String firstName = "";
  String lastName = "";
  String email = "";
  String password = "";

  String mobileNo = "";
  String cnic = "";
  String city = "";
  String birthday = "";

  String bloodGroup = "";
  String weight = "";
  String height = "";
  String age = "";
  String disease = "";
  String? cnicFrontUrl;
  String? cnicBackUrl;

  Image? cnicImageFront;
  Image? cnicImageBack;

  List<BillModelClass> listOfBills = [];
  StreamSubscription? subscription;

   getUserInfoNode() {

     DatabaseReference userRef = FirebaseDatabase.instance.ref()
         .child('users')
         .child(FirebaseAuth.instance.currentUser!.uid);

     subscription = null;
     subscription = userRef.onValue.listen((event) {
      var snapshot = event.snapshot;
      if (snapshot.value != null) {
        Map<dynamic, dynamic> dataList = snapshot.value as Map<dynamic, dynamic>;
        try{
          firstName = dataList["first_name"];
          lastName = dataList["last_name"];
          email = dataList["email"];

          mobileNo = dataList["mobile"];
          cnic = dataList["cnic"];
          city = dataList["city"];
          birthday = dataList["birthday"];

          bloodGroup = dataList["blood_group"];
          weight = dataList["weight"];
          height = dataList["height"];
          age = dataList["age"];
          disease = dataList["disease"];
          cnicFrontUrl = dataList["cnic_front_url"];
          cnicBackUrl = dataList["cnic_back_url"];

          if(cnicFrontUrl!=null){
            cnicImageFront = Image.network(cnicFrontUrl!);
          }

          if(cnicBackUrl!=null){
            cnicImageBack = Image.network(cnicBackUrl!);
          }

          Map<dynamic, dynamic> allBillsData = dataList["bills"] as Map<dynamic, dynamic>;
          listOfBills.clear();
          allBillsData.forEach((billCategoryName,data){
            Map<dynamic, dynamic> allBillsData = data as Map<dynamic, dynamic>;
            allBillsData.forEach((refNumber,metaData){
              BillModelClass billModelObj = BillModelClass.fromJson(metaData);
              billModelObj.refNumber = refNumber;
              billModelObj.category = billCategoryName;
              listOfBills.add(billModelObj);
              notifyListeners();
            });
          });

          notifyListeners();
        }catch(e){
          notifyListeners();
          print("Error in getUserInfoNode() = $e");
        }


      }else{
        print("user data not found");
      }
    });

  }

}
