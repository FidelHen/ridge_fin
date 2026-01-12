import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_news_model.freezed.dart';
part 'company_news_model.g.dart';

@freezed
sealed class CompanyNewsModel with _$CompanyNewsModel {
  const factory CompanyNewsModel({
    required String category,
    required int datetime,
    required String headline,
    required int id,
    required String image,
    required String related,
    required String source,
    required String summary,
    required String url,
  }) = _CompanyNewsModel;

  factory CompanyNewsModel.fromJson(Map<String, dynamic> json) => _$CompanyNewsModelFromJson(json);
}
