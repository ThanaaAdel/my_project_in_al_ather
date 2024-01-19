import '../../../../core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TablePageAppBarActions extends StatelessWidget {
  const TablePageAppBarActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
              color: Color(0x29000000),
              offset: Offset(0, 3),
              blurRadius: 6,
              spreadRadius: 0),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.date_range,
              color: kPrimaryColor,
              size: 15.sp,
            ),
          ),
          Text(
            "2023",
            style: TextStyle(color: const Color(0xff5e5e5e), fontSize: 11.sp),
          ),
        ],
      ),
    );
  }
}
