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
    return DropdownMenu(
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.orange,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
      ),
      dropdownMenuEntries: buildDropdownMenuItems(),
      onSelected: onSelected,
      hintText: hintText,
    );
  }
}
