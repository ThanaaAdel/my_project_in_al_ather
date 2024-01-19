import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/media_query_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/locale/app_localizations.dart';
import '../../../domain/entities/finger_print_entity.dart';
import '../../manger/finger_print_cubit.dart';
import 'details_snack_bar_item.dart';

// ignore: must_be_immutable
class DetailsSnackBar extends StatelessWidget {
  DetailsSnackBar({
    super.key,
  });
  late AppLocalizations locale;

  @override
  Widget build(BuildContext context) {
    locale = AppLocalizations.of(context)!;

    SizeConfig().init(context);

    var now = DateTime.now();
    var formatterDate = DateFormat('yyyy-MM-dd');
    String formattedDate = formatterDate.format(now);
    return Container(
      width: 300.w,
      // height: SizeConfig.screenHeight! * 0.1,
      margin: const EdgeInsets.only(
        top: 10,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
              color: Color(0x29000000),
              offset: Offset(0, 3),
              blurRadius: 6,
              spreadRadius: 0)
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.defaultSize! * 4,
            vertical: SizeConfig.defaultSize! * 0.4),
        child: BlocBuilder<FingerPrintCubit, FingerPrintState>(
          builder: (context, state) {
            var box = Hive.box<FingerPrintEntity>(kFingerPrintDataBox);

            if (state is FingerPrintSuccessful) {
              box.put(kFingerPrintDataBox, state.data);

              return Row(
                children: [
                  DetailsSnackBarItem(
                    icon: Icons.login_rounded,
                    timeText: state.data.timeIn,
                    actionText: locale.translate("attendance_register")!,
                  ),
                  DetailsSnackBarItem(
                    icon: Icons.logout_outlined,
                    timeText: state.data.timeOut,
                    actionText: locale.translate("leaving_register")!,
                    rotate: true,
                  ),
                  DetailsSnackBarItem(
                    icon: Icons.access_time,
                    timeText:
                        '${state.data.hours} ${locale.translate("hours")!} ${state.data.minutes} ${locale.translate("minutes")!}',
                    actionText: locale.translate("work_hours")!,
                  ),
                ],
              );
            } else {
              return Row(
                children: [
                  DetailsSnackBarItem(
                    icon: Icons.login_rounded,
                    timeText: box.get(kFingerPrintDataBox) == null ||
                            box.get(kFingerPrintDataBox)!.date != formattedDate
                        ? '---- '
                        : box.get(kFingerPrintDataBox)!.timeIn,
                    actionText: locale.translate("attendance_register")!,
                  ),
                  DetailsSnackBarItem(
                    icon: Icons.logout_outlined,
                    timeText: box.get(kFingerPrintDataBox) == null ||
                            box.get(kFingerPrintDataBox)!.date != formattedDate
                        ? '---- '
                        : box.get(kFingerPrintDataBox)!.timeOut,
                    actionText: locale.translate("leaving_register")!,
                    rotate: true,
                  ),
                  DetailsSnackBarItem(
                    icon: Icons.access_time,
                    timeText: box.get(kFingerPrintDataBox) == null ||
                            box.get(kFingerPrintDataBox)!.date != formattedDate
                        ? '0 ${locale.translate("hours")!}'
                        : "${box.get(kFingerPrintDataBox)!.hours.toString()} ${locale.translate("hours")!} ${box.get(kFingerPrintDataBox)!.minutes.toString()} ${locale.translate("minutes")!}",
                    actionText: locale.translate("work_hours")!,
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
