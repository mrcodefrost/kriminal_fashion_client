import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_client/features/common/presentation/controller/auth_controller.dart';
import 'package:kriminal_fashion_client/utils/validations.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return Scaffold(
        backgroundColor: context.theme.colorScheme.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Create a new account'),
              const SizedBox(height: 20),
              TextField(
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
                  Validations.emptyValidator(),
                ],
              ),
              const SizedBox(height: 20),
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
                  Validations.trimSpaces(),
                  Validations.onlyNumbers(),
                  Validations.emptyValidator(),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    authController.addUser();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: context.theme.colorScheme.inversePrimary,
                    backgroundColor: context.theme.colorScheme.primary,
                  ),
                  child: const Text('Register')),
              TextButton(
                  onPressed: () {},
                  child: const Text('Already have an account ? Login')),
            ],
          ),
        ),
      );
    });
  }
}
