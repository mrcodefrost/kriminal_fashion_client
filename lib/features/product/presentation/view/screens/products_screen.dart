import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/widgets/primary_button.dart';
import 'package:kriminal_fashion_client/features/product/presentation/controller/product_controller.dart';
import 'package:kriminal_fashion_client/features/product/presentation/view/screens/product_description_screen.dart';
import 'package:kriminal_fashion_client/features/product/presentation/view/widgets/custom_drawer.dart';
import 'package:kriminal_fashion_client/features/product/presentation/view/widgets/product_card.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../../../cart/presentation/controller/cart_controller.dart';
import '../../../../cart/presentation/view/screens/cart_screen.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  final List<String> dropDownItems = ['Rs. Low to High', 'Rs. High to Low'];
  final productController = Get.find<ProductController>();
  final cartController = Get.put(CartController());

  final List<String> sizesList = ['XS', 'S', 'M', 'L', 'XL'];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LiquidPullToRefresh(
        onRefresh: productController.onRefresh,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              TextButton(
                  onPressed: () {
                    Get.to(() => CartOrWishlistScreen());
                  },
                  child: Text('CART (${cartController.wishListedProducts.length})')),
            ],
          ),
          drawer: const CustomDrawer(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productController.productCategories.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        productController.filterByCategory(productController.productCategories[index].name);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0, top: 8, bottom: 8),
                        child: Chip(
                          key: UniqueKey(),
                          backgroundColor: Theme.of(context).colorScheme.surface,
                          labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                          elevation: 0,
                          surfaceTintColor: Colors.transparent,
                          label: Text(productController.productCategories[index].name.toUpperCase()),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                              side: BorderSide(color: Theme.of(context).colorScheme.secondary)),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              getBottomSheet(context: context, items: sizesList, onTap: () {});
                            },
                            child: Text('SIZE')),
                        TextButton(onPressed: () {}, child: Text('PRICE')),
                        TextButton(onPressed: () {}, child: Text('COLOUR')),
                      ],
                    ),
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Flexible(
                //       child: CustomDropDownMenu(
                //         items: dropDownItems,
                //         hintText: 'Sort',
                //         onSelected: (selectedValue) {
                //           productController.sortByPrice(
                //               // selectedValue == 'Rs. Low to High'
                //               ascending: selectedValue == dropDownItems[0] ? true : false);
                //         },
                //       ),
                //     ),
                //     Flexible(
                //         child: MultiSelectDropDownButton(
                //       items: brands,
                //       onSelectionChanged: (selectedItems) {
                //         productController.filterByBrand(selectedItems);
                //       },
                //     )),
                //   ],
                // ),
                const SizedBox(height: 10),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, crossAxisSpacing: 8, childAspectRatio: 0.62, mainAxisSpacing: 10),
                      itemCount: productController.filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = productController.filteredProducts[index];

                        // Call isProductWishListed directly
                        final isWishListed = cartController.isProductWishListed(product);
                        return ProductCard(
                          name: productController.filteredProducts[index].name,
                          price: productController.filteredProducts[index].price,
                          offerTag: productController.filteredProducts[index].shortTag,
                          onTap: () {
                            Get.to(
                                () => ProductDescriptionScreen(
                                      isWishListed: isWishListed,
                                    ),
                                arguments: {'data': product});
                          },
                          imageURL: productController.filteredProducts[index].image,
                          index: index,
                          // wishListTap: () {
                          //   cartController.wishListedProducts.add(cartController.wishListedProducts[index]);
                          // }
                          wishlistIcon: InkWell(
                            child: Icon(isWishListed ? Icons.bookmark : Icons.bookmark_border),
                            onTap: () {
                              cartController.addOrRemoveFromWishlist(product);
                            },
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void getBottomSheet({required BuildContext context, required List<String> items, required VoidCallback onTap}) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
    context: context,
    builder: (context) => SizedBox(
      width: Get.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            direction: Axis.horizontal,
            children: items.map((category) {
              return InkWell(
                // filter by size, price, color
                // productController
                //     .filterByCategory(productController.productCategories[index].name);
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Chip(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                    elevation: 0,
                    surfaceTintColor: Colors.transparent,
                    label: Text(category.toUpperCase()),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: BorderSide(color: Theme.of(context).colorScheme.secondary)),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Flexible(
                child: PrimaryButton(
                  text: 'Clear',
                  onPressed: () {},
                ),
              ),
              Flexible(
                child: PrimaryButton(
                  text: 'Show results',
                  onPressed: () {},
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
