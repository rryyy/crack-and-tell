import 'package:crack_and_tell/features/quote/data/models/quote_model.dart';
import 'package:crack_and_tell/features/quote/domain/entities/quote.dart';

abstract class QuoteRepository {
  Future<Quote> fetchRandomQuote({List<String>? tags});
  Future<void> cacheQuote(QuoteModel quote);
  Quote? fetchQuoteFromCache();
}