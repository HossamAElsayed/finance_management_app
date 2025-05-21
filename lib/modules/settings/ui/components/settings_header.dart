import 'package:finance_management_app/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:finance_management_app/core/theme/app_theme.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final premiumTheme = Theme.of(context).extension<PremiumTheme>()!;
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        gradient: premiumTheme.mainGradient,
        boxShadow: [
          BoxShadow(
            color: premiumTheme.accent.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 18),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: premiumTheme.accent),
              ),
              Text(
                currentUser.email,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontSize: 24,
                  color: premiumTheme.accent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
