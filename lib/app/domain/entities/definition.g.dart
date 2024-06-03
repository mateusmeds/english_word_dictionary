// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'definition.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DefinitionAdapter extends TypeAdapter<Definition> {
  @override
  final int typeId = 3;

  @override
  Definition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Definition(
      definition: fields[1] as String,
      synonyms: (fields[2] as List).cast<String>(),
      antonyms: (fields[3] as List).cast<String>(),
      example: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Definition obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.definition)
      ..writeByte(2)
      ..write(obj.synonyms)
      ..writeByte(3)
      ..write(obj.antonyms)
      ..writeByte(4)
      ..write(obj.example)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DefinitionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
