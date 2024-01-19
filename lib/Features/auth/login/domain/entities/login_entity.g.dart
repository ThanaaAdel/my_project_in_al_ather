// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginEntityAdapter extends TypeAdapter<LoginEntity> {
  @override
  final int typeId = 1;

  @override
  LoginEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginEntity(
      employeeId: fields[0] as String,
      employeeName: fields[1] as String,
      employeeCode: fields[2] as String,
      cardNum: fields[3] as String,
      image: fields[4] as String,
      departmentName: fields[6] as String,
      jobTitle: fields[7] as String,
      managementName: fields[8] as String,
      phoneNumber: fields[9] as String,
      userId: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LoginEntity obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.employeeId)
      ..writeByte(1)
      ..write(obj.employeeName)
      ..writeByte(2)
      ..write(obj.employeeCode)
      ..writeByte(3)
      ..write(obj.cardNum)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.userId)
      ..writeByte(6)
      ..write(obj.departmentName)
      ..writeByte(7)
      ..write(obj.jobTitle)
      ..writeByte(8)
      ..write(obj.managementName)
      ..writeByte(9)
      ..write(obj.phoneNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
