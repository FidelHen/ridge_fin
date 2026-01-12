import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ridge_fin/features/watchlist/models/stock_price_model.dart';
import 'package:ridge_fin/features/watchlist/repositories/stock_data_repository.dart';

part 'stock_chart_bloc.freezed.dart';

// ============================================
// STATE
// ============================================
@freezed
class StockChartState with _$StockChartState {
  const factory StockChartState.initial() = _Initial;
  const factory StockChartState.loading() = _Loading;
  const factory StockChartState.loaded({
    required List<StockPriceModel> data,
    required TimeRange timeRange,
    required double currentPrice,
    required double performance,
    required String displayDate,
    int? selectedIndex,
  }) = _Loaded;
  const factory StockChartState.error(String message) = _Error;
}

// ============================================
// EVENTS
// ============================================
abstract class StockChartEvent extends Equatable {
  const StockChartEvent();

  @override
  List<Object?> get props => [];
}

class LoadChartData extends StockChartEvent {
  final TimeRange timeRange;

  const LoadChartData(this.timeRange);

  @override
  List<Object?> get props => [timeRange];
}

class UpdateSelectedPoint extends StockChartEvent {
  final int? index;

  const UpdateSelectedPoint(this.index);

  @override
  List<Object?> get props => [index];
}

class ChangeTimeRange extends StockChartEvent {
  final TimeRange timeRange;

  const ChangeTimeRange(this.timeRange);

  @override
  List<Object?> get props => [timeRange];
}

// ============================================
// BLOC
// ============================================
class StockChartBloc extends Bloc<StockChartEvent, StockChartState> {
  final StockDataRepository _repository;
  List<StockPriceModel>? _allData;

  StockChartBloc(this._repository, [List<StockPriceModel>? initialData]) : _allData = initialData, super(const StockChartState.initial()) {
    on<LoadChartData>(_onLoadChartData);
    on<UpdateSelectedPoint>(_onUpdateSelectedPoint);
    on<ChangeTimeRange>(_onChangeTimeRange);
  }

  void setData(List<StockPriceModel> data) {
    _allData = data;
  }

  Future<void> _onLoadChartData(
    LoadChartData event,
    Emitter<StockChartState> emit,
  ) async {
    emit(const StockChartState.loading());

    try {
      final List<StockPriceModel> data;
      if (_allData != null) {
        data = _repository.filterDataByTimeRange(_allData!, event.timeRange);
      } else {
        data = await _repository.getFilteredData(event.timeRange);
      }

      if (data.isEmpty) {
        emit(const StockChartState.error('No data available'));
        return;
      }

      final latestPrice = data.last.price;
      final firstPrice = data.first.price;
      final performance = ((latestPrice - firstPrice) / firstPrice) * 100;

      emit(
        StockChartState.loaded(
          data: data,
          timeRange: event.timeRange,
          currentPrice: latestPrice,
          performance: performance,
          displayDate: data.last.date,
          selectedIndex: null,
        ),
      );
    } catch (e) {
      emit(StockChartState.error('Failed to load chart data: $e'));
    }
  }

  Future<void> _onUpdateSelectedPoint(
    UpdateSelectedPoint event,
    Emitter<StockChartState> emit,
  ) async {
    final currentState = state;

    if (currentState is! _Loaded) return;

    if (event.index == null) {
      final latestPrice = currentState.data.last.price;
      final firstPrice = currentState.data.first.price;
      final performance = ((latestPrice - firstPrice) / firstPrice) * 100;

      emit(
        currentState.copyWith(
          currentPrice: latestPrice,
          performance: performance,
          displayDate: currentState.data.last.date,
          selectedIndex: null,
        ),
      );
      return;
    }

    final index = event.index!;
    if (index < 0 || index >= currentState.data.length) return;

    final selectedData = currentState.data[index];
    final firstPrice = currentState.data.first.price;
    final performance = ((selectedData.price - firstPrice) / firstPrice) * 100;

    emit(
      currentState.copyWith(
        currentPrice: selectedData.price,
        performance: performance,
        displayDate: selectedData.date,
        selectedIndex: index,
      ),
    );
  }

  Future<void> _onChangeTimeRange(
    ChangeTimeRange event,
    Emitter<StockChartState> emit,
  ) async {
    add(LoadChartData(event.timeRange));
  }
}
