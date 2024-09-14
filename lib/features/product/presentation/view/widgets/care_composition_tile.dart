import 'package:flutter/material.dart';
import 'package:kriminal_fashion_client/utils/constants/app_constants.dart';

class CareCompositionTile extends StatefulWidget {
  const CareCompositionTile({super.key});

  @override
  State<CareCompositionTile> createState() => _CareCompositionTileState();
}

class _CareCompositionTileState extends State<CareCompositionTile> {
  bool _customIcon = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          title: Text(
            'COMPOSITION, CARE & ORIGIN',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          trailing: _customIcon ? const Icon(Icons.remove) : const Icon(Icons.add),
          onExpansionChanged: (expanded) {
            setState(() {
              _customIcon = expanded;
            });
          },
          tilePadding: const EdgeInsets.symmetric(horizontal: 8),
          children: [
            ListTile(
              title: Text(
                'COMPOSITION',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: Text(
                AppStrings.compositionText,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            ),
            ListTile(
              title: Text(
                'CARE',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: Text(
                AppStrings.careText,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            ),
            ListTile(
              title: Text(
                'ORIGIN',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: Text(
                AppStrings.originText,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            ),
          ],
        ),
      ],
    );
  }
}
