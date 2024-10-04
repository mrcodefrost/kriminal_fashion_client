import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/widgets/custom_tab_bar.dart';
import 'package:kriminal_fashion_client/features/product/data/model/product_category.dart';

import '../../../../account/presentation/view/screens/account_screen.dart';
import '../../../../common/data/model/super_category.dart';
import '../../../../common/domain/usecase/common_usecases.dart';
import '../../controller/product_controller.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final productController = Get.find<ProductController>();

  @override
  void initState() {
    super.initState();

    _tabController =
        TabController(length: superCategoriesList.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Obx(
        () => Drawer(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Get.to(AccountScreen());
                        },
                        child: const Text('MY ACCOUNT'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('CART (0)'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  // Tabs
                  CustomTabBar(tabController: _tabController),
                  const SizedBox(height: 25),
                  // Tabs content
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: getProductCategoryInThisSuperCategory(
                          productController.productCategories),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Tab bar view listens to the changes in TabController and rebuilds accordingly
// hence, there is no need to pass the tab index
// as long as the list of tabs are the same as the list of product categories
// return list tiles of product categories for selected super category
List<Widget> getProductCategoryInThisSuperCategory(
    List<ProductCategory> productCategories) {
  return superCategoriesList.map((superCategory) {
    List<ProductCategory> filteredCategories =
        filterProductCategoryBySuperCategory(superCategory, productCategories);
    return ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: filteredCategories.length,
        itemBuilder: (context, index) {
          final category = filteredCategories[index];
          // return food tile UI
          return ListTile(
              title: Text(category.name.toUpperCase()), onTap: () {});
        });
  }).toList();
}
