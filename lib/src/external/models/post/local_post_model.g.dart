// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_post_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalPostModelAdapter extends TypeAdapter<LocalPostModel> {
  @override
  final int typeId = 1;

  @override
  LocalPostModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalPostModel(
      authorId: fields[1] as String,
      creationDate: fields[2] as DateTime,
      type: fields[3] as String,
      text: fields[4] as String?,
      childId: fields[5] as String?,
      id: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LocalPostModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.authorId)
      ..writeByte(2)
      ..write(obj.creationDate)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.text)
      ..writeByte(5)
      ..write(obj.childId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalPostModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
