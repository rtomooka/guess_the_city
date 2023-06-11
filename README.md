# guess_the_city

このような感じのゲームを作る  
[日本：都道府県 - Map Quiz Game](https://www.geoguessr.com/ja/vgp/3184)

## なぜゲームなのか

- モチベーション維持
  - 作っていて楽しい
  - 遊べる

## 地図の入手方法

[d-maps.com](https://d-maps.com/continent.php?num_con=16&lang=ja)からダウンロードする  

## ToDo

- [×] 地図アセットの表示
- [×] タップできるようにする
- [×] flutter_genの追加
- [ ] クイズゲームの仕組みを作る
 
## クイズゲームの仕組みを作る

MapShapeクラスを改造をする

- idを追加して、正解の判定に使う 
- enableを追加して、回答済みのエリアをクリックしても反応しないようにする
- [×] ListenerをGestureDetectorに変更してクリックだけを受け付けるようにする

回答までの時間を計測するタイマーを作る

- 開始画面を追加する
- 開始ボタンをクリック >> 全問回答までの時間を計測する
