// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inbox_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MsgOutboxAdapter extends TypeAdapter<MsgOutBox> {
  @override
  final int typeId = 4;

  @override
  MsgOutBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MsgOutBox(
      msgDoc: fields[0] as String,
      msgRef: fields[1] as String,
      msgType: fields[2] as String,
      sendMsg: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MsgOutBox obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.msgDoc)
      ..writeByte(1)
      ..write(obj.msgRef)
      ..writeByte(2)
      ..write(obj.msgType)
      ..writeByte(3)
      ..write(obj.sendMsg);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MsgOutboxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
