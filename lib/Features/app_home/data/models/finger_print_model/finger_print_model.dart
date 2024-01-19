import 'package:HrmsVersions/Features/app_home/data/models/finger_print_model/data.dart';

import '../../../domain/entities/finger_print_entity.dart';

class FingerPrintModel extends FingerPrintEntity {
  int? status;
  String? message;
  double? distance;
  Data? data;

  FingerPrintModel({this.status, this.message, this.data, this.distance})
      : super(
            timeOut: data != null ? data.timeOut! : "",
            timeIn: data != null ? data.timeIn! : "",
            date: data != null ? data.date! : " ",
            hours: data != null ? data.hours! : 0,
            minutes: data != null ? data.minutes! : 0);

  factory FingerPrintModel.fromJson(Map<String, dynamic> json) =>
      FingerPrintModel(
          status: json['status'] as int?,
          message: json['message'] as String?,
          distance: json['distance'] as double?,
          data: json.containsKey('data')
              ? Data.fromJson(json['data'] as Map<String, dynamic>)
              : null);

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'distance': distance,
        'data': data?.toJson(),
      };
}
