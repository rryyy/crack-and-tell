import 'package:crack_and_tell/features/quote/data/models/quote_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'quote_api.g.dart';

@RestApi(baseUrl: "https://random-quotes-nu-liard.vercel.app/")
abstract class QuoteApi {
  factory QuoteApi(Dio dio, {String baseUrl}) = _QuoteApi;

  @GET("/api/quotes/random")
  Future<QuoteModel> fetchRandomQuote();
}