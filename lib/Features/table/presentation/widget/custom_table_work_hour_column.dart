import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTableWorkHourColumn extends StatelessWidget {
  final String amountHours;
  const CustomTableWorkHourColumn({super.key, required this.amountHours});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(amountHours,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xffd50a0a),
            fontSize: 12.sp,
          )),
    );
  }
}
