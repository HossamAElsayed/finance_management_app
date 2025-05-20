import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';

enum TransactionCategory { grocery, cashFromATM, restaurant, online }

class Transaction extends Equatable {
  final TransactionCategory category;
  final double amount;
  final DateTime transactionDateTime;

  const Transaction(this.category, this.amount, this.transactionDateTime);

  String get categoryText {
    switch (category) {
      case TransactionCategory.cashFromATM:
        return "Cash From ATM";
      case TransactionCategory.restaurant:
        return "Restaurant";
      case TransactionCategory.grocery:
        return "Grocery";
      case TransactionCategory.online:
        return "Online";
    }
  }

  IconData get icon {
    switch (category) {
      case TransactionCategory.cashFromATM:
        return Iconsax.wallet;
      case TransactionCategory.restaurant:
        return Iconsax.receipt;
      case TransactionCategory.grocery:
        return Iconsax.fatrows;
      case TransactionCategory.online:
        return Iconsax.shopping_cart;
    }
  }

  @override
  List<Object?> get props => [category, amount, transactionDateTime];
}

List<Transaction> lastTransactions = [
  Transaction(
    TransactionCategory.cashFromATM,
    240,
    DateTime(2023, 6, 12, 7, 45, 32, 123),
  ),
  Transaction(
    TransactionCategory.online,
    120,
    DateTime(2024, 9, 18, 14, 28, 47, 456),
  ),
  Transaction(
    TransactionCategory.restaurant,
    400,
    DateTime(2022, 12, 5, 22, 37, 59, 789),
  ),
  Transaction(
    TransactionCategory.restaurant,
    400,
    DateTime(2024, 3, 22, 8, 15, 10, 321),
  ),
  Transaction(
    TransactionCategory.restaurant,
    400,
    DateTime(2023, 11, 9, 19, 50, 22, 654),
  ),
  Transaction(
    TransactionCategory.restaurant,
    400,
    DateTime(2023, 4, 27, 16, 25, 44, 210),
  ),
  Transaction(
    TransactionCategory.restaurant,
    400,
    DateTime(2023, 8, 2, 10, 42, 55, 543),
  ),
  Transaction(
    TransactionCategory.restaurant,
    400,
    DateTime(2023, 12, 25, 5, 14, 12, 109),
  ),
];
