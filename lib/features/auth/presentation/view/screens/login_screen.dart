import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_client/features/auth/presentation/controller/auth_controller.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/screens/home_screen.dart';
import 'package:kriminal_fashion_client/features/auth/presentation/view/screens/register_screen.dart';

import '../../../../../utils/validations.dart';
import '../../../../common/presentation/view/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key, required this.onTap});

  final VoidCallback onTap;

  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                const Text(
                  'KRIMINAL',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, letterSpacing: 12),
                ),
                const Spacer(),
                Text(
                  'Welcome back !',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                    color: context.theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // User login
                CustomTextField(
                  controller: authController.loginEmailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email),
                  labelText: 'Email Address',
                  hintText: 'Enter your email address',
                  inputFormatters: [
                    InputFormatter.trimSpaces(),
                    InputFormatter.emptyValidator(),
                  ],
                  validator: Validations.isTouchedEmailValidator,
                ),
                const SizedBox(
                  height: 20,
                ),
                // User password
                CustomTextField(
                  controller: authController.loginPasswordController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: const Icon(Icons.password),
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  inputFormatters: [
                    InputFormatter.trimSpaces(),
                    InputFormatter.emptyValidator(),
                  ],
                  validator: Validations.isEmptyValidator,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      // authController.loginWithPhone(); // logins without password
                      if (_loginFormKey.currentState!.validate()) {
                        authController.loginWithEmail();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: context.theme.colorScheme.tertiary,
                        backgroundColor: context.theme.colorScheme.primary),
                    child: const Text('Login')),
                TextButton(
                    onPressed: () {
                      Get.offAll(RegisterScreen(
                        onTap: onTap,
                      ));
                    },
                    child: const Text('Don\'t have an account? Register')),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      Get.offAll(HomeScreen());
                    },
                    child: const Text('Quick Sign In')),
                const Spacer(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
