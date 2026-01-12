import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ridge_fin/core/services/cache_service.dart';
import 'package:ridge_fin/features/watchlist/models/quote_model.dart';
import 'package:ridge_fin/features/watchlist/models/watchlist_item_model.dart';
import 'package:ridge_fin/features/watchlist/repositories/finnhub_repository.dart';
import 'package:ridge_fin/features/watchlist/repositories/watchlist_repository.dart';

part 'watchlist_bloc.freezed.dart';

// ============================================
// STATE
// ============================================
@freezed
class WatchlistState with _$WatchlistState {
  const factory WatchlistState.initial() = _Initial;
  const factory WatchlistState.loading() = _Loading;
  const factory WatchlistState.loaded({
    required List<WatchlistItemModel> items,
    required Map<String, QuoteModel> quotes,
  }) = _Loaded;
  const factory WatchlistState.error(String message) = _Error;
}

// ============================================
// EVENTS
// ============================================
abstract class WatchlistEvent extends Equatable {
  const WatchlistEvent();

  @override
  List<Object?> get props => [];
}

class LoadWatchlist extends WatchlistEvent {
  const LoadWatchlist();
}

class RefreshWatchlist extends WatchlistEvent {
  const RefreshWatchlist();
}

class ToggleFavorite extends WatchlistEvent {
  final String symbol;
  final String title;

  const ToggleFavorite(this.symbol, this.title);

  @override
  List<Object?> get props => [symbol, title];
}

// ============================================
// BLOC
// ============================================
class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  final WatchlistRepository _watchlistRepository;
  final FinnhubRepository _finnhubRepository;
  final CacheService _cacheService;

  WatchlistBloc(
    this._watchlistRepository,
    this._finnhubRepository,
    this._cacheService,
  ) : super(const WatchlistState.initial()) {
    on<LoadWatchlist>(_onLoadWatchlist);
    on<RefreshWatchlist>(_onRefreshWatchlist);
    on<ToggleFavorite>(_onToggleFavorite);
  }

  Future<void> _onLoadWatchlist(
    LoadWatchlist event,
    Emitter<WatchlistState> emit,
  ) async {
    emit(const WatchlistState.loading());

    try {
      final items = await _watchlistRepository.getWatchlist();
      final quotes = <String, QuoteModel>{};

      for (final item in items) {
        final cachedQuote = await _cacheService.getCachedQuote(item.symbol);
        if (cachedQuote != null) {
          quotes[item.symbol] = cachedQuote;
        }
      }

      emit(WatchlistState.loaded(items: items, quotes: quotes));

      for (final item in items) {
        try {
          final quote = await _finnhubRepository.getQuote(item.symbol);
          quotes[item.symbol] = quote;
          await _cacheService.cacheQuote(item.symbol, quote);
        } catch (e) {
          // Continue with cached data if fetch fails
        }
      }

      emit(WatchlistState.loaded(items: items, quotes: quotes));
    } catch (e) {
      emit(WatchlistState.error('Failed to load watchlist: $e'));
    }
  }

  Future<void> _onRefreshWatchlist(
    RefreshWatchlist event,
    Emitter<WatchlistState> emit,
  ) async {
    final currentState = state;
    if (currentState is! _Loaded) {
      add(const LoadWatchlist());
      return;
    }

    try {
      final items = currentState.items;
      final quotes = Map<String, QuoteModel>.from(currentState.quotes);

      for (final item in items) {
        try {
          final quote = await _finnhubRepository.getQuote(item.symbol);
          quotes[item.symbol] = quote;
          await _cacheService.cacheQuote(item.symbol, quote);
        } catch (e) {
          // Keep existing quote if fetch fails
        }
      }

      emit(WatchlistState.loaded(items: items, quotes: quotes));
    } catch (e) {
      emit(WatchlistState.error('Failed to refresh: $e'));
    }
  }

  Future<void> _onToggleFavorite(
    ToggleFavorite event,
    Emitter<WatchlistState> emit,
  ) async {
    try {
      final isInWatchlist = await _watchlistRepository.isInWatchlist(event.symbol);

      if (isInWatchlist) {
        await _watchlistRepository.removeFromWatchlist(event.symbol);
      } else {
        await _watchlistRepository.addToWatchlist(event.symbol, event.title);
      }

      add(const LoadWatchlist());
    } catch (e) {
      emit(WatchlistState.error('Failed to toggle favorite: $e'));
    }
  }
}
