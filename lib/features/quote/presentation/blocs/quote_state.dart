part of 'quote_bloc.dart';

abstract class QuoteState extends Equatable {
  @override
  List<Object> get props => [];
}

class QuoteInitial extends QuoteState {}

class QuoteLoading extends QuoteState {}

class QuoteLoaded extends QuoteState {
  final List<Quote> quotes;
  QuoteLoaded({required this.quotes});
  @override
  List<Object> get props => [quotes];
}

class QuoteError extends QuoteState {
  final String message;
  QuoteError({required this.message});
  @override
  List<Object> get props => [message];
}
