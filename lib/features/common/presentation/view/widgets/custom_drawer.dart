import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      // Need to figure out how to add tabs inside the drawer
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
                      onPressed: () {},
                      icon: const Icon(Icons.close),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('MY ACCOUNT'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('CART'),
                    ),
                  ],
                ),
                SizedBox(height: 25),

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
      ),
    );
  }
}

// return list of foods in a given category
List<Widget> getFoodInThisCategory(List<String> categories) {
  return categories.map((category) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          // return food tile UI
          return ListTile(onTap: () {});
        });
  }).toList();
}

const List<String> categories = [
  'NEW',
  'BEST SELLERS',
  'JACKETS',
  'DRESSES',
  'TOPS',
  'SWEATERS',
  'SHIRTS',
  'SUNGLASSES',
];
