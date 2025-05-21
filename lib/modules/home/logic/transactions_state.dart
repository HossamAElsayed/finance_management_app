part of 'transactions_bloc.dart';

abstract class TransactionsState extends Equatable {
  const TransactionsState();
  @override
  List<Object?> get props => [];
}

class TransactionsInitial extends TransactionsState {}

class TransactionsLoaded extends TransactionsState {
  final List<Map<String, Object>> groupedTransactions;
  const TransactionsLoaded(this.groupedTransactions);

  @override
  List<Object?> get props => [groupedTransactions];
}
