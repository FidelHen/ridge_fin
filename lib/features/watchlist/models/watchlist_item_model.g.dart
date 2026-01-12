// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WatchlistItemModel _$WatchlistItemModelFromJson(Map<String, dynamic> json) =>
    _WatchlistItemModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      symbol: json['symbol'] as String,
      title: json['title'] as String,
      addedAt: json['added_at'] as String,
    );

Map<String, dynamic> _$WatchlistItemModelToJson(_WatchlistItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'symbol': instance.symbol,
      'title': instance.title,
      'added_at': instance.addedAt,
    };
