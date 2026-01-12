// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompanyNewsModel _$CompanyNewsModelFromJson(Map<String, dynamic> json) =>
    _CompanyNewsModel(
      category: json['category'] as String,
      datetime: (json['datetime'] as num).toInt(),
      headline: json['headline'] as String,
      id: (json['id'] as num).toInt(),
      image: json['image'] as String,
      related: json['related'] as String,
      source: json['source'] as String,
      summary: json['summary'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$CompanyNewsModelToJson(_CompanyNewsModel instance) =>
    <String, dynamic>{
      'category': instance.category,
      'datetime': instance.datetime,
      'headline': instance.headline,
      'id': instance.id,
      'image': instance.image,
      'related': instance.related,
      'source': instance.source,
      'summary': instance.summary,
      'url': instance.url,
    };
