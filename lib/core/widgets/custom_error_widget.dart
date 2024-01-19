import 'package:flutter/material.dart';

import '../locale/app_localizations.dart';
import '../utils/constants.dart';
import '../utils/gaps.dart';
import 'custom_button.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .1,
          ),
          Image.asset(
            "assets/images/error_image.png",
          ),
          Gaps.vGap16,
          Text(
            locale.translate('sorry')!,
          ),
          Gaps.vGap5,
          Text(
            locale.translate('sorry_for_having_this_error')!,
          ),
          Gaps.vGap16,
          CustomButton(
            screenWidth: MediaQuery.of(context).size.width * .5,
            buttonTapHandler: () {
              Navigator.pushReplacementNamed(context, kBottomNavRoute);
            },
            buttonText: locale.translate('back_to_home')!,
          ),
        ],
      ),
    );
  }
}
