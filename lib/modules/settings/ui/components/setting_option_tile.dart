import 'package:flutter/material.dart';
import 'package:finance_management_app/core/theme/app_theme.dart';

class SettingOptionTile extends StatelessWidget {
  final String title;
  final Widget trailing;
  final VoidCallback? onTap;
  final Widget? subtitle;
  final IconData? leadingIcon;

  const SettingOptionTile({
    super.key,
    required this.title,
    required this.trailing,
    this.onTap,
    this.subtitle,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    final premiumTheme = Theme.of(context).extension<PremiumTheme>()!;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Theme.of(context).dividerColor.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: leadingIcon != null
            ? Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: premiumTheme.accent.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(leadingIcon, color: premiumTheme.accent, size: 24),
              )
            : null,
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: premiumTheme.accent,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: subtitle,
        trailing: IconTheme(
          data: IconThemeData(color: premiumTheme.accent),
          child: trailing,
        ),
        onTap: onTap,
      ),
    );
  }
}
