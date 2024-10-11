import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/presentation/view/widgets/primary_button.dart';
import '../../../../product/presentation/view/screens/product_description_screen.dart';
import '../../../../product/presentation/view/widgets/product_card.dart';
import '../../controller/cart_controller.dart';

class CartOrWishlistScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController()); // Initialize controller

  CartOrWishlistScreen({super.key});

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
                  : WishlistContent(
                      cartController: cartController,
                    ), // Show Wishlist content
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
  final CartController cartController;

  const WishlistContent({super.key, required this.cartController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        width: double.maxFinite,
        child: cartController.wishListedProducts.isEmpty
            ? const Column(
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
              )
            : Column(
                children: [
                  const SizedBox(height: 10),
                  Expanded(
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, crossAxisSpacing: 8, childAspectRatio: 0.62, mainAxisSpacing: 10),
                        itemCount: cartController.wishListedProducts.length,
                        itemBuilder: (context, index) {
                          final product = cartController.wishListedProducts[index];
                          final isWishListed = cartController.isProductWishListed(product);
                          return ProductCard(
                            name: cartController.wishListedProducts[index].name,
                            price: cartController.wishListedProducts[index].price,
                            offerTag: cartController.wishListedProducts[index].shortTag,
                            onTap: () {
                              Get.to(
                                  () => ProductDescriptionScreen(
                                        isWishListed: isWishListed,
                                      ),
                                  arguments: {'data': product});
                            },
                            imageURL: cartController.wishListedProducts[index].image,
                            index: index,
                            wishlistIcon: const SizedBox.shrink(),
                            // wishListTap: () {
                            //   cartController.wishListedProducts.add(cartController.wishListedProducts[index]);
                            // },
                          );
                        }),
                  ),
                ],
              ),
      ),
    );
  }
}
