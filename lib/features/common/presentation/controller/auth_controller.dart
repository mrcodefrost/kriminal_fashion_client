import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/screens/home_screen.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/globals.dart';
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
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

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
    // see the shared preferences approach
    Map<String, dynamic>? user = box.read('loginUser');
    if (user != null) {
      loginUser = ClientUser.fromJson(user);
      Get.off(const AuthGate());
    }
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
    userCollection = firestore.collection('users');
  }

  void clearRegisterControllers() {
    registerNumberController.clear();
    registerNameController.clear();
    registerEmailController.clear();
    otpController.clear();
  }

  void clearLoginControllers() {
    loginEmailController.clear();
    loginPasswordController.clear();
  }

  void registerUser() async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: registerEmailController.text, password: registerPasswordController.text);
      addUser();
      Get.offAll(const AuthGate());
    } catch (e) {
      logg.e(e);
    }
  }

  void addUser() {
    try {
      DocumentReference doc = userCollection.doc();
      ClientUser clientUser = ClientUser(
        id: doc.id,
        name: registerNameController.text,
        number: int.parse(registerNumberController.text),
        email: registerEmailController.text,
      );
      final clientUserJson = clientUser.toJson();
      doc.set(clientUserJson);
      Get.snackbar('Success', 'User added successfully', colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', 'Unable to create user', colorText: Colors.red);
      debugPrint(e.toString());
    } finally {
      clearRegisterControllers();
    }
  }

  Future<void> loginWithEmail() async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: loginEmailController.text, password: loginPasswordController.text);
      Get.offAll(const AuthGate());
      clearLoginControllers();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void signOut() async {
    try {
      await firebaseAuth.signOut();
      Get.offAll(const AuthGate());
      update();
    } catch (e) {
      debugPrint('Error signing out: $e');
    }
  }

  //    Get.offAll(AuthGate()):
//         This directly creates an instance of AuthGate and navigates to it.
//         It's similar to instantiating AuthGate directly and then navigating to it.
//
//     Get.offAll(() => const AuthGate()):
//         This uses a callback to lazily create an instance of AuthGate when needed.
//         It's useful if AuthGate is a stateful widget and you want to create a new instance each time it's navigated to.
}
