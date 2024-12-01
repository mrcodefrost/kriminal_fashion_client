import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_client/features/auth/presentation/controller/auth_controller.dart';
import 'package:kriminal_fashion_client/features/auth/presentation/view/screens/register_screen.dart';
import 'package:kriminal_fashion_client/features/auth/presentation/view/widgets/copy_text_widget.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/widgets/secondary_button.dart';

import '../../../../../utils/validations.dart';
import '../../../../common/presentation/view/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();

  final authController = Get.find<AuthController>();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
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
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    letterSpacing: 12),
              ),
              const Spacer(),
              Text(
                'Welcome',
                style: Theme.of(context).textTheme.headlineSmall,
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
                obscureText: obscureText,
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: const Icon(Icons.password),
                labelText: 'Password',
                hintText: 'Enter your password',
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
                text: 'LOGIN',
                onPressed: () {
                  if (_loginFormKey.currentState!.validate()) {
                    authController.loginWithEmail();
                  }
                },
              ),
              TextButton(
                  onPressed: () {
                    Get.offAll(() => RegisterScreen(onTap: widget.onTap));
                  },
                  child: Text(
                    'Don\'t have an account? Register',
                    style: Theme.of(context).textTheme.titleSmall,
                  )),
              const SizedBox(height: 50),
              const Text(
                'Demo account credentials',
                style: TextStyle(decoration: TextDecoration.underline),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SelectionArea(
                          child: Text('ID: kriminal@test.com'),
                        ),
                        CopyTextButton(textToCopy: 'kriminal@test.com'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SelectionArea(
                          child: Text('Password: 123456789'),
                        ),
                        CopyTextButton(textToCopy: '123456789'),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
