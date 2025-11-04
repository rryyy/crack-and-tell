import 'package:crack_and_tell/core/data/repositories/date_repository_impl.dart';
import 'package:crack_and_tell/core/domain/repositories/date_repository.dart';
import 'package:crack_and_tell/features/quote/data/datasources/quote_local_data_source.dart';
import 'package:crack_and_tell/features/quote/data/datasources/quote_remote_data_source.dart';
import 'package:crack_and_tell/features/quote/data/repositories/quote_repository_impl.dart';
import 'package:crack_and_tell/features/quote/domain/repositories/quote_repository.dart';
import 'package:crack_and_tell/features/quote/domain/usecases/fetch_quote_usecase.dart';
import 'package:crack_and_tell/features/quote/network/quote_api.dart';
import 'package:crack_and_tell/features/quote/presentation/pages/quote_page_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  //External
  sl.registerLazySingleton<Dio>(() => Dio());

  //Register SharedPreferences instance
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  //Network
  sl.registerLazySingleton<QuoteApi>(() => QuoteApi(sl()));

  //Data sources
  sl.registerLazySingleton<QuoteRemoteDataSource>(() => QuoteRemoteDataSource(sl()));
  sl.registerLazySingleton<QuoteLocalDataSource>(() => QuoteLocalDataSource(sharedPreferences));

  //Repositories
  sl.registerLazySingleton<QuoteRepository>(() => QuoteRepositoryImpl(
    sl<QuoteRemoteDataSource>(), 
    sl<QuoteLocalDataSource>()
  ));
  sl.registerLazySingleton<DateRepository>(() => DateRepositoryImpl(sharedPreferences));

  //Use cases
  sl.registerLazySingleton(() => FetchQuoteUsecase(
    sl<QuoteRepository>(), 
    sl<DateRepository>()
  ));

  //View Models
  sl.registerFactory(() => QuoteViewModel(
    fetchQuote: sl()
  ));
}