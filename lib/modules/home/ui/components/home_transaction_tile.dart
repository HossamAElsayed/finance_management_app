import 'package:finance_management_app/modules/home/ui/components/transaction_detail_bottomsheet.dart';
import 'package:finance_management_app/shared/widgets/icon_with_circle.dart';
import 'package:flutter/material.dart';
import 'package:finance_management_app/models/transaction.dart';
import 'package:finance_management_app/core/theme/app_theme.dart';
import 'dart:ui';

class HomeTransactionTile extends StatelessWidget {
  final Transaction transaction;

  const HomeTransactionTile({required this.transaction, super.key});

  @override
  Widget build(BuildContext context) {
    final premiumTheme = Theme.of(context).extension<PremiumTheme>()!;
    final categoryColor = _getCategoryColor(transaction.category);
    final statusColor = _getStatusColor(transaction.status);
    final amountStr = _formatAmount(transaction.amount);
    final subtitle = _formatSubtitle(
      transaction.recipientBank,
      transaction.transactionDateTime,
    );

    return Hero(
      tag: 'transaction-${transaction.hashCode}',
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: premiumTheme.card,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: premiumTheme.accent.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(28),
                    ),
                  ),
                  builder: (context) =>
                      TransactionDetailBottomSheet(transaction: transaction),
                );
              },
              splashColor: categoryColor.withValues(alpha: 0.1),
              highlightColor: categoryColor.withValues(alpha: 0.05),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: categoryColor.withValues(alpha: 0.12),
                      ),
                      child: IconWithCircle(
                        icon: Icon(
                          transaction.icon,
                          size: 24,
                          color: Colors.white,
                        ),
                        circleColor: categoryColor,
                        size: 44,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transaction.recipientName.isNotEmpty
                                ? transaction.recipientName
                                : transaction.categoryText,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: premiumTheme.accent,
                                ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            subtitle,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: premiumTheme.accent.withValues(
                                    alpha: 0.6,
                                  ),
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          amountStr,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: premiumTheme.accent,
                                fontSize: 16,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          transaction.status,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: statusColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getCategoryColor(TransactionCategory category) {
    switch (category) {
      case TransactionCategory.cashFromATM:
        return Colors.blue;
      case TransactionCategory.restaurant:
        return Colors.orange;
      case TransactionCategory.grocery:
        return Colors.green;
      case TransactionCategory.online:
        return Colors.purple;
    }
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'success':
        return Colors.green;
      case 'pending':
        return Colors.blue;
      case 'cancel':
      case 'failed':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _formatAmount(double amount) {
    final str = amount.toStringAsFixed(2).replaceAll('.', ',');
    return '€ $str';
  }

  String _formatSubtitle(String bank, DateTime date) {
    final dateStr =
        '${date.day.toString().padLeft(2, '0')} ${_month(date.month)} ${date.year}';
    return bank.isNotEmpty ? '$bank • $dateStr' : dateStr;
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
