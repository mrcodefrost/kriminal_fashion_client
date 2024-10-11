import 'package:flutter/material.dart';
import 'package:kriminal_fashion_client/utils/constants/app_constants.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String imageURL;
  final double price;
  final String offerTag;
  final Function onTap;
  final int index;
  final Widget wishlistIcon;

  const ProductCard({
    super.key,
    required this.name,
    required this.imageURL,
    required this.price,
    required this.offerTag,
    required this.onTap,
    required this.index,
    required this.wishlistIcon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.titleSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              // InkWell(
              //   onTap: () {
              //     setState(() {
              //       isWishListed = !isWishListed;
              //     });
              //     // widget.wishListTap();
              //   },
              //   child: Icon(
              //     isWishListed ? Icons.bookmark : Icons.bookmark_border,
              //     color: Theme.of(context).colorScheme.primary,
              //     size: 24,
              //   ),
              // ),
              wishlistIcon,
            ],
          ),
          const Spacer(),
          Text(
            '₹ ${price.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.titleSmall,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
