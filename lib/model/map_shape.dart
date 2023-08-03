import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class MapShape {
  final Path _path;
  Path? transformedPath;
  final String label;
  Color color;
  bool enable;
  final String id;

  MapShape(
    strPath, {
    required this.label,
    required this.color,
    required this.enable,
    required this.id,
  }) : _path = parseSvgPathData(strPath);

  void transform(Matrix4 matrix4) {
    transformedPath = _path.transform(matrix4.storage);
  }
}
