// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuoteModel _$QuoteModelFromJson(Map<String, dynamic> json) => _QuoteModel(
  currentPrice: (json['c'] as num).toDouble(),
  change: (json['d'] as num).toDouble(),
  percentChange: (json['dp'] as num).toDouble(),
  highPrice: (json['h'] as num).toDouble(),
  lowPrice: (json['l'] as num).toDouble(),
  openPrice: (json['o'] as num).toDouble(),
  previousClose: (json['pc'] as num).toDouble(),
  timestamp: (json['t'] as num).toInt(),
);

Map<String, dynamic> _$QuoteModelToJson(_QuoteModel instance) =>
    <String, dynamic>{
      'c': instance.currentPrice,
      'd': instance.change,
      'dp': instance.percentChange,
      'h': instance.highPrice,
      'l': instance.lowPrice,
      'o': instance.openPrice,
      'pc': instance.previousClose,
      't': instance.timestamp,
    };
