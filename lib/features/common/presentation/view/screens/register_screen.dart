import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_client/features/common/presentation/controller/auth_controller.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/screens/login_screen.dart';
import 'package:kriminal_fashion_client/utils/validations.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key, required this.onTap});

  final VoidCallback onTap;

  final _registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return Scaffold(
        backgroundColor: context.theme.colorScheme.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _registerFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                const Text(
                  'KRIMINAL',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, letterSpacing: 12),
                ),
                const Spacer(),
                const Text('Create a new account'),
                const SizedBox(height: 20),
                TextFormField(
                  controller: authController.registerNameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.face),
                    labelText: 'Name',
                    hintText: 'Name',
                  ),
                  inputFormatters: [
                    InputFormatter.emptyValidator(),
                  ],
                  validator: Validations.isEmptyValidator,
                ),
                const SizedBox(height: 20),
                // User Mobile Number
                TextFormField(
                  controller: authController.registerNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.phone_android),
                    labelText: 'Mobile Number',
                    hintText: 'Mobile Number',
                  ),
                  inputFormatters: [
                    InputFormatter.trimSpaces(),
                    InputFormatter.onlyNumbers(),
                    InputFormatter.emptyValidator(),
                    LengthLimitingTextInputFormatter(10),
                  ],
                  validator: Validations.mobileNumberValidator,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: authController.registerEmailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.email),
                    labelText: 'Email Address',
                    hintText: 'Email Address',
                  ),
                  inputFormatters: [
                    InputFormatter.trimSpaces(),
                    InputFormatter.emptyValidator(),
                  ],
                  validator: Validations.isTouchedEmailValidator,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: authController.registerPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.password),
                    labelText: 'Password',
                    hintText: 'Password',
                  ),
                  inputFormatters: [
                    InputFormatter.trimSpaces(),
                    InputFormatter.emptyValidator(),
                  ],
                  validator: Validations.isEmptyValidator,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      if (_registerFormKey.currentState!.validate()) {
                        authController.registerUser();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: context.theme.colorScheme.inversePrimary,
                      backgroundColor: context.theme.colorScheme.primary,
                    ),
                    child: const Text('Register')),
                TextButton(
                    onPressed: () {
                      Get.to(LoginScreen(onTap: onTap));
                    },
                    child: const Text('Already have an account ? Login')),
                const Spacer(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
