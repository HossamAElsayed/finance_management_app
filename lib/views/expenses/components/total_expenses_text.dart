import 'package:finance_management_app/views/constants/constants.dart';
import 'package:flutter/material.dart';

class TotalExpensesText extends StatelessWidget {
  const TotalExpensesText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '\$${expenses.reduce((a, b) => a + b).toStringAsFixed(3)}',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Text(
            'Total Expenses',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
