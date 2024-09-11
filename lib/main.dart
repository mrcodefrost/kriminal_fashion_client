import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kriminal_fashion_client/features/auth/presentation/controller/auth_controller.dart';
import 'package:kriminal_fashion_client/features/common/presentation/controller/product_controller.dart';
import 'package:kriminal_fashion_client/firebase_options.dart';
import 'package:kriminal_fashion_client/themes/dark_mode.dart';
import 'package:kriminal_fashion_client/themes/light_mode.dart';
import 'package:kriminal_fashion_client/themes/theme_controller.dart';
import 'package:kriminal_fashion_client/utils/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/domain/usecase/auth_gate.dart';

void main() async {
  await _setup();
  runApp(const MyApp());
}

Future<void> _setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  // always place Firebase.initializeApp first after ensureInitialized
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  Get.put(prefs);
  Get.put(AuthController());
  Get.put(ProductController());
  Stripe.publishableKey = AppSecrets.stripePublishableKey;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'K R I M I N A L',
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: ThemeController.prefThemeMode(),
      home: const AuthGate(),
    );
  }
}
