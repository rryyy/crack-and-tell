import 'package:crack_and_tell/features/quote/domain/entities/quote.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quote_model.g.dart';

@JsonSerializable()
class QuoteModel extends Quote {
  final int length;

  QuoteModel({
    required super.id,
    required super.quote,
    required super.author,
    required super.tags,
    required this.length
  });
  
  factory QuoteModel.fromJson(Map<String, dynamic> json) => _$QuoteModelFromJson(json);
  Map<String, dynamic> toJson() => _$QuoteModelToJson(this);

}