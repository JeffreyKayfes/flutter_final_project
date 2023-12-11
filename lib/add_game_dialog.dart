import 'package:flutter/material.dart';

import 'game.dart';

class AddGameDialog extends StatefulWidget {
  const AddGameDialog({
    Key? key,
    this.game,
  }) : super(key: key);

  final Game? game;

  @override
  State<AddGameDialog> createState() => _AddGameDialogState();
}

class _AddGameDialogState extends State<AddGameDialog> {
  late final TextEditingController _pointsController;
  late final TextEditingController _reboundsController;
  late final TextEditingController _assistsController;
  late final TextEditingController _stealsController;
  late final TextEditingController _blocksController;
  late final TextEditingController _fgmController;
  late final TextEditingController _fgaController;
  late final TextEditingController _threesMadeController;
  late final TextEditingController _threesAttemptedController;
  late final TextEditingController _ftmController;
  late final TextEditingController _ftaController;

  @override
  void initState() {
    super.initState();
    _pointsController = TextEditingController();
    _reboundsController = TextEditingController();
    _assistsController = TextEditingController();
    _stealsController = TextEditingController();
    _blocksController = TextEditingController();
    _fgmController = TextEditingController();
    _fgaController = TextEditingController();
    _threesMadeController = TextEditingController();
    _threesAttemptedController = TextEditingController();
    _ftmController = TextEditingController();
    _ftaController = TextEditingController();

    if (widget.game != null) {
      _pointsController.text = widget.game!.points.toString();
      _reboundsController.text = widget.game!.rebounds.toString();
      _assistsController.text = widget.game!.assists.toString();
      _stealsController.text = widget.game!.steals.toString();
      _blocksController.text = widget.game!.blocks.toString();
      _fgmController.text = widget.game!.fgm.toString();
      _fgaController.text = widget.game!.fga.toString();
      _threesMadeController.text = widget.game!.threesMade.toString();
      _threesAttemptedController.text = widget.game!.threesAttempted.toString();
      _ftmController.text = widget.game!.ftm.toString();
      _ftaController.text = widget.game!.fta.toString();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _pointsController.dispose();
    _reboundsController.dispose();
    _assistsController.dispose();
    _stealsController.dispose();
    _blocksController.dispose();
    _fgmController.dispose();
    _fgaController.dispose();
    _threesMadeController.dispose();
    _threesAttemptedController.dispose();
    _ftmController.dispose();
    _ftaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Game'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _pointsController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Points',
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _reboundsController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Rebounds',
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _assistsController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Assists',
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _stealsController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Steals',
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _blocksController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Blocks',
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _fgmController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Field Goals Made',
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _fgaController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Field Goals Attempted',
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _threesMadeController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '3s Made',
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _threesAttemptedController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '3s Attempted',
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _ftmController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Free Throws Made',
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _ftaController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Free Throws Attempted',
              ),
              textInputAction: TextInputAction.next,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(null),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Game game = Game(
              id: DateTime.now().toString(),
              points: int.parse(_pointsController.text),
              rebounds: int.parse(_reboundsController.text),
              assists: int.parse(_assistsController.text),
              steals: int.parse(_stealsController.text),
              blocks: int.parse(_blocksController.text),
              fgm: int.parse(_fgmController.text),
              fga: int.parse(_fgaController.text),
              threesMade: int.parse(_threesMadeController.text),
              threesAttempted: int.parse(_threesAttemptedController.text),
              ftm: int.parse(_ftmController.text),
              fta: int.parse(_ftaController.text),
            );
            if (widget.game != null) {
              game = Game(
                id: widget.game!.id,
                points: int.parse(_pointsController.text),
                rebounds: int.parse(_reboundsController.text),
                assists: int.parse(_assistsController.text),
                steals: int.parse(_stealsController.text),
                blocks: int.parse(_blocksController.text),
                fgm: int.parse(_fgmController.text),
                fga: int.parse(_fgaController.text),
                threesMade: int.parse(_threesMadeController.text),
                threesAttempted: int.parse(_threesAttemptedController.text),
                ftm: int.parse(_ftmController.text),
                fta: int.parse(_ftaController.text),
              );
            }
            Navigator.of(context).pop(game);
          },
          child: const Text('Add Game'),
        )
      ],
    );
  }
}