import 'package:animate_do/animate_do.dart';
import '../../../../core/widgets/out_put_container.dart';
import 'package:flutter/material.dart';

import '../../../../core/locale/app_localizations.dart';
import '../../../../core/utils/gaps.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_orders_raw_icon.dart';
import '../../../../core/widgets/custom_request_text_field.dart';
import '../../../request_vacation/presentation/widgets/custom_drop_down_list.dart';
import '../widgets/custom_time_picker_widget.dart';

class RequestPermissionScreen extends StatefulWidget {
  const RequestPermissionScreen({super.key});

  @override
  State<RequestPermissionScreen> createState() =>
      _RequestPermissionScreenState();
}

class _RequestPermissionScreenState extends State<RequestPermissionScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    return FadeInUp(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: screenSize * .1, child: const CustomAppBar()),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0, bottom: 30),
            child: Column(
              children: [
                Text(
                  locale.translate('permission_request')!,
                  style: const TextStyle(
                    color: Color(0xff000000),
                    fontSize: 20,
                  ),
                ),
                CustomOrdersRawIcon(
                    rawText: locale.translate('permission_type')!,
                    iconImagePath: "assets/icons/vacation_icon.png"),
                CustomDropDownList(
                    hintText: locale.translate('permission_type')!),
                CustomOrdersRawIcon(
                    rawText: locale.translate('Period')!,
                    iconImagePath: "assets/icons/vacation_icon.png"),
                CustomDropDownList(
                  hintText: locale.translate('Period')!,
                ),
                Row(
                  children: [
                    CustomOrdersRawIcon(
                        rawText: locale.translate('start_permission')!,
                        iconImagePath: "assets/icons/time_icon.png"),
                    SizedBox(
                      width: screenSize.width * .27,
                    ),
                    CustomOrdersRawIcon(
                        rawText: locale.translate('end_permission')!,
                        iconImagePath: "assets/icons/time_icon.png"),
                  ],
                ),
                Row(
                  children: [
                    CustomTimePicker(
                      timePickerText: locale.translate('to')!,
                    ),
                    const Spacer(),
                    CustomTimePicker(
                      timePickerText: locale.translate('from')!,
                    )
                  ],
                ),
                Row(
                  children: [
                    CustomOrdersRawIcon(
                        rawText: locale.translate('Period')!,
                        iconImagePath: "assets/icons/time_icon.png"),
                    SizedBox(
                      width: screenSize.width * .32,
                    ),
                    CustomOrdersRawIcon(
                        rawText: locale.translate('remaining_time')!,
                        iconImagePath: "assets/icons/time_icon.png"),
                  ],
                ),
                Row(
                  children: [
                    CustomTimePicker(
                      timePickerText: locale.translate('Period')!,
                    ),
                    const Spacer(),
                    CustomTimePicker(
                      timePickerText: locale.translate('remaining_time')!,
                    )
                  ],
                ),
                OutPutContainer(
                  containerIconPath: "assets/icons/hashtag_icon.png",
                  containerTitle:
                      locale.translate('the_number_of_permissions_left')!,
                  containerWidth: double.infinity,
                  containerText:
                      locale.translate('the_number_of_permissions_left')!,
                ),
                CustomOrdersRawIcon(
                  rawText: locale.translate('the_reason')!,
                  iconImagePath: "assets/icons/notes_icon.png",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                  child: CustomRequestsTextField(
                    hintTextField: locale.translate('the_reason')!,
                  ),
                ),
                Gaps.vGap15,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                        screenWidth: MediaQuery.of(context).size.width * .3,
                        buttonTapHandler: () {},
                        buttonText: locale.translate('accept')!),
                    CustomButton(
                        buttonBackGroundColor: Colors.white,
                        screenWidth: MediaQuery.of(context).size.width * .3,
                        buttonTapHandler: () {},
                        buttonText: locale.translate('reject')!)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
