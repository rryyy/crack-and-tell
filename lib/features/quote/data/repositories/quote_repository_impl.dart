import 'package:crack_and_tell/features/quote/data/datasources/quote_remote_data_source.dart';
import 'package:crack_and_tell/features/quote/domain/entities/quote.dart';
import 'package:crack_and_tell/features/quote/domain/repositories/quote_repository.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final QuoteRemoteDataSource remoteDataSource;

  QuoteRepositoryImpl(this.remoteDataSource);
  
  @override
  Future<Quote> fetchRandomQuote() {
    return remoteDataSource.fetchRandomQuote();
  }
}