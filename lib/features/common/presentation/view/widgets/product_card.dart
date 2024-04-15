import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                ? const BorderSide(color: Colors.black, width: 1)
                : BorderSide.none,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageURL,
                fit: BoxFit.cover,
                width: double.maxFinite,
                height: 200,
              ),
              const SizedBox(height: 10),
              Text(
                name,
                style: const TextStyle(fontSize: 14),
                overflow: TextOverflow.visible,
              ),
              const SizedBox(height: 10),
              Text(
                'Rs. ${price.toStringAsFixed(2)}',
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  offerTag,
                  style: TextStyle(
                      color: context.theme.colorScheme.secondary,
                      fontSize: 12,
                      fontStyle: FontStyle.italic),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
