import 'package:crack_and_tell/features/quote/data/datasources/quote_remote_data_source.dart';
import 'package:crack_and_tell/features/quote/data/repositories/quote_repository_impl.dart';
import 'package:crack_and_tell/features/quote/domain/repositories/quote_repository.dart';
import 'package:crack_and_tell/features/quote/domain/usecases/fetch_quote.dart';
import 'package:crack_and_tell/features/quote/network/quote_api.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  //External
  sl.registerLazySingleton<Dio>(() => Dio());

  //Network
  sl.registerLazySingleton<QuoteApi>(() => QuoteApi(sl()));

  //Data sources
  sl.registerLazySingleton<QuoteRemoteDataSource>(() => QuoteRemoteDataSource(sl()));

  //Repositories
  sl.registerLazySingleton<QuoteRepository>(() => QuoteRepositoryImpl(sl()));

  //Use cases
  sl.registerLazySingleton(() => FetchQuote(sl()));
}