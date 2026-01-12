import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ridge_fin/features/watchlist/models/ticker_model.dart';
import 'package:ridge_fin/features/watchlist/repositories/ticker_repository.dart';

part 'search_stock_bloc.freezed.dart';

// ============================================
// STATE
// ============================================
@freezed
class SearchStockState with _$SearchStockState {
  const factory SearchStockState.initial() = _Initial;
  const factory SearchStockState.loading() = _Loading;
  const factory SearchStockState.success(List<TickerModel> tickers) = _Success;
  const factory SearchStockState.empty() = _Empty;
  const factory SearchStockState.error(String message) = _Error;
}

// ============================================
// EVENTS
// ============================================
abstract class SearchStockEvent extends Equatable {
  const SearchStockEvent();

  @override
  List<Object?> get props => [];
}

class SearchQueryChanged extends SearchStockEvent {
  final String query;

  const SearchQueryChanged(this.query);

  @override
  List<Object?> get props => [query];
}

class ClearSearch extends SearchStockEvent {
  const ClearSearch();
}

// ============================================
// BLOC
// ============================================
class SearchStockBloc extends Bloc<SearchStockEvent, SearchStockState> {
  final TickerRepository _tickerRepository;

  SearchStockBloc(this._tickerRepository) : super(const SearchStockState.initial()) {
    on<SearchQueryChanged>(_onSearchQueryChanged);
    on<ClearSearch>(_onClearSearch);
  }

  Future<void> _onSearchQueryChanged(
    SearchQueryChanged event,
    Emitter<SearchStockState> emit,
  ) async {
    final query = event.query.trim();

    if (query.isEmpty) {
      emit(const SearchStockState.initial());
      return;
    }

    emit(const SearchStockState.loading());

    try {
      final tickers = await _tickerRepository.searchTickers(query);

      if (tickers.isEmpty) {
        emit(const SearchStockState.empty());
      } else {
        emit(SearchStockState.success(tickers));
      }
    } catch (e) {
      emit(SearchStockState.error('Failed to search: ${e.toString()}'));
    }
  }

  void _onClearSearch(
    ClearSearch event,
    Emitter<SearchStockState> emit,
  ) {
    emit(const SearchStockState.initial());
  }
}
