import 'package:finance_management_app/core/theme/app_theme.dart';
import 'package:finance_management_app/core/theme/theme_export.dart';
import 'package:finance_management_app/modules/expenses/ui/expenses_screen.dart';
import 'package:finance_management_app/modules/home/ui/home_screen.dart';
import 'package:finance_management_app/modules/settings/ui/settings_screen.dart';
import 'package:finance_management_app/modules/wallet/ui/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

// Use a ValueNotifier for theme switching
final ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier(
  ThemeMode.light,
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (context, mode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: mode,
          home: const BottomNavBar(),
        );
      },
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 1;

  void _onItemTapped(int index) {
    setState(() => _currentIndex = index);
  }

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    WalletScreen(),
    ExpensesScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        selectedItemColor: Theme.of(context).primaryColor,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(color: Colors.blue),
        currentIndex: _currentIndex,
        onTap: (index) => _onItemTapped(index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Iconsax.home_2), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.wallet_3),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.money_send),
            label: 'Expense',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.setting),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
