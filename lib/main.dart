import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'games_screen.dart';
import 'game.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter<Game>(GameAdapter());
  await Hive.initFlutter();
  await Hive.openBox<Game>('games');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GamesScreen(),
    );
  }
}