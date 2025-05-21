import 'package:finance_management_app/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionDetailBottomSheet extends StatelessWidget {
  final Transaction transaction;
  const TransactionDetailBottomSheet({required this.transaction, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                color: Colors.grey.withValues(alpha: 0.2),
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
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Icon(Icons.check_circle, color: Colors.green, size: 64),
            const SizedBox(height: 8),
            Text(
              '€ ${transaction.amount.toStringAsFixed(2).replaceAll('.', ',')}',
              style: theme.textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              isSuccess
                  ? 'Your payment was successful!'
                  : 'Your payment failed',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 18),
            Container(
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 8,
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Column(
                children: [
                  _row('ID Transaction', transaction.transactionId, copy: true),
                  _row(
                    'Time',
                    _formatDateTime(transaction.transactionDateTime),
                  ),
                  _row(
                    'Fee',
                    '€ ${transaction.fee.toStringAsFixed(2).replaceAll('.', ',')}',
                  ),
                  _row('Recipient Bank', transaction.recipientBank),
                  _row('Recipient', transaction.recipientName),
                  _row(
                    'Status',
                    transaction.status,
                    valueColor: isSuccess ? Colors.green : Colors.red,
                  ),
                  _row('Sender', transaction.sender),
                  _row('Source Pockets', transaction.sourcePockets),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.download),
                    label: const Text('Download'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.share),
                    label: const Text('Share'),
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

  Widget _row(
    String label,
    String value, {
    bool copy = false,
    Color? valueColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Row(
            children: [
              Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: valueColor,
                ),
              ),
              if (copy)
                IconButton(
                  icon: const Icon(Icons.copy, size: 16),
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
