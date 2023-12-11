import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'game.dart';
import 'utils.dart';
import 'game_list_tile.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({Key? key}) : super(key: key);

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Games'),
      ),
      body: ValueListenableBuilder(
          valueListenable: Hive.box<Game>('games').listenable(),
          builder: (context, box, child) {
            // Get list of all games
            final games = box.values;
            return ListView.builder(
              itemCount: games.length,
              itemBuilder: (context, index) {
                // get current game
                final game = games.elementAt(index);
                return GameListTile(
                  game: game,
                  index: index,
                );
              },
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final game = await openAddGameDialog(context: context);
          if (game != null) {
            // Add task to "tasks" box
            Hive.box<Game>('games').put(game.id, game);
          }
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}