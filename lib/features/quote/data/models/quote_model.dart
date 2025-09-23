import 'package:crack_and_tell/features/quote/domain/entities/quote.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quote_model.g.dart';

@JsonSerializable()
class QuoteModel extends Quote {
  final int length;

  QuoteModel({
    required int id,
    required String quote,
    required String author,
    required List<String> tags,
    required this.length
  }) : super(
          id: id,
          quote: quote,
          author: author,
          tags: tags,
        );
  
  factory QuoteModel.fromJson(Map<String, dynamic> json) => _$QuoteModelFromJson(json);
  Map<String, dynamic> toJson() => _$QuoteModelToJson(this);

}