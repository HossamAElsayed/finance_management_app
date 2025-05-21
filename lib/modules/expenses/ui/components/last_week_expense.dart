import 'package:finance_management_app/core/constants/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:finance_management_app/core/theme/app_theme.dart';

class LastWeekExpense extends StatelessWidget {
  const LastWeekExpense({super.key});

  @override
  Widget build(BuildContext context) {
    final premiumTheme = Theme.of(context).extension<PremiumTheme>()!;
    // Create a list of FlSpot objects from weekly expenses
    final List<FlSpot> spots = [];
    for (int i = 0; i < weeklyExpenses.length; i++) {
      spots.add(FlSpot(i.toDouble(), weeklyExpenses[i]));
    }

    const double balanceAmount = 1000.0;
    final double lastWeekExpense = expenses.isNotEmpty ? expenses.last : 0.0;
    final String lastWeekExpenseChange =
        ((lastWeekExpense / balanceAmount) * 100).ceil().toString();

    return Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      decoration: BoxDecoration(
        gradient: premiumTheme.mainGradient,
        borderRadius: const BorderRadius.all(Radius.circular(14)),
        boxShadow: [
          BoxShadow(
            color: premiumTheme.accent.withValues(alpha: 0.10),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(
          color: premiumTheme.card.withValues(alpha: 0.18),
          width: 1.2,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 5),
        leading: SizedBox(
          width: 120,
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: false, drawVerticalLine: false),
              titlesData: const FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              lineTouchData: const LineTouchData(enabled: false),
              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  color: premiumTheme.accent.withValues(alpha: 0.7),
                  isStrokeCapRound: true,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    color: premiumTheme.accent.withValues(alpha: 0.15),
                  ),
                ),
              ],
            ),
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Last Week Expense',
              style: TextStyle(
                color: premiumTheme.accent,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            Wrap(
              spacing: 5,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(
                  Iconsax.trend_up,
                  color: Theme.of(context).colorScheme.error,
                  size: 18,
                ),
                Text(
                  '-$lastWeekExpenseChange%',
                  style: TextStyle(
                    fontSize: 18,
                    color: premiumTheme.accent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
