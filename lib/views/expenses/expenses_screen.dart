import 'package:finance_management_app/views/expenses/components/total_expenses_chart.dart';
import 'package:finance_management_app/views/expenses/components/total_expenses_text.dart';
import 'package:finance_management_app/views/modules/CustomAppBar.dart';
import 'package:finance_management_app/views/modules/CustomAppTabBar.dart';
import 'package:flutter/material.dart';

import '../home/components/home_transactions_log.dart';
import 'components/last_week_expense.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Expense'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppTabBar(tabs: ['Weekly', 'Monthly', 'Yearly', 'All Time']),
            TotalExpensesText(),
            TotalExpensesChart(),
            LastWeekExpense(),
            HomeTransactionsLog(),
          ],
        ),
      ),
    );
  }
}
