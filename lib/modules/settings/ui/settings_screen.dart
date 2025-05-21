import 'package:flutter/material.dart';
import 'package:finance_management_app/modules/settings/ui/components/settings_header.dart';
import 'package:finance_management_app/modules/settings/ui/components/account_settings_section.dart';
import 'package:finance_management_app/modules/settings/ui/components/preferences_settings_section.dart';
import 'package:finance_management_app/modules/settings/ui/components/about_settings_section.dart';
import 'package:finance_management_app/modules/settings/ui/components/logout_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(title: 'Settings'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SettingsHeader(),
            const SizedBox(height: 18),

            const AccountSettingsSection(
              // You can add callbacks here
              // onChangePasswordTap: () => {}
            ),

            const PreferencesSettingsSection(
              // You can add callbacks here
              // onThemeChanged: (value) => {},
              // onBiometricChanged: (value) => {},
            ),

            const AboutSettingsSection(
              // You can customize app version and add callbacks
              appVersion: '1.0.0',
              // onHelpAndSupportTap: () => {},
              // onTermsAndPolicyTap: () => {},
            ),

            LogoutButton(
              onLogoutTap: () {
                // Log out functionality
              },
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
