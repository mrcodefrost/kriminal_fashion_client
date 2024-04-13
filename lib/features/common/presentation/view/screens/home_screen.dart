import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kriminal_fashion_client/features/common/presentation/controller/auth_controller.dart';
import 'package:kriminal_fashion_client/features/common/presentation/controller/product_controller.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/screens/product_description_screen.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/widgets/custom_drop_down_menu.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/widgets/multi_select_drop_down_button.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/widgets/product_card.dart';
import 'package:kriminal_fashion_client/themes/theme_controller.dart';
import 'package:kriminal_fashion_client/utils/constants/app_constants.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> multiDropDownItems = ['item1', 'item2', 'item3'];
  final List<String> dropDownItems = ['Rs. Low to High', 'Rs. High to Low'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (productController) {
      Future<void> refresh() async {
        await productController.fetchProducts();
      }

      return Scaffold(
        backgroundColor: context.theme.colorScheme.background,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('K R I M I N A L'),
          titleTextStyle:
              TextStyle(color: context.theme.colorScheme.primary, fontSize: 24),
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, // TODO make dynamic
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Chip(
                      backgroundColor: context.theme.colorScheme.background,
                      labelStyle:
                          TextStyle(color: context.theme.colorScheme.primary),
                      elevation: 0,
                      surfaceTintColor: Colors.transparent,
                      label: const Text('Category'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: BorderSide(
                              color: context.theme.colorScheme.secondary)),
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
                      onSelected: (selectedValue) {},
                    ),
                  ),
                  Flexible(
                      child: MultiSelectDropDownButton(
                    items: multiDropDownItems,
                    onSelectionChanged: (selectedItems) {},
                  )),
                ],
              ),
              const SizedBox(height: 30),
              LiquidPullToRefresh(
                onRefresh: refresh,
                child: Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          childAspectRatio: 0.45,
                          mainAxisSpacing: 8),
                      itemCount: productController.products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          name: productController.products[index].name ??
                              'No Name',
                          price: productController.products[index].price ?? 0.0,
                          offerTag:
                              productController.products[index].shortTag ??
                                  'No Tags',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDescriptionScreen()));
                          },
                          imageURL: productController.products[index].image ??
                              AppImages.demoImageURL,
                          index: index,
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
