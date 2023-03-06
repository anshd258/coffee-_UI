// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class loginStorageAdapter extends TypeAdapter<loginStorage> {
  @override
  final int typeId = 0;

  @override
  loginStorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return loginStorage()
      ..phonenumber = fields[0] as String
      ..token = fields[1] as String
      ..role = fields[2] as String
      ..userId = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, loginStorage obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.phonenumber)
      ..writeByte(1)
      ..write(obj.token)
      ..writeByte(2)
      ..write(obj.role)
      ..writeByte(3)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is loginStorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
