import 'package:flutter/material.dart';

class AccountsTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const AccountsTile({super.key, required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.secondary,
      ),
      title: Text(title.toUpperCase()),
      onTap: onTap,
    );
  }
}
