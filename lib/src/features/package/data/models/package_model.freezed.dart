// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PackageModel {

 String get id; String get title; String get branding; String get description; String get note; List<String> get inclusion; double get price; int? get lastUpdated; int? get dateAdded; bool get isDeleted; bool get isAvailable;
/// Create a copy of PackageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackageModelCopyWith<PackageModel> get copyWith => _$PackageModelCopyWithImpl<PackageModel>(this as PackageModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.branding, branding) || other.branding == branding)&&(identical(other.description, description) || other.description == description)&&(identical(other.note, note) || other.note == note)&&const DeepCollectionEquality().equals(other.inclusion, inclusion)&&(identical(other.price, price) || other.price == price)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,branding,description,note,const DeepCollectionEquality().hash(inclusion),price,lastUpdated,dateAdded,isDeleted,isAvailable);

@override
String toString() {
  return 'PackageModel(id: $id, title: $title, branding: $branding, description: $description, note: $note, inclusion: $inclusion, price: $price, lastUpdated: $lastUpdated, dateAdded: $dateAdded, isDeleted: $isDeleted, isAvailable: $isAvailable)';
}


}

/// @nodoc
abstract mixin class $PackageModelCopyWith<$Res>  {
  factory $PackageModelCopyWith(PackageModel value, $Res Function(PackageModel) _then) = _$PackageModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String branding, String description, String note, List<String> inclusion, double price, int? lastUpdated, int? dateAdded, bool isDeleted, bool isAvailable
});




}
/// @nodoc
class _$PackageModelCopyWithImpl<$Res>
    implements $PackageModelCopyWith<$Res> {
  _$PackageModelCopyWithImpl(this._self, this._then);

  final PackageModel _self;
  final $Res Function(PackageModel) _then;

/// Create a copy of PackageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? branding = null,Object? description = null,Object? note = null,Object? inclusion = null,Object? price = null,Object? lastUpdated = freezed,Object? dateAdded = freezed,Object? isDeleted = null,Object? isAvailable = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,branding: null == branding ? _self.branding : branding // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,inclusion: null == inclusion ? _self.inclusion : inclusion // ignore: cast_nullable_to_non_nullable
as List<String>,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as int?,dateAdded: freezed == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as int?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PackageModel].
extension PackageModelPatterns on PackageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PackageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PackageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PackageModel value)  $default,){
final _that = this;
switch (_that) {
case _PackageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PackageModel value)?  $default,){
final _that = this;
switch (_that) {
case _PackageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String branding,  String description,  String note,  List<String> inclusion,  double price,  int? lastUpdated,  int? dateAdded,  bool isDeleted,  bool isAvailable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PackageModel() when $default != null:
return $default(_that.id,_that.title,_that.branding,_that.description,_that.note,_that.inclusion,_that.price,_that.lastUpdated,_that.dateAdded,_that.isDeleted,_that.isAvailable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String branding,  String description,  String note,  List<String> inclusion,  double price,  int? lastUpdated,  int? dateAdded,  bool isDeleted,  bool isAvailable)  $default,) {final _that = this;
switch (_that) {
case _PackageModel():
return $default(_that.id,_that.title,_that.branding,_that.description,_that.note,_that.inclusion,_that.price,_that.lastUpdated,_that.dateAdded,_that.isDeleted,_that.isAvailable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String branding,  String description,  String note,  List<String> inclusion,  double price,  int? lastUpdated,  int? dateAdded,  bool isDeleted,  bool isAvailable)?  $default,) {final _that = this;
switch (_that) {
case _PackageModel() when $default != null:
return $default(_that.id,_that.title,_that.branding,_that.description,_that.note,_that.inclusion,_that.price,_that.lastUpdated,_that.dateAdded,_that.isDeleted,_that.isAvailable);case _:
  return null;

}
}

}

/// @nodoc


class _PackageModel extends PackageModel {
  const _PackageModel({this.id = '', this.title = '', this.branding = '', this.description = '', this.note = '', final  List<String> inclusion = const <String>[], this.price = 0.0, this.lastUpdated, this.dateAdded, this.isDeleted = false, this.isAvailable = true}): _inclusion = inclusion,super._();
  

@override@JsonKey() final  String id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String branding;
@override@JsonKey() final  String description;
@override@JsonKey() final  String note;
 final  List<String> _inclusion;
@override@JsonKey() List<String> get inclusion {
  if (_inclusion is EqualUnmodifiableListView) return _inclusion;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_inclusion);
}

@override@JsonKey() final  double price;
@override final  int? lastUpdated;
@override final  int? dateAdded;
@override@JsonKey() final  bool isDeleted;
@override@JsonKey() final  bool isAvailable;

/// Create a copy of PackageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackageModelCopyWith<_PackageModel> get copyWith => __$PackageModelCopyWithImpl<_PackageModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.branding, branding) || other.branding == branding)&&(identical(other.description, description) || other.description == description)&&(identical(other.note, note) || other.note == note)&&const DeepCollectionEquality().equals(other._inclusion, _inclusion)&&(identical(other.price, price) || other.price == price)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,branding,description,note,const DeepCollectionEquality().hash(_inclusion),price,lastUpdated,dateAdded,isDeleted,isAvailable);

@override
String toString() {
  return 'PackageModel(id: $id, title: $title, branding: $branding, description: $description, note: $note, inclusion: $inclusion, price: $price, lastUpdated: $lastUpdated, dateAdded: $dateAdded, isDeleted: $isDeleted, isAvailable: $isAvailable)';
}


}

/// @nodoc
abstract mixin class _$PackageModelCopyWith<$Res> implements $PackageModelCopyWith<$Res> {
  factory _$PackageModelCopyWith(_PackageModel value, $Res Function(_PackageModel) _then) = __$PackageModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String branding, String description, String note, List<String> inclusion, double price, int? lastUpdated, int? dateAdded, bool isDeleted, bool isAvailable
});




}
/// @nodoc
class __$PackageModelCopyWithImpl<$Res>
    implements _$PackageModelCopyWith<$Res> {
  __$PackageModelCopyWithImpl(this._self, this._then);

  final _PackageModel _self;
  final $Res Function(_PackageModel) _then;

/// Create a copy of PackageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? branding = null,Object? description = null,Object? note = null,Object? inclusion = null,Object? price = null,Object? lastUpdated = freezed,Object? dateAdded = freezed,Object? isDeleted = null,Object? isAvailable = null,}) {
  return _then(_PackageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,branding: null == branding ? _self.branding : branding // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,inclusion: null == inclusion ? _self._inclusion : inclusion // ignore: cast_nullable_to_non_nullable
as List<String>,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as int?,dateAdded: freezed == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as int?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
