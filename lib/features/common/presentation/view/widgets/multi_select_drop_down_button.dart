import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MultiSelectDropDownButton extends StatelessWidget {
  MultiSelectDropDownButton(
      {super.key, required this.items, required this.onSelectionChanged});

  final List<String> items;
  final Function(List<String>) onSelectionChanged;
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return DropdownButton2<String>(
      underline: const SizedBox.shrink(), // imp to remove underline
      isExpanded: true,
      hint: Text(
        'Filters',
        style: TextStyle(
          fontSize: 14,
          color: context.theme.colorScheme.primary,
        ),
      ),
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          //disable default onTap to avoid closing menu when selecting an item
          enabled: false,
          child: StatefulBuilder(
            builder: (context, menuSetState) {
              final isSelected = selectedItems.contains(item);
              return InkWell(
                onTap: () {
                  isSelected
                      ? selectedItems.remove(item)
                      : selectedItems.add(item);
                  onSelectionChanged(selectedItems);
                  menuSetState(() {});
                },
                child: Container(
                  height: double.infinity,
                  color: context.theme.colorScheme.tertiary,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      if (isSelected)
                        Icon(
                          Icons.check_box_outlined,
                          color: context.theme.colorScheme.inversePrimary,
                        )
                      else
                        const Icon(Icons.check_box_outline_blank),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }).toList(),
      // Use last selected item as the current value so if we've limited menu height, it scroll to last item.
      value: selectedItems.isEmpty ? null : selectedItems.last,
      onChanged: (value) {},
      selectedItemBuilder: (context) {
        return items.map(
          (item) {
            return Container(
              alignment: AlignmentDirectional.center,
              child: Text(
                selectedItems.join(', '),
                style: const TextStyle(
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
            );
          },
        ).toList();
      },
      buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          height: 60,
          width: 130,
          elevation: 0,
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: context.theme.colorScheme.secondary))),
      menuItemStyleData: const MenuItemStyleData(
        height: 60,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
