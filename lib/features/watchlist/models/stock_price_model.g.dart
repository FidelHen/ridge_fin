// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StockPriceModel _$StockPriceModelFromJson(Map<String, dynamic> json) =>
    _StockPriceModel(
      symbol: json['symbol'] as String,
      date: json['date'] as String,
      price: (json['price'] as num).toDouble(),
      volume: (json['volume'] as num).toInt(),
    );

Map<String, dynamic> _$StockPriceModelToJson(_StockPriceModel instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'date': instance.date,
      'price': instance.price,
      'volume': instance.volume,
    };
