import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CardModel extends Equatable {
  final int id;
  final String name;
  final String bankName;
  final String number;
  final String currency;
  final double available;

  const CardModel(
    this.id,
    this.name,
    this.bankName,
    this.number,
    this.currency,
    this.available,
  );

  @override
  List<Object?> get props => [id, name, bankName, number, currency, available];
}

class CardProvider with ChangeNotifier {
  List<CardModel> cards = const [
    CardModel(0, 'MasterCard', 'X Bank', '4987546982169745', 'EGP', 451.15),
    CardModel(1, 'Visa', 'National Bank', '4570165495523649', 'EGP', 135.2),
  ];

  int getCardLength() {
    return cards.length;
  }
}
