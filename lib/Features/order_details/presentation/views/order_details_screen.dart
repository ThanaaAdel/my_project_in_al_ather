import '../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'widgets/showing_bottom_sheet.dart';
import '../../../../core/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/custom_simple_app_bar.dart';
import 'widgets/custom_row.dart';
import 'widgets/divider_custom.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: screenSize * .07,
        child: CustomSimpleAppBar(
          appBarTitle: locale.translate('order_details')!,
          leadingWidget: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(children: [
              InkWell(
                child: Image.asset(
                  "assets/icons/touch_icon.png",
                  color: kPrimaryColor,
                ),
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    context: context,
                    builder: (context) {
                      return AnimatedPadding(
                          duration: const Duration(seconds: 1),
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: const ShowModalBottomSheet());
                    },
                  );
                },
              ),
              const Spacer(),
              InkWell(
                child: Image.asset(
                  "assets/icons/follow_request_icon.png",
                  color: kPrimaryColor,
                ),
                onTap: () {
                  // BlocProvider.of<BottomNavCubit>(context)
                  //     .navigationQueue
                  //     .addLast(BlocProvider.of<BottomNavCubit>(context)
                  //         .bottomNavIndex);
                  BlocProvider.of<BottomNavCubit>(context)
                      .updateBottomNavIndex(kFollowingRequestsScreen);
                },
              ),
            ]),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomOrderItem(
                hasStatusIcon: false,
                imgScr: "assets/icons/hashtag_icon.png",
                titleText: locale.translate('num_request')!,
                subTitleText: "#123546"),
            const CustomDivider(),
            CustomOrderItem(
                hasStatusIcon: false,
                imgScr: "assets/icons/calender_icon.png",
                titleText: locale.translate('date_request')!,
                subTitleText: "5-7-2023"),
            const CustomDivider(),
            CustomOrderItem(
                hasStatusIcon: false,
                imgScr: "assets/icons/vacation_icon.png",
                titleText: locale.translate('vacation_type')!,
                subTitleText: locale.translate('sick_leave')!),
            const CustomDivider(),
            CustomOrderItem(
                hasStatusIcon: false,
                imgScr: "assets/icons/hashtag_icon.png",
                titleText: locale.translate('num_days')!,
                subTitleText: "15${locale.translate('day')!}"),
            const CustomDivider(),
            CustomOrderItem(
                hasStatusIcon: false,
                imgScr: "assets/icons/calender_icon.png",
                titleText: locale.translate('from_date')!,
                subTitleText: "5-23-2023"),
            const CustomDivider(),
            CustomOrderItem(
                hasStatusIcon: false,
                imgScr: "assets/icons/calender_icon.png",
                titleText: locale.translate('to_date')!,
                subTitleText: "5-23-2023"),
            const CustomDivider(),
            CustomOrderItem(
                hasStatusIcon: true,
                imgScr: "assets/icons/status_icon.png",
                titleText: locale.translate('status')!,
                subTitleText:
                    locale.translate('work_is_underway_on_the_request')!),
          ],
        ),
      ),
    );
  }
}
