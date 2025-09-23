import 'package:crack_and_tell/features/quote/domain/entities/quote.dart';

abstract class QuoteRepository {
  Future<Quote> fetchRandomQuote();
}