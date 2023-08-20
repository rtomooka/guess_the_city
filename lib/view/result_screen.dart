import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:guess_the_city/widget/menu_button.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final ConfettiController confettiController = ConfettiController(
    duration: const Duration(seconds: 10),
  );

  @override
  void initState() {
    super.initState();
    confettiController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FittedBox(
            child: ConfettiWidget(
              confettiController: confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Thank you for playing!!',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
                  MenuButton(
                    path: '/',
                    title: 'GO HOME',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
