import 'package:freezed_annotation/freezed_annotation.dart';

part 'watchlist_item_model.freezed.dart';
part 'watchlist_item_model.g.dart';

@freezed
sealed class WatchlistItemModel with _$WatchlistItemModel {
  const factory WatchlistItemModel({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    required String symbol,
    required String title,
    @JsonKey(name: 'added_at') required String addedAt,
  }) = _WatchlistItemModel;

  factory WatchlistItemModel.fromJson(Map<String, dynamic> json) => _$WatchlistItemModelFromJson(json);
}
