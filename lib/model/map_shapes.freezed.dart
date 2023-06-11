// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_shapes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MapShapes {
  List<MapShape> get mapShapes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapShapesCopyWith<MapShapes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapShapesCopyWith<$Res> {
  factory $MapShapesCopyWith(MapShapes value, $Res Function(MapShapes) then) =
      _$MapShapesCopyWithImpl<$Res, MapShapes>;
  @useResult
  $Res call({List<MapShape> mapShapes});
}

/// @nodoc
class _$MapShapesCopyWithImpl<$Res, $Val extends MapShapes>
    implements $MapShapesCopyWith<$Res> {
  _$MapShapesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapShapes = null,
  }) {
    return _then(_value.copyWith(
      mapShapes: null == mapShapes
          ? _value.mapShapes
          : mapShapes // ignore: cast_nullable_to_non_nullable
              as List<MapShape>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MapShapesCopyWith<$Res> implements $MapShapesCopyWith<$Res> {
  factory _$$_MapShapesCopyWith(
          _$_MapShapes value, $Res Function(_$_MapShapes) then) =
      __$$_MapShapesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MapShape> mapShapes});
}

/// @nodoc
class __$$_MapShapesCopyWithImpl<$Res>
    extends _$MapShapesCopyWithImpl<$Res, _$_MapShapes>
    implements _$$_MapShapesCopyWith<$Res> {
  __$$_MapShapesCopyWithImpl(
      _$_MapShapes _value, $Res Function(_$_MapShapes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapShapes = null,
  }) {
    return _then(_$_MapShapes(
      mapShapes: null == mapShapes
          ? _value._mapShapes
          : mapShapes // ignore: cast_nullable_to_non_nullable
              as List<MapShape>,
    ));
  }
}

/// @nodoc

class _$_MapShapes implements _MapShapes {
  const _$_MapShapes({required final List<MapShape> mapShapes})
      : _mapShapes = mapShapes;

  final List<MapShape> _mapShapes;
  @override
  List<MapShape> get mapShapes {
    if (_mapShapes is EqualUnmodifiableListView) return _mapShapes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mapShapes);
  }

  @override
  String toString() {
    return 'MapShapes(mapShapes: $mapShapes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MapShapes &&
            const DeepCollectionEquality()
                .equals(other._mapShapes, _mapShapes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_mapShapes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MapShapesCopyWith<_$_MapShapes> get copyWith =>
      __$$_MapShapesCopyWithImpl<_$_MapShapes>(this, _$identity);
}

abstract class _MapShapes implements MapShapes {
  const factory _MapShapes({required final List<MapShape> mapShapes}) =
      _$_MapShapes;

  @override
  List<MapShape> get mapShapes;
  @override
  @JsonKey(ignore: true)
  _$$_MapShapesCopyWith<_$_MapShapes> get copyWith =>
      throw _privateConstructorUsedError;
}
