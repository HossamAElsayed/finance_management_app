import 'package:finance_management_app/core/constants/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:finance_management_app/core/theme/app_theme.dart';

class TotalExpensesChart extends StatefulWidget {
  const TotalExpensesChart({super.key});

  @override
  State<TotalExpensesChart> createState() => _TotalExpensesChartState();
}

class _TotalExpensesChartState extends State<TotalExpensesChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final premiumTheme = Theme.of(context).extension<PremiumTheme>()!;
    return Column(
      children: [
        Container(
          height: 220,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: premiumTheme.glassBackground,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: premiumTheme.accent.withValues(alpha: 0.10),
                blurRadius: 18,
                offset: const Offset(0, 6),
              ),
            ],
            border: Border.all(
              color: premiumTheme.card.withValues(alpha: 0.15),
              width: 1.2,
            ),
          ),
          child: BarChart(
            BarChartData(
              barTouchData: barTouchData(premiumTheme),
              titlesData: titlesData(premiumTheme),
              borderData: borderData,
              barGroups: List.generate(7, (i) {
                return makeGroupData(
                  i,
                  weeklyExpenses[i],
                  isTouched: i == touchedIndex,
                  premiumTheme: premiumTheme,
                );
              }),
              gridData: const FlGridData(show: false),
              alignment: BarChartAlignment.spaceAround,
              maxY: 1000,
            ),
          ),
        ),
      ],
    );
  }

  BarTouchData barTouchData(PremiumTheme premiumTheme) => BarTouchData(
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
      tooltipBorderRadius: BorderRadius.circular(40),
      getTooltipColor: (group) => premiumTheme.card.withValues(alpha: 0.95),
      tooltipPadding: const EdgeInsets.symmetric(horizontal: 12),
      tooltipMargin: 5,
      getTooltipItem:
          (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              TextStyle(
                color: premiumTheme.accent,
                fontWeight: FontWeight.bold,
              ),
            );
          },
    ),
  );

  Widget getBottomTitles(
    double value,
    TitleMeta meta,
    PremiumTheme premiumTheme,
  ) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    String text = days[value.toInt()];
    Color color = value.toInt() == touchedIndex
        ? premiumTheme.accent
        : premiumTheme.card.withValues(alpha: 0.7);
    return SideTitleWidget(
      meta: meta,
      space: 4,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  FlTitlesData titlesData(PremiumTheme premiumTheme) => FlTitlesData(
    show: true,
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 30,
        getTitlesWidget: (value, meta) =>
            getBottomTitles(value, meta, premiumTheme),
      ),
    ),
    leftTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 40,
        getTitlesWidget: (value, meta) {
          return Text(
            value.toInt().toString(),
            style: TextStyle(
              color: premiumTheme.card.withValues(alpha: 0.7),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            textAlign: TextAlign.left,
          );
        },
      ),
    ),
    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
  );

  FlBorderData get borderData => FlBorderData(show: false);

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    PremiumTheme? premiumTheme,
    double width = 24,
    List<int> showTooltips = const [],
  }) {
    premiumTheme ??= Theme.of(context).extension<PremiumTheme>()!;
    Color barColor = premiumTheme.accent.withValues(
      alpha: isTouched ? 0.85 : 0.35,
    );
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? premiumTheme.accent : barColor,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: premiumTheme.accent)
              : BorderSide(
                  color: premiumTheme.card.withValues(alpha: 0.15),
                  width: 0.5,
                ),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 1000,
            color: Colors.transparent,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }
}
