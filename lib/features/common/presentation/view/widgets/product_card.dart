import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_client/utils/constants/app_constants.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String imageURL;
  final double price;
  final String offerTag;
  final Function onTap;
  final int index;

  const ProductCard(
      {super.key,
      required this.name,
      required this.imageURL,
      required this.price,
      required this.offerTag,
      required this.onTap,
      required this.index});

  bool _isRightBorder(int index) {
    // Check if the card is the last one in the row
    return (index + 1) % 2 != 0;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border(
            // bottom: const BorderSide(color: Colors.black, width: 1),
            right: _isRightBorder(index)
                ? BorderSide(color: Theme.of(context).colorScheme.secondary, width: 1)
                : BorderSide.none,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInImage.assetNetwork(
                placeholder: AppImages.splashLogo,
                image: imageURL,
                fit: BoxFit.cover,
                width: double.maxFinite,
                height: 200,
              ),
              const SizedBox(height: 10),
              Text(
                name,
                style: Theme.of(context).textTheme.titleSmall,
                overflow: TextOverflow.visible,
              ),
              const SizedBox(height: 10),
              Text(
                'Rs. ${price.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.titleSmall,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  offerTag,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
