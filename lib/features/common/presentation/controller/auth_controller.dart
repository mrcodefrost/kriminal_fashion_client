import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';

import '../../data/model/client_user_model.dart';

class AuthController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;

  TextEditingController registerNameController = TextEditingController();
  TextEditingController registerNumberController = TextEditingController();

  // OTP related
  OtpFieldControllerV2 otpController = OtpFieldControllerV2();
  bool otpFieldShown = false;
  int? otpSent;
  int? otpEntered;

  @override
  void onInit() {
    super.onInit();
    userCollection = firestore.collection('users');
  }

  void addUser() {
    try {
      if (otpSent == otpEntered) {
        DocumentReference doc = userCollection.doc();

        ClientUser clientUser = ClientUser(
          id: doc.id,
          name: registerNameController.text,
          number: int.parse(registerNumberController.text),
        );

        final clientUserJson = clientUser.toJson();
        doc.set(clientUserJson);
        Get.snackbar('Success', 'User added successfully',
            colorText: Colors.green);
        registerNumberController.clear();
        registerNameController.clear();
        otpController.clear();
      } else {
        Get.snackbar('Error', 'OTP is incorrect');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      debugPrint(e.toString());
    }
  }

  void sendOTP() {
    try {
      if (registerNameController.text.isEmpty ||
          registerNumberController.text.isEmpty) {
        Get.snackbar('Error', 'Please fill in all the fields',
            colorText: Colors.red);
        // to terminate the code
        return;
      }

      final random = Random();
      int otp = 1000 + random.nextInt(9380);
      print(otp);
      // if otp was sent successfully or not
      if (otp != null) {
        otpFieldShown = true;
        otpSent = otp;
        Get.snackbar('Success', 'OTP sent successfully',
            colorText: Colors.green);
      } else {
        Get.snackbar('Error', 'OTP not sent, please try again !',
            colorText: Colors.red);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      update();
    }
  }
}
