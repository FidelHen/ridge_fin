import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ridge_fin/features/watchlist/bloc/stock_chart_bloc.dart';
import 'package:ridge_fin/features/watchlist/models/stock_price_model.dart';
import 'package:ridge_fin/features/watchlist/repositories/stock_data_repository.dart';

import 'stock_chart_bloc_test.mocks.dart';

@GenerateMocks([StockDataRepository])
void main() {
  late MockStockDataRepository mockRepository;

  setUp(() {
    mockRepository = MockStockDataRepository();
  });

  group('StockChartBloc', () {
    final testData = [
      StockPriceModel(
        symbol: 'AAPL',
        date: '2026-01-01',
        price: 100.0,
        volume: 1000000,
      ),
      StockPriceModel(
        symbol: 'AAPL',
        date: '2026-01-05',
        price: 110.0,
        volume: 1000000,
      ),
    ];

    test('initial state is StockChartState.initial', () {
      // Arrange & Act
      final bloc = StockChartBloc(mockRepository);

      // Assert
      expect(bloc.state, const StockChartState.initial());
      bloc.close();
    });

    test('emits [loading, loaded] when LoadChartData is added with valid data', () async {
      // Arrange
      when(mockRepository.filterDataByTimeRange(testData, TimeRange.oneWeek)).thenReturn(testData);
      final bloc = StockChartBloc(mockRepository, testData);

      // Act
      bloc.add(const LoadChartData(TimeRange.oneWeek));

      // Assert
      await expectLater(
        bloc.stream,
        emitsInOrder([
          const StockChartState.loading(),
          StockChartState.loaded(
            data: testData,
            timeRange: TimeRange.oneWeek,
            currentPrice: 110.0,
            performance: 10.0,
            displayDate: '2026-01-05',
            selectedIndex: null,
          ),
        ]),
      );
      await bloc.close();
    });

    test('emits [loading, error] when LoadChartData is added with null data', () async {
      // Arrange
      final bloc = StockChartBloc(mockRepository, null);

      // Act
      bloc.add(const LoadChartData(TimeRange.oneWeek));

      // Assert
      await expectLater(
        bloc.stream,
        emitsInOrder([
          const StockChartState.loading(),
          const StockChartState.error('No data available'),
        ]),
      );
      await bloc.close();
    });

    test('emits [loading, error] when filtered data is empty', () async {
      // Arrange
      when(mockRepository.filterDataByTimeRange(testData, TimeRange.oneWeek)).thenReturn([]);
      final bloc = StockChartBloc(mockRepository, testData);

      // Act
      bloc.add(const LoadChartData(TimeRange.oneWeek));

      // Assert
      await expectLater(
        bloc.stream,
        emitsInOrder([
          const StockChartState.loading(),
          const StockChartState.error('No data available for selected time range'),
        ]),
      );
      await bloc.close();
    });

    test('changes time range when ChangeTimeRange is added', () async {
      // Arrange
      when(mockRepository.filterDataByTimeRange(testData, TimeRange.oneMonth)).thenReturn(testData);
      final bloc = StockChartBloc(mockRepository, testData);

      // Act
      bloc.add(const ChangeTimeRange(TimeRange.oneMonth));

      // Assert
      await expectLater(
        bloc.stream,
        emitsInOrder([
          const StockChartState.loading(),
          StockChartState.loaded(
            data: testData,
            timeRange: TimeRange.oneMonth,
            currentPrice: 110.0,
            performance: 10.0,
            displayDate: '2026-01-05',
            selectedIndex: null,
          ),
        ]),
      );
      await bloc.close();
    });
  });
}
