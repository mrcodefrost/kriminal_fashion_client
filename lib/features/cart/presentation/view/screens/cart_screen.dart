import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/presentation/view/widgets/primary_button.dart';
import '../../controller/cart_controller.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController()); // Initialize controller

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              Flexible(
                  child: PrimaryButton(
                      text: 'Cart',
                      onPressed: () {
                        cartController.switchView(0);
                      })),
              Flexible(
                  child: PrimaryButton(
                      text: 'Wishlist',
                      onPressed: () {
                        cartController.switchView(1);
                      })),
            ],
          ),
          const SizedBox(height: 20),
          Obx(
            () => Expanded(
              child: cartController.selectedIndex.value == 0
                  ? CartContent() // Show Cart content
                  : WishlistContent(), // Show Wishlist content
            ),
          ),
        ],
      ),
    );
  }
}

class CartContent extends StatelessWidget {
  const CartContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.shopping_bag,
              size: 40,
            ),
            SizedBox(height: 20),
            Text('YOUR CART IS EMPTY'),
            SizedBox(height: 20),
            Text('The items you add will be shown here')
          ],
        ),
      ),
    );
  }
}

class WishlistContent extends StatelessWidget {
  const WishlistContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.bookmark_border,
              size: 40,
            ),
            SizedBox(height: 20),
            Text('YOU DO NOT HAVE ANY SAVED ITEMS'),
            SizedBox(height: 20),
            Text('Save your favourites and share them with anyone you like')
          ],
        ),
      ),
    );
  }
}
