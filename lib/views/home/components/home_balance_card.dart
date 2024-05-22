import 'package:finance_management_app/views/components/CustomAppDot.dart';
import 'package:flutter/material.dart';

class HomeBalanceCard extends StatelessWidget {
  const HomeBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        decoration: BoxDecoration(
          color: Colors.white10.withOpacity(0.2),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("Balance",
              style: TextStyle(fontSize: 18, color: Colors.white)),
          RichText(
            text: const TextSpan(
              text: '\$',
              style: TextStyle(
                  color: Colors.white54,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: '345.463',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Expanded(
              child: ListView(
            padding: const EdgeInsets.only(top: 20),
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              CustomMonthlyInfoTile(
                dotColor: Colors.white,
                dotSize: 6,
                title: 'Monthly Cash in',
                amount: 645,
              ),
              CustomMonthlyInfoTile(
                dotColor: Colors.amber,
                dotSize: 6,
                title: 'Monthly Expense',
                amount: -234,
              ),
            ],
          ))
        ]));
  }
}

class CustomMonthlyInfoTile extends StatelessWidget {
  final String title;
  final double dotSize;
  final Color dotColor;
  final double amount;

  const CustomMonthlyInfoTile({
    super.key,
    required this.dotSize,
    required this.dotColor,
    required this.title,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            spacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              CustomAppDot(dotSize: dotSize, dotColor: dotColor),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
            ],
          ),
          Text(
            '${amount > 0 ? "+" : "-"}\$${amount.abs().toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
    // return ListTile(
    //   horizontalTitleGap: 0,
    //   contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
    //   leading: CustomAppDot(dotSize: dotSize, dotColor: dotColor),
    //   title: Text(
    //     title,
    //     style: const TextStyle(
    //         fontSize: 15, fontWeight: FontWeight.w300, color: Colors.white),
    //   ),
    //   trailing: Text(
    //     '${money > 0 ? "+" : "-"}\$${money.abs().toStringAsFixed(2)}',
    //     style: const TextStyle(
    //       fontSize: 15,
    //       color: Colors.white,
    //     ),
    //   ),
    // );
  }
}
