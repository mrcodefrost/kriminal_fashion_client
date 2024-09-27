import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/widgets/custom_tab_bar.dart';
import 'package:kriminal_fashion_client/features/product/data/model/product_category.dart';

import '../../../data/model/super_category.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: tabsList.length, vsync: this);
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
      child: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                // try to match with zara UI
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
                      onPressed: () {},
                      child: const Text('MY ACCOUNT'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('CART'),
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
                    children: getProductCategoryInThisSuperCategory(productCategories),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// sort out and return a list of product categories that belong to a specific  super category
List<ProductCategory> _filterProductCategoryBySuperCategory(
    SuperCategory superCategory, List<ProductCategory> allProductCategories) {
  return allProductCategories.where((productCategory) => productCategory.superCategoryName == superCategory).toList();
}

// return list tiles of product categories for selected super category
List<Widget> getProductCategoryInThisSuperCategory(List<ProductCategory> productCategories) {
  return SuperCategory.values.map((superCategory) {
    List<ProductCategory> filteredCategories = _filterProductCategoryBySuperCategory(superCategory, productCategories);
    return ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: filteredCategories.length,
        itemBuilder: (context, index) {
          final category = filteredCategories[index];
          // return food tile UI
          return ListTile(title: Text(category.name), onTap: () {});
        });
  }).toList();
}

final List<ProductCategory> productCategories = [
  ProductCategory(
    id: '1',
    name: 'BEST SELLERS',
    superCategoryName: SuperCategory.woman,
  ),
  ProductCategory(
    id: '2',
    name: 'DENIMS',
    superCategoryName: SuperCategory.woman,
  ),
  ProductCategory(
    id: '3',
    name: 'JACKETS | TRENCH COATS',
    superCategoryName: SuperCategory.woman,
  ),
  ProductCategory(
    id: '4',
    name: 'BLAZERS',
    superCategoryName: SuperCategory.woman,
  ),
  ProductCategory(
    id: '5',
    name: 'DRESSES',
    superCategoryName: SuperCategory.woman,
  ),
  ProductCategory(
    id: '6',
    name: 'TOPS | BODYSUITS',
    superCategoryName: SuperCategory.woman,
  ),
  ProductCategory(
    id: '7',
    name: 'T-SHIRTS',
    superCategoryName: SuperCategory.woman,
  ),
  ProductCategory(
    id: '8',
    name: 'BESTSELLER',
    superCategoryName: SuperCategory.man,
  ),
  ProductCategory(
    id: '8',
    name: 'JACKETS | GILETS',
    superCategoryName: SuperCategory.man,
  ),
  ProductCategory(
    id: '8',
    name: 'COATS',
    superCategoryName: SuperCategory.man,
  ),
  ProductCategory(
    id: '8',
    name: 'SWEATERS | CARDIGANS',
    superCategoryName: SuperCategory.man,
  ),
  ProductCategory(
    id: '8',
    name: 'TROUSERS',
    superCategoryName: SuperCategory.man,
  ),
  ProductCategory(
    id: '8',
    name: 'JEANS',
    superCategoryName: SuperCategory.man,
  ),
];
