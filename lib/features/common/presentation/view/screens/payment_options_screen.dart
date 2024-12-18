import 'package:flutter/material.dart';
import 'package:kriminal_fashion_client/features/payment_razorpay/domain/service/razorpay_service.dart';

import '../../../../payment_stripe/domain/service/stripe_service.dart';

class PaymentOptionsScreen extends StatelessWidget {
  const PaymentOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Please select your preferred payment gateway'),
            ElevatedButton(
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
                  StripeService.instance.makePayment();
                },
                child: const Text('Stripe')),
            ElevatedButton(
                onPressed: () {
                  // StripeService.instance.makePayment();

                  RazorpayService.instance.onPaymentButtonTap();
                },
                child: const Text('Razorpay')),
            ElevatedButton(
                onPressed: () {
                  // StripeService.instance.makePayment();

                  RazorpayService.instance.onPaymentButtonTap();
                },
                child: const Text('Paypal')),
            ElevatedButton(
                onPressed: () {
                  // StripeService.instance.makePayment();

                  RazorpayService.instance.onPaymentButtonTap();
                },
                child: const Text('Square')),
            ElevatedButton(
                onPressed: () {
                  // StripeService.instance.makePayment();

                  RazorpayService.instance.onPaymentButtonTap();
                },
                child: const Text('PayU')),
          ],
        ),
      ),
    );
  }
}
