import 'package:flutter/material.dart';

class SettingOptionTile extends StatelessWidget {
  final String title;
  final Widget trailing;

  const SettingOptionTile(
      {super.key, required this.title, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: trailing,
      onTap: () {},
    );
  }
}
