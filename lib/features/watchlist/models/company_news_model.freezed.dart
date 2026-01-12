// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_news_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompanyNewsModel {

 String get category; int get datetime; String get headline; int get id; String get image; String get related; String get source; String get summary; String get url;
/// Create a copy of CompanyNewsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyNewsModelCopyWith<CompanyNewsModel> get copyWith => _$CompanyNewsModelCopyWithImpl<CompanyNewsModel>(this as CompanyNewsModel, _$identity);

  /// Serializes this CompanyNewsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyNewsModel&&(identical(other.category, category) || other.category == category)&&(identical(other.datetime, datetime) || other.datetime == datetime)&&(identical(other.headline, headline) || other.headline == headline)&&(identical(other.id, id) || other.id == id)&&(identical(other.image, image) || other.image == image)&&(identical(other.related, related) || other.related == related)&&(identical(other.source, source) || other.source == source)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,datetime,headline,id,image,related,source,summary,url);

@override
String toString() {
  return 'CompanyNewsModel(category: $category, datetime: $datetime, headline: $headline, id: $id, image: $image, related: $related, source: $source, summary: $summary, url: $url)';
}


}

/// @nodoc
abstract mixin class $CompanyNewsModelCopyWith<$Res>  {
  factory $CompanyNewsModelCopyWith(CompanyNewsModel value, $Res Function(CompanyNewsModel) _then) = _$CompanyNewsModelCopyWithImpl;
@useResult
$Res call({
 String category, int datetime, String headline, int id, String image, String related, String source, String summary, String url
});




}
/// @nodoc
class _$CompanyNewsModelCopyWithImpl<$Res>
    implements $CompanyNewsModelCopyWith<$Res> {
  _$CompanyNewsModelCopyWithImpl(this._self, this._then);

  final CompanyNewsModel _self;
  final $Res Function(CompanyNewsModel) _then;

/// Create a copy of CompanyNewsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? datetime = null,Object? headline = null,Object? id = null,Object? image = null,Object? related = null,Object? source = null,Object? summary = null,Object? url = null,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,datetime: null == datetime ? _self.datetime : datetime // ignore: cast_nullable_to_non_nullable
as int,headline: null == headline ? _self.headline : headline // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,related: null == related ? _self.related : related // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CompanyNewsModel].
extension CompanyNewsModelPatterns on CompanyNewsModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompanyNewsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompanyNewsModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompanyNewsModel value)  $default,){
final _that = this;
switch (_that) {
case _CompanyNewsModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompanyNewsModel value)?  $default,){
final _that = this;
switch (_that) {
case _CompanyNewsModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String category,  int datetime,  String headline,  int id,  String image,  String related,  String source,  String summary,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompanyNewsModel() when $default != null:
return $default(_that.category,_that.datetime,_that.headline,_that.id,_that.image,_that.related,_that.source,_that.summary,_that.url);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String category,  int datetime,  String headline,  int id,  String image,  String related,  String source,  String summary,  String url)  $default,) {final _that = this;
switch (_that) {
case _CompanyNewsModel():
return $default(_that.category,_that.datetime,_that.headline,_that.id,_that.image,_that.related,_that.source,_that.summary,_that.url);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String category,  int datetime,  String headline,  int id,  String image,  String related,  String source,  String summary,  String url)?  $default,) {final _that = this;
switch (_that) {
case _CompanyNewsModel() when $default != null:
return $default(_that.category,_that.datetime,_that.headline,_that.id,_that.image,_that.related,_that.source,_that.summary,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompanyNewsModel implements CompanyNewsModel {
  const _CompanyNewsModel({required this.category, required this.datetime, required this.headline, required this.id, required this.image, required this.related, required this.source, required this.summary, required this.url});
  factory _CompanyNewsModel.fromJson(Map<String, dynamic> json) => _$CompanyNewsModelFromJson(json);

@override final  String category;
@override final  int datetime;
@override final  String headline;
@override final  int id;
@override final  String image;
@override final  String related;
@override final  String source;
@override final  String summary;
@override final  String url;

/// Create a copy of CompanyNewsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyNewsModelCopyWith<_CompanyNewsModel> get copyWith => __$CompanyNewsModelCopyWithImpl<_CompanyNewsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyNewsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanyNewsModel&&(identical(other.category, category) || other.category == category)&&(identical(other.datetime, datetime) || other.datetime == datetime)&&(identical(other.headline, headline) || other.headline == headline)&&(identical(other.id, id) || other.id == id)&&(identical(other.image, image) || other.image == image)&&(identical(other.related, related) || other.related == related)&&(identical(other.source, source) || other.source == source)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,datetime,headline,id,image,related,source,summary,url);

@override
String toString() {
  return 'CompanyNewsModel(category: $category, datetime: $datetime, headline: $headline, id: $id, image: $image, related: $related, source: $source, summary: $summary, url: $url)';
}


}

/// @nodoc
abstract mixin class _$CompanyNewsModelCopyWith<$Res> implements $CompanyNewsModelCopyWith<$Res> {
  factory _$CompanyNewsModelCopyWith(_CompanyNewsModel value, $Res Function(_CompanyNewsModel) _then) = __$CompanyNewsModelCopyWithImpl;
@override @useResult
$Res call({
 String category, int datetime, String headline, int id, String image, String related, String source, String summary, String url
});




}
/// @nodoc
class __$CompanyNewsModelCopyWithImpl<$Res>
    implements _$CompanyNewsModelCopyWith<$Res> {
  __$CompanyNewsModelCopyWithImpl(this._self, this._then);

  final _CompanyNewsModel _self;
  final $Res Function(_CompanyNewsModel) _then;

/// Create a copy of CompanyNewsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? datetime = null,Object? headline = null,Object? id = null,Object? image = null,Object? related = null,Object? source = null,Object? summary = null,Object? url = null,}) {
  return _then(_CompanyNewsModel(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,datetime: null == datetime ? _self.datetime : datetime // ignore: cast_nullable_to_non_nullable
as int,headline: null == headline ? _self.headline : headline // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,related: null == related ? _self.related : related // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
