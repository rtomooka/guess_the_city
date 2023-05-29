import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guess_the_city/gen/assets.gen.dart';
import 'package:guess_the_city/map_shape.dart';
import 'package:guess_the_city/svg_map_painter.dart';
import 'package:xml/xml.dart';

part 'shizuoka_map_helper.dart';

class SvgMap extends StatefulWidget {
  const SvgMap({Key? key}) : super(key: key);

  @override
  State<SvgMap> createState() => _SvgMapState();
}

class _SvgMapState extends State<SvgMap> {
  List<MapShape>? _shapes;
  List<String> ids = [];
  late final ValueNotifier<Offset> notifier;

  @override
  void initState() {
    super.initState();

    // CustomPainterの再描画用
    notifier = ValueNotifier(Offset.zero);
    notifier.addListener(() {
      debugPrint("notified: ${notifier.value}");
    });

    // map読み込み
    rootBundle.load(Assets.maps.shizuoka19).then((ByteData byteData) {
      debugPrint("load: ${byteData.lengthInBytes}");

      // バイナリとして読み込み >> 文字列に変換 >> XML要素に変換
      final document =
          XmlDocument.parse(utf8.decode(byteData.buffer.asUint8List()));
      final svgRoot = document.findAllElements('svg').first;
      final strokeRoot = svgRoot.findElements('g').first;
      final prefectures = strokeRoot.children;

      //
      List<MapShape> shapes = [];
      prefectures.forEach((node) {
        final id = node.getAttribute("id");
        if (id != null) {
          debugPrint("xnode: ${node.getAttribute("id")}");
          final paths = node.findAllElements("path");
          paths.forEach((element) {
            final data = element.getAttribute("d");
            // debugPrint("data: $data");
            final printName = _prefecture_name[_prefecture_id[id]];
            shapes.add(MapShape(
              data,
              label: printName != null ? printName! : "Invalid Name",
              color: const Color.fromRGBO(60, 128, 74, 1.0),
              enable: true,
              id: id,
            ));
          });
          // idの格納
          ids.add(id);
        }
      });
      setState(() {
        _shapes = shapes;
        ids.shuffle();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        notifier.value = event.localPosition;
      },
      onPointerMove: (event) {
        notifier.value = event.localPosition;
      },
      child: CustomPaint(
        painter: SvgMapPainter(
          notifier: notifier,
          shapes: _shapes,
          ids: ids,
        ),
        child: const SizedBox.expand(),
      ),
    );
  }
}
