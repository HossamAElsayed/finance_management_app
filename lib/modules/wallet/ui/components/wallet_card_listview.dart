import 'package:finance_management_app/models/card.dart';
import 'package:finance_management_app/modules/wallet/ui/components/wallet_bank_card.dart';
import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  final List<CardModel> cards;

  const CardList({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 12),
        children: cards.map((card) => BankCard(card)).toList());
  }
}
