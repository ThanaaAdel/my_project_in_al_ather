import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/locale/app_localizations.dart';
import '../../../core/utils/constants.dart';
import '../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'row_details_alert.dart';

class OrderListTile extends StatelessWidget {
  const OrderListTile(
      {super.key, required this.status, required this.dotColor});

  final String status;
  final Color dotColor;

  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 7, left: 10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: kTextColor.withOpacity(0.4),
                blurRadius: 3.0,
                offset: const Offset(0.0, 0.8))
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      ' ${locale.translate('order_number')!}',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 12.sp),
                    ),
                    Text(
                      ' :  123456',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6), fontSize: 12),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    // BlocProvider.of<BottomNavCubit>(context)
                    //     .navigationQueue
                    //     .addLast(BlocProvider.of<BottomNavCubit>(context)
                    //         .bottomNavIndex);
                    BlocProvider.of<BottomNavCubit>(context)
                        .updateBottomNavIndex(kOrderDetailsScreen);
                    // // set up the AlertDialog
                    // AlertDialog alert = alertDetails(context);

                    // // show the dialog
                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return alert;
                    //   },
                    // );
                  },
                  child: Text(
                    locale.translate('the_details')!,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: kPrimaryColor,
                        fontSize: 12.sp),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      locale.translate('type_vacation')!,
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 12.sp),
                    ),
                    Text(
                      '  ${locale.translate('sick_leave')!} ',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6), fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '  ${locale.translate('status')!} ',
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 12),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Icon(
                        Icons.circle,
                        color: dotColor,
                        size: 10,
                      ),
                    ),
                    Text(
                      status,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AlertDialog alertDetails(context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      contentPadding: const EdgeInsets.only(top: 10.0, right: 10),
      actionsAlignment: MainAxisAlignment.end,
      actionsOverflowDirection: VerticalDirection.up,
      icon: const Align(
        alignment: Alignment.topLeft,
        child: FaIcon(
          FontAwesomeIcons.xmark,
          color: Color(0xd97350cb),
        ),
      ),
      title: Text(AppLocalizations.of(context)!.translate("order_details")!),
      alignment: Alignment.center,
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .3,
        child: Column(
          children: [
            RowDetailsAlert(
              staticText:
                  AppLocalizations.of(context)!.translate("num_request")!,
              comeText: "# 3625362",
            ),
            RowDetailsAlert(
              staticText:
                  AppLocalizations.of(context)!.translate("date_request")!,
              comeText: "# 3625362",
            ),
            RowDetailsAlert(
              staticText:
                  AppLocalizations.of(context)!.translate("type_vacation")!,
              comeText: "# 3625362",
            ),
            RowDetailsAlert(
              staticText: AppLocalizations.of(context)!.translate("num_days")!,
              comeText: "# 3625362",
            ),
            RowDetailsAlert(
              staticText: AppLocalizations.of(context)!.translate("from_date")!,
              comeText: "# 3625362",
            ),
          ],
        ),
      ),
    );
  }
}
