typedef TableList = List<Datum>?;

class Datum {
  String? id;
  String? branchId;
  String? dwamId;
  String? employeeId;
  String? timeSettingId;
  String? total;
  String? date;
  String? time;
  String? timeAr;
  String? type;
  String? positiveMinutes;
  String? negativeMinutes;
  String? dateS;
  String? month;
  String? year;
  String? timeHdoor;
  String? timeEnsraf;
//  int? timeDiff;
  String? employee;
  String? timeHdoorAr;
  String? timeEnsrafAr;
  String? dayName;
  int? hours;
  int? minutes;

  Datum(
      {this.id,
      this.branchId,
      this.dwamId,
      this.employeeId,
      this.timeSettingId,
      this.total,
      this.date,
      this.time,
      this.timeAr,
      this.type,
      this.positiveMinutes,
      this.negativeMinutes,
      this.dateS,
      this.month,
      this.year,
      this.timeHdoor,
      this.timeEnsraf,
      //  this.timeDiff,
      this.employee,
      this.timeHdoorAr,
      this.timeEnsrafAr,
      this.dayName,
      this.hours,
      this.minutes});

  Datum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchId = json['branch_id'];
    dwamId = json['dwam_id'];
    employeeId = json['employee_id'];
    timeSettingId = json['time_setting_id'];
    total = json['total'];
    date = json['date'];
    time = json['time'];
    timeAr = json['time_ar'];
    type = json['type'];
    positiveMinutes = json['positive_minutes'];
    negativeMinutes = json['negative_minutes'];
    dateS = json['date_s'];
    month = json['month'];
    year = json['year'];
    timeHdoor = json['time_hdoor'];
    timeEnsraf = json['time_ensraf'];
    //timeDiff = json['time_diff'];
    employee = json['employee'];
    timeHdoorAr = json['time_hdoor_ar'];
    timeEnsrafAr = json['time_ensraf_ar'];
    dayName = json['day_name'];
    hours = json['hours'];
    minutes = json['minutes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['branch_id'] = branchId;
    data['dwam_id'] = dwamId;
    data['employee_id'] = employeeId;
    data['time_setting_id'] = timeSettingId;
    data['total'] = total;
    data['date'] = date;
    data['time'] = time;
    data['time_ar'] = timeAr;
    data['type'] = type;
    data['positive_minutes'] = positiveMinutes;
    data['negative_minutes'] = negativeMinutes;
    data['date_s'] = dateS;
    data['month'] = month;
    data['year'] = year;
    data['time_hdoor'] = timeHdoor;
    data['time_ensraf'] = timeEnsraf;
    //data['time_diff'] = this.timeDiff;
    data['employee'] = employee;
    data['time_hdoor_ar'] = timeHdoorAr;
    data['time_ensraf_ar'] = timeEnsrafAr;
    data['day_name'] = dayName;
    data['hours'] = hours;
    data['minutes'] = minutes;
    return data;
  }
}
