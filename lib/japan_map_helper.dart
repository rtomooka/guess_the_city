// Copyright 2021, Techaas.com. All rights reserved.
//
part of 'svg_map.dart';

final _prefecture_id = {
  'atami': 1,
  'fukuroi': 2,
  'gotenba': 3,
  'hamamatsu': 4,
  'higashiizu': 5,
  'hujinomiya': 6,
  'huzieda': 7,
  'itou': 8,
  'iwata': 9,
  'izunokuni': 10,
  'izu': 11,
  'kakegawa': 12,
  'kannami': 13,
  'kawanehonntyou': 14,
  'kawazu': 15,
  'kikugawa': 16,
  'kosai': 17,
  'makinohara': 18,
  'matuzaki': 19,
  'minamiizu': 20,
  'mishima': 21,
  'morityou': 22,
  'nagaizumi': 23,
  'nishiizu': 24,
  'numazu': 25,
  'omaezaki': 26,
  'oyama': 27,
  'shimada': 28,
  'shimizutyou': 29,
  'shimoda': 30,
  'shizuoka': 31,
  'susono': 32,
  'yaizu': 33,
  'yoshidatyou': 34,
  'kanagawa': 35,
  'tokyo': 36,
  'yamanashi': 37,
  'gifu': 38,
  'aichi': 39,
};

final _prefecture_name = {
  1: '熱海市',
  2: '袋井市',
  3: '御殿場市',
  4: '浜松市',
  5: '東伊豆町',
  6: '富士宮市',
  7: '藤枝市',
  8: '伊東市',
  9: '磐田市',
  10: '伊豆の国市',
  11: '伊豆市',
  12: '掛川市',
  13: '函南町',
  14: '川根本町',
  15: '河津長',
  16: '菊川市',
  17: '湖西市',
  18: '牧之原市',
  19: '松崎町',
  20: '南伊豆町',
  21: '三島市',
  22: '森町',
  23: '長泉町',
  24: '西伊豆町',
  25: '沼津市',
  26: '御前崎市',
  27: '小山町',
  28: '島田市',
  29: '清水町',
  30: '下田市',
  31: '静岡市',
  32: '裾野市',
  33: '焼津市',
  34: '吉田町',
  35: '神奈川県',
  36: '東京都',
  37: '山梨県',
  38: '岐阜県',
  39: '愛知県',
};

final _emergency_state = [
  1,
  4,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  21,
  22,
  23,
  24,
  25,
  26,
  27,
  28,
  33,
  34,
  // 40,
  // 47,
];

final _warning_state = [
  7,
  16,
  17,
  19,
  37,
  38,
  // 39,
  // 41,
  // 42,
  // 43,
  // 45,
  // 46,
];
