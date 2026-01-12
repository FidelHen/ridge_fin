import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote_model.freezed.dart';
part 'quote_model.g.dart';

@freezed
sealed class QuoteModel with _$QuoteModel {
  const factory QuoteModel({
    @JsonKey(name: 'c') required double currentPrice,
    @JsonKey(name: 'd') required double change,
    @JsonKey(name: 'dp') required double percentChange,
    @JsonKey(name: 'h') required double highPrice,
    @JsonKey(name: 'l') required double lowPrice,
    @JsonKey(name: 'o') required double openPrice,
    @JsonKey(name: 'pc') required double previousClose,
    @JsonKey(name: 't') required int timestamp,
  }) = _QuoteModel;

  factory QuoteModel.fromJson(Map<String, dynamic> json) => _$QuoteModelFromJson(json);
}
