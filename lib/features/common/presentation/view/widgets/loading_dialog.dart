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
        padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 30),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2),

        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'LOADING',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 50),
            CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
              strokeWidth: 2,
            ),
          ],
        ),
      ),
    );
  }
}
