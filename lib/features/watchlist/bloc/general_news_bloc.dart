import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ridge_fin/core/services/cache_service.dart';
import 'package:ridge_fin/features/watchlist/models/company_news_model.dart';
import 'package:ridge_fin/features/watchlist/repositories/finnhub_repository.dart';

part 'general_news_bloc.freezed.dart';

// ============================================
// STATE
// ============================================
@freezed
class GeneralNewsState with _$GeneralNewsState {
  const factory GeneralNewsState.initial() = _Initial;
  const factory GeneralNewsState.loading() = _Loading;
  const factory GeneralNewsState.loaded(List<CompanyNewsModel> news) = _Loaded;
  const factory GeneralNewsState.error(String message) = _Error;
}

// ============================================
// EVENTS
// ============================================
abstract class GeneralNewsEvent extends Equatable {
  const GeneralNewsEvent();

  @override
  List<Object?> get props => [];
}

class LoadGeneralNews extends GeneralNewsEvent {
  const LoadGeneralNews();
}

class RefreshGeneralNews extends GeneralNewsEvent {
  const RefreshGeneralNews();
}

// ============================================
// BLOC
// ============================================
class GeneralNewsBloc extends Bloc<GeneralNewsEvent, GeneralNewsState> {
  final FinnhubRepository _finnhubRepository;
  final CacheService _cacheService;

  GeneralNewsBloc(
    this._finnhubRepository,
    this._cacheService,
  ) : super(const GeneralNewsState.initial()) {
    on<LoadGeneralNews>(_onLoadGeneralNews);
    on<RefreshGeneralNews>(_onRefreshGeneralNews);
  }

  Future<void> _onLoadGeneralNews(
    LoadGeneralNews event,
    Emitter<GeneralNewsState> emit,
  ) async {
    emit(const GeneralNewsState.loading());

    try {
      final cached = await _cacheService.getCachedGeneralNews();
      if (cached != null && cached.isNotEmpty) {
        emit(GeneralNewsState.loaded(cached));
        return;
      }

      final news = await _finnhubRepository.getGeneralNews();
      await _cacheService.cacheGeneralNews(news);
      emit(GeneralNewsState.loaded(news));
    } catch (e) {
      emit(GeneralNewsState.error('Failed to load news: $e'));
    }
  }

  Future<void> _onRefreshGeneralNews(
    RefreshGeneralNews event,
    Emitter<GeneralNewsState> emit,
  ) async {
    try {
      final news = await _finnhubRepository.getGeneralNews();
      await _cacheService.cacheGeneralNews(news);
      emit(GeneralNewsState.loaded(news));
    } catch (e) {
      emit(GeneralNewsState.error('Failed to refresh news: $e'));
    }
  }
}
