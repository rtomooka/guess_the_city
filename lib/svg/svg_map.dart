import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:guess_the_city/model/map_shape.dart';
import 'package:guess_the_city/svg/svg_map_painter.dart';
import 'package:guess_the_city/view_model/map_shapes_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SvgMap extends StatefulHookConsumerWidget {
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
  void dispose() {
    super.dispose();
    // ゲームの初期化
    ref.watch(mapShapesProvider.notifier).parseSvgData();
  }

  @override
  Widget build(BuildContext context) {
    final shapes = ref.watch(mapShapesProvider).mapShapes;
    final expShape = useState(MapShape(
      '',
      label: '',
      color: Colors.transparent,
      enable: false,
      id: '',
    ));

    if (shapes.isEmpty) {
      // 初期化が完了するまでローディング表示
      return const CircularProgressIndicator();
    }

    // マップからランダムに1つ選択
    final MapShape? mapShape = getRandomEnabledMapShape(shapes);
    if (!expShape.value.enable && mapShape != null) {
      expShape.value = mapShape;
    }

    // 画面サイズに応じてリサイズ
    final size = MediaQuery.of(context).size;
    ref.watch(mapShapesProvider.notifier).updateSize(size);
    final BuildContext buildContext = context;

    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.orange,
            child: Center(
              child: Text(
                "${expShape.value.label}を選択してください",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 15,
          child: GestureDetector(
            onTapDown: (event) {
              // タップイベントの処理
              List<MapShape> mapShapes = [];
              bool updateFlag = false;
              for (var shape in shapes) {
                final path = shape.transformedPath;
                final selected = path!.contains(event.localPosition);

                // 正解
                if (selected && (shape.id == expShape.value.id)) {
                  shape.enable = false;
                  shape.color = Colors.white;
                  updateFlag = true;
                }
                mapShapes.add(shape);
              }

              // idを更新
              if (updateFlag) {
                // enableなshapeを1つ選択する
                final MapShape? mapShape = getRandomEnabledMapShape(mapShapes);
                if (mapShape != null) {
                  expShape.value = mapShape;
                } else {
                  // すべてのshapeが回答済みの場合は、ゲームクリア
                  Future<void>.delayed(const Duration(milliseconds: 2000), () {
                    GoRouter.of(buildContext).go('/result');
                  });
                }
              }

              // 更新
              ref.read(mapShapesProvider.notifier).updateMapShapes(
                    mapShapes: mapShapes,
                  );

              // クリック位置を通知
              notifier.value = event.localPosition;
            },
            child: CustomPaint(
              painter: SvgMapPainter(
                notifier: notifier,
                shapes: shapes,
              ),
              child: const SizedBox.expand(),
            ),
          ),
        ),
      ],
    );
  }
}
