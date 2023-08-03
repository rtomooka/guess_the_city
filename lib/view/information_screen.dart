import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guess_the_city/gen/assets.gen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          scrollPhysics: const BouncingScrollPhysics(),
          pages: [
            PageViewModel(
              title: 'ゲームの始めかた',
              body: '"START GAME"を選択してください',
              image: Image.asset(Assets.image.introduction1.path),
              decoration: const PageDecoration(bodyFlex: 1, imageFlex: 2),
            ),
            PageViewModel(
              title: '遊び方',
              body: '画面上に表示される市を地図から選択してください',
              image: Image.asset(Assets.image.introduction2.path),
              decoration: const PageDecoration(bodyFlex: 1, imageFlex: 2),
            ),
            PageViewModel(
              title: '遊び方',
              body: '正解すると白に変わります',
              image: Image.asset(Assets.image.introduction3.path),
              decoration: const PageDecoration(bodyFlex: 1, imageFlex: 2),
            ),
            PageViewModel(
              title: '終わり方',
              body: 'ゲームを終了するときは、ブラウザを閉じてください',
              image: Image.asset(Assets.image.introduction4.path),
              decoration: const PageDecoration(bodyFlex: 1, imageFlex: 2),
            ),
          ],
          onDone: () {
            GoRouter.of(context).pop();
          },
          showBackButton: true,
          next: const Icon(Icons.arrow_forward_rounded),
          back: const Icon(Icons.arrow_back_outlined),
          done: const Text(
            '先頭にもどる',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
