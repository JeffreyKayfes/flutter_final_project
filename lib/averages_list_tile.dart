import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'game.dart';

class AveragesListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Game> games = Hive.box<Game>('games').values.toList();
    final int totalGames = games.length;

    if (totalGames == 0) {
      return Container(
        width: double.infinity,
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Averages',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'No games available',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }

    double totalPoints = 0;
    double totalRebounds = 0;
    double totalAssists = 0;
    double totalSteals = 0;
    double totalBlocks = 0;
    double totalFieldGoalsMade = 0;
    double totalFieldGoalsAttempted = 0;
    double totalThreePointsMade = 0;
    double totalThreePointsAttempted = 0;
    double totalFreeThrowsMade = 0;
    double totalFreeThrowsAttempted = 0;

    // Calculate totals
    for (Game game in games) {
      totalPoints += game.points;
      totalRebounds += game.rebounds;
      totalAssists += game.assists;
      totalSteals += game.steals;
      totalBlocks += game.blocks;
      totalFieldGoalsMade += game.fgm;
      totalFieldGoalsAttempted += game.fga;
      totalThreePointsMade += game.threesMade;
      totalThreePointsAttempted += game.threesAttempted;
      totalFreeThrowsMade += game.ftm;
      totalFreeThrowsAttempted += game.fta;
    }

    // Calculate averages
    double averagePoints = totalPoints / totalGames;
    double averageRebounds = totalRebounds / totalGames;
    double averageAssists = totalAssists / totalGames;
    double averageSteals = totalSteals / totalGames;
    double averageBlocks = totalBlocks / totalGames;
    double averageFieldGoalPercentage = (totalFieldGoalsMade / totalFieldGoalsAttempted) * 100;
    double averageThreePointPercentage = (totalThreePointsMade / totalThreePointsAttempted) * 100;
    double averageFreeThrowPercentage = (totalFreeThrowsMade / totalFreeThrowsAttempted) * 100;

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
                      'Averages',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        buildStatText('Points', averagePoints),
                        buildStatText('Rebounds', averageRebounds),
                        buildStatText('Assists', averageAssists),
                        buildStatText('Steals', averageSteals),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        buildStatText('Blocks', averageBlocks),
                        buildStatText('FG%', averageFieldGoalPercentage),
                        buildStatText('3P%', averageThreePointPercentage),
                        buildStatText('FT%', averageFreeThrowPercentage),
                      ],
                    ),
                  ],
                ),
              ),
              // Add a basketball icon to the right side of the card
              Icon(
                Icons.sports_basketball_outlined,
                size: 40,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStatText(String label, double value) {
    return Expanded(
      child: Text(
        '$label: ${value.toStringAsFixed(1)}',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}