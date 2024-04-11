import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field_v2/otp_field_style_v2.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';

class OtpTextField extends StatelessWidget {
  final OtpFieldControllerV2 otpController;
  final bool visible;
  final Function(String?) onComplete;

  const OtpTextField(
      {super.key,
      required this.otpController,
      required this.visible,
      required this.onComplete});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: OTPTextFieldV2(
        controller: otpController,
        length: 6,
        width: MediaQuery.of(context).size.width,
        textFieldAlignment: MainAxisAlignment.spaceAround,
        fieldWidth: 45,
        fieldStyle: FieldStyle.box,
        otpFieldStyle: OtpFieldStyle(
          borderColor: context.theme.colorScheme.secondary,
        ),
        outlineBorderRadius: 15,
        style: const TextStyle(fontSize: 17),
        onCompleted: (pin) {
          onComplete(pin);
        },
      ),
    );
  }
}
