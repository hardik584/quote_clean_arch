import 'package:dartz/dartz.dart';
import 'package:quote_clean_code/core/error/failures.dart';
import 'package:quote_clean_code/features/quote/domain/entities/quote.dart';

abstract class QuoteRepository {
  Future<Either<Failure, List<Quote>>> getQuotes();
}
