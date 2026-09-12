// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'addon_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddOnModel {

 String get id; String get title; String get description; double get price; String get unit; int? get lastUpdated; int? get dateAdded; bool get isDeleted; bool get isAvailable;
/// Create a copy of AddOnModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddOnModelCopyWith<AddOnModel> get copyWith => _$AddOnModelCopyWithImpl<AddOnModel>(this as AddOnModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddOnModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,price,unit,lastUpdated,dateAdded,isDeleted,isAvailable);

@override
String toString() {
  return 'AddOnModel(id: $id, title: $title, description: $description, price: $price, unit: $unit, lastUpdated: $lastUpdated, dateAdded: $dateAdded, isDeleted: $isDeleted, isAvailable: $isAvailable)';
}


}

/// @nodoc
abstract mixin class $AddOnModelCopyWith<$Res>  {
  factory $AddOnModelCopyWith(AddOnModel value, $Res Function(AddOnModel) _then) = _$AddOnModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, double price, String unit, int? lastUpdated, int? dateAdded, bool isDeleted, bool isAvailable
});




}
/// @nodoc
class _$AddOnModelCopyWithImpl<$Res>
    implements $AddOnModelCopyWith<$Res> {
  _$AddOnModelCopyWithImpl(this._self, this._then);

  final AddOnModel _self;
  final $Res Function(AddOnModel) _then;

/// Create a copy of AddOnModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? price = null,Object? unit = null,Object? lastUpdated = freezed,Object? dateAdded = freezed,Object? isDeleted = null,Object? isAvailable = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as int?,dateAdded: freezed == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as int?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AddOnModel].
extension AddOnModelPatterns on AddOnModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddOnModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddOnModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddOnModel value)  $default,){
final _that = this;
switch (_that) {
case _AddOnModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddOnModel value)?  $default,){
final _that = this;
switch (_that) {
case _AddOnModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  double price,  String unit,  int? lastUpdated,  int? dateAdded,  bool isDeleted,  bool isAvailable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddOnModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.price,_that.unit,_that.lastUpdated,_that.dateAdded,_that.isDeleted,_that.isAvailable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  double price,  String unit,  int? lastUpdated,  int? dateAdded,  bool isDeleted,  bool isAvailable)  $default,) {final _that = this;
switch (_that) {
case _AddOnModel():
return $default(_that.id,_that.title,_that.description,_that.price,_that.unit,_that.lastUpdated,_that.dateAdded,_that.isDeleted,_that.isAvailable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  double price,  String unit,  int? lastUpdated,  int? dateAdded,  bool isDeleted,  bool isAvailable)?  $default,) {final _that = this;
switch (_that) {
case _AddOnModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.price,_that.unit,_that.lastUpdated,_that.dateAdded,_that.isDeleted,_that.isAvailable);case _:
  return null;

}
}

}

/// @nodoc


class _AddOnModel extends AddOnModel {
  const _AddOnModel({this.id = '', this.title = '', this.description = '', this.price = 0.0, this.unit = '', this.lastUpdated, this.dateAdded, this.isDeleted = false, this.isAvailable = true}): super._();
  

@override@JsonKey() final  String id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String description;
@override@JsonKey() final  double price;
@override@JsonKey() final  String unit;
@override final  int? lastUpdated;
@override final  int? dateAdded;
@override@JsonKey() final  bool isDeleted;
@override@JsonKey() final  bool isAvailable;

/// Create a copy of AddOnModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddOnModelCopyWith<_AddOnModel> get copyWith => __$AddOnModelCopyWithImpl<_AddOnModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddOnModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,price,unit,lastUpdated,dateAdded,isDeleted,isAvailable);

@override
String toString() {
  return 'AddOnModel(id: $id, title: $title, description: $description, price: $price, unit: $unit, lastUpdated: $lastUpdated, dateAdded: $dateAdded, isDeleted: $isDeleted, isAvailable: $isAvailable)';
}


}

/// @nodoc
abstract mixin class _$AddOnModelCopyWith<$Res> implements $AddOnModelCopyWith<$Res> {
  factory _$AddOnModelCopyWith(_AddOnModel value, $Res Function(_AddOnModel) _then) = __$AddOnModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, double price, String unit, int? lastUpdated, int? dateAdded, bool isDeleted, bool isAvailable
});




}
/// @nodoc
class __$AddOnModelCopyWithImpl<$Res>
    implements _$AddOnModelCopyWith<$Res> {
  __$AddOnModelCopyWithImpl(this._self, this._then);

  final _AddOnModel _self;
  final $Res Function(_AddOnModel) _then;

/// Create a copy of AddOnModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? price = null,Object? unit = null,Object? lastUpdated = freezed,Object? dateAdded = freezed,Object? isDeleted = null,Object? isAvailable = null,}) {
  return _then(_AddOnModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as int?,dateAdded: freezed == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as int?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
