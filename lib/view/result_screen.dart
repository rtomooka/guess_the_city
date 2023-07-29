import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Thank you for playing!!',
            style: TextStyle(
              color: Colors.orange,
              decoration: TextDecoration.none,
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go('/');
            },
            child: const Text('Go Home'),
          ),
        ],
      ),
    );
  }
}
