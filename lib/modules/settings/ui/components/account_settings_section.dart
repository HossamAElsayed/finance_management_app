import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:finance_management_app/modules/settings/ui/components/setting_option_tile.dart';
import 'package:finance_management_app/modules/settings/ui/components/settings_category_header.dart';

class AccountSettingsSection extends StatelessWidget {
  final VoidCallback? onChangePasswordTap;

  const AccountSettingsSection({super.key, this.onChangePasswordTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SettingsCategoryHeader(title: 'Account'),
        SettingOptionTile(
          title: 'Change Password',
          leadingIcon: Iconsax.password_check,
          trailing: const Icon(Iconsax.arrow_right_3, size: 20),
          onTap: onChangePasswordTap,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
