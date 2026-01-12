// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_quote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CachedQuoteModel _$CachedQuoteModelFromJson(Map<String, dynamic> json) =>
    _CachedQuoteModel(
      symbol: json['symbol'] as String,
      quote: QuoteModel.fromJson(json['quote'] as Map<String, dynamic>),
      cachedAt: (json['cachedAt'] as num).toInt(),
    );

Map<String, dynamic> _$CachedQuoteModelToJson(_CachedQuoteModel instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'quote': instance.quote,
      'cachedAt': instance.cachedAt,
    };
