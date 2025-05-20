import 'package:finance_management_app/views/modules/icon_with_circle.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:finance_management_app/models/transaction.dart';

class HomeTransactionTile extends StatelessWidget {
  final Transaction transaction;

  const HomeTransactionTile({required this.transaction, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconWithCircle(
        icon: Icon(
          transaction.icon,
          size: 28,
          color: Theme.of(context).primaryColor,
        ),
        circleColor: Theme.of(context).primaryColor.withValues(alpha: 0.3),
      ),
      title: Text(
        transaction.categoryText,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      subtitle: Text(
        DateFormat('MMM dd, yyyy').format(transaction.transactionDateTime),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '-\$${transaction.amount.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            DateFormat('HH:mm').format(transaction.transactionDateTime),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
