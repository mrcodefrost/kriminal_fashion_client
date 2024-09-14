import 'package:flutter/material.dart';

class SelectSizeButton extends StatelessWidget {
  SelectSizeButton({super.key});

  final List<String> sizes = [
    'XXS',
    'XS',
    'S',
    'M',
    'L',
    'XL',
    'XXL',
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: List.generate(sizes.length, (index) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Theme.of(context).colorScheme.surface,
            foregroundColor: Theme.of(context).colorScheme.primary,
            minimumSize: Size.zero,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            shape: BeveledRectangleBorder(
              side: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 0.5),
            ),
          ),
          onPressed: () {},
          child: Text(
            sizes[index],
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        );
      }),
    );
  }
}
