// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MapId {
  List<String> get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapIdCopyWith<MapId> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapIdCopyWith<$Res> {
  factory $MapIdCopyWith(MapId value, $Res Function(MapId) then) =
      _$MapIdCopyWithImpl<$Res, MapId>;
  @useResult
  $Res call({List<String> id});
}

/// @nodoc
class _$MapIdCopyWithImpl<$Res, $Val extends MapId>
    implements $MapIdCopyWith<$Res> {
  _$MapIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MapIdCopyWith<$Res> implements $MapIdCopyWith<$Res> {
  factory _$$_MapIdCopyWith(_$_MapId value, $Res Function(_$_MapId) then) =
      __$$_MapIdCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> id});
}

/// @nodoc
class __$$_MapIdCopyWithImpl<$Res> extends _$MapIdCopyWithImpl<$Res, _$_MapId>
    implements _$$_MapIdCopyWith<$Res> {
  __$$_MapIdCopyWithImpl(_$_MapId _value, $Res Function(_$_MapId) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_MapId(
      id: null == id
          ? _value._id
          : id // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_MapId implements _MapId {
  const _$_MapId({required final List<String> id}) : _id = id;

  final List<String> _id;
  @override
  List<String> get id {
    if (_id is EqualUnmodifiableListView) return _id;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_id);
  }

  @override
  String toString() {
    return 'MapId(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MapId &&
            const DeepCollectionEquality().equals(other._id, _id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_id));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MapIdCopyWith<_$_MapId> get copyWith =>
      __$$_MapIdCopyWithImpl<_$_MapId>(this, _$identity);
}

abstract class _MapId implements MapId {
  const factory _MapId({required final List<String> id}) = _$_MapId;

  @override
  List<String> get id;
  @override
  @JsonKey(ignore: true)
  _$$_MapIdCopyWith<_$_MapId> get copyWith =>
      throw _privateConstructorUsedError;
}
