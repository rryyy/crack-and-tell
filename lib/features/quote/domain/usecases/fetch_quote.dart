import 'package:crack_and_tell/features/quote/domain/entities/quote.dart';
import 'package:crack_and_tell/features/quote/domain/repositories/quote_repository.dart';

class FetchQuote {
  final QuoteRepository repository;

  FetchQuote(this.repository);

  Future<Quote> call() {
    return repository.fetchRandomQuote();
  }
}