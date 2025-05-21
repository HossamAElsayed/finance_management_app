import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:finance_management_app/modules/settings/ui/components/setting_option_tile.dart';
import 'package:finance_management_app/modules/settings/ui/components/settings_category_header.dart';

class AboutSettingsSection extends StatelessWidget {
  final VoidCallback? onHelpAndSupportTap;
  final VoidCallback? onTermsAndPolicyTap;
  final String appVersion;

  const AboutSettingsSection({
    super.key,
    this.onHelpAndSupportTap,
    this.onTermsAndPolicyTap,
    this.appVersion = '1.0.0',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SettingsCategoryHeader(title: 'About'),
        SettingOptionTile(
          title: 'Help & Support',
          leadingIcon: Iconsax.message_question,
          trailing: const Icon(Iconsax.arrow_right_3, size: 20),
          onTap: onHelpAndSupportTap,
        ),
        SettingOptionTile(
          title: 'Terms & Privacy Policy',
          leadingIcon: Iconsax.document_text,
          trailing: const Icon(Iconsax.arrow_right_3, size: 20),
          onTap: onTermsAndPolicyTap,
        ),
        SettingOptionTile(
          title: 'App Version',
          leadingIcon: Iconsax.info_circle,
          trailing: Text(appVersion),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
