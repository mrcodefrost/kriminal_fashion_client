import 'package:flutter/material.dart';
import 'package:kriminal_fashion_client/features/payment_razorpay/domain/service/razorpay_service.dart';

import '../../../../payment_stripe/domain/service/stripe_service.dart';

class PaymentOptionsScreen extends StatelessWidget {
  const PaymentOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    StripeService.instance.makePayment();
                  },
                  child: const Text('Stripe')),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    // StripeService.instance.makePayment();

                    RazorpayService.instance.onPaymentButtonTap();
                  },
                  child: const Text('Razorpay')),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    // StripeService.instance.makePayment();

                    RazorpayService.instance.onPaymentButtonTap();
                  },
                  child: const Text('Paypal')),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    // StripeService.instance.makePayment();

                    RazorpayService.instance.onPaymentButtonTap();
                  },
                  child: const Text('Square')),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    // StripeService.instance.makePayment();

                    RazorpayService.instance.onPaymentButtonTap();
                  },
                  child: const Text('PayU')),
            ],
          ),
        ),
      ),
    );
  }
}
