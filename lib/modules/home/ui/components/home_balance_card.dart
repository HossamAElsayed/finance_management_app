import 'package:finance_management_app/core/theme/app_theme.dart';
import 'package:finance_management_app/shared/widgets/custom_app_dot.dart';
import 'package:flutter/material.dart';

class HomeBalanceCard extends StatelessWidget {
  const HomeBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final premiumTheme = Theme.of(context).extension<PremiumTheme>()!;
    return Container(
      height: 180,
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      decoration: BoxDecoration(
        color: premiumTheme.glassBackground,
        borderRadius: const BorderRadius.all(Radius.circular(18)),
        boxShadow: [
          BoxShadow(
            color: premiumTheme.accent.withValues(alpha: 0.10),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
        // Optionally add a border for more glass effect
        border: Border.all(
          color: premiumTheme.card.withValues(alpha: 0.15),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Balance",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: premiumTheme.accent,
              fontWeight: FontWeight.w600,
            ),
          ),
          RichText(
            text: TextSpan(
              text: '\$',
              style: TextStyle(
                color: premiumTheme.accent.withValues(alpha: 0.7),
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: '345.463',
                  style: TextStyle(
                    color: premiumTheme.accent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 20),
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                CustomMonthlyInfoTile(
                  dotColor: Colors.white,
                  dotSize: 6,
                  title: 'Monthly Cash in',
                  amount: 645,
                ),
                CustomMonthlyInfoTile(
                  dotColor: Colors.amber,
                  dotSize: 6,
                  title: 'Monthly Expense',
                  amount: -234,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomMonthlyInfoTile extends StatelessWidget {
  final String title;
  final double dotSize;
  final Color dotColor;
  final double amount;

  const CustomMonthlyInfoTile({
    super.key,
    required this.dotSize,
    required this.dotColor,
    required this.title,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final premiumTheme = Theme.of(context).extension<PremiumTheme>()!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            spacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              CustomAppDot(size: dotSize, color: dotColor),
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: premiumTheme.accent,
                ),
              ),
            ],
          ),
          Text(
            '${amount > 0 ? "+" : "-"}\$${amount.abs().toStringAsFixed(2)}',
            style: TextStyle(fontSize: 15, color: premiumTheme.accent),
          ),
        ],
      ),
    );
  }
}
