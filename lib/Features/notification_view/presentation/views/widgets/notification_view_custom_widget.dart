import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/locale/app_localizations.dart';
import '../../../../../core/utils/media_query_sizes.dart';

class NotificationViewCustomWidget extends StatelessWidget {
  const NotificationViewCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.only(
        right: SizeConfig.screenWidth! * 0.03,
        left: SizeConfig.screenWidth! * 0.03,
        top: SizeConfig.screenHeight! * 0.02,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Color(0x26000000),
                offset: Offset(0, 2),
                blurRadius: 3,
                spreadRadius: 0)
          ],
          color: Color(0xffffffff),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  locale.translate('address_of_the_notice')!,
                  style: TextStyle(
                      color: const Color(0xff282828), fontSize: 13.sp),
                  textAlign: TextAlign.right,
                ),
                Text(
                  "03:00 PM",
                  style: TextStyle(
                      color: const Color(0xff5d5d5d), fontSize: 13.sp),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                  "يتم هنا كتابة موضوع الإشعار يتم هنا كتابة موضوع الإشعار يتم هنا كتابة موضوع الإشعار يتم هنا"
                  "يتم هنا كتابة موضوع الإشعار يتم هنا كتابة موضوع الإشعار يتم هنا كتابة موضوع الإشعار يتم هنا"
                  "يتم هنا كتابة موضوع الإشعار يتم هنا كتابة",
                  style:
                      TextStyle(color: const Color(0xffa4a4a4), fontSize: 9.sp),
                  textAlign: TextAlign.right),
            ),
          ],
        ),
      ),
    );
  }
}
