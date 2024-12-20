import 'package:animated_collection/animated_collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/widgets/loading_dialog.dart';

import '../../../../common/presentation/view/widgets/primary_button.dart';
import '../../../../product/presentation/view/screens/product_description_screen.dart';
import '../../../../product/presentation/view/widgets/product_card.dart';
import '../../../data/models/cart_item.dart';
import '../../controller/cart_controller.dart';

class CartOrWishlistScreen extends StatelessWidget {
  final CartController cartController =
      Get.put(CartController()); // Initialize controller

  CartOrWishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Obx(
            () => Row(
              children: [
                AnimatedFlexible(
                    // IMPORTANT
                    // Flex values must be very high to ensure smooth animation since flex is an int and not double
                    // Tween through small values causes the animation to be choppy
                    // The ratio in the current UI is 2:1 for flex, update it in case of UI change
                    flex:
                        cartController.selectedIndex.value == 0 ? 200.0 : 100.0,
                    child: StreamBuilder<int>(
                      stream: cartController.streamCartItemCount(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return PrimaryButton(
                            onPressed: () {},
                            text: 'CART (0)',
                          );
                        }
                        final cartItemCount = snapshot.data!;
                        return PrimaryButton(
                          text: 'Cart ($cartItemCount)',
                          onPressed: () {
                            cartController.switchView(0);
                          },
                        );
                      },
                    )),
                AnimatedFlexible(
                  flex: cartController.selectedIndex.value == 1 ? 200.0 : 100.0,
                  child: PrimaryButton(
                    text: 'Wishlist',
                    onPressed: () {
                      cartController.switchView(1);
                    },
                  ),
                ),
              ],
            ),
          ),
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
  final cartController = Get.find<CartController>();
  CartContent({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CartItem>>(
      stream: cartController.streamCartItems(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Showing dialogs or triggering side-effects (like navigation or showing overlays) directly inside builder
          // causes the build cycle to behave unexpectedly and throw errors like visitChildElements
          // Use stateless loading indicators instead, hence call the widget directly
          return const LoadingDialog();
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
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

        final cartItems = snapshot.data!;

        return ListView.builder(
          shrinkWrap: true,
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            final cartItem = cartItems[index];
            return Container(
              height: 290,
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: 5,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(right: BorderSide(color: Colors.black)),
                    ),
                    child: Image.network(
                      cartItem.image,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.bookmark_border)),
                            IconButton(
                                onPressed: () {}, icon: const Icon(Icons.close))
                          ],
                        ),
                        const SizedBox(height: 40),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartItem.name,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              '₹${cartItem.price * cartItem.quantity}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 10),
                            const Text('M | BLACK'),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.remove),
                                padding: EdgeInsets.zero,
                                constraints:
                                    const BoxConstraints(), // needed to remove padding
                                style: IconButton.styleFrom(
                                    shape: BeveledRectangleBorder(
                                        side: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ))),
                              ),
                              const Text('-'),
                              Text('${cartItem.quantity}'),
                              const Text('+'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
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
                  Text(
                      'Save your favourites and share them with anyone you like')
                ],
              )
            : Column(
                children: [
                  const SizedBox(height: 10),
                  Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                childAspectRatio: 0.62,
                                mainAxisSpacing: 10),
                        itemCount: cartController.wishListedProducts.length,
                        itemBuilder: (context, index) {
                          final product =
                              cartController.wishListedProducts[index];
                          final isWishListed =
                              cartController.isProductWishListed(product);
                          return ProductCard(
                            name: cartController.wishListedProducts[index].name,
                            price:
                                cartController.wishListedProducts[index].price,
                            offerTag: cartController
                                .wishListedProducts[index].shortTag,
                            onTap: () {
                              Get.to(
                                  () => ProductDescriptionScreen(
                                        isWishListed: isWishListed,
                                      ),
                                  arguments: {'data': product});
                            },
                            imageURL:
                                cartController.wishListedProducts[index].image,
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
