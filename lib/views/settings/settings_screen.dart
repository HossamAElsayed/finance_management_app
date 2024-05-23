import 'package:finance_management_app/views/constants/theme.dart';
import 'package:finance_management_app/views/modules/CustomAppBar.dart';
import 'package:finance_management_app/views/settings/components/setting_option_tile.dart';
import 'package:finance_management_app/views/settings/components/settings_header.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

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
            trailing: Icon(
              Iconsax.arrow_right_3,
              size: 28,
            ),
          ),
          SettingOptionTile(
            title: 'Dark Mode',
            trailing: ToggleSwitch(
              isEnable: Provider.of<ThemeModel>(context).isDark,
            ),
          ),
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
  final bool isEnable;

  const ToggleSwitch({this.isEnable = false, super.key});

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  late bool isSwitched;

  @override
  void initState() {
    isSwitched = widget.isEnable;
    super.initState();
  }

  void _toggleSwitch(bool value) {
    ThemeModel themeModel = Provider.of<ThemeModel>(context, listen: false);
    ThemeData newTheme = !isSwitched ? AppTheme.darkTheme : AppTheme.lightTheme;
    themeModel.setTheme(newTheme);

    setState(() {
      isSwitched = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: Theme.of(context).secondaryHeaderColor,
      activeTrackColor: Theme.of(context).primaryColor,
      inactiveThumbColor: Colors.grey,
      splashRadius: 50.0,
      value: isSwitched,
      onChanged: _toggleSwitch,
    );
  }
}
