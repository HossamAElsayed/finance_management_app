import 'package:finance_management_app/views/constants/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LastWeekExpense extends StatelessWidget {
  const LastWeekExpense({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
        color: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
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
                  color: Colors.blue.withOpacity(0.5),
                  isStrokeCapRound: true,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: false,
                    color: Colors.blue.withOpacity(0.1),
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
            const Text('Last Week Expense'),
            Wrap(
              spacing: 5,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Icon(
                  Iconsax.trend_up,
                  color: Colors.red,
                  size: 18,
                ),
                Text(
                  '-$lastWeekExpenseChange%',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
