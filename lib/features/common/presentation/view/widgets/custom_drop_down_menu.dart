import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDownMenu extends StatelessWidget {
  final List<String> items;
  final String hintText;
  final void Function(String?)? onSelected;

  List<DropdownMenuEntry<String>> buildDropdownMenuItems() {
    return items.map((String item) {
      return DropdownMenuEntry<String>(
        value: item,
        label: item,
      );
    }).toList();
  }

  const CustomDropDownMenu(
      {super.key,
      required this.items,
      this.onSelected,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // Use BoxDecoration for border and background
        border: Border.all(
            color: context.theme.colorScheme.secondary), // Border on all sides
        borderRadius: BorderRadius.zero, // Adjust border radius as needed
        color: Colors.transparent,
      ),
      child: DropdownMenu(
        width: 130,
        dropdownMenuEntries: buildDropdownMenuItems(),
        onSelected: onSelected,
        hintText: hintText,
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          enabledBorder: InputBorder.none,
        ),
        menuStyle: MenuStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(
              context.theme.colorScheme.tertiary),
          elevation: MaterialStateProperty.all<double>(
              0.0), // more explicit than using propertyAll
        ),
      ),
    );
  }
}
