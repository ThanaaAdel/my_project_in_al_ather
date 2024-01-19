import 'package:flutter/material.dart';
import 'package:HrmsVersions/Features/app_home/presentation/views/widgets/stack_time_text.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/gaps.dart';
import '../../../../../core/utils/media_query_sizes.dart';
import 'stack_day_text.dart';
import 'stack_fingerprint_logo.dart';

class StackPurpleContainer extends StatelessWidget {
  const StackPurpleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      alignment: Alignment.center,
      width: SizeConfig.screenWidth! * 0.80,
      height: SizeConfig.screenHeight! * 0.33,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          colors: [
            kSecondaryColor,
            kPrimaryColor,
            kSecondaryColor,
          ],
          stops: [0, 0.4560239911079407, 1],
          begin: Alignment(-0.73, -0.68),
          end: Alignment(0.73, 0.68),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const StackFingerPrintLogo(),
          StackDayText(),
          StackTimeText(),
          Gaps.vGap10
        ],
      ),
    );
  }
}
