part of 'transactions_bloc.dart';

abstract class TransactionsEvent extends Equatable {
  const TransactionsEvent();
  @override
  List<Object?> get props => [];
}

class LoadTransactionsEvent extends TransactionsEvent {
  final List<Transaction> transactions;
  const LoadTransactionsEvent(this.transactions);

  @override
  List<Object?> get props => [transactions];
}
