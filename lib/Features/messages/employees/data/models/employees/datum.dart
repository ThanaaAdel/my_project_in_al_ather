class Datum {
  String? empId;
  String? userId;
  String? employee;
  String? empCode;
  String? cardNum;
  String? edaraName;
  String? qsmName;
  String? mosmaWazefyName;
  String? phoneNumber;
  String? personalPhoto;
  String? empImg;

  Datum({
    this.empId,
    this.userId,
    this.employee,
    this.empCode,
    this.cardNum,
    this.edaraName,
    this.qsmName,
    this.mosmaWazefyName,
    this.phoneNumber,
    this.personalPhoto,
    this.empImg,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        empId: json['emp_id'] as String?,
        userId: json['user_id'] as String?,
        employee: json['employee'] as String?,
        empCode: json['emp_code'] as String?,
        cardNum: json['card_num'] as String?,
        edaraName: json['edara_name'] as String?,
        qsmName: json['qsm_name'] as String?,
        mosmaWazefyName: json['mosma_wazefy_name'] as String?,
        phoneNumber: json['phone_number'] as String?,
        personalPhoto: json['personal_photo'] as String?,
        empImg: json['emp_img'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'emp_id': empId,
        'user_id': userId,
        'employee': employee,
        'emp_code': empCode,
        'card_num': cardNum,
        'edara_name': edaraName,
        'qsm_name': qsmName,
        'mosma_wazefy_name': mosmaWazefyName,
        'phone_number': phoneNumber,
        'personal_photo': personalPhoto,
        'emp_img': empImg,
      };
}
