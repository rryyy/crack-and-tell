import 'dart:convert';

import 'package:crack_and_tell/features/quote/data/models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuoteLocalDataSource {
  final SharedPreferences _prefs;
  static const _cacheKey = 'cached_quote';

  QuoteLocalDataSource(this._prefs);

  Future<void> cacheQuote(QuoteModel quote) async {
    final jsonString = jsonEncode(quote.toJson());
    await _prefs.setString(_cacheKey, jsonString);
  }

  QuoteModel? fetchQuoteFromCache() {
    final jsonString = _prefs.getString(_cacheKey);
    if (jsonString == null) return null;
    return QuoteModel.fromJson(jsonDecode(jsonString));
  }
}