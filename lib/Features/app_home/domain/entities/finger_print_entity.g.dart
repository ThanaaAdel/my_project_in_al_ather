// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finger_print_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FingerPrintEntityAdapter extends TypeAdapter<FingerPrintEntity> {
  @override
  final int typeId = 2;

  @override
  FingerPrintEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FingerPrintEntity(
      date: fields[0] as String,
      timeIn: fields[1] as String,
      timeOut: fields[2] as String,
      hours: fields[3] as int,
      minutes: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, FingerPrintEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.timeIn)
      ..writeByte(2)
      ..write(obj.timeOut)
      ..writeByte(3)
      ..write(obj.hours)
      ..writeByte(4)
      ..write(obj.minutes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FingerPrintEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
