import 'package:crack_and_tell/core/domain/usecases/is_new_day_usecase.dart';
import 'package:crack_and_tell/features/quote/domain/entities/quote.dart';
import 'package:crack_and_tell/features/quote/domain/usecases/fetch_quote.dart';
import 'package:flutter/material.dart';

class QuoteViewModel extends ChangeNotifier {
  final IsNewDayUsecase isNewDayUseCase;
  final FetchQuote fetchQuote;

  QuoteViewModel({
    required this.isNewDayUseCase,
    required this.fetchQuote
  });

  Quote? _quote;
  bool _isLoading = false;

  //Getters and Setters -> for outside access
  Quote? get quote => _quote;
  bool get isLoading => _isLoading;

  Future<void> fetchRandomQuote() async {
    _isLoading = true;
    notifyListeners();

    final isNewDay = await isNewDayUseCase.execute();
    debugPrint("viewmodel isNewDay: $isNewDay");

    if (isNewDay) {
      _quote = await fetchQuote();
      debugPrint("_quote: $_quote");

      _isLoading = false;
      notifyListeners();
    }
    _quote = await fetchQuote();

    _isLoading = false;
    notifyListeners();
    
  }
}