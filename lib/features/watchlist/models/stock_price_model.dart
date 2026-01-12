import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_price_model.freezed.dart';
part 'stock_price_model.g.dart';

@freezed
sealed class StockPriceModel with _$StockPriceModel {
  const factory StockPriceModel({
    required String symbol,
    required String date,
    required double price,
    required int volume,
  }) = _StockPriceModel;

  factory StockPriceModel.fromJson(Map<String, dynamic> json) => _$StockPriceModelFromJson(json);
}
