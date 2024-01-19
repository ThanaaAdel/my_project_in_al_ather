class Data {
  String? userId;
  String? empId;
  String? employee;
  String? empCode;
  String? cardNum;
  String? edaraName;
  String? qsmName;
  String? mosmaWazefyName;
  String? phoneNumber;
  String? empImg;

  Data({
    this.userId,
    this.empId,
    this.employee,
    this.empCode,
    this.cardNum,
    this.edaraName,
    this.qsmName,
    this.mosmaWazefyName,
    this.phoneNumber,
    this.empImg,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json['user_id'] as String?,
        empId: json['emp_id'] as String?,
        employee: json['employee'] as String?,
        empCode: json['emp_code'] as String?,
        cardNum: json['card_num'] as String?,
        edaraName: json['edara_name'] as String?,
        qsmName: json['qsm_name'] as String?,
        mosmaWazefyName: json['mosma_wazefy_name'] as String?,
        phoneNumber: json['phone_number'] as String?,
        empImg: json['emp_img'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'emp_id': empId,
        'employee': employee,
        'emp_code': empCode,
        'card_num': cardNum,
        'edara_name': edaraName,
        'qsm_name': qsmName,
        'mosma_wazefy_name': mosmaWazefyName,
        'phone_number': phoneNumber,
        'emp_img': empImg,
      };
}
