// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phonetic.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhoneticAdapter extends TypeAdapter<Phonetic> {
  @override
  final int typeId = 1;

  @override
  Phonetic read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Phonetic(
      text: fields[1] as String,
      audio: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Phonetic obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.audio)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhoneticAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
