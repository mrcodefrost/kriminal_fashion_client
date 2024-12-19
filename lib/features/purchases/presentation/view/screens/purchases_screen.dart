import 'package:flutter/material.dart';

class PurchasesScreen extends StatelessWidget {
  const PurchasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            'PURCHASES'.toUpperCase(),
          ),
          const Spacer(),
          const Text(''),
        ],
      ),
    );
  }
}
