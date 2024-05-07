part of 'transaction_bloc.dart';

sealed class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

final class TransactionInitial extends TransactionState {}

final class TransactionLoading extends TransactionState {}

final class TransactionSuccess extends TransactionState {
  final List<TransactionModel> transactions;
  const TransactionSuccess(this.transactions);

  @override
  List<Object> get props => [transactions];
}

final class TransactionFailed extends TransactionState {
  final String errorMessage;
  const TransactionFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}