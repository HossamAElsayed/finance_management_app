import 'package:flutter/material.dart';
import 'package:finance_management_app/core/theme/app_theme.dart';

class SettingOptionTile extends StatelessWidget {
  final String title;
  final Widget trailing;

  const SettingOptionTile({
    super.key,
    required this.title,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final premiumTheme = Theme.of(context).extension<PremiumTheme>()!;
    return ListTile(
      title: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.bodyLarge?.copyWith(color: premiumTheme.accent),
      ),
      trailing: IconTheme(
        data: IconThemeData(color: premiumTheme.accent),
        child: trailing,
      ),
      onTap: () {},
    );
  }
}
