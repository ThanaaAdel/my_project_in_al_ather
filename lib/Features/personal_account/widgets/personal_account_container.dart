import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/media_query_sizes.dart';
import '../../../core/utils/styles.dart';

class PersonalAccountContainer extends StatelessWidget {
  const PersonalAccountContainer(
      {super.key, required this.tapHandler, required this.text});

  final String text;
  final Function tapHandler;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Expanded(
      child: InkWell(
        onTap: () {
          tapHandler();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Container(
              height: SizeConfig.screenHeight! * 0.11,
              decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(14)),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                      text,
                      style: Styles.textStyle18.copyWith(
                        color: Colors.grey[700],
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
