// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_package_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreatePackageState {

 CreatePackageStep get step; String get title; String get branding; String get description; List<String> get inclusions; double get price; String get note; bool get isAvailable; bool get isSubmitting;
/// Create a copy of CreatePackageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePackageStateCopyWith<CreatePackageState> get copyWith => _$CreatePackageStateCopyWithImpl<CreatePackageState>(this as CreatePackageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePackageState&&(identical(other.step, step) || other.step == step)&&(identical(other.title, title) || other.title == title)&&(identical(other.branding, branding) || other.branding == branding)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.inclusions, inclusions)&&(identical(other.price, price) || other.price == price)&&(identical(other.note, note) || other.note == note)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting));
}


@override
int get hashCode => Object.hash(runtimeType,step,title,branding,description,const DeepCollectionEquality().hash(inclusions),price,note,isAvailable,isSubmitting);

@override
String toString() {
  return 'CreatePackageState(step: $step, title: $title, branding: $branding, description: $description, inclusions: $inclusions, price: $price, note: $note, isAvailable: $isAvailable, isSubmitting: $isSubmitting)';
}


}

/// @nodoc
abstract mixin class $CreatePackageStateCopyWith<$Res>  {
  factory $CreatePackageStateCopyWith(CreatePackageState value, $Res Function(CreatePackageState) _then) = _$CreatePackageStateCopyWithImpl;
@useResult
$Res call({
 CreatePackageStep step, String title, String branding, String description, List<String> inclusions, double price, String note, bool isAvailable, bool isSubmitting
});




}
/// @nodoc
class _$CreatePackageStateCopyWithImpl<$Res>
    implements $CreatePackageStateCopyWith<$Res> {
  _$CreatePackageStateCopyWithImpl(this._self, this._then);

  final CreatePackageState _self;
  final $Res Function(CreatePackageState) _then;

/// Create a copy of CreatePackageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,Object? title = null,Object? branding = null,Object? description = null,Object? inclusions = null,Object? price = null,Object? note = null,Object? isAvailable = null,Object? isSubmitting = null,}) {
  return _then(_self.copyWith(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as CreatePackageStep,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,branding: null == branding ? _self.branding : branding // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,inclusions: null == inclusions ? _self.inclusions : inclusions // ignore: cast_nullable_to_non_nullable
as List<String>,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatePackageState].
extension CreatePackageStatePatterns on CreatePackageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatePackageState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatePackageState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatePackageState value)  $default,){
final _that = this;
switch (_that) {
case _CreatePackageState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatePackageState value)?  $default,){
final _that = this;
switch (_that) {
case _CreatePackageState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CreatePackageStep step,  String title,  String branding,  String description,  List<String> inclusions,  double price,  String note,  bool isAvailable,  bool isSubmitting)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatePackageState() when $default != null:
return $default(_that.step,_that.title,_that.branding,_that.description,_that.inclusions,_that.price,_that.note,_that.isAvailable,_that.isSubmitting);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CreatePackageStep step,  String title,  String branding,  String description,  List<String> inclusions,  double price,  String note,  bool isAvailable,  bool isSubmitting)  $default,) {final _that = this;
switch (_that) {
case _CreatePackageState():
return $default(_that.step,_that.title,_that.branding,_that.description,_that.inclusions,_that.price,_that.note,_that.isAvailable,_that.isSubmitting);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CreatePackageStep step,  String title,  String branding,  String description,  List<String> inclusions,  double price,  String note,  bool isAvailable,  bool isSubmitting)?  $default,) {final _that = this;
switch (_that) {
case _CreatePackageState() when $default != null:
return $default(_that.step,_that.title,_that.branding,_that.description,_that.inclusions,_that.price,_that.note,_that.isAvailable,_that.isSubmitting);case _:
  return null;

}
}

}

/// @nodoc


class _CreatePackageState extends CreatePackageState {
  const _CreatePackageState({this.step = CreatePackageStep.basicInfo, this.title = '', this.branding = '', this.description = '', final  List<String> inclusions = const <String>[], this.price = 0.0, this.note = '', this.isAvailable = true, this.isSubmitting = false}): _inclusions = inclusions,super._();
  

@override@JsonKey() final  CreatePackageStep step;
@override@JsonKey() final  String title;
@override@JsonKey() final  String branding;
@override@JsonKey() final  String description;
 final  List<String> _inclusions;
@override@JsonKey() List<String> get inclusions {
  if (_inclusions is EqualUnmodifiableListView) return _inclusions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_inclusions);
}

@override@JsonKey() final  double price;
@override@JsonKey() final  String note;
@override@JsonKey() final  bool isAvailable;
@override@JsonKey() final  bool isSubmitting;

/// Create a copy of CreatePackageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePackageStateCopyWith<_CreatePackageState> get copyWith => __$CreatePackageStateCopyWithImpl<_CreatePackageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePackageState&&(identical(other.step, step) || other.step == step)&&(identical(other.title, title) || other.title == title)&&(identical(other.branding, branding) || other.branding == branding)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._inclusions, _inclusions)&&(identical(other.price, price) || other.price == price)&&(identical(other.note, note) || other.note == note)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting));
}


@override
int get hashCode => Object.hash(runtimeType,step,title,branding,description,const DeepCollectionEquality().hash(_inclusions),price,note,isAvailable,isSubmitting);

@override
String toString() {
  return 'CreatePackageState(step: $step, title: $title, branding: $branding, description: $description, inclusions: $inclusions, price: $price, note: $note, isAvailable: $isAvailable, isSubmitting: $isSubmitting)';
}


}

/// @nodoc
abstract mixin class _$CreatePackageStateCopyWith<$Res> implements $CreatePackageStateCopyWith<$Res> {
  factory _$CreatePackageStateCopyWith(_CreatePackageState value, $Res Function(_CreatePackageState) _then) = __$CreatePackageStateCopyWithImpl;
@override @useResult
$Res call({
 CreatePackageStep step, String title, String branding, String description, List<String> inclusions, double price, String note, bool isAvailable, bool isSubmitting
});




}
/// @nodoc
class __$CreatePackageStateCopyWithImpl<$Res>
    implements _$CreatePackageStateCopyWith<$Res> {
  __$CreatePackageStateCopyWithImpl(this._self, this._then);

  final _CreatePackageState _self;
  final $Res Function(_CreatePackageState) _then;

/// Create a copy of CreatePackageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,Object? title = null,Object? branding = null,Object? description = null,Object? inclusions = null,Object? price = null,Object? note = null,Object? isAvailable = null,Object? isSubmitting = null,}) {
  return _then(_CreatePackageState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as CreatePackageStep,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,branding: null == branding ? _self.branding : branding // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,inclusions: null == inclusions ? _self._inclusions : inclusions // ignore: cast_nullable_to_non_nullable
as List<String>,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
