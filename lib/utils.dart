import 'package:flutter/material.dart';

import 'game.dart';
import 'add_game_dialog.dart';

Future<Game?> openAddGameDialog({
  required BuildContext context,
  Game? game,
}) {
  return showDialog<Game?>(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AddGameDialog(
        game: game,
      );
    },
  );
}