import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingDialog extends StatelessWidget {
  static showProgressIndicatorAlertDialog() {
    Get.dialog(const LoadingDialog(), barrierDismissible: false);
  }

  static removeProgressIndicatorAlertDialog() {
    Get.back();
  }

  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: Colors.black,
    ));
  }
}
