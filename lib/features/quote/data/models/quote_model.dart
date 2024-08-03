import 'package:quote_clean_code/features/quote/domain/entities/quote.dart';

class QuoteModel extends Quote {
  QuoteModel({required super.text, required super.author});
  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      text: json['text'],
      author: json['author'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'author': author,
    };
  }
}
