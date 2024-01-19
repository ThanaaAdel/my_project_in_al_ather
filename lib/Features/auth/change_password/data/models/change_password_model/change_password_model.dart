import '../../../domain/entities/change_password_entity.dart';
import 'data.dart';

class ChangePasswordModel extends ChangePasswordEntity {
  int? status;
  String? message;
  Data? data;

  ChangePasswordModel({this.status, this.message, this.data})
      : super(changePasswordMessage: message!);

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
