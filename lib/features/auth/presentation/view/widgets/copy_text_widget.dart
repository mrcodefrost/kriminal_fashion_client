import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyTextButton extends StatefulWidget {
  const CopyTextButton({super.key, required this.textToCopy});

  final String textToCopy;

  @override
  State<CopyTextButton> createState() => _CopyTextButtonState();
}

class _CopyTextButtonState extends State<CopyTextButton> {
  bool isCopied = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Clipboard.setData(ClipboardData(text: widget.textToCopy));
        setState(() {
          isCopied = true;
        });
      },
      icon: Icon(
        isCopied ? Icons.check : Icons.copy_rounded,
        color: Theme.of(context).colorScheme.primary,
        size: 20,
      ),
    );
  }
}
