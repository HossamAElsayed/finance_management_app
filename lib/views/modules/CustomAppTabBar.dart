import 'package:flutter/material.dart';

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
    return Container(
      width: double.infinity,
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
        // color: Colors.grey[300], // Background color of the tab bar
        borderRadius: BorderRadius.circular(30),
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
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: isEnabled ? Colors.blue : Colors.white.withOpacity(0.5),
        // Background color of the tab item
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: isEnabled ? Colors.white : Colors.black, // Text color
            fontWeight: FontWeight.bold, // Text weight
          ),
        ),
      ),
    );
  }
}
