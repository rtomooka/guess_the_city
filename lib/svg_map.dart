import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_the_city/svg_map_painter.dart';
import 'package:guess_the_city/view_model/map_shapes_notifier.dart';

class SvgMap extends ConsumerStatefulWidget {
  const SvgMap({Key? key}) : super(key: key);

  @override
  SvgMapState createState() => SvgMapState();
}

class SvgMapState extends ConsumerState<SvgMap> {
  late final ValueNotifier<Offset> notifier;

  @override
  void initState() {
    super.initState();

    // CustomPainterの再描画用
    notifier = ValueNotifier(Offset.zero);
    notifier.addListener(() {
      debugPrint("notified: ${notifier.value}");
    });
  }

  @override
  Widget build(BuildContext context) {
    final shapes = ref.watch(mapShapesProvider);
    // debugPrint("watch: ${shapes.mapShapes}");

    return GestureDetector(
      onTapDown: (event) {
        notifier.value = event.localPosition;
      },
      child: CustomPaint(
        painter: SvgMapPainter(
          notifier: notifier,
          shapes: shapes.mapShapes,
        ),
        child: const SizedBox.expand(),
      ),
    );
  }
}
