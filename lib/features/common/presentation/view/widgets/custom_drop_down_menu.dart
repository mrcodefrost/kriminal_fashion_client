import 'package:flutter/material.dart';

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
        border: Border.all(color: Colors.white), // Border on all sides
        borderRadius:
            BorderRadius.circular(8), // Adjust border radius as needed
        color: Colors.white,
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
      ),
    );
  }
}
