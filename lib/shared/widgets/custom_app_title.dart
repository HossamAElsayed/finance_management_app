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
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      trailing: TextButton(
        onPressed: () {
          // Handle button press
        },
        child: Text(
          'View All',
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.blue),
        ),
      ),
    );
  }
}
