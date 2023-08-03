import 'package:flutter/material.dart';
import 'package:guess_the_city/gen/assets.gen.dart';
import 'package:guess_the_city/widget/menu_button.dart';
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
              flex: 5,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Assets.image.japanColor.image(),
                  const FittedBox(
                    child: Text(
                      'GUESS THE CITY',
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: FittedBox(
                child: Column(
                  children: [
                    MenuButton(
                      path: '/game',
                      title: 'START GAME',
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
                    MenuButton(
                      path: '/information',
                      title: 'INFORMATION',
                    ),
                  ],
                ),
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
