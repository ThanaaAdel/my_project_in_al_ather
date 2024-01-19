import 'package:HrmsVersions/Features/app_home/presentation/manger/toggle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../../../../core/locale/app_localizations.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/media_query_sizes.dart';
import '../../../../auth/login/domain/entities/login_entity.dart';
import '../../../../../core/utils/functions/registration_alert.dart';
import '../../manger/finger_print_cubit.dart';

class StackFingerPrintLogo extends StatefulWidget {
  const StackFingerPrintLogo({super.key});

  @override
  State<StackFingerPrintLogo> createState() => _StackFingerPrintLogoState();
}

class _StackFingerPrintLogoState extends State<StackFingerPrintLogo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BlocConsumer<FingerPrintCubit, FingerPrintState>(
      listener: (context, state) async {
        if (state is FingerPrintSuccessful) {
          AlertDialog alert = alertRegistration(context,
              AppLocalizations.of(context)!.translate('Attendance_leaving')!,
              () {
            Navigator.pop(context);
          });

          // show the dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            },
          );
        } else if (state is FingerPrintFailed) {
          AlertDialog alert = alertRegistration(context, state.message, () {
            Navigator.pop(context);
          });

          // show the dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            },
          );
        }
      },
      builder: (context, state) {
        if (state is FingerPrintLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else {
          return BlocBuilder<ToggleCubit, int>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () async {
                  var box = Hive.box<LoginEntity>(kEmployeeDataBox);

                  if (box.get(kEmployeeDataBox) != null) {
                    AlertDialog alert = alertLeaveRegistration(context);

                    state == 1
                        ? showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          )
                        : BlocProvider.of<FingerPrintCubit>(context)
                            .getUserData(box.get(kEmployeeDataBox)!.employeeId,
                                "6", "presence", context);
                  } else {
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
                child: Image.asset(
                  AssetsData.fingerPrint,
                  width: SizeConfig.screenWidth! * 0.2,
                ),
              );
            },
          );
        }
      },
    );
  }
}
