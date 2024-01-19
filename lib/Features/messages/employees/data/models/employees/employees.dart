import 'datum.dart';

typedef EmployeesList = List<Datum>;

class EmployeesModel {
  int? status;
  String? message;
  List<Datum>? data;

  EmployeesModel({this.status, this.message, this.data});

  factory EmployeesModel.fromJson(Map<String, dynamic> json) => EmployeesModel(
        status: json['status'] as int?,
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
