import 'package:flutter/material.dart';
import 'package:finance_management_app/views/home/components/home_action_buttons.dart';
import 'package:finance_management_app/views/home/components/home_balance_card.dart';
import 'package:finance_management_app/views/home/components/home_transactions_log.dart';
import 'package:finance_management_app/theme/app_theme.dart';
import 'components/home_user_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final premiumTheme = Theme.of(context).extension<PremiumTheme>()!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                gradient: premiumTheme.mainGradient,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: premiumTheme.accent.withValues(alpha: 0.08),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 32),
                  HomeUserTile(),
                  HomeBalanceCard(),
                  SizedBox(height: 23),
                  HomeActionButtons(),
                  SizedBox(height: 15.0),
                ],
              ),
            ),
            const HomeTransactionsLog(),
          ],
        ),
      ),
    );
  }
}
