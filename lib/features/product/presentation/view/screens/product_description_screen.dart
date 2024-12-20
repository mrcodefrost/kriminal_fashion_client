import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_client/features/product/presentation/view/widgets/add_to_cart_button.dart';
import 'package:kriminal_fashion_client/features/product/presentation/view/widgets/care_composition_tile.dart';
import 'package:kriminal_fashion_client/features/product/presentation/view/widgets/select_size_button.dart';
import 'package:kriminal_fashion_client/utils/constants/app_constants.dart';
import '../../../../cart/presentation/controller/cart_controller.dart';
import '../../../data/model/product.dart';
import '../widgets/buy_now_button.dart';

class ProductDescriptionScreen extends StatelessWidget {
  final bool isWishListed;
  // bool isWishListed = Get.arguments['isWishListed'];
  final Product product = Get.arguments['data'];

  ProductDescriptionScreen({super.key, required this.isWishListed});

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage.assetNetwork(
                  image: product.image,
                  imageScale: 1.82,
                  placeholder: AppImages.splashLogo,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                InkWell(
                  child: Icon(
                      isWishListed ? Icons.bookmark : Icons.bookmark_border),
                  onTap: () {
                    cartController.addOrRemoveFromWishlist(product);
                  },
                ),
                // InkWell(
                //   onTap: () {
                //     setState(() {
                //       isWishListed = !isWishListed;
                //     });
                //   },
                //   child: Icon(
                //     isWishListed ? Icons.bookmark : Icons.bookmark_border,
                //     color: Theme.of(context).colorScheme.primary,
                //     size: 30,
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              product.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              product.shortTag,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 10),
            SelectSizeButton(),
            const SizedBox(height: 10),
            Text(
              'Rs. ${product.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            AddToCartButton(
              onPressed: () {
                cartController.addToCart(product);
              },
            ),
            const SizedBox(height: 10),
            const BuyNowButton(),
            const SizedBox(height: 40),
            const CareCompositionTile(),
          ],
        ),
      ),
    );
  }
}
