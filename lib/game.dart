import 'package:hive/hive.dart';

part 'game.g.dart';

@HiveType(typeId: 0)
class Game {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final int points;
  @HiveField(2)
  final int rebounds;
  @HiveField(3)
  final int assists;
  @HiveField(4)
  final int steals;
  @HiveField(5)
  final int blocks;
  @HiveField(6)
  final int fgm;
  @HiveField(7)
  final int fga;
  @HiveField(8)
  final int threesMade;
  @HiveField(9)
  final int threesAttempted;
  @HiveField(10)
  final int ftm;
  @HiveField(11)
  final int fta;

  Game({
    required this.id,
    required this.points,
    required this.rebounds,
    required this.assists,
    required this.steals,
    required this.blocks,
    required this.fgm,
    required this.fga,
    required this.threesMade,
    required this.threesAttempted,
    required this.ftm,
    required this.fta,
  });
}