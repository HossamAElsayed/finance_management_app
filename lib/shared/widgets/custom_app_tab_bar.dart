import 'package:flutter/material.dart';
import 'package:finance_management_app/core/theme/app_theme.dart';

class CustomAppTabBar extends StatefulWidget {
  final List<String> tabs;

  const CustomAppTabBar({required this.tabs, super.key});

  @override
  State<CustomAppTabBar> createState() => _CustomAppTabBarState();
}

class _CustomAppTabBarState extends State<CustomAppTabBar> {
  int _currentTab = 0;

  void _changeTab(int tabIndex) {
    setState(() {
      _currentTab = tabIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final premiumTheme = Theme.of(context).extension<PremiumTheme>()!;
    return Container(
      width: double.infinity,
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: premiumTheme.card.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: premiumTheme.accent.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: premiumTheme.card.withValues(alpha: 0.15),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          widget.tabs.length,
          (index) => GestureDetector(
            onTap: () => _changeTab(index),
            child: TabItem(
              isEnabled: index == _currentTab,
              title: widget.tabs[index],
            ),
          ),
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final bool isEnabled;
  final String title;

  const TabItem({required this.isEnabled, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    final premiumTheme = Theme.of(context).extension<PremiumTheme>()!;
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: isEnabled
            ? premiumTheme.accent
            : premiumTheme.card.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(30),
        boxShadow: isEnabled
            ? [
                BoxShadow(
                  color: premiumTheme.accent.withValues(alpha: 0.10),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : [],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: isEnabled ? Colors.white : premiumTheme.accent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
