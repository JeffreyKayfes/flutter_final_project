import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'game.dart';
import 'utils.dart';
import 'game_list_tile.dart';
import 'averages_list_tile.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({Key? key}) : super(key: key);

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            stretch: true,
            onStretchTrigger: () async {
              print('Load new data!');
              // await Server.requestNewData();
            },
            backgroundColor: Colors.orange[800],
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
                StretchMode.blurBackground,
              ],
              title: const Text('Basketball Stat Tracker'),
              background: DecoratedBox(
                position: DecorationPosition.foreground,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: <Color>[Colors.orange[800]!, Colors.transparent],
                  ),
                ),
                // Image here
                child: Image.asset(
                  'assets/images/basketball-court.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                if (index == 0) {
                  return AveragesListTile();
                } else {
                  final game = Hive.box<Game>('games').values.elementAt(index - 1);
                  return GameListTile(
                    game: game,
                    index: index - 1,
                  );
                }
              },
              childCount: Hive.box<Game>('games').length + 1,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final game = await openAddGameDialog(context: context);
          if (game != null) {
            Hive.box<Game>('games').put(game.id, game);
          }
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}