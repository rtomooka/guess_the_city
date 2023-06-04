import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_the_city/gen/assets.gen.dart';
import 'package:guess_the_city/map_shape.dart';
import 'package:guess_the_city/model/map_shapes.dart';
import 'package:guess_the_city/shizuoka_map_helper.dart';
import 'package:xml/xml.dart';

class MapShapesNotifier extends StateNotifier<MapShapes> {
  MapShapesNotifier() : super(const MapShapes(mapShapes: [])) {
    parseSvgData();
  }

  //
  void updateMapShapes({required List<MapShape> mapShapes}) {
    state = state.copyWith(mapShapes: mapShapes);
  }

  Future<void> parseSvgData() async {
    List<MapShape> mapShapes = [];

    // map読み込み
    await rootBundle.load(Assets.maps.shizuoka19).then((ByteData byteData) {
      debugPrint("load: ${byteData.lengthInBytes}");

      // バイナリとして読み込み >> 文字列に変換 >> XML要素に変換
      final document =
          XmlDocument.parse(utf8.decode(byteData.buffer.asUint8List()));
      final svgRoot = document.findAllElements('svg').first;
      final strokeRoot = svgRoot.findElements('g').first;
      final prefectures = strokeRoot.children;

      prefectures.forEach((node) {
        final id = node.getAttribute("id");
        if (id != null) {
          final paths = node.findAllElements("path");
          paths.forEach((element) {
            final data = element.getAttribute("d");
            // debugPrint("data: $data");
            final printName =
                Prefecture.prefecture_name[Prefecture.prefecture_id[id]];
            mapShapes.add(MapShape(
              data,
              label: printName ?? "Invalid Name",
              color: const Color.fromRGBO(60, 128, 74, 1.0),
              enable: true,
              id: id,
            ));
          });
        }
      });
    });

    state = state.copyWith(mapShapes: mapShapes);
  }
}

final mapShapesProvider =
    StateNotifierProvider.autoDispose<MapShapesNotifier, MapShapes>(
  (ref) => MapShapesNotifier(),
);
