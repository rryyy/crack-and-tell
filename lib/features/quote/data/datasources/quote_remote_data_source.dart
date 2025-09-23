import 'package:crack_and_tell/features/quote/data/models/quote_model.dart';
import 'package:crack_and_tell/features/quote/network/quote_api.dart';

class QuoteRemoteDataSource {
  final QuoteApi quoteApi;

  QuoteRemoteDataSource(this.quoteApi);

  Future<QuoteModel> fetchRandomQuote() async {
    return await quoteApi.fetchRandomQuote();
  }
}