import 'package:flutter_test/flutter_test.dart';
import 'package:ridge_fin/features/watchlist/models/stock_price_model.dart';
import 'package:ridge_fin/features/watchlist/repositories/stock_data_repository.dart';

void main() {
  late StockDataRepository repository;

  setUp(() {
    repository = StockDataRepository();
  });

  group('StockDataRepository', () {
    test('filterDataByTimeRange returns empty list when input is empty', () {
      // Arrange
      final emptyData = <StockPriceModel>[];

      // Act
      final result = repository.filterDataByTimeRange(
        emptyData,
        TimeRange.oneWeek,
      );

      // Assert
      expect(result, isEmpty);
    });

    test('filterDataByTimeRange filters data correctly for one week', () {
      // Arrange
      final now = DateTime.now();
      final testData = [
        StockPriceModel(
          symbol: 'AAPL',
          date: now.subtract(const Duration(days: 10)).toIso8601String().split('T')[0],
          price: 100.0,
          volume: 1000000,
        ),
        StockPriceModel(
          symbol: 'AAPL',
          date: now.subtract(const Duration(days: 5)).toIso8601String().split('T')[0],
          price: 105.0,
          volume: 1000000,
        ),
        StockPriceModel(
          symbol: 'AAPL',
          date: now.subtract(const Duration(days: 2)).toIso8601String().split('T')[0],
          price: 110.0,
          volume: 1000000,
        ),
      ];

      // Act
      final result = repository.filterDataByTimeRange(
        testData,
        TimeRange.oneWeek,
      );

      // Assert
      expect(result.length, 2); // Should only include last 2 items (within 7 days)
      expect(result[0].price, 105.0);
      expect(result[1].price, 110.0);
    });

    test('filterDataByTimeRange filters data correctly for one month', () {
      // Arrange
      final now = DateTime.now();
      final testData = [
        StockPriceModel(
          symbol: 'AAPL',
          date: now.subtract(const Duration(days: 40)).toIso8601String().split('T')[0],
          price: 100.0,
          volume: 1000000,
        ),
        StockPriceModel(
          symbol: 'AAPL',
          date: now.subtract(const Duration(days: 20)).toIso8601String().split('T')[0],
          price: 105.0,
          volume: 1000000,
        ),
        StockPriceModel(
          symbol: 'AAPL',
          date: now.subtract(const Duration(days: 5)).toIso8601String().split('T')[0],
          price: 110.0,
          volume: 1000000,
        ),
      ];

      // Act
      final result = repository.filterDataByTimeRange(
        testData,
        TimeRange.oneMonth,
      );

      // Assert
      expect(result.length, 2); // Should only include last 2 items (within 30 days)
      expect(result[0].price, 105.0);
      expect(result[1].price, 110.0);
    });

    test('filterDataByTimeRange includes all data for one year when all data is within range', () {
      // Arrange
      final now = DateTime.now();
      final testData = [
        StockPriceModel(
          symbol: 'AAPL',
          date: now.subtract(const Duration(days: 350)).toIso8601String().split('T')[0],
          price: 100.0,
          volume: 1000000,
        ),
        StockPriceModel(
          symbol: 'AAPL',
          date: now.subtract(const Duration(days: 180)).toIso8601String().split('T')[0],
          price: 105.0,
          volume: 1000000,
        ),
        StockPriceModel(
          symbol: 'AAPL',
          date: now.subtract(const Duration(days: 5)).toIso8601String().split('T')[0],
          price: 110.0,
          volume: 1000000,
        ),
      ];

      // Act
      final result = repository.filterDataByTimeRange(
        testData,
        TimeRange.oneYear,
      );

      // Assert
      expect(result.length, 3); // All items within 365 days
    });
  });
}
