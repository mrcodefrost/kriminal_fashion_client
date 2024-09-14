import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/presentation/view/screens/payment_options_screen.dart';

class BuyNowButton extends StatelessWidget {
  const BuyNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10),
          foregroundColor: Theme.of(context).colorScheme.surface,
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: BeveledRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        onPressed: () {
          Get.to(() => const PaymentOptionsScreen());
        },
        child: Text(
          'BUY NOW',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.surface,
              ),
        ),
      ),
    );
  }
}
