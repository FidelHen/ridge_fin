import 'package:injectable/injectable.dart';
import 'package:ridge_fin/features/watchlist/models/stock_price_model.dart';

enum TimeRange {
  oneWeek,
  oneMonth,
  oneYear,
}

@singleton
class StockDataRepository {
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
