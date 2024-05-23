import 'package:finance_management_app/views/constants/theme.dart';
import 'package:finance_management_app/views/expenses/expenses_screen.dart';
import 'package:finance_management_app/views/home/home_screen.dart';
import 'package:finance_management_app/views/settings/settings_screen.dart';
import 'package:finance_management_app/views/wallet/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: const MyApp(),
    ),
  );
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeModel>(context).currentTheme,
        // darkTheme: AppTheme.darkTheme,
        // themeMode: ThemeMode.light,
        home: const BottomNavBar());
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
        selectedItemColor: Colors.blue,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(color: Colors.blue),
        currentIndex: _currentIndex,
        onTap: (index) => _onItemTapped(index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home_2),
            label: 'Home',
          ),
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
