import 'package:flutter/material.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/widgets/secondary_button.dart';
import 'package:kriminal_fashion_client/features/payment_razorpay/domain/service/razorpay_service.dart';

import '../../../../../utils/globals.dart';
import '../../../../payment_stripe/domain/service/stripe_service.dart';

class PaymentOptionsScreen extends StatefulWidget {
  const PaymentOptionsScreen({super.key});

  @override
  State<PaymentOptionsScreen> createState() => _PaymentOptionsScreenState();
}

class _PaymentOptionsScreenState extends State<PaymentOptionsScreen> {
  int selectedOption = 1;

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
            ListView.builder(
                shrinkWrap: true,
                itemCount: paymentGatewayOptions.length,
                itemBuilder: (context, index) {
                  final paymentOp = paymentGatewayOptions[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          selectedOption = paymentOp.value;
                        });
                        // paymentOp.function();
                      },
                      leading: const Icon(Icons.credit_card),
                      title: Text(paymentOp.label),
                      trailing: Radio(
                          value: paymentOp.value,
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value ?? 1;
                            });
                          }),
                      shape: BeveledRectangleBorder(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  );
                }),
            const Spacer(flex: 5),
            SecondaryButton(
                text: 'Continue to payment',
                onPressed: () {
                  // since selectedOption is greater by 1 than the index of paymentGatewayOptions list
                  // and we want the index of paymentGatewayOptions list
                  // index = selectedOption - 1
                  paymentGatewayOptions[selectedOption - 1].function();
                }),
            const Spacer(flex: 1)
          ],
        ),
      ),
    );
  }
}

final List<PaymentGatewayOptions> paymentGatewayOptions = [
  PaymentGatewayOptions(
      value: 1,
      label: 'Razorpay',
      function: () {
        RazorpayService.instance.onPaymentButtonTap();
        logg.d('Razorpay button tapped');
      }),
  PaymentGatewayOptions(
      value: 2,
      label: 'Stripe',
      function: () {
        StripeService.instance.makePayment();
        logg.d('Stripe button tapped');
      }),
  PaymentGatewayOptions(
      value: 3,
      label: 'Paypal',
      function: () {
        logg.d('Paypal button tapped');
      }),
  PaymentGatewayOptions(
      value: 4,
      label: 'Square',
      function: () {
        logg.d('Square button tapped');
      }),
  PaymentGatewayOptions(
      value: 5,
      label: 'PayU',
      function: () {
        logg.d('PayU button tapped');
      }),
];

class PaymentGatewayOptions {
  final int value;
  final String label;
  final Function function;

  const PaymentGatewayOptions({
    required this.value,
    required this.label,
    required this.function,
  });
}
