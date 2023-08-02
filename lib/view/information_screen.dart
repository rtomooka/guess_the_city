import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'ゲームの始めかた',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        Text('タイトルメニュー'),
        Text(
          'ゲームを起動すると、以下のメニューが選択できます。',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
