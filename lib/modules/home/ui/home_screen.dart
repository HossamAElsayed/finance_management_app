import 'package:flutter/material.dart';
import 'package:finance_management_app/modules/home/ui/components/home_action_buttons.dart';
import 'package:finance_management_app/modules/home/ui/components/home_balance_card.dart';
import 'package:finance_management_app/modules/home/ui/components/home_transactions_log.dart';
import 'package:finance_management_app/core/theme/app_theme.dart';
import 'package:finance_management_app/modules/home/ui/components/home_user_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final premiumTheme = Theme.of(context).extension<PremiumTheme>()!;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          // Background gradient effect
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: premiumTheme.accent.withValues(alpha: 0.05),
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: premiumTheme.accent.withValues(alpha: 0.05),
              ),
            ),
          ),
          // Main content
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  // Removed fixed height to prevent overflow
                  decoration: BoxDecoration(
                    gradient: premiumTheme.mainGradient,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: premiumTheme.accent.withValues(alpha: 0.1),
                        blurRadius: 24,
                        spreadRadius: 2,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.only(bottom: 16),
                  child: const Column(
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
                // Transactions section with improved spacing
                Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  child: const HomeTransactionsLog(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
