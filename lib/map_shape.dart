import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class MapShape {
  final Path _path;
  Path? transformedPath;
  final String _label;
  final Color color;

  MapShape(strPath, this._label, this.color)
      : _path = parseSvgPathData(strPath);

  void transform(Matrix4 matrix4) {
    transformedPath = _path.transform(matrix4.storage);
  }
}
