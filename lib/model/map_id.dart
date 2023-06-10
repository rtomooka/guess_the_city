import 'package:freezed_annotation/freezed_annotation.dart';

// 生成されるファイル名を指定する
part 'map_id.freezed.dart';

@freezed
class MapId with _$MapId {
  const factory MapId({
    required String id,
  }) = _MapId;
}
