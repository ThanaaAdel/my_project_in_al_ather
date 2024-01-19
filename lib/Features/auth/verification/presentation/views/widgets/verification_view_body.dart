import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/media_query_sizes.dart';
import '../../../../../../core/widgets/custom_circle_clipper.dart';
import '../../../../register/presentation/views/widgets/register_form_decoration.dart';
import 'verification_view_form.dart';

class VerificationViewBody extends StatelessWidget {
  const VerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Stack(
        children: [
          ClipPath(
            clipper: RoundedClipper(),
            child: Container(
              color: kPrimaryColor,
              height: SizeConfig.screenHeight! * 0.8,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.screenHeight! * 0.2),
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: SizeConfig.screenHeight! * 0.62,
                    width: SizeConfig.screenWidth! * 0.85,
                    decoration: formDecoration(),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: VerificationViewForm(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Image.asset(
                AssetsData.logo,
                height: 130,
                width: 130,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
