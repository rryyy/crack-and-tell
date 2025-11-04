import 'package:crack_and_tell/core/domain/repositories/date_repository.dart';
import 'package:crack_and_tell/features/quote/data/datasources/quote_local_data_source.dart';
import 'package:crack_and_tell/features/quote/data/datasources/quote_remote_data_source.dart';
import 'package:crack_and_tell/features/quote/data/models/quote_model.dart';
import 'package:crack_and_tell/features/quote/domain/entities/quote.dart';
import 'package:crack_and_tell/features/quote/domain/repositories/quote_repository.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final QuoteRemoteDataSource _remoteDataSource;
  final QuoteLocalDataSource _localDataSource;

  QuoteRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
  );
  
  @override
  Future<Quote> fetchRandomQuote() async {
    final quote = await _remoteDataSource.fetchRandomQuote();
    await cacheQuote(quote);
    return quote;
  }

  @override
  Future<void> cacheQuote(QuoteModel quote) async {
    _localDataSource.cacheQuote(quote);
  }

  @override
  Quote? fetchQuoteFromCache() {
    return _localDataSource.fetchQuoteFromCache();
  }
}