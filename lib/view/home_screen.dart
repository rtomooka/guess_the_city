import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Guess The City')
              .animate(
                onPlay: (controller) => controller.repeat(
                    period: const Duration(milliseconds: 3000)),
              )
              .then(duration: const Duration(milliseconds: 200))
              .shake(),
          const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go('/game');
            },
            child: const Text('Go Game'),
          ),
        ],
      ),
    );
  }
}
