class Data {
  String? date;
  String? timeIn;
  String? timeOut;
  int? hours;
  int? minutes;

  Data({this.date, this.timeIn, this.timeOut, this.hours, this.minutes});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        date: json['date'] as String?,
        timeOut: json['time_out'] as String?,
        timeIn: json['time_in'] as String?,
        hours: json['hours'] as int?,
        minutes: json['minutes'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'time_in': timeIn,
        'time_out': timeOut,
        'hours': hours,
        "minutes": minutes
      };
}
