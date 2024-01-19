import 'package:hive/hive.dart';

part 'login_entity.g.dart';

@HiveType(typeId: 1)
class LoginEntity {
  @HiveField(0)
  final String employeeId;
  @HiveField(1)
  final String employeeName;
  @HiveField(2)
  final String employeeCode;
  @HiveField(3)
  final String cardNum;
  @HiveField(4)
  final String image;
  @HiveField(5)
  final String userId;
  @HiveField(6)
  final String departmentName;
  @HiveField(7)
  final String jobTitle;
  @HiveField(8)
  final String managementName;
  @HiveField(9)
  final String phoneNumber;
  LoginEntity({
    required this.employeeId,
    required this.employeeName,
    required this.employeeCode,
    required this.cardNum,
    required this.image,
    required this.departmentName,
    required this.jobTitle,
    required this.managementName,
    required this.phoneNumber,
    required this.userId,
  });
}
