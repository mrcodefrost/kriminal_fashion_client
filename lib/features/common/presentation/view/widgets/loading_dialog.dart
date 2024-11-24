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
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey, border: Border.all(color: Colors.purple)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'LOADING',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 40),
            CircularProgressIndicator(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
