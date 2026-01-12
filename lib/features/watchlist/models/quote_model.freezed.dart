// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuoteModel {

@JsonKey(name: 'c') double get currentPrice;@JsonKey(name: 'd') double get change;@JsonKey(name: 'dp') double get percentChange;@JsonKey(name: 'h') double get highPrice;@JsonKey(name: 'l') double get lowPrice;@JsonKey(name: 'o') double get openPrice;@JsonKey(name: 'pc') double get previousClose;@JsonKey(name: 't') int get timestamp;
/// Create a copy of QuoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuoteModelCopyWith<QuoteModel> get copyWith => _$QuoteModelCopyWithImpl<QuoteModel>(this as QuoteModel, _$identity);

  /// Serializes this QuoteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuoteModel&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.change, change) || other.change == change)&&(identical(other.percentChange, percentChange) || other.percentChange == percentChange)&&(identical(other.highPrice, highPrice) || other.highPrice == highPrice)&&(identical(other.lowPrice, lowPrice) || other.lowPrice == lowPrice)&&(identical(other.openPrice, openPrice) || other.openPrice == openPrice)&&(identical(other.previousClose, previousClose) || other.previousClose == previousClose)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPrice,change,percentChange,highPrice,lowPrice,openPrice,previousClose,timestamp);

@override
String toString() {
  return 'QuoteModel(currentPrice: $currentPrice, change: $change, percentChange: $percentChange, highPrice: $highPrice, lowPrice: $lowPrice, openPrice: $openPrice, previousClose: $previousClose, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $QuoteModelCopyWith<$Res>  {
  factory $QuoteModelCopyWith(QuoteModel value, $Res Function(QuoteModel) _then) = _$QuoteModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'c') double currentPrice,@JsonKey(name: 'd') double change,@JsonKey(name: 'dp') double percentChange,@JsonKey(name: 'h') double highPrice,@JsonKey(name: 'l') double lowPrice,@JsonKey(name: 'o') double openPrice,@JsonKey(name: 'pc') double previousClose,@JsonKey(name: 't') int timestamp
});




}
/// @nodoc
class _$QuoteModelCopyWithImpl<$Res>
    implements $QuoteModelCopyWith<$Res> {
  _$QuoteModelCopyWithImpl(this._self, this._then);

  final QuoteModel _self;
  final $Res Function(QuoteModel) _then;

/// Create a copy of QuoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPrice = null,Object? change = null,Object? percentChange = null,Object? highPrice = null,Object? lowPrice = null,Object? openPrice = null,Object? previousClose = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
currentPrice: null == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double,change: null == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as double,percentChange: null == percentChange ? _self.percentChange : percentChange // ignore: cast_nullable_to_non_nullable
as double,highPrice: null == highPrice ? _self.highPrice : highPrice // ignore: cast_nullable_to_non_nullable
as double,lowPrice: null == lowPrice ? _self.lowPrice : lowPrice // ignore: cast_nullable_to_non_nullable
as double,openPrice: null == openPrice ? _self.openPrice : openPrice // ignore: cast_nullable_to_non_nullable
as double,previousClose: null == previousClose ? _self.previousClose : previousClose // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [QuoteModel].
extension QuoteModelPatterns on QuoteModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuoteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuoteModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuoteModel value)  $default,){
final _that = this;
switch (_that) {
case _QuoteModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuoteModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuoteModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'c')  double currentPrice, @JsonKey(name: 'd')  double change, @JsonKey(name: 'dp')  double percentChange, @JsonKey(name: 'h')  double highPrice, @JsonKey(name: 'l')  double lowPrice, @JsonKey(name: 'o')  double openPrice, @JsonKey(name: 'pc')  double previousClose, @JsonKey(name: 't')  int timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuoteModel() when $default != null:
return $default(_that.currentPrice,_that.change,_that.percentChange,_that.highPrice,_that.lowPrice,_that.openPrice,_that.previousClose,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'c')  double currentPrice, @JsonKey(name: 'd')  double change, @JsonKey(name: 'dp')  double percentChange, @JsonKey(name: 'h')  double highPrice, @JsonKey(name: 'l')  double lowPrice, @JsonKey(name: 'o')  double openPrice, @JsonKey(name: 'pc')  double previousClose, @JsonKey(name: 't')  int timestamp)  $default,) {final _that = this;
switch (_that) {
case _QuoteModel():
return $default(_that.currentPrice,_that.change,_that.percentChange,_that.highPrice,_that.lowPrice,_that.openPrice,_that.previousClose,_that.timestamp);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'c')  double currentPrice, @JsonKey(name: 'd')  double change, @JsonKey(name: 'dp')  double percentChange, @JsonKey(name: 'h')  double highPrice, @JsonKey(name: 'l')  double lowPrice, @JsonKey(name: 'o')  double openPrice, @JsonKey(name: 'pc')  double previousClose, @JsonKey(name: 't')  int timestamp)?  $default,) {final _that = this;
switch (_that) {
case _QuoteModel() when $default != null:
return $default(_that.currentPrice,_that.change,_that.percentChange,_that.highPrice,_that.lowPrice,_that.openPrice,_that.previousClose,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuoteModel implements QuoteModel {
  const _QuoteModel({@JsonKey(name: 'c') required this.currentPrice, @JsonKey(name: 'd') required this.change, @JsonKey(name: 'dp') required this.percentChange, @JsonKey(name: 'h') required this.highPrice, @JsonKey(name: 'l') required this.lowPrice, @JsonKey(name: 'o') required this.openPrice, @JsonKey(name: 'pc') required this.previousClose, @JsonKey(name: 't') required this.timestamp});
  factory _QuoteModel.fromJson(Map<String, dynamic> json) => _$QuoteModelFromJson(json);

@override@JsonKey(name: 'c') final  double currentPrice;
@override@JsonKey(name: 'd') final  double change;
@override@JsonKey(name: 'dp') final  double percentChange;
@override@JsonKey(name: 'h') final  double highPrice;
@override@JsonKey(name: 'l') final  double lowPrice;
@override@JsonKey(name: 'o') final  double openPrice;
@override@JsonKey(name: 'pc') final  double previousClose;
@override@JsonKey(name: 't') final  int timestamp;

/// Create a copy of QuoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuoteModelCopyWith<_QuoteModel> get copyWith => __$QuoteModelCopyWithImpl<_QuoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuoteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuoteModel&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.change, change) || other.change == change)&&(identical(other.percentChange, percentChange) || other.percentChange == percentChange)&&(identical(other.highPrice, highPrice) || other.highPrice == highPrice)&&(identical(other.lowPrice, lowPrice) || other.lowPrice == lowPrice)&&(identical(other.openPrice, openPrice) || other.openPrice == openPrice)&&(identical(other.previousClose, previousClose) || other.previousClose == previousClose)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPrice,change,percentChange,highPrice,lowPrice,openPrice,previousClose,timestamp);

@override
String toString() {
  return 'QuoteModel(currentPrice: $currentPrice, change: $change, percentChange: $percentChange, highPrice: $highPrice, lowPrice: $lowPrice, openPrice: $openPrice, previousClose: $previousClose, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$QuoteModelCopyWith<$Res> implements $QuoteModelCopyWith<$Res> {
  factory _$QuoteModelCopyWith(_QuoteModel value, $Res Function(_QuoteModel) _then) = __$QuoteModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'c') double currentPrice,@JsonKey(name: 'd') double change,@JsonKey(name: 'dp') double percentChange,@JsonKey(name: 'h') double highPrice,@JsonKey(name: 'l') double lowPrice,@JsonKey(name: 'o') double openPrice,@JsonKey(name: 'pc') double previousClose,@JsonKey(name: 't') int timestamp
});




}
/// @nodoc
class __$QuoteModelCopyWithImpl<$Res>
    implements _$QuoteModelCopyWith<$Res> {
  __$QuoteModelCopyWithImpl(this._self, this._then);

  final _QuoteModel _self;
  final $Res Function(_QuoteModel) _then;

/// Create a copy of QuoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPrice = null,Object? change = null,Object? percentChange = null,Object? highPrice = null,Object? lowPrice = null,Object? openPrice = null,Object? previousClose = null,Object? timestamp = null,}) {
  return _then(_QuoteModel(
currentPrice: null == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double,change: null == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as double,percentChange: null == percentChange ? _self.percentChange : percentChange // ignore: cast_nullable_to_non_nullable
as double,highPrice: null == highPrice ? _self.highPrice : highPrice // ignore: cast_nullable_to_non_nullable
as double,lowPrice: null == lowPrice ? _self.lowPrice : lowPrice // ignore: cast_nullable_to_non_nullable
as double,openPrice: null == openPrice ? _self.openPrice : openPrice // ignore: cast_nullable_to_non_nullable
as double,previousClose: null == previousClose ? _self.previousClose : previousClose // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
