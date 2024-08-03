part of 'quote_bloc.dart';

abstract class QuoteEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchQuotes extends QuoteEvent {}
