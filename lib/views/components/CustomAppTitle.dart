import 'package:flutter/material.dart';

class CustomAppTitle extends StatelessWidget {
  final String title;

  const CustomAppTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            title,
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        trailing: MaterialButton(
          onPressed: () {},
          child: Text(
            'View All',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ));
  }
}
