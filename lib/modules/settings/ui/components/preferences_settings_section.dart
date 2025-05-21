import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:finance_management_app/modules/settings/ui/components/setting_option_tile.dart';
import 'package:finance_management_app/modules/settings/ui/components/settings_category_header.dart';
import 'package:finance_management_app/modules/settings/ui/components/toggle_switch.dart';

class PreferencesSettingsSection extends StatelessWidget {
  final Function(bool)? onThemeChanged;
  final Function(bool)? onBiometricChanged;

  const PreferencesSettingsSection({
    super.key,
    this.onThemeChanged,
    this.onBiometricChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SettingsCategoryHeader(title: 'Preferences'),
        const SettingOptionTile(
          title: 'Dark Mode',
          leadingIcon: Iconsax.moon,
          trailing: ToggleSwitch(),
          subtitle: Text('Switch between light and dark appearance'),
        ),
        const SettingOptionTile(
          title: 'Use Face ID',
          leadingIcon: Iconsax.scan,
          trailing: ToggleSwitch(isThemeSwitch: false),
          subtitle: Text('Use biometric authentication for login'),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
