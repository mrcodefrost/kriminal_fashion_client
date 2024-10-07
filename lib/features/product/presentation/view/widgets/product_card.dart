import 'package:flutter/material.dart';
import 'package:kriminal_fashion_client/utils/constants/app_constants.dart';

class ProductCard extends StatefulWidget {
  final String name;
  final String imageURL;
  final double price;
  final String offerTag;
  final Function onTap;
  final int index;
  // final Function wishListTap;

  const ProductCard({
    super.key,
    required this.name,
    required this.imageURL,
    required this.price,
    required this.offerTag,
    required this.onTap,
    required this.index,
    // required this.wishListTap,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isWishListed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInImage.assetNetwork(
            placeholder: AppImages.splashLogo,
            image: widget.imageURL,
            fit: BoxFit.cover,
            width: double.maxFinite,
            height: 200,
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  widget.name,
                  style: Theme.of(context).textTheme.titleSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isWishListed = !isWishListed;
                  });
                  // widget.wishListTap();
                },
                child: Icon(
                  isWishListed ? Icons.bookmark : Icons.bookmark_border,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
              ),
            ],
          ),
          // const SizedBox(height: 15),
          const Spacer(),
          Text(
            '₹ ${widget.price.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.titleSmall,
            overflow: TextOverflow.ellipsis,
          ),
          // const SizedBox(height: 5),
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 5),
          //   decoration: BoxDecoration(
          //     color: context.theme.colorScheme.tertiary,
          //     borderRadius: BorderRadius.circular(12),
          //   ),
          //   child: Text(
          //     offerTag,
          //     style: Theme.of(context).textTheme.labelMedium?.copyWith(
          //           color: Theme.of(context).colorScheme.secondary,
          //         ),
          //   ),
          // )
        ],
      ),
    );
  }
}
