// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticker_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TickerModel {

@JsonKey(name: 'cik_str') int get cikStr; String get ticker; String get title;
/// Create a copy of TickerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TickerModelCopyWith<TickerModel> get copyWith => _$TickerModelCopyWithImpl<TickerModel>(this as TickerModel, _$identity);

  /// Serializes this TickerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TickerModel&&(identical(other.cikStr, cikStr) || other.cikStr == cikStr)&&(identical(other.ticker, ticker) || other.ticker == ticker)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cikStr,ticker,title);

@override
String toString() {
  return 'TickerModel(cikStr: $cikStr, ticker: $ticker, title: $title)';
}


}

/// @nodoc
abstract mixin class $TickerModelCopyWith<$Res>  {
  factory $TickerModelCopyWith(TickerModel value, $Res Function(TickerModel) _then) = _$TickerModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'cik_str') int cikStr, String ticker, String title
});




}
/// @nodoc
class _$TickerModelCopyWithImpl<$Res>
    implements $TickerModelCopyWith<$Res> {
  _$TickerModelCopyWithImpl(this._self, this._then);

  final TickerModel _self;
  final $Res Function(TickerModel) _then;

/// Create a copy of TickerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cikStr = null,Object? ticker = null,Object? title = null,}) {
  return _then(_self.copyWith(
cikStr: null == cikStr ? _self.cikStr : cikStr // ignore: cast_nullable_to_non_nullable
as int,ticker: null == ticker ? _self.ticker : ticker // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TickerModel].
extension TickerModelPatterns on TickerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TickerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TickerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TickerModel value)  $default,){
final _that = this;
switch (_that) {
case _TickerModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TickerModel value)?  $default,){
final _that = this;
switch (_that) {
case _TickerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'cik_str')  int cikStr,  String ticker,  String title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TickerModel() when $default != null:
return $default(_that.cikStr,_that.ticker,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'cik_str')  int cikStr,  String ticker,  String title)  $default,) {final _that = this;
switch (_that) {
case _TickerModel():
return $default(_that.cikStr,_that.ticker,_that.title);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'cik_str')  int cikStr,  String ticker,  String title)?  $default,) {final _that = this;
switch (_that) {
case _TickerModel() when $default != null:
return $default(_that.cikStr,_that.ticker,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TickerModel implements TickerModel {
  const _TickerModel({@JsonKey(name: 'cik_str') required this.cikStr, required this.ticker, required this.title});
  factory _TickerModel.fromJson(Map<String, dynamic> json) => _$TickerModelFromJson(json);

@override@JsonKey(name: 'cik_str') final  int cikStr;
@override final  String ticker;
@override final  String title;

/// Create a copy of TickerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TickerModelCopyWith<_TickerModel> get copyWith => __$TickerModelCopyWithImpl<_TickerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TickerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TickerModel&&(identical(other.cikStr, cikStr) || other.cikStr == cikStr)&&(identical(other.ticker, ticker) || other.ticker == ticker)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cikStr,ticker,title);

@override
String toString() {
  return 'TickerModel(cikStr: $cikStr, ticker: $ticker, title: $title)';
}


}

/// @nodoc
abstract mixin class _$TickerModelCopyWith<$Res> implements $TickerModelCopyWith<$Res> {
  factory _$TickerModelCopyWith(_TickerModel value, $Res Function(_TickerModel) _then) = __$TickerModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'cik_str') int cikStr, String ticker, String title
});




}
/// @nodoc
class __$TickerModelCopyWithImpl<$Res>
    implements _$TickerModelCopyWith<$Res> {
  __$TickerModelCopyWithImpl(this._self, this._then);

  final _TickerModel _self;
  final $Res Function(_TickerModel) _then;

/// Create a copy of TickerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cikStr = null,Object? ticker = null,Object? title = null,}) {
  return _then(_TickerModel(
cikStr: null == cikStr ? _self.cikStr : cikStr // ignore: cast_nullable_to_non_nullable
as int,ticker: null == ticker ? _self.ticker : ticker // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
