// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameAdapter extends TypeAdapter<Game> {
  @override
  final int typeId = 0;

  @override
  Game read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Game(
      id: fields[0] as String,
      points: fields[1] as int,
      rebounds: fields[2] as int,
      assists: fields[3] as int,
      steals: fields[4] as int,
      blocks: fields[5] as int,
      fgm: fields[6] as int,
      fga: fields[7] as int,
      threesMade: fields[8] as int,
      threesAttempted: fields[9] as int,
      ftm: fields[10] as int,
      fta: fields[11] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Game obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.points)
      ..writeByte(2)
      ..write(obj.rebounds)
      ..writeByte(3)
      ..write(obj.assists)
      ..writeByte(4)
      ..write(obj.steals)
      ..writeByte(5)
      ..write(obj.blocks)
      ..writeByte(6)
      ..write(obj.fgm)
      ..writeByte(7)
      ..write(obj.fga)
      ..writeByte(8)
      ..write(obj.threesMade)
      ..writeByte(9)
      ..write(obj.threesAttempted)
      ..writeByte(10)
      ..write(obj.ftm)
      ..writeByte(11)
      ..write(obj.fta);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
