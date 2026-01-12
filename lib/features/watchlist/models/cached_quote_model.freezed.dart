// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cached_quote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CachedQuoteModel {

 String get symbol; QuoteModel get quote; int get cachedAt;
/// Create a copy of CachedQuoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CachedQuoteModelCopyWith<CachedQuoteModel> get copyWith => _$CachedQuoteModelCopyWithImpl<CachedQuoteModel>(this as CachedQuoteModel, _$identity);

  /// Serializes this CachedQuoteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CachedQuoteModel&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.quote, quote) || other.quote == quote)&&(identical(other.cachedAt, cachedAt) || other.cachedAt == cachedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,quote,cachedAt);

@override
String toString() {
  return 'CachedQuoteModel(symbol: $symbol, quote: $quote, cachedAt: $cachedAt)';
}


}

/// @nodoc
abstract mixin class $CachedQuoteModelCopyWith<$Res>  {
  factory $CachedQuoteModelCopyWith(CachedQuoteModel value, $Res Function(CachedQuoteModel) _then) = _$CachedQuoteModelCopyWithImpl;
@useResult
$Res call({
 String symbol, QuoteModel quote, int cachedAt
});


$QuoteModelCopyWith<$Res> get quote;

}
/// @nodoc
class _$CachedQuoteModelCopyWithImpl<$Res>
    implements $CachedQuoteModelCopyWith<$Res> {
  _$CachedQuoteModelCopyWithImpl(this._self, this._then);

  final CachedQuoteModel _self;
  final $Res Function(CachedQuoteModel) _then;

/// Create a copy of CachedQuoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? quote = null,Object? cachedAt = null,}) {
  return _then(_self.copyWith(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,quote: null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as QuoteModel,cachedAt: null == cachedAt ? _self.cachedAt : cachedAt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of CachedQuoteModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuoteModelCopyWith<$Res> get quote {
  
  return $QuoteModelCopyWith<$Res>(_self.quote, (value) {
    return _then(_self.copyWith(quote: value));
  });
}
}


/// Adds pattern-matching-related methods to [CachedQuoteModel].
extension CachedQuoteModelPatterns on CachedQuoteModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CachedQuoteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CachedQuoteModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CachedQuoteModel value)  $default,){
final _that = this;
switch (_that) {
case _CachedQuoteModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CachedQuoteModel value)?  $default,){
final _that = this;
switch (_that) {
case _CachedQuoteModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol,  QuoteModel quote,  int cachedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CachedQuoteModel() when $default != null:
return $default(_that.symbol,_that.quote,_that.cachedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol,  QuoteModel quote,  int cachedAt)  $default,) {final _that = this;
switch (_that) {
case _CachedQuoteModel():
return $default(_that.symbol,_that.quote,_that.cachedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol,  QuoteModel quote,  int cachedAt)?  $default,) {final _that = this;
switch (_that) {
case _CachedQuoteModel() when $default != null:
return $default(_that.symbol,_that.quote,_that.cachedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CachedQuoteModel implements CachedQuoteModel {
  const _CachedQuoteModel({required this.symbol, required this.quote, required this.cachedAt});
  factory _CachedQuoteModel.fromJson(Map<String, dynamic> json) => _$CachedQuoteModelFromJson(json);

@override final  String symbol;
@override final  QuoteModel quote;
@override final  int cachedAt;

/// Create a copy of CachedQuoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CachedQuoteModelCopyWith<_CachedQuoteModel> get copyWith => __$CachedQuoteModelCopyWithImpl<_CachedQuoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CachedQuoteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CachedQuoteModel&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.quote, quote) || other.quote == quote)&&(identical(other.cachedAt, cachedAt) || other.cachedAt == cachedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,quote,cachedAt);

@override
String toString() {
  return 'CachedQuoteModel(symbol: $symbol, quote: $quote, cachedAt: $cachedAt)';
}


}

/// @nodoc
abstract mixin class _$CachedQuoteModelCopyWith<$Res> implements $CachedQuoteModelCopyWith<$Res> {
  factory _$CachedQuoteModelCopyWith(_CachedQuoteModel value, $Res Function(_CachedQuoteModel) _then) = __$CachedQuoteModelCopyWithImpl;
@override @useResult
$Res call({
 String symbol, QuoteModel quote, int cachedAt
});


@override $QuoteModelCopyWith<$Res> get quote;

}
/// @nodoc
class __$CachedQuoteModelCopyWithImpl<$Res>
    implements _$CachedQuoteModelCopyWith<$Res> {
  __$CachedQuoteModelCopyWithImpl(this._self, this._then);

  final _CachedQuoteModel _self;
  final $Res Function(_CachedQuoteModel) _then;

/// Create a copy of CachedQuoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? quote = null,Object? cachedAt = null,}) {
  return _then(_CachedQuoteModel(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,quote: null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as QuoteModel,cachedAt: null == cachedAt ? _self.cachedAt : cachedAt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of CachedQuoteModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuoteModelCopyWith<$Res> get quote {
  
  return $QuoteModelCopyWith<$Res>(_self.quote, (value) {
    return _then(_self.copyWith(quote: value));
  });
}
}

// dart format on
