import 'package:finance_management_app/views/settings/components/setting_option_tile.dart';
import 'package:finance_management_app/views/settings/components/settings_header.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../main.dart'; // Import to access themeModeNotifier

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(title: 'Settings'),
      body: Column(
        children: [
          const SettingsHeader(),
          const SizedBox(height: 18),
          const SettingOptionTile(
            title: 'Change Password',
            trailing: Icon(Iconsax.arrow_right_3, size: 28),
          ),
          SettingOptionTile(title: 'Dark Mode', trailing: ToggleSwitch()),
          const SettingOptionTile(
            title: 'Use Face ID ',
            trailing: ToggleSwitch(),
          ),
        ],
      ),
    );
  }
}

class ToggleSwitch extends StatefulWidget {
  const ToggleSwitch({super.key});

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (context, mode, _) {
        return Switch(
          activeColor: Theme.of(context).secondaryHeaderColor,
          activeTrackColor: Theme.of(context).primaryColor,
          inactiveThumbColor: Colors.grey,
          splashRadius: 50.0,
          value: mode == ThemeMode.dark,
          onChanged: (value) {
            themeModeNotifier.value = value ? ThemeMode.dark : ThemeMode.light;
          },
        );
      },
    );
  }
}
