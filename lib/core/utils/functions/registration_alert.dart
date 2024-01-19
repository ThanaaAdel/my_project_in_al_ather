import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../Features/app_home/presentation/manger/finger_print_cubit.dart';
import '../../locale/app_localizations.dart';
import '../constants.dart';
import '../gaps.dart';
import '../../widgets/custom_button.dart';
import '../../../Features/auth/login/domain/entities/login_entity.dart';
import '../../../Features/auth/register/presentation/views/widgets/styles.dart';

AlertDialog alertRegistration(context, message, tapHandler, [image]) {
  late AppLocalizations locale;
  locale = AppLocalizations.of(context)!;
  return AlertDialog(
    insetPadding: const EdgeInsets.symmetric(horizontal: 20),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0))),
    contentPadding: const EdgeInsets.only(top: 10.0, right: 10),
    actionsAlignment: MainAxisAlignment.end,
    actionsOverflowDirection: VerticalDirection.up,
    alignment: Alignment.center,
    content: SizedBox(
      width: MediaQuery.of(context).size.width / 1.3,
      height: MediaQuery.of(context).size.height * .35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image ?? "assets/images/Ok-amico.png",
              height: 100, width: 100, fit: BoxFit.cover),
          Gaps.vGap20,
          Text(
            message,
            style: const TextStyle(fontSize: 12),
          ),
          Gaps.vGap20,
          CustomButton(
              onTapAvailable: true,
              screenWidth: MediaQuery.of(context).size.width * 0.4,
              buttonTapHandler: () {
                tapHandler();
              },
              buttonText: locale.translate('confirm')!)
        ],
      ),
    ),
  );
}

AlertDialog alertLeaveRegistration(
  context,
) {
  late AppLocalizations locale;
  locale = AppLocalizations.of(context)!;
  return AlertDialog(
    insetPadding: const EdgeInsets.symmetric(horizontal: 20),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0))),
    contentPadding: const EdgeInsets.only(top: 10.0, right: 10),
    actionsAlignment: MainAxisAlignment.end,
    actionsOverflowDirection: VerticalDirection.up,
    alignment: Alignment.center,
    content: SizedBox(
      width: MediaQuery.of(context).size.width / 1.1,
      height: MediaQuery.of(context).size.height * .32,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 250,
            child: Text(
              locale.translate('time_of_checkout')!,
              textAlign: TextAlign.center,
              style: Styles.textStyle14,
            ),
          ),
          Gaps.vGap30,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomButton(
                  onTapAvailable: true,
                  screenWidth: MediaQuery.of(context).size.width * 0.3,
                  buttonTapHandler: () {
                    var box = Hive.box<LoginEntity>(kEmployeeDataBox);

                    if (box.get(kEmployeeDataBox) != null) {
                      BlocProvider.of<FingerPrintCubit>(context).getUserData(
                          box.get(kEmployeeDataBox)!.employeeId,
                          "6",
                          "leave",
                          context);

                      Navigator.pop(context);
                    } else {
                      Navigator.pop(context);

                      AlertDialog alert = alertRegistration(
                          context,
                          AppLocalizations.of(context)!
                              .translate('you_should_login_first')!, () {
                        Navigator.pushReplacementNamed(
                            context, kLoginScreenRoute);
                      }, "assets/images/should_login.png");

                      // show the dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }
                  },
                  buttonText: locale.translate('confirm')!),
              CustomButton(
                  onTapAvailable: true,
                  buttonBackGroundColor: Colors.white,
                  screenWidth: MediaQuery.of(context).size.width * 0.3,
                  buttonTapHandler: () {
                    Navigator.pop(context);
                  },
                  haveBorder: true,
                  buttonText: locale.translate('cancel')!),
            ],
          )
        ],
      ),
    ),
  );
}
