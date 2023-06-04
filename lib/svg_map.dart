import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_the_city/map_shape.dart';
import 'package:guess_the_city/svg_map_painter.dart';
import 'package:guess_the_city/view_model/map_id_notifier.dart';
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
    final size = MediaQuery.of(context).size;
    ref.watch(mapShapesProvider.notifier).updateSize(size);

    final shapes = ref.watch(mapShapesProvider);
    final mapId = ref.read(mapIdProvider);

    return GestureDetector(
      onTapDown: (event) {
        List<MapShape> mapShapes = [];
        for (var shape in shapes.mapShapes) {
          final path = shape.transformedPath;
          final selected = path!.contains(event.localPosition);

          if (selected && (shape.id == mapId.id.first)) {
            shape.enable = false;
            shape.color = Colors.white;
            ref.watch(mapIdProvider.notifier).removeMapId();
          }
          mapShapes.add(shape);
        }

        // 更新
        ref.watch(mapShapesProvider.notifier).updateMapShapes(
              mapShapes: mapShapes,
            );

        // クリック位置を通知
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
