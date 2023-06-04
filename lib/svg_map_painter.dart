import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_the_city/map_shape.dart';
import 'package:guess_the_city/view_model/map_id_notifier.dart';

class SvgMapPainterWidget extends ConsumerWidget {
  final List<MapShape>? shapes;
  final ValueNotifier<Offset> notifier;

  const SvgMapPainterWidget({
    required this.shapes,
    required this.notifier,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(mapIdProvider);
    // TODO: implement build
    return Container(
      color: Colors.orange,
    );
  }
}

class SvgMapPainter extends CustomPainter {
  SvgMapPainter({
    required this.shapes,
    required this.notifier,
  }) : super(repaint: notifier);
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
        const Size(29700, 21000),
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
        const Color.fromRGBO(172, 207, 219, 1.0),
        BlendMode.src,
      );

    var selectedMapShape;

    // print("${ids.first}をクリック");

    if (shapes != null) {
      for (var shape in shapes!) {
        final path = shape.transformedPath;
        final selected = path!.contains(notifier.value);
        // 正解!
        // if (selected) {
        //   if (shape.enable && (shape.id == ids.first)) {
        //     shape.enable = false;
        //     shape.color = Colors.white;
        //     ids.removeAt(0);
        //   } else {
        //     // shape.color = const Color.fromRGBO(179, 77, 68, 1.0);
        //   }
        // }
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
