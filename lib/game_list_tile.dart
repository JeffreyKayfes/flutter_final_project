import 'package:flutter/material.dart';

import 'game.dart';

class GameListTile extends StatelessWidget {
  const GameListTile({
    Key? key,
    required this.game,
    required this.index
  }) : super(key: key);

  final Game game;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Game #${index + 1}', // Display the index (add 1 to start from 1)
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        buildStatText('Points', game.points),
                        buildStatText('Rebounds', game.rebounds),
                        buildStatText('Assists', game.assists),
                        buildStatText('Steals', game.steals),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        buildStatText('Blocks', game.blocks),
                        buildStatText('FG%', calculateFieldGoalPercentage(game.fgm, game.fga)),
                        buildStatText('3P%', calculateThreePointPercentage(game.threesMade, game.threesAttempted)),
                        buildStatText('FT%', calculateFreeThrowPercentage(game.ftm, game.fta)),
                      ],
                    ),
                  ],
                ),
              ),
              // Add a basketball icon to the right side of the card
              Icon(
                Icons.sports_basketball_sharp,
                size: 40,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build individual stat text widgets
  Widget buildStatText(String label, num value) {
    return Expanded(
      child: Text(
        '$label: ${value.toStringAsFixed(value is int ? 0 : 1)}',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  // Helper methods for calculating shooting percentages
  double calculateFieldGoalPercentage(int made, int attempted) {
    if (attempted == 0) {
      return 0.0; // To avoid division by zero
    }
    return (made / attempted * 100).toDouble();
  }

  double calculateThreePointPercentage(int made, int attempted) {
    if (attempted == 0) {
      return 0.0; // To avoid division by zero
    }
    return (made / attempted * 100).toDouble();
  }

  double calculateFreeThrowPercentage(int made, int attempted) {
    if (attempted == 0) {
      return 0.0; // To avoid division by zero
    }
    return (made / attempted * 100).toDouble();
  }
}