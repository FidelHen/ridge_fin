// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticker_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TickerModel _$TickerModelFromJson(Map<String, dynamic> json) => _TickerModel(
  cikStr: (json['cik_str'] as num).toInt(),
  ticker: json['ticker'] as String,
  title: json['title'] as String,
);

Map<String, dynamic> _$TickerModelToJson(_TickerModel instance) =>
    <String, dynamic>{
      'cik_str': instance.cikStr,
      'ticker': instance.ticker,
      'title': instance.title,
    };
