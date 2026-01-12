// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_price_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StockPriceModel {

 String get symbol; String get date; double get price; int get volume;
/// Create a copy of StockPriceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockPriceModelCopyWith<StockPriceModel> get copyWith => _$StockPriceModelCopyWithImpl<StockPriceModel>(this as StockPriceModel, _$identity);

  /// Serializes this StockPriceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockPriceModel&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.date, date) || other.date == date)&&(identical(other.price, price) || other.price == price)&&(identical(other.volume, volume) || other.volume == volume));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,date,price,volume);

@override
String toString() {
  return 'StockPriceModel(symbol: $symbol, date: $date, price: $price, volume: $volume)';
}


}

/// @nodoc
abstract mixin class $StockPriceModelCopyWith<$Res>  {
  factory $StockPriceModelCopyWith(StockPriceModel value, $Res Function(StockPriceModel) _then) = _$StockPriceModelCopyWithImpl;
@useResult
$Res call({
 String symbol, String date, double price, int volume
});




}
/// @nodoc
class _$StockPriceModelCopyWithImpl<$Res>
    implements $StockPriceModelCopyWith<$Res> {
  _$StockPriceModelCopyWithImpl(this._self, this._then);

  final StockPriceModel _self;
  final $Res Function(StockPriceModel) _then;

/// Create a copy of StockPriceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? date = null,Object? price = null,Object? volume = null,}) {
  return _then(_self.copyWith(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [StockPriceModel].
extension StockPriceModelPatterns on StockPriceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockPriceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockPriceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockPriceModel value)  $default,){
final _that = this;
switch (_that) {
case _StockPriceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockPriceModel value)?  $default,){
final _that = this;
switch (_that) {
case _StockPriceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol,  String date,  double price,  int volume)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockPriceModel() when $default != null:
return $default(_that.symbol,_that.date,_that.price,_that.volume);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol,  String date,  double price,  int volume)  $default,) {final _that = this;
switch (_that) {
case _StockPriceModel():
return $default(_that.symbol,_that.date,_that.price,_that.volume);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol,  String date,  double price,  int volume)?  $default,) {final _that = this;
switch (_that) {
case _StockPriceModel() when $default != null:
return $default(_that.symbol,_that.date,_that.price,_that.volume);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockPriceModel implements StockPriceModel {
  const _StockPriceModel({required this.symbol, required this.date, required this.price, required this.volume});
  factory _StockPriceModel.fromJson(Map<String, dynamic> json) => _$StockPriceModelFromJson(json);

@override final  String symbol;
@override final  String date;
@override final  double price;
@override final  int volume;

/// Create a copy of StockPriceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockPriceModelCopyWith<_StockPriceModel> get copyWith => __$StockPriceModelCopyWithImpl<_StockPriceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockPriceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockPriceModel&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.date, date) || other.date == date)&&(identical(other.price, price) || other.price == price)&&(identical(other.volume, volume) || other.volume == volume));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,date,price,volume);

@override
String toString() {
  return 'StockPriceModel(symbol: $symbol, date: $date, price: $price, volume: $volume)';
}


}

/// @nodoc
abstract mixin class _$StockPriceModelCopyWith<$Res> implements $StockPriceModelCopyWith<$Res> {
  factory _$StockPriceModelCopyWith(_StockPriceModel value, $Res Function(_StockPriceModel) _then) = __$StockPriceModelCopyWithImpl;
@override @useResult
$Res call({
 String symbol, String date, double price, int volume
});




}
/// @nodoc
class __$StockPriceModelCopyWithImpl<$Res>
    implements _$StockPriceModelCopyWith<$Res> {
  __$StockPriceModelCopyWithImpl(this._self, this._then);

  final _StockPriceModel _self;
  final $Res Function(_StockPriceModel) _then;

/// Create a copy of StockPriceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? date = null,Object? price = null,Object? volume = null,}) {
  return _then(_StockPriceModel(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
