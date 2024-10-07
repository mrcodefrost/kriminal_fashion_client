import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_client/features/product/presentation/view/widgets/add_to_cart_button.dart';
import 'package:kriminal_fashion_client/features/product/presentation/view/widgets/care_composition_tile.dart';
import 'package:kriminal_fashion_client/features/product/presentation/view/widgets/select_size_button.dart';
import 'package:kriminal_fashion_client/utils/constants/app_constants.dart';
import '../../../data/model/product.dart';
import '../widgets/buy_now_button.dart';

class ProductDescriptionScreen extends StatefulWidget {
  const ProductDescriptionScreen({super.key});

  @override
  State<ProductDescriptionScreen> createState() => _ProductDescriptionScreenState();
}

class _ProductDescriptionScreenState extends State<ProductDescriptionScreen> {
  bool isWishListed = false;
  Product product = Get.arguments['data'];

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
                  onTap: () {
                    setState(() {
                      isWishListed = !isWishListed;
                    });
                  },
                  child: Icon(
                    isWishListed ? Icons.bookmark : Icons.bookmark_border,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30,
                  ),
                ),
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
            const AddToCartButton(),
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
