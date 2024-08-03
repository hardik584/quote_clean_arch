import 'package:get_it/get_it.dart';
import 'package:quote_clean_code/features/quote/data/datasources/quote_remote_data_source.dart';
import 'package:quote_clean_code/features/quote/domain/repositories/quote_repository.dart';
import 'package:quote_clean_code/features/quote/domain/usecases/quote_usecases.dart';
import 'package:quote_clean_code/features/quote/presentation/blocs/quote_bloc.dart';

import 'features/quote/data/repositories/quote_repository_impl.dart';
import 'features/quote/presentation/cubits/quote_cubit.dart';

final sl = GetIt.instance;
void init() {
  // Bloc
  sl.registerFactory(() => QuoteBloc(getQuotes: sl()));
  sl.registerFactory(() => QuoteCubit(getQuotes: sl()));
  // Use cases
  sl.registerLazySingleton(() => GetQuotes(sl()));
  // Repository
  sl.registerLazySingleton<QuoteRepository>(
    () => QuoteRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<QuoteRemoteDataSource>(
    () => QuoteRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<QuoteLocalDataSource>(
    () => QuoteLocalDataSourceImpl(),
  );
  // External dependencies (if any)
  // sl.registerLazySingleton(() => http.Client());
}
