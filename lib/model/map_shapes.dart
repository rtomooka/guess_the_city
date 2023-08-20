import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:guess_the_city/model/map_shape.dart';

// 生成されるファイル名を指定する
part 'map_shapes.freezed.dart';

@freezed
class MapShapes with _$MapShapes {
  const factory MapShapes({
    required List<MapShape> mapShapes,
    required Size size,
    required String svgPath,
  }) = _MapShapes;
}
