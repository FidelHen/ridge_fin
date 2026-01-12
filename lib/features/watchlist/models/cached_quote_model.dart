import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ridge_fin/features/watchlist/models/quote_model.dart';

part 'cached_quote_model.freezed.dart';
part 'cached_quote_model.g.dart';

@freezed
sealed class CachedQuoteModel with _$CachedQuoteModel {
  const factory CachedQuoteModel({
    required String symbol,
    required QuoteModel quote,
    required int cachedAt,
  }) = _CachedQuoteModel;

  factory CachedQuoteModel.fromJson(Map<String, dynamic> json) => _$CachedQuoteModelFromJson(json);
}
