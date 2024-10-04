import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_client/features/auth/presentation/view/screens/login_screen.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/widgets/custom_text_field.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/widgets/secondary_button.dart';
import 'package:kriminal_fashion_client/utils/validations.dart';

import '../../controller/auth_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _registerFormKey = GlobalKey<FormState>();

  final authController = Get.find<AuthController>();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    letterSpacing: 12),
              ),
              const Spacer(),
              Text(
                'Join the mafia today',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),
              // User Name
              CustomTextField(
                controller: authController.registerNameController,
                prefixIcon: const Icon(Icons.face),
                labelText: 'Name',
                hintText: 'Name',
                inputFormatters: [InputFormatter.emptyValidator()],
                validator: Validations.isEmptyValidator,
              ),
              const SizedBox(height: 20),
              // User Mobile Number
              CustomTextField(
                controller: authController.registerNumberController,
                keyboardType: TextInputType.phone,
                prefixIcon: const Icon(Icons.phone_android),
                labelText: 'Mobile Number',
                hintText: 'Mobile Number',
                inputFormatters: [
                  InputFormatter.trimSpaces(),
                  InputFormatter.onlyNumbers(),
                  InputFormatter.emptyValidator(),
                  LengthLimitingTextInputFormatter(10),
                ],
                validator: Validations.mobileNumberValidator,
              ),
              const SizedBox(height: 20),
              // User Email
              CustomTextField(
                controller: authController.registerEmailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email),
                labelText: 'Email Address',
                hintText: 'Email Address',
                inputFormatters: [
                  InputFormatter.trimSpaces(),
                  InputFormatter.emptyValidator(),
                ],
                validator: Validations.isTouchedEmailValidator,
              ),
              const SizedBox(height: 20),
              // User Password
              CustomTextField(
                controller: authController.registerPasswordController,
                obscureText: obscureText,
                prefixIcon: const Icon(Icons.password),
                labelText: 'Password',
                hintText: 'Password',
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: obscureText
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility)),
                inputFormatters: [
                  InputFormatter.trimSpaces(),
                  InputFormatter.emptyValidator(),
                ],
                validator: Validations.isEmptyValidator,
              ),

              const SizedBox(height: 20),
              SecondaryButton(
                  text: 'REGISTER',
                  onPressed: () {
                    if (_registerFormKey.currentState!.validate()) {
                      authController.registerUser();
                    }
                  }),
              TextButton(
                  onPressed: () {
                    Get.offAll(() => LoginScreen(onTap: widget.onTap));
                  },
                  child: Text(
                    'Already have an account ? Login',
                    style: Theme.of(context).textTheme.titleSmall,
                  )),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
