import 'package:dartz/dartz.dart';
import 'package:quote_clean_code/core/error/failures.dart';
import 'package:quote_clean_code/features/quote/domain/entities/quote.dart';
import 'package:quote_clean_code/features/quote/domain/repositories/quote_repository.dart';
import 'package:quote_clean_code/features/quote/domain/usecases/no_params.dart';

class GetQuotes {
  final QuoteRepository repository;
  GetQuotes(this.repository);
  Future<Either<Failure, List<Quote>>> call(NoParams params) async {
    return await repository.getQuotes();
  }
}
