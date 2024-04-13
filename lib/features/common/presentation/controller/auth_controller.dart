import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/screens/home_screen.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/client_user_model.dart';
import '../../domain/usecase/auth_gate.dart';

class AuthController extends GetxController {
  // instances
  final firestore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;
  late CollectionReference userCollection;
  final prefs = Get.find<SharedPreferences>();
  final box = GetStorage();

  // text controllers
  TextEditingController registerNameController = TextEditingController();
  TextEditingController registerNumberController = TextEditingController();
  TextEditingController loginNumberController = TextEditingController();

  // OTP related
  OtpFieldControllerV2 otpController = OtpFieldControllerV2();
  RxBool otpFieldShown = false.obs;
  var verificationId = ''.obs;
  bool otpVerified = false;

  // Get storage user

  ClientUser? loginUser;

  @override
  void onReady() {
    // TODO: implement onReady

    Map<String, dynamic>? user = box.read('loginUser');
    if (user != null) {
      loginUser = ClientUser.fromJson(user);
      Get.to(HomeScreen());
    }
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
    userCollection = firestore.collection('users');
  }

  void clearAllControllers() {
    registerNumberController.clear();
    registerNameController.clear();
    otpController.clear();
  }

  void addUser() {
    try {
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
      clearAllControllers();
    } catch (e) {
      Get.snackbar('Error', 'Unable to create user', colorText: Colors.red);
      debugPrint(e.toString());
    }
  }

  // This sends the OTP
  Future<void> otpAuthentication() async {
    try {
      if (registerNameController.text.isEmpty ||
          registerNumberController.text.isEmpty) {
        Get.snackbar('Error', 'Please fill in all the fields',
            colorText: Colors.red);
        // to terminate the code
        return;
      }

      await firebaseAuth.verifyPhoneNumber(
          phoneNumber: '+91${registerNumberController.text}',
          verificationCompleted: (credential) async {
            await firebaseAuth.signInWithCredential(credential);
          },
          verificationFailed: (e) {
            if (e.code == 'invalid-phone-number') {
              Get.snackbar('Error', 'The provided phone number is not valid');
            } else {
              Get.snackbar('Error', 'Something went wrong, please try again');
            }
          },
          codeSent: (verificationId, resendToken) {
            this.verificationId.value = verificationId;
            otpFieldShown = true.obs; // didn't work ?
            Get.snackbar('OTP Sent', 'OTP has been sent to your number');
          },
          codeAutoRetrievalTimeout: (verificationId) {
            this.verificationId.value = verificationId;
          });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar('Error', 'OTP was not sent, try again later');
    } finally {
      update();
    }
  }

  // if verified ? navigate to new screen : go back

  // tries signing in the user and returns true or false if credentials match
  Future<bool> verifyOtp(String otp) async {
    var credentials = await firebaseAuth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));

    return credentials.user != null ? true : false;
  }

  // logins without password - needs to be implemented
  Future<void> loginWithPhone() async {
    try {
      String phoneNumber = loginNumberController.text;
      if (phoneNumber.isNotEmpty) {
        var querySnapshot = await userCollection
            .where('number', isEqualTo: int.parse(phoneNumber))
            .limit(1)
            .get();
        if (querySnapshot.docs.isNotEmpty) {
          var userDoc = querySnapshot.docs.first;
          var userData = userDoc.data() as Map<String, dynamic>;
          box.write('loginUser', userData);
          // prefs.setString('loginUser', jsonEncode(userData));
          loginNumberController.clear();
          Get.off(HomeScreen());
          Get.snackbar('Success', 'Login Successful', colorText: Colors.green);
        } else {
          Get.snackbar('Error', 'User not found, please register',
              colorText: Colors.red);
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      update();
    }
  }

  void signOut() async {
    try {
      await firebaseAuth.signOut();
      // Get.off(const LoginScreen());
      // Get.offAll(const LoginScreen(onTap: onTap));
      Get.offAll(AuthGate());
      update();
    } catch (e) {
      debugPrint('Error signing out: $e');
    }
  }

  // Future<void> autoVerifyOtp() async {
  //   bool isVerified = await verifyOtp(otpController);
  //   if (isVerified) {
  //     // Navigate to the next screen upon successful OTP verification
  //     // Example: Get.offNamed('/next_screen');
  //   } else {
  //     Get.snackbar('Error', 'Invalid OTP');
  //   }
  // }
}
