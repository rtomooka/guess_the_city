import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_the_city/gen/assets.gen.dart';
import 'package:guess_the_city/model/map_id.dart';
import 'package:guess_the_city/shizuoka_map_helper.dart';
import 'package:xml/xml.dart';

class MapIdNotifier extends StateNotifier<MapId> {
  MapIdNotifier() : super(const MapId(id: [])) {
    parseSvgData();
  }

  void updateMapId({required List<String> mapId}) {
    state = state.copyWith(id: mapId);
  }

  void removeMapId() {
    if (state.id.isNotEmpty) {
      state.id.removeAt(0);
      state = state.copyWith(id: state.id);
    }
  }

  Future<void> parseSvgData() async {
    List<String> mapId = [];

    // map読み込み
    await rootBundle.load(Assets.maps.shizuoka19).then((ByteData byteData) {
      // debugPrint("load: ${byteData.lengthInBytes}");

      // バイナリとして読み込み >> 文字列に変換 >> XML要素に変換
      final document =
          XmlDocument.parse(utf8.decode(byteData.buffer.asUint8List()));
      final svgRoot = document.findAllElements('svg').first;
      final strokeRoot = svgRoot.findElements('g').first;
      final prefectures = strokeRoot.children;

      prefectures.forEach((node) {
        final id = node.getAttribute("id");
        if (id != null) {
          debugPrint("id: $id");
          if (Prefecture.prefecture_id[id] != null) {
            mapId.add(id);
          }
        }
      });
    });
    state = state.copyWith(id: mapId);
  }
}

final mapIdProvider = StateNotifierProvider.autoDispose<MapIdNotifier, MapId>(
  (ref) => MapIdNotifier(),
);
