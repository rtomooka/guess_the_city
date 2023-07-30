import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<String> getVersionInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    var text = 'App Ver. ${packageInfo.version}';
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(bottom: 400)),
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
          const Padding(padding: EdgeInsets.only(bottom: 400)),
          FutureBuilder(
            future: getVersionInfo(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      snapshot.hasData ? snapshot.data : '',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontSize: 14.0,
                              ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
