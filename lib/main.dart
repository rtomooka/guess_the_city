import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_the_city/shizuoka_map_helper.dart';
import 'package:guess_the_city/svg_map.dart';
import 'package:guess_the_city/view_model/map_id_notifier.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guess the city',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
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
    final mapId = ref.watch(mapIdProvider);
    final printName =
        Prefecture.prefecture_name[Prefecture.prefecture_id[mapId.id.first]];

    return Scaffold(
      appBar: AppBar(
        title: mapId.id.isNotEmpty ? Text("$printNameをクリック") : const Text(""),
      ),
      body: const Center(
        child: SvgMap(),
      ),
    );
  }
}
