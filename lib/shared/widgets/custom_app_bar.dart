import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:finance_management_app/core/theme/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    final premiumTheme = Theme.of(context).extension<PremiumTheme>()!;
    return AppBar(
      elevation: 0,
      centerTitle: true,
      forceMaterialTransparency: true,
      foregroundColor: Colors.transparent,
      leading: Icon(Iconsax.arrow_left_2, size: 26, color: premiumTheme.accent),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          color: premiumTheme.accent,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
