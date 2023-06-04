import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:guess_the_city/map_shape.dart';

class SvgMapPainter extends CustomPainter {
  SvgMapPainter({
    required this.shapes,
    required this.notifier,
  }) : super(repaint: notifier);
  final List<MapShape>? shapes;
  final ValueNotifier<Offset> notifier;
  final Paint _paint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    canvas
      ..clipRect(
        Offset.zero & size,
      )
      ..drawColor(
        const Color.fromRGBO(172, 207, 219, 1.0),
        BlendMode.src,
      );

    var selectedMapShape;

    // print("${ids.first}をクリック");

    if (shapes != null) {
      for (var shape in shapes!) {
        final path = shape.transformedPath;
        final selected = path!.contains(notifier.value);
        _paint
          ..color = shape.color
          ..style = PaintingStyle.fill;
        canvas.drawPath(path, _paint);

        selectedMapShape ??= selected ? shape : null;

        _paint
          ..color = Colors.white
          ..strokeWidth = 0.1
          ..style = PaintingStyle.stroke;
        canvas.drawPath(path, _paint);
      }
    }

    if (selectedMapShape != null) {
      _paint
        ..color = Colors.black
        ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 12)
        ..style = PaintingStyle.fill;
      canvas.drawPath(selectedMapShape.transformedPath, _paint);
      _paint.maskFilter = null;

      final builder = ui.ParagraphBuilder(ui.ParagraphStyle(
        fontSize: 20,
        fontFamily: 'Roboto',
      ))
        ..pushStyle(ui.TextStyle(
          color: Colors.yellow,
        ))
        ..addText(selectedMapShape.label);
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
