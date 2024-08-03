import 'dart:convert';

import 'package:quote_clean_code/core/error/failures.dart';
import 'package:quote_clean_code/features/quote/data/models/quote_model.dart';
import 'package:http/http.dart' as http;

abstract class QuoteRemoteDataSource {
  Future<List<QuoteModel>> getQuotes();
}

class QuoteRemoteDataSourceImpl implements QuoteRemoteDataSource {
  final http.Client client;
  QuoteRemoteDataSourceImpl({required this.client});
  @override
  Future<List<QuoteModel>> getQuotes() async {
    final response = await client.get(Uri.parse('https://example.com/quotes'));
    if (response.statusCode == 200) {
      final List jsonList = json.decode(response.body);
      return jsonList.map((json) => QuoteModel.fromJson(json)).toList();
    } else {
      throw ServerFailure();
    }
  }
}

abstract class QuoteLocalDataSource {
  Future<List<QuoteModel>> getLastQuotes();
  Future<void> cacheQuotes(List<QuoteModel> quotes);
}

class QuoteLocalDataSourceImpl implements QuoteLocalDataSource {
  @override
  Future<List<QuoteModel>> getLastQuotes() async {
    return [];
  }

  @override
  Future<void> cacheQuotes(List<QuoteModel> quotes) async {
    return;
  }
}
