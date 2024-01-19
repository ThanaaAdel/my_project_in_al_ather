import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:HrmsVersions/Features/app_home/presentation/views/widgets/round_clipper.dart';

import '../../../../../core/locale/app_localizations.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/functions/registration_alert.dart';
import '../../../../../core/utils/gaps.dart';
import '../../../../../core/utils/media_query_sizes.dart';
import '../../../../auth/login/domain/entities/login_entity.dart';
import '../../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'app_home_screen_app_bar.dart';
import 'custom_grid_container.dart';
import 'details_snack_bar.dart';
import 'home_app_toggle_button.dart';

import 'stack_purple_container.dart';

// ignore: must_be_immutable
class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  late AppLocalizations locale;

  @override
  Widget build(BuildContext context) {
    locale = AppLocalizations.of(context)!;

    SizeConfig().init(context);

    return SingleChildScrollView(
      child: Stack(
        children: [
          ClipPath(
            clipper: RoundedClipperHome(),
            child: Container(
              color: const Color(0xffeaeaf7),
              height: SizeConfig.screenHeight! * 0.60,
            ),
          ),
          Column(
            children: [
              const HomeScreenAppBar(),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: StackPurpleContainer(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.screenWidth! * 0.29,
                        right: SizeConfig.screenWidth! * 0.29),
                    child: const HomeAppToggleButton(),
                  ),
                ],
              ),
              DetailsSnackBar(),
              Gaps.vGap15,
              CustomGridContainer(
                onTap: () {
                  var box = Hive.box<LoginEntity>(kEmployeeDataBox);

                  if (box.get(kEmployeeDataBox) != null) {
                    BlocProvider.of<BottomNavCubit>(context)
                        .updateBottomNavIndex(kDataTableView);
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
                imagePath: 'assets/images/confirmed_attendance_bro.png',
                orderText: locale.translate("attendance_and_leaving")!,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
