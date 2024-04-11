import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kriminal_fashion_client/features/common/presentation/controller/auth_controller.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/screens/product_description_screen.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/widgets/custom_drop_down_menu.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/widgets/multi_select_drop_down_button.dart';
import 'package:kriminal_fashion_client/features/common/presentation/view/widgets/product_card.dart';
import 'package:kriminal_fashion_client/themes/theme_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> multiDropDownItems = ['item1', 'item2', 'item3'];
  final List<String> dropDownItems = ['Rs. Low to High', 'Rs. High to Low'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return Scaffold(
        backgroundColor: context.theme.colorScheme.background,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('K R I M I N A L'),
          actions: [
            IconButton(
                onPressed: () {
                  ThemeController.toggleThemeMode();
                },
                icon: const Icon(Icons.lightbulb)),
            IconButton(
                onPressed: () {
                  authController.signOut();
                },
                icon: const Icon(Icons.logout))
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
                  itemBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Chip(
                      label: Text('Category'),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: CustomDropDownMenu(
                      items: dropDownItems,
                      hintText: 'Sort',
                      onSelected: (selectedValue) {},
                    ),
                  ),
                  const SizedBox(width: 80),
                  Flexible(
                      child: MultiSelectDropDownButton(
                    items: multiDropDownItems,
                    onSelectionChanged: (selectedItems) {},
                  )),
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.37,
                        mainAxisSpacing: 8),
                    itemCount: 10, //TODO make dynamic
                    itemBuilder: (context, index) {
                      return ProductCard(
                        name: 'SATIN MIDI DRESS',
                        price: '3590.00',
                        offerTag: 'Black | 8372/090',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDescriptionScreen()));
                        },
                        imageURL:
                            'https://static.zara.net/assets/public/c5d0/cda6/3fbd4a5fa232/e4b313d6aa37/08372090800-p/08372090800-p.jpg?ts=1708613834317&w=563',
                        index: index,
                      );
                    }),
              ),
            ],
          ),
        ),
      );
    });
  }
}
