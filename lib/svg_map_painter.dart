import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:guess_the_city/map_shape.dart';

class SvgMapPainter extends CustomPainter {
  SvgMapPainter({required this.shapes, required this.notifier})
      : super(repaint: notifier);
  final List<MapShape>? shapes;
  final ValueNotifier<Offset> notifier;
  final Paint _paint = Paint();
  Size _size = Size.zero;

  @override
  void paint(Canvas canvas, Size size) {
    if (size != _size) {
      _size = size;
      final fs = applyBoxFit(
        BoxFit.contain,
        Size(29700, 21000),
        size,
      );
      final rect =
          Alignment.center.inscribe(fs.destination, Offset.zero & size);
      final matrix = Matrix4.translationValues(rect.left, rect.top, 0)
        ..scale(fs.destination.width / fs.source.width);
      if (shapes != null) {
        for (var shape in shapes!) {
          shape.transform(matrix);
        }
      }
      print('new size: $_size');
    }
    canvas
      ..clipRect(
        Offset.zero & size,
      )
      ..drawColor(
        Colors.blueGrey,
        BlendMode.src,
      );

    var selectedMapShape;
    if (shapes != null) {
      for (var shape in shapes!) {
        final path = shape.transformedPath;
        final selected = path!.contains(notifier.value);
        _paint
          ..color = selected ? Colors.teal : shape.color
          ..style = PaintingStyle.fill;
        canvas.drawPath(path, _paint);
        selectedMapShape ??= selected ? shape : null;

        _paint
          ..color = Colors.black
          ..strokeWidth = 3
          ..style = PaintingStyle.stroke;
        canvas.drawPath(path, _paint);
      }
    }

    if (selectedMapShape != null) {
      _paint
        ..color = Colors.black
        ..maskFilter = MaskFilter.blur(BlurStyle.outer, 12)
        ..style = PaintingStyle.fill;
      canvas.drawPath(selectedMapShape._transformedPath, _paint);
      _paint.maskFilter = null;

      final builder = ui.ParagraphBuilder(ui.ParagraphStyle(
        fontSize: 20,
        fontFamily: 'Roboto',
      ))
        ..pushStyle(ui.TextStyle(
          color: Colors.yellow,
        ))
        ..addText(selectedMapShape._label);
      final paragraph = builder.build()
        ..layout(ui.ParagraphConstraints(width: size.width));
      canvas.drawParagraph(paragraph, notifier.value.translate(0, -32));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
