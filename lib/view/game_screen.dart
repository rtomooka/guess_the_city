import 'package:flutter/material.dart';
import 'package:guess_the_city/svg_map.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SvgMap(),
    );
  }
}
