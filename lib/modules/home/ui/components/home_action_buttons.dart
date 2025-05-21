import 'package:finance_management_app/shared/widgets/icon_with_circle.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:finance_management_app/core/theme/app_theme.dart';

class HomeActionButtons extends StatelessWidget {
  const HomeActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final premiumTheme = Theme.of(context).extension<PremiumTheme>()!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomHomeButton(
          icon: Icon(Iconsax.scan_barcode, color: premiumTheme.accent),
          foregroundColor: premiumTheme.accent,
          backgroundColor: premiumTheme.card,
          circleColor: premiumTheme.accent.withValues(alpha: 0.08),
          title: 'Pay or Transfer',
        ),
        CustomHomeButton(
          icon: Icon(Iconsax.wallet, color: Colors.white),
          foregroundColor: Colors.white,
          backgroundColor: premiumTheme.accent,
          circleColor: premiumTheme.accent.withValues(alpha: 0.5),
          title: 'Add Money',
        ),
      ],
    );
  }
}

class CustomHomeButton extends StatelessWidget {
  final Icon icon;
  final String title;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color circleColor;

  const CustomHomeButton({
    required this.icon,
    required this.title,
    required this.foregroundColor,
    required this.backgroundColor,
    this.circleColor = Colors.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final premiumTheme = Theme.of(context).extension<PremiumTheme>()!;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 5,
        ).copyWith(right: 18),
        side: BorderSide(color: premiumTheme.card.withValues(alpha: 0.18)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
      ),
      onPressed: () {},
      child: Wrap(
        spacing: 5,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          IconWithCircle(icon: icon, circleColor: circleColor),
          Text(title),
        ],
      ),
    );
  }
}
