import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        leading: const Icon(
          Iconsax.arrow_left_2,
          size: 26,
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
