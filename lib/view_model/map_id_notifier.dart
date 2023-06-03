import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_the_city/model/map_id.dart';

class MapIdNotifier extends StateNotifier<MapId> {
  MapIdNotifier() : super(const MapId(id: ""));

  void updateMapId({required String mapId}) {
    state = state.copyWith(id: mapId);
  }
}

final mapIdProvider = StateNotifierProvider.autoDispose<MapIdNotifier, MapId>(
  (ref) => MapIdNotifier(),
);
