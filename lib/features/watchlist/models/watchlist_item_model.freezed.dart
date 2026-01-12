// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watchlist_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WatchlistItemModel {

 String get id;@JsonKey(name: 'user_id') String get userId; String get symbol; String get title;@JsonKey(name: 'added_at') String get addedAt;
/// Create a copy of WatchlistItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchlistItemModelCopyWith<WatchlistItemModel> get copyWith => _$WatchlistItemModelCopyWithImpl<WatchlistItemModel>(this as WatchlistItemModel, _$identity);

  /// Serializes this WatchlistItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchlistItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.title, title) || other.title == title)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,symbol,title,addedAt);

@override
String toString() {
  return 'WatchlistItemModel(id: $id, userId: $userId, symbol: $symbol, title: $title, addedAt: $addedAt)';
}


}

/// @nodoc
abstract mixin class $WatchlistItemModelCopyWith<$Res>  {
  factory $WatchlistItemModelCopyWith(WatchlistItemModel value, $Res Function(WatchlistItemModel) _then) = _$WatchlistItemModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId, String symbol, String title,@JsonKey(name: 'added_at') String addedAt
});




}
/// @nodoc
class _$WatchlistItemModelCopyWithImpl<$Res>
    implements $WatchlistItemModelCopyWith<$Res> {
  _$WatchlistItemModelCopyWithImpl(this._self, this._then);

  final WatchlistItemModel _self;
  final $Res Function(WatchlistItemModel) _then;

/// Create a copy of WatchlistItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? symbol = null,Object? title = null,Object? addedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WatchlistItemModel].
extension WatchlistItemModelPatterns on WatchlistItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WatchlistItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WatchlistItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WatchlistItemModel value)  $default,){
final _that = this;
switch (_that) {
case _WatchlistItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WatchlistItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _WatchlistItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId,  String symbol,  String title, @JsonKey(name: 'added_at')  String addedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WatchlistItemModel() when $default != null:
return $default(_that.id,_that.userId,_that.symbol,_that.title,_that.addedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId,  String symbol,  String title, @JsonKey(name: 'added_at')  String addedAt)  $default,) {final _that = this;
switch (_that) {
case _WatchlistItemModel():
return $default(_that.id,_that.userId,_that.symbol,_that.title,_that.addedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String userId,  String symbol,  String title, @JsonKey(name: 'added_at')  String addedAt)?  $default,) {final _that = this;
switch (_that) {
case _WatchlistItemModel() when $default != null:
return $default(_that.id,_that.userId,_that.symbol,_that.title,_that.addedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WatchlistItemModel implements WatchlistItemModel {
  const _WatchlistItemModel({required this.id, @JsonKey(name: 'user_id') required this.userId, required this.symbol, required this.title, @JsonKey(name: 'added_at') required this.addedAt});
  factory _WatchlistItemModel.fromJson(Map<String, dynamic> json) => _$WatchlistItemModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  String userId;
@override final  String symbol;
@override final  String title;
@override@JsonKey(name: 'added_at') final  String addedAt;

/// Create a copy of WatchlistItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WatchlistItemModelCopyWith<_WatchlistItemModel> get copyWith => __$WatchlistItemModelCopyWithImpl<_WatchlistItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WatchlistItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WatchlistItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.title, title) || other.title == title)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,symbol,title,addedAt);

@override
String toString() {
  return 'WatchlistItemModel(id: $id, userId: $userId, symbol: $symbol, title: $title, addedAt: $addedAt)';
}


}

/// @nodoc
abstract mixin class _$WatchlistItemModelCopyWith<$Res> implements $WatchlistItemModelCopyWith<$Res> {
  factory _$WatchlistItemModelCopyWith(_WatchlistItemModel value, $Res Function(_WatchlistItemModel) _then) = __$WatchlistItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId, String symbol, String title,@JsonKey(name: 'added_at') String addedAt
});




}
/// @nodoc
class __$WatchlistItemModelCopyWithImpl<$Res>
    implements _$WatchlistItemModelCopyWith<$Res> {
  __$WatchlistItemModelCopyWithImpl(this._self, this._then);

  final _WatchlistItemModel _self;
  final $Res Function(_WatchlistItemModel) _then;

/// Create a copy of WatchlistItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? symbol = null,Object? title = null,Object? addedAt = null,}) {
  return _then(_WatchlistItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
