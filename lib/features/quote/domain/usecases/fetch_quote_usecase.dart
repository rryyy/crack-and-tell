import 'package:crack_and_tell/core/domain/repositories/date_repository.dart';
import 'package:crack_and_tell/features/quote/domain/entities/quote.dart';
import 'package:crack_and_tell/features/quote/domain/repositories/quote_repository.dart';
import 'package:flutter/material.dart';

class FetchQuoteUsecase {
  final QuoteRepository _quoteRepository;
  final DateRepository _dateRepository;

  FetchQuoteUsecase(
    this._quoteRepository,
    this._dateRepository
  );

  Future<Quote> call(List<String>? tags) async {
    if (await _shouldFetchNewQuote()) {
      // TODO: Need to define whether tag is null or not
      // if null, fetch random quote, else need to use join(',') to convert list to string 
      // for query parameter
      return _quoteRepository.fetchRandomQuote(tags: tags);
    }

    return _quoteRepository.fetchQuoteFromCache() ?? await _quoteRepository.fetchRandomQuote();
  }

  Future<void> fetchQuoteByTag(List<String> tags) async {
    debugPrint(tags.toString());
  }

  Future<bool> _shouldFetchNewQuote() async {
    final lastSaveDate = await _dateRepository.getLastSaveDate();
    final today = DateTime.now();
  
    if (lastSaveDate == null) {
      await _dateRepository.saveDate(today);
      return true;
    }

    if (!_isSameDay(lastSaveDate, today)) {
      await _dateRepository.saveDate(today);
      return true;
    }

    return false;
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}