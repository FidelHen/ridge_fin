import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:ridge_fin/features/watchlist/models/stock_price_model.dart';

@singleton
class FmpRepository {
  final Dio _dio;
  final String _apiKey = dotenv.env['FMP_API_KEY']!;
  final String _baseUrl = 'https://financialmodelingprep.com/stable';

  final Map<String, List<StockPriceModel>> _historicalCache = {};

  FmpRepository(this._dio);

  Future<List<StockPriceModel>> getHistoricalPrices(String symbol) async {
    if (_historicalCache.containsKey(symbol)) {
      return _historicalCache[symbol]!;
    }

    try {
      final now = DateTime.now();
      final oneYearAgo = DateTime(now.year - 1, now.month, now.day);

      final response = await _dio.get(
        '$_baseUrl/historical-price-eod/light',
        queryParameters: {
          'symbol': symbol,
          'from': oneYearAgo.toIso8601String().split('T')[0],
          'to': now.toIso8601String().split('T')[0],
          'apikey': _apiKey,
        },
      );

      final priceList = (response.data as List).map((json) => StockPriceModel.fromJson(json)).toList();

      priceList.sort((a, b) => DateTime.parse(a.date).compareTo(DateTime.parse(b.date)));

      _historicalCache[symbol] = priceList;
      return priceList;
    } catch (e) {
      throw Exception('Failed to fetch historical prices: $e');
    }
  }

  void clearCache() {
    _historicalCache.clear();
  }
}
