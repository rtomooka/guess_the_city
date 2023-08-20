// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:guess_the_city/gen/assets.gen.dart';
import 'package:guess_the_city/view_model/map_shapes_notifier.dart';

class StageSelectScreen extends ConsumerWidget {
  const StageSelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapNotifier = ref.watch(mapShapesProvider.notifier);
    final BuildContext buildContext = context;

    return Scaffold(
      appBar: AppBar(
        title: const Text("地図を選択してください"),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: ElevatedButton(
                  onPressed: () async {
                    await mapNotifier.setSvgPath(Assets.maps.tokyo70);
                    GoRouter.of(buildContext).go('/game');
                  },
                  child: Stack(
                    children: [
                      Image.asset(
                        Assets.image.tokyoIllust1.path,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
            ),
            Expanded(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: ElevatedButton(
                  onPressed: () async {
                    await mapNotifier.setSvgPath(Assets.maps.shizuoka19);
                    GoRouter.of(buildContext).go('/game');
                  },
                  child: Stack(
                    children: [
                      Image.asset(
                        Assets.image.shizuokaIllust2.path,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
