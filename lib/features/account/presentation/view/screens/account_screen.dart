import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kriminal_fashion_client/features/cart/presentation/view/screens/cart_screen.dart';

import '../../../../../themes/theme_controller.dart';
import '../../../../auth/presentation/controller/auth_controller.dart';
import '../widgets/accounts_tile.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final authController = Get.find<AuthController>();

  // List of options with title and icon // incorrect way since UI rebuild will not occur
  final List<Map<String, dynamic>> accountOptions = [
    {
      'title': 'Purchases',
      'icon': Icons.shopping_bag,
    },
    {
      'title': 'Wishlist',
      'icon': Icons.favorite,
    },
    {
      'title': 'Notifications',
      'icon': Icons.notifications,
    },
    {
      'title': 'Payment Methods',
      'icon': Icons.payment,
    },
    {
      'title': 'Profile',
      'icon': Icons.person,
    },
    {
      'title': 'Settings',
      'icon': Icons.settings,
    },
    {
      'title': 'Help',
      'icon': Icons.help_outline,
    },
    {
      'title': 'Toggle theme',
      'icon': Icons.lightbulb,
    },
    {
      'title': 'Sign out',
      'icon': Icons.logout,
    },
  ];

  final List<AccountsTile> accountTiles = [
    AccountsTile(
      title: 'Purchases',
      icon: Icons.shopping_cart,
      onTap: () {
        // Get.to(() => const PurchasesScreen());
      },
    ),
    AccountsTile(
      title: 'Wishlist',
      icon: Icons.favorite,
      onTap: () {
        Get.to(() => CartOrWishlistScreen());
      },
    ),
    AccountsTile(
      title: 'Notifications',
      icon: Icons.notifications,
      onTap: () {
        // Get.to(() => const NotificationsScreen());
      },
    ),
    AccountsTile(
      title: 'Payment Methods',
      icon: Icons.payment,
      onTap: () {
        // Get.to(() => const PaymentMethodsScreen());
      },
    ),
    AccountsTile(
      title: 'Profile',
      icon: Icons.person,
      onTap: () {
        // Get.to(() => const ProfileScreen());
      },
    ),
    AccountsTile(
      title: 'Settings',
      icon: Icons.settings,
      onTap: () {
        // Get.to(() => const SettingsScreen());
      },
    ),
    AccountsTile(
      title: 'Help',
      icon: Icons.help,
      onTap: () {
        // Get.to(() => const HelpScreen());
      },
    ),
    AccountsTile(
      title: 'Toggle theme',
      icon: Icons.lightbulb_outline,
      onTap: () {
        ThemeController.toggleThemeMode();
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // body: ListView.builder(
      //   itemCount: accountOptions.length,
      //   itemBuilder: (context, index) {
      //     final option = accountOptions[index];
      //
      //     logg.e('Get.isDarkMode: ${Get.isDarkMode} \n Color: ${Theme.of(context).colorScheme.inversePrimary}');
      //     return ListTile(
      //       leading: Icon(
      //         option['icon'],
      //         color: Get.isDarkMode
      //             ? Theme.of(context).colorScheme.inversePrimary
      //             : Theme.of(context).colorScheme.inversePrimary,
      //       ),
      //       title: Text(
      //         option['title'].toString().toUpperCase(),
      //       ),
      //       onTap: () {
      //         // Handle navigation or function based on title
      //         switch (option['title']) {
      //           case 'Purchases':
      //             // Navigate to Purchases screen
      //             //   Get.to(() => const PurchasesScreen());
      //             break;
      //           case 'Wishlist':
      //             // Navigate to Wishlist screen
      //             //   Get.to(() => const WishlistScreen());
      //             break;
      //           case 'Notifications':
      //             // Navigate to Notifications screen
      //             //   Get.to(() => const NotificationsScreen());
      //             break;
      //           case 'Payment Methods':
      //             // Navigate to Payment Methods screen
      //             //   Get.to(() => const PaymentMethodsScreen());
      //             break;
      //           case 'Profile':
      //             // Navigate to Profile screen
      //             //   Get.to(() => const ProfileScreen());
      //             break;
      //           case 'Settings':
      //             // Navigate to Settings screen
      //             //   Get.to(() => const SettingsScreen());
      //             break;
      //           case 'Help':
      //             // Navigate to Help screen
      //             //   Get.to(() => const HelpScreen());
      //             break;
      //           case 'Toggle theme':
      //             // Toggle the app theme
      //             ThemeController.toggleThemeMode();
      //             break;
      //           case 'Sign out':
      //             // Handle sign out
      //             final box = GetStorage();
      //             box.erase();
      //             authController.signOut();
      //             break;
      //           default:
      //             break;
      //         }
      //       },
      //     );
      //   },
      // ),

      body: Column(
        children: [
          Column(
            children: accountTiles,
          ),
          // Separate since requires access to auth controller
          AccountsTile(
            title: 'Sign out',
            icon: Icons.exit_to_app,
            onTap: () {
              final box = GetStorage();
              box.erase();
              authController.signOut();
            },
          ),
        ],
      ),

      // body: ListView.builder(
      //   itemCount: accountTiles.length,
      //   itemBuilder: (context, index) {
      //     return accountTiles[index];
      //   },
      // ),
    );
  }
}
