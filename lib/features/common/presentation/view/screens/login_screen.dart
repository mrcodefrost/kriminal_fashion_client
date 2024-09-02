import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_client/features/common/presentation/controller/auth_controller.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/screens/home_screen.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/screens/register_screen.dart';

import '../../../../../utils/validations.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key, required this.onTap});

  final VoidCallback onTap;

  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return Scaffold(
        backgroundColor: context.theme.colorScheme.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: context.theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: authController.loginEmailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.phone_android),
                    labelText: 'Email Address',
                    hintText: 'Enter your email address',
                  ),
                  inputFormatters: [
                    InputFormatter.trimSpaces(),
                    InputFormatter.emptyValidator(),
                  ],
                  validator: Validations.isTouchedEmailValidator,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: authController.loginPasswordController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.password),
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                  inputFormatters: [
                    InputFormatter.trimSpaces(),
                    InputFormatter.emptyValidator(),
                  ],
                  validator: Validations.isEmptyValidator,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      // authController.loginWithPhone(); // logins without password
                      if (_loginFormKey.currentState!.validate()) {
                        authController.loginWithEmail();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: context.theme.colorScheme.inversePrimary,
                        backgroundColor: context.theme.colorScheme.primary),
                    child: const Text('Login')),
                TextButton(
                    onPressed: () {
                      Get.to(RegisterScreen(
                        onTap: onTap,
                      ));
                    },
                    child: const Text('Register new account')),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      Get.offAll(HomeScreen());
                    },
                    child: Text('Quick Sign In'))
              ],
            ),
          ),
        ),
      );
    });
  }
}
