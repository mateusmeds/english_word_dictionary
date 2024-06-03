// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordAdapter extends TypeAdapter<Word> {
  @override
  final int typeId = 0;

  @override
  Word read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Word(
      word: fields[1] as String,
      phonetics: (fields[3] as List).cast<Phonetic>(),
      meanings: (fields[4] as List).cast<Meaning>(),
      phonetic: fields[2] as String?,
    )
      .._isFavorited = fields[5] as bool
      .._lastTimeReaded = fields[6] as DateTime?;
  }

  @override
  void write(BinaryWriter writer, Word obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.word)
      ..writeByte(2)
      ..write(obj.phonetic)
      ..writeByte(3)
      ..write(obj.phonetics)
      ..writeByte(4)
      ..write(obj.meanings)
      ..writeByte(5)
      ..write(obj._isFavorited)
      ..writeByte(6)
      ..write(obj._lastTimeReaded)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
