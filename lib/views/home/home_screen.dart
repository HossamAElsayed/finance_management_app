import 'package:finance_management_app/views/home/components/home_action_buttons.dart';
import 'package:finance_management_app/views/home/components/home_balance_card.dart';
import 'package:finance_management_app/views/home/components/home_transactions_log.dart';
import 'package:flutter/material.dart';

import 'components/home_user_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 400,
            decoration: const BoxDecoration(
                color: Color(0xff008dda),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )),
            child: const Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 32),
                HomeUserTile(),
                HomeBalanceCard(),
                SizedBox(height: 23),
                HomeActionButtons(),
                SizedBox(height: 15.0)
              ],
            ),
          ),
          const HomeTransactionsLog(),
        ]),
      ),
    );
  }
}
