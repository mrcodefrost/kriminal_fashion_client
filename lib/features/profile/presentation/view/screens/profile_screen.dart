import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ProfileTile(
            title: Text('NAME'),
          ),
          ProfileTile(
            title: Text('ADDRESSES'),
          ),
          ProfileTile(
            title: Text('EMAIL'),
            subtitle: Text('mr.codefrost@gmail.com'),
          ),
          ProfileTile(
            title: Text('PHONE'),
            subtitle: Text('+91 1234567890'),
          ),
          ProfileTile(
            title: Text('PASSWORD'),
            subtitle: Text('********'),
          ),
          ProfileTile(
            title: Text('VOUCHERS'),
          ),
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final Text title;
  final Text? subtitle;

  const ProfileTile({super.key, this.subtitle, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      subtitle: subtitle,
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
