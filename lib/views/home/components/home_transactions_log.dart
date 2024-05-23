import 'package:finance_management_app/models/transaction.dart';
import 'package:finance_management_app/views/home/components/home_transaction_tile.dart';
import 'package:finance_management_app/views/modules/CustomAppTitle.dart';
import 'package:flutter/material.dart';

class HomeTransactionsLog extends StatelessWidget {
  const HomeTransactionsLog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppTitle(title: 'Transactions'),
        ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: lastTransactions.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return HomeTransactionTile(transaction: lastTransactions[index]);
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ],
    );
  }
}
