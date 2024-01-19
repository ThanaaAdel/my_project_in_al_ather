import '../../../domain/entities/table_entity.dart';
import 'datum.dart';

class TableModel extends TableEntity {
  int? status;
  List<Datum>? data;
  String? message;

  TableModel({this.status, this.data, this.message})
      : super(
            attendanceTime: data![0].timeHdoorAr!,
            leavingTime: data[0].timeEnsrafAr!,
            dayName: data[0].dayName!,
            hours: data[0].hours!,
            minutes: data[0].minutes!,
            date: data[0].date!,
            type: data[0].type!);

  factory TableModel.fromJson(Map<String, dynamic> json) => TableModel(
        status: json['status'] as int?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.map((e) => e.toJson()).toList(),
        'message': message,
      };
}
