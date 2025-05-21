import 'package:finance_management_app/models/transaction.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc() : super(TransactionsInitial()) {
    on<LoadTransactionsEvent>(_onLoadTransactions);
  }

  void _onLoadTransactions(
    LoadTransactionsEvent event,
    Emitter<TransactionsState> emit,
  ) {
    final grouped = _groupTransactionsByDate(event.transactions);
    emit(TransactionsLoaded(grouped));
  }

  List<Map<String, Object>> _groupTransactionsByDate(List<Transaction> txs) {
    if (txs.isEmpty) return [];
    txs = List.from(txs);
    txs.sort((a, b) => b.transactionDateTime.compareTo(a.transactionDateTime));
    final List<Map<String, Object>> groups = [];
    DateTime? lastDate;
    for (final tx in txs) {
      final date = DateTime(
        tx.transactionDateTime.year,
        tx.transactionDateTime.month,
        tx.transactionDateTime.day,
      );
      if (groups.isEmpty || lastDate != date) {
        groups.add({
          'date': date,
          'items': <Transaction>[tx],
        });
        lastDate = date;
      } else {
        (groups.last['items'] as List<Transaction>).add(tx);
      }
    }
    return groups;
  }
}
