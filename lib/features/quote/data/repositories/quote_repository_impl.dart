import 'package:dartz/dartz.dart';
import 'package:quote_clean_code/features/quote/data/datasources/quote_remote_data_source.dart';
import 'package:quote_clean_code/features/quote/domain/entities/quote.dart';
import 'package:quote_clean_code/features/quote/domain/repositories/quote_repository.dart';

import '../../../../core/error/failures.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final QuoteRemoteDataSource remoteDataSource;
  final QuoteLocalDataSource localDataSource;

  QuoteRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  @override
  Future<Either<Failure, List<Quote>>> getQuotes() async {
    try {
      final remoteQuotes = await remoteDataSource.getQuotes();
      localDataSource.cacheQuotes(remoteQuotes);
      return Right(remoteQuotes);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
