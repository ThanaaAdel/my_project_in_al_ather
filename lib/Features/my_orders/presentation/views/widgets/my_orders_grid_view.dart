import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../../../core/locale/app_localizations.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/functions/registration_alert.dart';
import '../../../../../core/utils/gaps.dart';
import '../../../../auth/login/domain/entities/login_entity.dart';
import '../../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import '../../../data/my_orders_grid_dummy_data.dart';
import 'my_orders_grid_view_item.dart';

// ignore: must_be_immutable
class MyOrdersGridView extends StatelessWidget {
  const MyOrdersGridView({super.key});
  // List MyOrdersScreens = [
  //   kPermissionRquestScreen,
  //   kPermissionRquestScreen,
  //   kPermissionRquestScreen,
  //   kPermissionRquestScreen,
  //   kPermissionRquestScreen,
  //   kPermissionRquestScreen
  // ];
  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    return Column(
      children: [
        Gaps.vGap20,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyOrdersGridViewItem(
              navScreenIndex: 0,
              gridImagePath: MyOrdersGridDummyData().dummyData[0]["imagePath"],
              gridItemTapHandler: () {
                // BlocProvider.of<BottomNavCubit>(context)
                //     .navigationQueue
                //     .addLast(BlocProvider.of<BottomNavCubit>(context)
                //         .bottomNavIndex);
                BlocProvider.of<BottomNavCubit>(context)
                    .updateBottomNavIndex(kStatusRequest);
              },
              gridText: locale.translate('order_vacation')!,
            ),
            MyOrdersGridViewItem(
              navScreenIndex: 1,
              gridImagePath: MyOrdersGridDummyData().dummyData[1]["imagePath"],
              gridItemTapHandler: () {
                // BlocProvider.of<BottomNavCubit>(context)
                //     .navigationQueue
                //     .addLast(BlocProvider.of<BottomNavCubit>(context)
                //         .bottomNavIndex);
                BlocProvider.of<BottomNavCubit>(context)
                    .updateBottomNavIndex(kStatusRequest);
              },
              gridText: locale.translate('dept_request')!,
            )
          ],
        ),
        Gaps.vGap20,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyOrdersGridViewItem(
              navScreenIndex: 2,
              gridImagePath: MyOrdersGridDummyData().dummyData[2]["imagePath"],
              gridItemTapHandler: () {
                // BlocProvider.of<BottomNavCubit>(context)
                //     .navigationQueue
                //     .addLast(BlocProvider.of<BottomNavCubit>(context)
                //         .bottomNavIndex);
                BlocProvider.of<BottomNavCubit>(context)
                    .updateBottomNavIndex(kStatusRequest);
              },
              gridText: locale.translate('order_permission')!,
            ),
            MyOrdersGridViewItem(
              navScreenIndex: 3,
              gridImagePath: MyOrdersGridDummyData().dummyData[3]["imagePath"],
              gridItemTapHandler: () {
                // BlocProvider.of<BottomNavCubit>(context)
                //     .navigationQueue
                //     .addLast(BlocProvider.of<BottomNavCubit>(context)
                //         .bottomNavIndex);
                BlocProvider.of<BottomNavCubit>(context)
                    .updateBottomNavIndex(kChangeBankAccountViewStep1);
                // Commons.showToast(context, message: "not Found screen");
              },
              gridText: locale.translate('bank_account_change')!,
            )
          ],
        ),
        Gaps.vGap20,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyOrdersGridViewItem(
              navScreenIndex: 4,
              gridImagePath: MyOrdersGridDummyData().dummyData[4]["imagePath"],
              gridItemTapHandler: () {
                // BlocProvider.of<BottomNavCubit>(context)
                //     .navigationQueue
                //     .addLast(BlocProvider.of<BottomNavCubit>(context)
                //         .bottomNavIndex);
                BlocProvider.of<BottomNavCubit>(context)
                    .updateBottomNavIndex(kEmployeeProfileFormScreenStep1);
              },
              gridText: locale.translate('employee_identification_form')!,
            ),
            MyOrdersGridViewItem(
              navScreenIndex: 5,
              gridImagePath: MyOrdersGridDummyData().dummyData[5]["imagePath"],
              gridItemTapHandler: () {
                // BlocProvider.of<BottomNavCubit>(context)
                //     .navigationQueue
                //     .addLast(BlocProvider.of<BottomNavCubit>(context)
                //         .bottomNavIndex);
                BlocProvider.of<BottomNavCubit>(context)
                    .updateBottomNavIndex(kPaymentPermissionScreen);
              },
              gridText: locale.translate('payment_permission')!,
            )
          ],
        ),
        Gaps.vGap20,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyOrdersGridViewItem(
              navScreenIndex: 4,
              gridImagePath: MyOrdersGridDummyData().dummyData[6]["imagePath"],
              gridItemTapHandler: () {
                // BlocProvider.of<BottomNavCubit>(context)
                //     .navigationQueue
                //     .addLast(BlocProvider.of<BottomNavCubit>(context)
                //         .bottomNavIndex);

                var box = Hive.box<LoginEntity>(kEmployeeDataBox);

                if (box.get(kEmployeeDataBox) != null) {
                  BlocProvider.of<BottomNavCubit>(context)
                      .updateBottomNavIndex(kCalenderView);
                } else {
                  AlertDialog alert = alertRegistration(
                      context,
                      AppLocalizations.of(context)!
                          .translate('you_should_login_first')!, () {
                    Navigator.pushReplacementNamed(context, kLoginScreenRoute);
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
              gridText: locale.translate('attendance_table')!,
            ),
          ],
        ),
        Gaps.vGap100,
      ],
    );
  }
}
