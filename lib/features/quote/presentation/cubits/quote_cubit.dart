import 'package:bloc/bloc.dart';

import 'package:quote_clean_code/core/error/failures.dart';
import 'package:quote_clean_code/features/quote/domain/usecases/no_params.dart';
import 'package:quote_clean_code/features/quote/domain/usecases/quote_usecases.dart';
import 'package:quote_clean_code/features/quote/presentation/blocs/quote_bloc.dart';

class QuoteCubit extends Cubit<QuoteState> {
  final GetQuotes getQuotes;
  QuoteCubit({required this.getQuotes}) : super(QuoteInitial());
  Future<void> fetchQuotes() async {
    emit(QuoteLoading());
    final failureOrQuotes = await getQuotes(NoParams());
    failureOrQuotes.fold(
      (failure) => emit(QuoteError(message: _mapFailureToMessage(failure))),
      (quotes) => emit(QuoteLoaded(quotes: quotes)),
    );
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
