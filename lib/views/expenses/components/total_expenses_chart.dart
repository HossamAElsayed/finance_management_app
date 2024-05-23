import 'package:finance_management_app/views/constants/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TotalExpensesChart extends StatefulWidget {
  const TotalExpensesChart({super.key});

  @override
  State<TotalExpensesChart> createState() => _TotalExpensesChartState();
}

class _TotalExpensesChartState extends State<TotalExpensesChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 220,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: BarChart(
            BarChartData(
                barTouchData: barTouchData,
                titlesData: titlesData,
                borderData: borderData,
                barGroups: List.generate(7, (i) {
                  return makeGroupData(i, weeklyExpenses[i],
                      isTouched: i == touchedIndex);
                }),
                gridData: const FlGridData(show: false),
                alignment: BarChartAlignment.spaceAround,
                maxY: 1000),
          ),
        ),
      ],
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: true,
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
        touchTooltipData: BarTouchTooltipData(
          tooltipRoundedRadius: 40,
          getTooltipColor: (group) => Colors.blue,
          tooltipPadding: const EdgeInsets.symmetric(horizontal: 12),
          tooltipMargin: 5,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getBottomTitles(double value, TitleMeta meta) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    String text = days[value.toInt()];

    Color color = value.toInt() == touchedIndex ? Colors.blue : Colors.grey;

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          )),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getBottomTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            getTitlesWidget: (value, meta) {
              return Text(
                value.toInt().toString(),
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                textAlign: TextAlign.left,
              );
            },
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 24,
    List<int> showTooltips = const [],
  }) {
    barColor ??= Colors.grey.withOpacity(0.2);
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? Colors.blue : barColor,
          width: width,
          borderSide: isTouched
              ? const BorderSide(color: Colors.blue)
              : const BorderSide(color: Colors.transparent, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
              show: true, toY: 1000, color: Colors.transparent),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }
}
