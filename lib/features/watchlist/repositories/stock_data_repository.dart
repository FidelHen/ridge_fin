import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:ridge_fin/features/watchlist/models/stock_price_model.dart';

enum TimeRange {
  oneWeek,
  oneMonth,
  oneYear,
}

@singleton
class StockDataRepository {
  List<StockPriceModel>? _cachedData;

  Future<List<StockPriceModel>> loadStockData() async {
    if (_cachedData != null) {
      return _cachedData!;
    }

    final jsonString = await rootBundle.loadString('assets/json/stock_data.json');
    final List<dynamic> jsonData = json.decode(jsonString);

    _cachedData = jsonData.map((json) => StockPriceModel.fromJson(json)).toList();

    _cachedData!.sort((a, b) => DateTime.parse(a.date).compareTo(DateTime.parse(b.date)));

    return _cachedData!;
  }

  Future<List<StockPriceModel>> getFilteredData(TimeRange timeRange) async {
    final allData = await loadStockData();

    if (allData.isEmpty) {
      return [];
    }

    final now = DateTime.now();
    final DateTime cutoffDate;

    switch (timeRange) {
      case TimeRange.oneWeek:
        cutoffDate = now.subtract(const Duration(days: 7));
        break;
      case TimeRange.oneMonth:
        cutoffDate = now.subtract(const Duration(days: 30));
        break;
      case TimeRange.oneYear:
        cutoffDate = now.subtract(const Duration(days: 365));
        break;
    }

    return allData.where((data) {
      final dataDate = DateTime.parse(data.date);
      return dataDate.isAfter(cutoffDate) || dataDate.isAtSameMomentAs(cutoffDate);
    }).toList();
  }

  List<StockPriceModel> filterDataByTimeRange(
    List<StockPriceModel> allData,
    TimeRange timeRange,
  ) {
    if (allData.isEmpty) {
      return [];
    }

    final now = DateTime.now();
    final DateTime cutoffDate;

    switch (timeRange) {
      case TimeRange.oneWeek:
        cutoffDate = now.subtract(const Duration(days: 7));
        break;
      case TimeRange.oneMonth:
        cutoffDate = now.subtract(const Duration(days: 30));
        break;
      case TimeRange.oneYear:
        cutoffDate = now.subtract(const Duration(days: 365));
        break;
    }

    return allData.where((data) {
      final dataDate = DateTime.parse(data.date);
      return dataDate.isAfter(cutoffDate) || dataDate.isAtSameMomentAs(cutoffDate);
    }).toList();
  }
}
