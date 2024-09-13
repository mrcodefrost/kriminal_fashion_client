import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/screens/payment_options_screen.dart';

import '../../../data/model/product.dart';

class ProductDescriptionScreen extends StatelessWidget {
  const ProductDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductModel product = Get.arguments['data'];
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(product.image!),
            ),
            const SizedBox(height: 20),
            Text(
              product.name!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product.description!,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Rs. ${product.price!.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: context.theme.colorScheme.primary,
                    //     shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(0),
                    // ),
                    // todo
                    shape: StarBorder()),
                onPressed: () {},
                child: Text('Add to Cart'),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: context.theme.colorScheme.secondary,
                ),
                child: Text(
                  'Buy Now',
                  style: TextStyle(
                    fontSize: 18,
                    color: context.theme.colorScheme.inversePrimary,
                  ),
                ),
                onPressed: () {
                  // Get.snackbar('Sorry !', 'Functionality under development',
                  //    colorText: Colors.red);
                  // StripeService.instance.makePayment();
                  Get.to(() => const PaymentOptionsScreen());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
