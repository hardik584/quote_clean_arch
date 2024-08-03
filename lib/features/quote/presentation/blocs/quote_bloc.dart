import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quote_clean_code/core/error/failures.dart';
import 'package:quote_clean_code/features/quote/domain/entities/quote.dart';
import 'package:quote_clean_code/features/quote/domain/usecases/no_params.dart';
import 'package:quote_clean_code/features/quote/domain/usecases/quote_usecases.dart';

part 'quote_event.dart';
part 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  final GetQuotes getQuotes;
  QuoteBloc({required this.getQuotes}) : super(QuoteInitial());
  Stream<QuoteState> mapEventToState(QuoteEvent event) async* {
    if (event is FetchQuotes) {
      yield QuoteLoading();
      final failureOrQuotes = await getQuotes(NoParams());
      yield failureOrQuotes.fold(
        (failure) => QuoteError(message: _mapFailureToMessage(failure)),
        (quotes) => QuoteLoaded(quotes: quotes),
      );
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        return 'Server Failure';
      case const (CacheFailure):
        return 'Cache Failure';
      default:
        return 'Unexpected Error';
    }
  }
}
