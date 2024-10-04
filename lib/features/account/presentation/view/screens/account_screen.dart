import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../themes/theme_controller.dart';
import '../../../../auth/presentation/controller/auth_controller.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: Icon(
              Icons.lightbulb,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            title: const Text('Toggle theme'),
            onTap: () {
              ThemeController.toggleThemeMode();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            title: const Text('Sign out'),
            onTap: () {
              final box = GetStorage();
              box.erase();
              authController.signOut();
            },
          ),
        ],
      ),
    );
  }
}
