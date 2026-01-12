import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:ridge_fin/features/watchlist/models/cached_quote_model.dart';
import 'package:ridge_fin/features/watchlist/models/company_news_model.dart';
import 'package:ridge_fin/features/watchlist/models/quote_model.dart';
import 'package:ridge_fin/features/watchlist/models/stock_price_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class CacheService {
  static const String _quotePrefix = 'quote_';
  static const String _historicalPrefix = 'historical_';
  static const String _generalNewsKey = 'general_news';
  static const String _newsTimestampKey = 'general_news_timestamp';

  Future<void> cacheQuote(String symbol, QuoteModel quote) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cached = CachedQuoteModel(
        symbol: symbol,
        quote: quote,
        cachedAt: DateTime.now().millisecondsSinceEpoch,
      );
      await prefs.setString('$_quotePrefix$symbol', jsonEncode(cached.toJson()));
    } catch (e) {
      // Fail silently
    }
  }

  Future<QuoteModel?> getCachedQuote(String symbol) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cached = prefs.getString('$_quotePrefix$symbol');
      if (cached == null) return null;

      final cachedQuote = CachedQuoteModel.fromJson(jsonDecode(cached));
      return cachedQuote.quote;
    } catch (e) {
      return null;
    }
  }

  Future<void> cacheHistoricalData(
    String symbol,
    List<StockPriceModel> data,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonData = data.map((e) => e.toJson()).toList();
      await prefs.setString('$_historicalPrefix$symbol', jsonEncode(jsonData));
    } catch (e) {
      // Fail silently
    }
  }

  Future<List<StockPriceModel>?> getCachedHistoricalData(String symbol) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cached = prefs.getString('$_historicalPrefix$symbol');
      if (cached == null) return null;

      final List<dynamic> jsonData = jsonDecode(cached);
      return jsonData.map((e) => StockPriceModel.fromJson(e)).toList();
    } catch (e) {
      return null;
    }
  }

  Future<void> cacheGeneralNews(List<CompanyNewsModel> news) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonData = news.map((e) => e.toJson()).toList();
      await prefs.setString(_generalNewsKey, jsonEncode(jsonData));
      await prefs.setInt(_newsTimestampKey, DateTime.now().millisecondsSinceEpoch);
    } catch (e) {
      // Fail silently
    }
  }

  Future<List<CompanyNewsModel>?> getCachedGeneralNews() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cached = prefs.getString(_generalNewsKey);
      if (cached == null) return null;

      final List<dynamic> jsonData = jsonDecode(cached);
      return jsonData.map((e) => CompanyNewsModel.fromJson(e)).toList();
    } catch (e) {
      return null;
    }
  }

  Future<void> clearAll() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    } catch (e) {
      // Fail silently
    }
  }
}
