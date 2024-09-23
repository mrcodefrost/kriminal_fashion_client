import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kriminal_fashion_client/features/auth/presentation/controller/auth_controller.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/widgets/custom_drop_down_menu.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/widgets/multi_select_drop_down_button.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/widgets/product_card.dart';
import 'package:kriminal_fashion_client/features/product/presentation/controller/product_controller.dart';
import 'package:kriminal_fashion_client/features/product/presentation/view/screens/product_description_screen.dart';
import 'package:kriminal_fashion_client/themes/theme_controller.dart';
import 'package:kriminal_fashion_client/utils/constants/app_constants.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> brands = [
    'Unbranded',
    'Zara',
    'Forever 21',
    'Snitch',
    'Rare Rabbit',
    'Only',
    'Vera Moda',
    'Van Heusan',
    'Peter England',
    'Allen Solly',
    'Domyos',
    'Kipsta',
    'Puma',
    'Sketchers',
    'Adidas',
    'Clarks',
  ];
  final List<String> dropDownItems = ['Rs. Low to High', 'Rs. High to Low'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (productController) {
      Future<void> refresh() async {
        await productController.fetchProducts();
        // Get.snackbar('Success', 'Product list updated successfully', colorText: Colors.green);
      }

      return LiquidPullToRefresh(
        onRefresh: refresh,
        child: Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            backgroundColor: Colors.transparent,
            title: const Text(AppStrings.appName),
            titleTextStyle: TextStyle(
                color: context.theme.colorScheme.primary, fontSize: 24),
            actions: [
              IconButton(
                  onPressed: () {
                    ThemeController.toggleThemeMode();
                  },
                  icon: Icon(
                    Icons.lightbulb,
                    color: context.theme.colorScheme.inversePrimary,
                  )),
              GetBuilder<AuthController>(builder: (authController) {
                return IconButton(
                    onPressed: () {
                      final box = GetStorage();
                      box.erase();
                      authController.signOut();
                    },
                    icon: const Icon(Icons.logout));
              })
            ],
          ),
          drawer: Container(
            width: Get.width * 0.95,
            // Need to figure out how to add tabs inside the drawer
            child: Drawer(
              child: Column(
                children: [
                  // try to match with zara UI
                  ListTile(
                    title: Text('NEW'),
                  ),
                  ListTile(
                    title: Text('BEST SELLERS'),
                  ),
                  ListTile(
                    title: Text('JACKETS'),
                  ),
                  ListTile(
                    title: Text('DRESSES'),
                  ),
                  ListTile(
                    title: Text('TOPS'),
                  )
                ],
              ),
            ),
          ),
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
                        productController.filterByCategory(
                            productController.productCategories[index].name);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 8.0, top: 8, bottom: 8),
                        child: Chip(
                          backgroundColor: context.theme.colorScheme.surface,
                          labelStyle: TextStyle(
                              color: context.theme.colorScheme.primary),
                          elevation: 0,
                          surfaceTintColor: Colors.transparent,
                          label: Text(
                              productController.productCategories[index].name),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                              side: BorderSide(
                                  color: context.theme.colorScheme.secondary)),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: CustomDropDownMenu(
                        items: dropDownItems,
                        hintText: 'Sort',
                        onSelected: (selectedValue) {
                          productController.sortByPrice(
                              // selectedValue == 'Rs. Low to High'
                              ascending: selectedValue == dropDownItems[0]
                                  ? true
                                  : false);
                        },
                      ),
                    ),
                    Flexible(
                        child: MultiSelectDropDownButton(
                      items: brands,
                      onSelectionChanged: (selectedItems) {
                        productController.filterByBrand(selectedItems);
                      },
                    )),
                  ],
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              childAspectRatio: 0.45,
                              mainAxisSpacing: 8),
                      itemCount: productController.filteredProducts.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          name:
                              productController.filteredProducts[index].name ??
                                  'No Name',
                          price:
                              productController.filteredProducts[index].price ??
                                  0.0,
                          offerTag: productController
                                  .filteredProducts[index].shortTag ??
                              'No Tags',
                          onTap: () {
                            Get.to(() => const ProductDescriptionScreen(),
                                arguments: {
                                  'data':
                                      productController.filteredProducts[index]
                                });
                          },
                          imageURL:
                              productController.filteredProducts[index].image ??
                                  AppImages.demoImageURL,
                          index: index,
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
