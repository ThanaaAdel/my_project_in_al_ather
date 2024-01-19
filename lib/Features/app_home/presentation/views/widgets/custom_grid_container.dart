import 'package:HrmsVersions/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/media_query_sizes.dart';

class CustomGridContainer extends StatelessWidget {
  const CustomGridContainer(
      {super.key,
      required this.imagePath,
      required this.orderText,
      required this.onTap});

  final String imagePath;
  final String orderText;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: context.screenWidth * 0.8,
        height: context.screenHeight * 0.15,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 4.h),
        decoration: BoxDecoration(
          color: const Color(0xffeaeaf7),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
              offset: Offset(0.2, 0.2),
            )
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: SizeConfig.screenHeight! * 0.08,
              width: 65,
            ),
            const SizedBox(
              height: 5,
            ),
            FittedBox(
              fit: BoxFit.fill,
              child: Text(orderText,
                  style: TextStyle(
                    color: const Color(0xff403f3f),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
