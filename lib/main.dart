import 'package:finance_management_app/views/expenses/expenses_screen.dart';
import 'package:flutter/material.dart';
import 'package:finance_management_app/views/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.red,
          primarySwatch: Colors.amber,
        ),
        home: const ExpensesScreen());
  }
}
