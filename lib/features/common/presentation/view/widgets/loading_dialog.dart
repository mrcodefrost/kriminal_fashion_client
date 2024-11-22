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
    // TODO : layout not correct, need to fix
    return Container(
      height: 100,
      width: 200,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('LOADING'),
          SizedBox(height: 20),
          CircularProgressIndicator(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
