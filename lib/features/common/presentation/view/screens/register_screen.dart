import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_client/features/common/presentation/controller/auth_controller.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/screens/login_screen.dart';
import 'package:kriminal_fashion_client/utils/validations.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key, required this.onTap});

  final VoidCallback onTap;

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
              const Text('Create a new account'),
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
                  Validations.trimSpaces(),
                  Validations.onlyNumbers(),
                  Validations.emptyValidator(),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: authController.registerEmailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.phone_android),
                  labelText: 'Email Address',
                  hintText: 'Email Address',
                ),
                inputFormatters: [
                  Validations.trimSpaces(),
                  Validations.emptyValidator(),
                ],
              ),
              const SizedBox(height: 20),
              // OtpTextField(
              //   otpController: authController.otpController,
              //   visible: authController.otpFieldShown.value,
              //   // visible: true,
              //   onComplete: (code) async {
              //     // this returns true or false depending on verification
              //     authController.otpVerified = await authController
              //         .verifyOtp(code ?? '0000'); // this verifies otp
              //
              //     if (authController.otpVerified) {
              //       authController.addUser();
              //       Get.to(HomeScreen());
              //     } else {
              //       Get.snackbar('Error', 'Incorrect OTP');
              //     }
              //   },
              // ),
              // const SizedBox(height: 20),
              // ElevatedButton(
              //     onPressed: () {
              //       if (authController.otpFieldShown.value) {
              //         // authController.addUser();
              //       } else {
              //         authController.otpAuthentication(); // this sends the otp
              //         authController.otpFieldShown = true.obs;
              //       }
              //     },
              //     style: ElevatedButton.styleFrom(
              //       foregroundColor: context.theme.colorScheme.inversePrimary,
              //       backgroundColor: context.theme.colorScheme.primary,
              //     ),
              //     child: Text(authController.otpFieldShown.value
              //         ? 'Register'
              //         : 'Send OTP')),
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
                  onPressed: () {
                    Get.to(LoginScreen(onTap: onTap));
                  },
                  child: const Text('Already have an account ? Login')),
            ],
          ),
        ),
      );
    });
  }
}
