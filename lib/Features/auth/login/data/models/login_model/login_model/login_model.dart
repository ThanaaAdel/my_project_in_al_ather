import '../../../../domain/entities/login_entity.dart';
import 'data.dart';

class LoginModel extends LoginEntity {
  int? status;
  String? message;
  Data? data;

  LoginModel({this.status, this.message, this.data})
      : super(
          employeeId: data!.empId!,
          employeeName: data.employee!,
          employeeCode: data.empCode!,
          cardNum: data.cardNum!,
          image: data.empImg!,
          departmentName: data.qsmName!,
          jobTitle: data.mosmaWazefyName!,
          managementName: data.edaraName!,
          phoneNumber: data.phoneNumber!,
          userId: data.userId!,
        );

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json['status'] as int?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
