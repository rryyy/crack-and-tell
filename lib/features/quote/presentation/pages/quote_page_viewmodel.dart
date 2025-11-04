import 'package:crack_and_tell/features/quote/domain/entities/quote.dart';
import 'package:crack_and_tell/features/quote/domain/usecases/fetch_quote_usecase.dart';
import 'package:flutter/material.dart';

class QuoteViewModel extends ChangeNotifier {
  final FetchQuoteUsecase _fetchQuote;

  QuoteViewModel({
    required FetchQuoteUsecase fetchQuote
  }) : _fetchQuote = fetchQuote;

  Quote? _quote;
  bool _isLoading = false;

  //Getters and Setters -> for outside access
  Quote? get quote => _quote;
  bool get isLoading => _isLoading;

  Future<void> fetchRandomQuote() async {
    _isLoading = true;
    notifyListeners();

    _quote = await _fetchQuote();

    _isLoading = false;
    notifyListeners();
  }
}