import 'package:finance_management_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:finance_management_app/core/theme/app_theme.dart';

class TransactionDetailBottomSheet extends StatelessWidget {
  final Transaction transaction;
  const TransactionDetailBottomSheet({required this.transaction, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final premiumTheme = Theme.of(context).extension<PremiumTheme>()!;
    final isSuccess = transaction.status.toLowerCase() == 'success';

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 48,
              height: 5,
              margin: const EdgeInsets.only(bottom: 18),
              decoration: BoxDecoration(
                color: premiumTheme.accent.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Status Payment',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: premiumTheme.accent,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: premiumTheme.accent),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Icon(
              isSuccess ? Icons.check_circle : Icons.cancel,
              color: isSuccess ? Colors.green : Colors.red,
              size: 64,
            ),
            const SizedBox(height: 8),
            Text(
              '€ ${transaction.amount.toStringAsFixed(2).replaceAll('.', ',')}',
              style: theme.textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: premiumTheme.accent,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              isSuccess
                  ? 'Your payment was successful!'
                  : 'Your payment failed',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: premiumTheme.accent.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 18),
            Container(
              decoration: BoxDecoration(
                color: premiumTheme.card,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: premiumTheme.accent.withValues(alpha: 0.03),
                    blurRadius: 8,
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Column(
                children: [
                  _buildRow(
                    context,
                    'ID Transaction',
                    transaction.transactionId,
                    copy: true,
                  ),
                  _buildRow(
                    context,
                    'Time',
                    _formatDateTime(transaction.transactionDateTime),
                  ),
                  _buildRow(
                    context,
                    'Fee',
                    '€ ${transaction.fee.toStringAsFixed(2).replaceAll('.', ',')}',
                  ),
                  _buildRow(
                    context,
                    'Recipient Bank',
                    transaction.recipientBank,
                  ),
                  _buildRow(context, 'Recipient', transaction.recipientName),
                  _buildRow(
                    context,
                    'Status',
                    transaction.status,
                    valueColor: isSuccess ? Colors.green : Colors.red,
                  ),
                  _buildRow(context, 'Sender', transaction.sender),
                  _buildRow(
                    context,
                    'Source Pockets',
                    transaction.sourcePockets,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.download, color: premiumTheme.accent),
                    label: Text(
                      'Download',
                      style: TextStyle(color: premiumTheme.accent),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: premiumTheme.accent.withValues(alpha: 0.3),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.share),
                    label: const Text('Share'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: premiumTheme.accent,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(
    BuildContext context,
    String label,
    String value, {
    bool copy = false,
    Color? valueColor,
  }) {
    final premiumTheme = Theme.of(context).extension<PremiumTheme>()!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: premiumTheme.accent.withValues(alpha: 0.8),
            ),
          ),
          Row(
            children: [
              Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: valueColor ?? premiumTheme.accent,
                ),
              ),
              if (copy)
                IconButton(
                  icon: Icon(Icons.copy, size: 16, color: premiumTheme.accent),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDateTime(DateTime dt) {
    // Example: Today, 24 Apr at 22:32
    final now = DateTime.now();
    final isToday =
        dt.year == now.year && dt.month == now.month && dt.day == now.day;
    final dateStr = isToday
        ? 'Today'
        : '${dt.day.toString().padLeft(2, '0')} ${_month(dt.month)}';
    final timeStr =
        '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
    return '$dateStr at $timeStr';
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
