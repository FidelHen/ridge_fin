import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticker_model.freezed.dart';
part 'ticker_model.g.dart';

@freezed
sealed class TickerModel with _$TickerModel {
  const factory TickerModel({
    required int cikStr,
    required String ticker,
    required String title,
  }) = _TickerModel;

  factory TickerModel.fromJson(Map<String, dynamic> json) => _$TickerModelFromJson(json);
}
