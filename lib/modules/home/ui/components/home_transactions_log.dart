import 'package:finance_management_app/models/transaction.dart';
import 'package:finance_management_app/modules/home/ui/components/home_transaction_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finance_management_app/core/theme/app_theme.dart';
import '../../logic/transactions_bloc.dart';

class HomeTransactionsLog extends StatelessWidget {
  const HomeTransactionsLog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          TransactionsBloc()..add(LoadTransactionsEvent(lastTransactions)),
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            _buildHeader(context),
            const SizedBox(height: 12),
            BlocBuilder<TransactionsBloc, TransactionsState>(
              builder: (context, state) {
                if (state is TransactionsLoaded) {
                  final grouped = state.groupedTransactions;
                  return ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: grouped.length,
                    itemBuilder: (context, i) {
                      final group = grouped[i];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                            child: Text(
                              _formatSectionHeader(
                                group['date'] as DateTime,
                                i == 0,
                              ),
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(
                                      context,
                                    ).extension<PremiumTheme>()!.accent,
                                  ),
                            ),
                          ),
                          ...((group['items'] as List<Transaction>)
                              .map((tx) => HomeTransactionTile(transaction: tx))
                              .toList()),
                        ],
                      );
                    },
                  );
                } else if (state is TransactionsInitial) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return _buildEmptyState(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final premiumTheme = Theme.of(context).extension<PremiumTheme>()!;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: premiumTheme.accent.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.receipt_long,
                  color: premiumTheme.accent,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Recent Transactions',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                  color: premiumTheme.accent,
                ),
              ),
            ],
          ),
          TextButton.icon(
            onPressed: () {
              // Handle view all transactions
            },
            icon: Icon(
              Icons.arrow_forward,
              size: 16,
              color: premiumTheme.accent,
            ),
            label: Text(
              'View All',
              style: TextStyle(color: premiumTheme.accent),
            ),
            style: TextButton.styleFrom(
              foregroundColor: premiumTheme.accent,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final premiumTheme = Theme.of(context).extension<PremiumTheme>()!;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          Icon(
            Icons.receipt_long,
            size: 48,
            color: premiumTheme.accent.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 16),
          Text(
            'No transactions yet',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: premiumTheme.accent.withValues(alpha: 0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Your recent transactions will appear here',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: premiumTheme.accent.withValues(alpha: 0.5),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  String _formatSectionHeader(DateTime date, bool isFirst) {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));
    if (isFirst) return 'Last Payment';
    if (date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day) {
      return 'Yesterday, ${date.day.toString().padLeft(2, '0')} ${_month(date.month)}';
    }
    return '${date.day.toString().padLeft(2, '0')} ${_month(date.month)} ${date.year}';
  }

  String _month(int m) {
    const months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[m];
  }
}
