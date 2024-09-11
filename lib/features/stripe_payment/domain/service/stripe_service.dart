import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../../utils/constants/app_constants.dart';

class StripeService {
  // private constructor
  StripeService._();

  // Singleton instance
  static final StripeService instance = StripeService._();

  Future<void> makePayment() async {
    try {
      String? paymentIntentClientSecret = await _createPaymentIntent(2000, "USD");
      // print("Payment intent" + result!);

      // can't go further if paymentIntent is null
      if (paymentIntentClientSecret == null) {
        return;
      }
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntentClientSecret, merchantDisplayName: "Kriminal Fashio Co"));

      await _processPayment();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // payment intent should only be created on the server end
  Future<String?> _createPaymentIntent(int amount, String currency) async {
    try {
      final Dio dio = Dio();
      Map<String, dynamic> data = {
        "amount": _calculateAmount(amount), // need to specify in cents for USD
        "currency": currency,
      };

      var response = await dio.post('https://api.stripe.com/v1/payment_intents',
          data: data,
          // to authenticate
          options: Options(contentType: Headers.formUrlEncodedContentType, headers: {
            "Authorization": "Bearer ${AppSecrets.stripeSecretKey}",
            "Content-Type": "application/x-www-form-urlencoded",
          }));

      if (response.data != null) {
        return response.data["client_secret"];
      }

      return null;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      await Stripe.instance.confirmPaymentSheetPayment();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  String _calculateAmount(int amount) {
    final calculatedAmount = amount * 100;
    return calculatedAmount.toString();
  }
}
