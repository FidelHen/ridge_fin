import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:ridge_fin/features/watchlist/models/company_news_model.dart';
import 'package:ridge_fin/features/watchlist/models/quote_model.dart';

@singleton
class FinnhubRepository {
  final Dio _dio;
  final String _apiKey = dotenv.env['FINNHUB_API_KEY']!;
  final String _baseUrl = 'https://finnhub.io/api/v1';

  final Map<String, QuoteModel> _quoteCache = {};
  final Map<String, List<CompanyNewsModel>> _newsCache = {};

  FinnhubRepository(this._dio);

  Future<QuoteModel> getQuote(String symbol) async {
    if (_quoteCache.containsKey(symbol)) {
      return _quoteCache[symbol]!;
    }

    try {
      final response = await _dio.get(
        '$_baseUrl/quote',
        queryParameters: {
          'symbol': symbol,
          'token': _apiKey,
        },
      );

      final quote = QuoteModel.fromJson(response.data);
      _quoteCache[symbol] = quote;
      return quote;
    } catch (e) {
      throw Exception('Failed to fetch quote: $e');
    }
  }

  Future<List<CompanyNewsModel>> getCompanyNews(String symbol) async {
    if (_newsCache.containsKey(symbol)) {
      return _newsCache[symbol]!;
    }

    try {
      final now = DateTime.now();
      final from = now.subtract(const Duration(days: 90));

      final response = await _dio.get(
        '$_baseUrl/company-news',
        queryParameters: {
          'symbol': symbol,
          'from': from.toIso8601String().split('T')[0],
          'to': now.toIso8601String().split('T')[0],
          'token': _apiKey,
        },
      );

      final newsList = (response.data as List).map((json) => CompanyNewsModel.fromJson(json)).toList();

      _newsCache[symbol] = newsList;
      return newsList;
    } catch (e) {
      throw Exception('Failed to fetch company news: $e');
    }
  }

  void clearCache() {
    _quoteCache.clear();
    _newsCache.clear();
  }
}
