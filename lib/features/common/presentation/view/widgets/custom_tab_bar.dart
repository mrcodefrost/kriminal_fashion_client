import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;

  const CustomTabBar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs() {
    return tabsList.map((tab) {
      return Tab(
        text: tab.toString().split('.').last.toUpperCase(),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: TabBar(
        controller: tabController,
        tabs: _buildCategoryTabs(),
        indicatorColor: Theme.of(context).colorScheme.inversePrimary,
        labelColor: Theme.of(context).colorScheme.inversePrimary,
        unselectedLabelColor: Theme.of(context).colorScheme.primary,
        isScrollable: true,
      ),
    );
  }
}

const tabsList = ['WOMAN', 'MAN', 'KIDS', 'BEAUTY'];
