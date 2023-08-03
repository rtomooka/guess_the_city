import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:guess_the_city/svg/svg_map.dart';
import 'package:guess_the_city/view/game_screen.dart';
import 'package:guess_the_city/view/home_screen.dart';
import 'package:guess_the_city/view/information_screen.dart';
import 'package:guess_the_city/view/result_screen.dart';

void main() {
  runApp(
    ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter goRouter = GoRouter(
    routes: [
      // top-level
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'game',
            builder: (context, state) => const GameScreen(),
          ),
          GoRoute(
            path: 'information',
            builder: (context, state) => const InformationScreen(),
          ),
          GoRoute(
            path: 'result',
            builder: (context, state) => const ResultScreen(),
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Guess the city',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Guess The City"),
      ),
      body: const Center(
        child: SvgMap(),
      ),
    );
  }
}
