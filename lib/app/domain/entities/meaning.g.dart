// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meaning.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MeaningAdapter extends TypeAdapter<Meaning> {
  @override
  final int typeId = 2;

  @override
  Meaning read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Meaning(
      partOfSpeech: fields[1] as String,
      definitions: (fields[2] as List).cast<Definition>(),
      synonyms: (fields[3] as List).cast<String>(),
      antonyms: (fields[4] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Meaning obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.partOfSpeech)
      ..writeByte(2)
      ..write(obj.definitions)
      ..writeByte(3)
      ..write(obj.synonyms)
      ..writeByte(4)
      ..write(obj.antonyms)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeaningAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
