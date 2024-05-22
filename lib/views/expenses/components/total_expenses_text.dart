import 'package:flutter/material.dart';

class TotalExpensesText extends StatelessWidget {
  const TotalExpensesText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '\$1000.00',
            style: TextStyle(fontSize: 28.0),
          ),
          Text(
            'Total Expenses',
            style: TextStyle(
                color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
