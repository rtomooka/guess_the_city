import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guess_the_city/gen/assets.gen.dart';
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
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Assets.image.japanColor.image(),
                  FittedBox(
                    child: Container(
                      color: Colors.white,
                      child: Text(
                        'Guess The City',
                        style: TextStyle(
                          fontSize: 48,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go('/game');
                },
                child: const Text('Go Game'),
              ),
            ),
            Expanded(
              flex: 1,
              child: FutureBuilder(
                future: getVersionInfo(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          snapshot.hasData ? snapshot.data : '',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontSize: 14.0,
                              ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
