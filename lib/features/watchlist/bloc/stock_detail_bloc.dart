import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ridge_fin/features/watchlist/models/company_news_model.dart';
import 'package:ridge_fin/features/watchlist/models/quote_model.dart';
import 'package:ridge_fin/features/watchlist/models/stock_price_model.dart';
import 'package:ridge_fin/features/watchlist/repositories/finnhub_repository.dart';
import 'package:ridge_fin/features/watchlist/repositories/fmp_repository.dart';

part 'stock_detail_bloc.freezed.dart';

// ============================================
// STATE
// ============================================
@freezed
class StockDetailState with _$StockDetailState {
  const factory StockDetailState.initial() = _Initial;
  const factory StockDetailState.loading() = _Loading;
  const factory StockDetailState.loaded({
    required String symbol,
    required QuoteModel quote,
    required List<StockPriceModel> historicalPrices,
    required List<CompanyNewsModel> news,
  }) = _Loaded;
  const factory StockDetailState.error(String message) = _Error;
}

// ============================================
// EVENTS
// ============================================
abstract class StockDetailEvent extends Equatable {
  const StockDetailEvent();

  @override
  List<Object?> get props => [];
}

class LoadStockDetail extends StockDetailEvent {
  final String symbol;

  const LoadStockDetail(this.symbol);

  @override
  List<Object?> get props => [symbol];
}

class RefreshStockDetail extends StockDetailEvent {
  final String symbol;

  const RefreshStockDetail(this.symbol);

  @override
  List<Object?> get props => [symbol];
}

// ============================================
// BLOC
// ============================================
class StockDetailBloc extends Bloc<StockDetailEvent, StockDetailState> {
  final FinnhubRepository _finnhubRepository;
  final FmpRepository _fmpRepository;

  StockDetailBloc(
    this._finnhubRepository,
    this._fmpRepository,
  ) : super(const StockDetailState.initial()) {
    on<LoadStockDetail>(_onLoadStockDetail);
    on<RefreshStockDetail>(_onRefreshStockDetail);
  }

  Future<void> _onLoadStockDetail(
    LoadStockDetail event,
    Emitter<StockDetailState> emit,
  ) async {
    emit(const StockDetailState.loading());

    try {
      final results = await Future.wait([
        _finnhubRepository.getQuote(event.symbol),
        _fmpRepository.getHistoricalPrices(event.symbol),
        _finnhubRepository.getCompanyNews(event.symbol),
      ]);

      final quote = results[0] as QuoteModel;
      var historicalPrices = results[1] as List<StockPriceModel>;
      final news = results[2] as List<CompanyNewsModel>;

      if (historicalPrices.isNotEmpty) {
        final latestHistoricalPrice = historicalPrices.last.price;

        if ((quote.currentPrice - latestHistoricalPrice).abs() > 0.01) {
          final today = DateTime.now().toIso8601String().split('T')[0];
          final latestPricePoint = StockPriceModel(
            symbol: event.symbol,
            date: today,
            price: quote.currentPrice,
            volume: 0,
          );

          historicalPrices = [...historicalPrices, latestPricePoint];
        }
      }

      emit(
        StockDetailState.loaded(
          symbol: event.symbol,
          quote: quote,
          historicalPrices: historicalPrices,
          news: news,
        ),
      );
    } catch (e) {
      emit(StockDetailState.error('Failed to load stock details: $e'));
    }
  }

  Future<void> _onRefreshStockDetail(
    RefreshStockDetail event,
    Emitter<StockDetailState> emit,
  ) async {
    // Clear cache and reload
    _finnhubRepository.clearCache();
    _fmpRepository.clearCache();
    add(LoadStockDetail(event.symbol));
  }
}
