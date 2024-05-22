import 'package:finance_management_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:finance_management_app/views/components/IconWithCircle.dart';

class HomeTransactionTile extends StatelessWidget {
  final Transaction transaction; // title text

  const HomeTransactionTile({required this.transaction, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconWithCircle(
          icon: Icon(
            transaction.icon,
            size: 28,
            color: Colors.white,
          ),
          circleColor: Colors.blue.withOpacity(0.5)),
      title: Text(transaction.categoryText),
      subtitle: Text(
          DateFormat('MMM dd,yyyy').format(transaction.transactionDateTime)),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '-\$${transaction.amount.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          Text(
            DateFormat('HH.mm').format(transaction.transactionDateTime),
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ],
      ),
      minTileHeight: 1,
    );
  }
}
