import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:ridge_fin/features/watchlist/models/ticker_model.dart';

@lazySingleton
class TickerRepository {
  List<TickerModel>? _cachedTickers;

  Future<List<TickerModel>> loadTickers() async {
    if (_cachedTickers != null) {
      return _cachedTickers!;
    }

    try {
      final String jsonString = await rootBundle.loadString('assets/json/sec_tickers.json');
      final Map<String, dynamic> jsonMap = json.decode(jsonString);

      _cachedTickers = jsonMap.entries.map((entry) => TickerModel.fromJson(entry.value)).toList();

      return _cachedTickers!;
    } catch (e) {
      throw Exception('Failed to load tickers: $e');
    }
  }

  Future<List<TickerModel>> searchTickers(String query) async {
    if (query.isEmpty) {
      return [];
    }

    final tickers = await loadTickers();
    final lowerQuery = query.toLowerCase();

    return tickers
        .where((ticker) {
          return ticker.ticker.toLowerCase().contains(lowerQuery) || ticker.title.toLowerCase().contains(lowerQuery);
        })
        .take(15)
        .toList();
  }
}
