import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/widgets/loading_dialog.dart';
import 'package:kriminal_fashion_client/utils/preference_manager.dart';
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

  // ====== VARIABLES ====== //

  String? userUID;

  // Get storage user
  ClientUser? loginUser;

  @override
  void onReady() {
    // see the shared preferences approach
    Map<String, dynamic>? user = box.read('loginUser');
    if (user != null) {
      loginUser = ClientUser.fromJson(user);
      Get.off(() => const AuthGate());
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
  }

  void clearLoginControllers() {
    loginEmailController.clear();
    loginPasswordController.clear();
  }

  void registerUser() async {
    LoadingDialog.showProgressIndicatorAlertDialog();
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: registerEmailController.text, password: registerPasswordController.text);
      await addUser();
      await saveUserDataInPrefs(uuid: userUID!);
      LoadingDialog.removeProgressIndicatorAlertDialog();
      Get.offAll(() => const AuthGate());
    } catch (e) {
      logg.e(e);
    }
  }

  Future<void> addUser() async {
    try {
      User? currentUser = firebaseAuth.currentUser;

      if (currentUser == null) {
        Get.snackbar('Error', 'No authenticated user found', colorText: Colors.red);
        logg.e('No authenticated user found');
      }

      userUID = currentUser!.uid;

      // New client user with userUID
      ClientUser clientUser = ClientUser(
        id: userUID,
        name: registerNameController.text,
        number: int.parse(registerNumberController.text),
        email: registerEmailController.text,
      );

      // Save user data in firestore with userUID as document ID for consistency
      DocumentReference doc = userCollection.doc(userUID); // Firestore doc ID = UID

      final clientUserJson = clientUser.toJson();
      await doc.set(clientUserJson);

      Get.snackbar('Success', 'User added successfully', colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', 'Unable to create user', colorText: Colors.red);
      debugPrint(e.toString());
    } finally {
      clearRegisterControllers();
    }
  }

  Future<void> loginWithEmail() async {
    LoadingDialog.showProgressIndicatorAlertDialog();
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: loginEmailController.text, password: loginPasswordController.text);
      userUID = firebaseAuth.currentUser!.uid;
      await saveUserDataInPrefs(uuid: userUID!);
      LoadingDialog.removeProgressIndicatorAlertDialog();
      Get.offAll(() => const AuthGate());
      clearLoginControllers();
      logg.i(PreferenceManager.getData(PreferenceManager.userId));
    } catch (e) {
      logg.e(e);
    }
  }

  void signOut() async {
    LoadingDialog.showProgressIndicatorAlertDialog();
    try {
      await firebaseAuth.signOut();
      Get.offAll(() => const AuthGate());
      update();
      await PreferenceManager.deleteData();
      LoadingDialog.removeProgressIndicatorAlertDialog();
    } catch (e) {
      logg.e('Error sign out: $e');
    }
  }

  Future<void> saveUserDataInPrefs({required String uuid}) async {
    await PreferenceManager.setData(PreferenceManager.userId, uuid);
  }
}

//    Get.offAll(AuthGate()):
//         This directly creates an instance of AuthGate and navigates to it.
//         It's similar to instantiating AuthGate directly and then navigating to it.
//
//     Get.offAll(() => const AuthGate()):
//         This uses a callback to lazily create an instance of AuthGate when needed.
//         It's useful if AuthGate is a stateful widget and you want to create a new instance each time it's navigated to.
