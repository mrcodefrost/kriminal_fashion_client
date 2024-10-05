import 'package:flutter/material.dart';

import '../../../../common/presentation/view/widgets/primary_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              Flexible(child: PrimaryButton(text: 'Cart', onPressed: () {})),
              Flexible(
                  child: PrimaryButton(text: 'Wishlist', onPressed: () {})),
            ],
          )
        ],
      ),
    );
  }
}
