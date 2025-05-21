import 'package:finance_management_app/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:finance_management_app/core/theme/app_theme.dart';

class TotalExpensesText extends StatelessWidget {
  const TotalExpensesText({super.key});

  @override
  Widget build(BuildContext context) {
    final premiumTheme = Theme.of(context).extension<PremiumTheme>()!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '\$24${expenses.reduce((a, b) => a + b).toStringAsFixed(3)}',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: premiumTheme.accent,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Total Expenses',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: premiumTheme.accent.withValues(alpha: 0.7),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
