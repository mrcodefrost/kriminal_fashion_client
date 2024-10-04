import 'package:flutter/material.dart';
import 'package:kriminal_fashion_client/features/common/data/model/super_category.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;

  const CustomTabBar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs() {
    return superCategoriesList.map((tab) {
      return Tab(
        text: tab.toString().split('.').last.toUpperCase(),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: TabBar(
        controller: tabController,
        tabAlignment: TabAlignment.center,
        tabs: _buildCategoryTabs(),
        indicatorColor: Theme.of(context).colorScheme.inversePrimary,
        labelColor: Theme.of(context).colorScheme.primary,
        labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
        unselectedLabelColor: Theme.of(context).colorScheme.primary,
        unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
        isScrollable: true, // not required but fine, it allows for tab alignment to be at start if needed
        padding: const EdgeInsets.only(bottom: 15),
      ),
    );
  }
}
