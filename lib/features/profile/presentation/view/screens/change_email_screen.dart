import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/widgets/custom_text_field.dart';

import '../../controller/profile_controller.dart';

class ChangeEmailScreen extends StatelessWidget {
  final profileCtrl = Get.put(ProfileController());
  ChangeEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('CHANGE E-MAIL'),
          Text('Your current email address is mr.codefrost@gmail.com'),
          CustomTextField(
              controller: profileCtrl.currentPassword,
              labelText: 'CURRENT PASSWORD',
              hintText: 'CURRENT PASSWORD'),
          CustomTextField(
              controller: profileCtrl.newEmail,
              labelText: 'NEW E-MAIL ADDRESS',
              hintText: 'NEW E-MAIL ADDRESS'),
        ],
      ),
    );
  }
}
