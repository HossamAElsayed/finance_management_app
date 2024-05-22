import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';

enum TransactionCategory { Grocery, CashFromATM, Resturant, Online }

class Transaction extends Equatable {
  final TransactionCategory category;
  final double amount;
  final DateTime transactionDateTime;

  const Transaction(this.category, this.amount, this.transactionDateTime);

  String get categoryText {
    switch (category) {
      case TransactionCategory.CashFromATM:
        return "Cash From ATM";
      case TransactionCategory.Resturant:
        return "Resturant";
      case TransactionCategory.Grocery:
        return "Grocery";
      case TransactionCategory.Online:
        return "Online";
    }
  }

  IconData get icon {
    switch (category) {
      case TransactionCategory.CashFromATM:
        return Iconsax.wallet;
      case TransactionCategory.Resturant:
        return Iconsax.receipt;
      case TransactionCategory.Grocery:
        return Iconsax.fatrows;
      case TransactionCategory.Online:
        return Iconsax.shopping_cart;
    }
  }

  @override
  List<Object?> get props => [category, amount, transactionDateTime];
}

List<Transaction> lastTransactions = [
  Transaction(TransactionCategory.CashFromATM, 240, DateTime(2024)),
  Transaction(TransactionCategory.Online, 120, DateTime.now()),
  Transaction(TransactionCategory.Resturant, 400, DateTime(2021)),
  Transaction(TransactionCategory.Resturant, 400, DateTime(2021)),
  Transaction(TransactionCategory.Resturant, 400, DateTime(2021)),
  Transaction(TransactionCategory.Resturant, 400, DateTime(2021)),
  Transaction(TransactionCategory.Resturant, 400, DateTime(2021)),
  Transaction(TransactionCategory.Resturant, 400, DateTime(2021)),
];
