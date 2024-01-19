import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/media_query_sizes.dart';
import '../../../../../../core/widgets/custom_circle_clipper.dart';
import 'package:flutter/material.dart';
import '../../../../register/presentation/views/widgets/register_form_decoration.dart';
import 'login_view_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // late AppLocalizations locale;
    // locale = AppLocalizations.of(context)!;
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipPath(
            clipper: RoundedClipper(),
            child: Container(
              color: kPrimaryColor,
              height: SizeConfig.screenHeight! * 0.7,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 170, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // height: SizeConfig.screenHeight! * 0.79,
                  width: SizeConfig.screenWidth! * 0.85,
                  decoration: formDecoration(),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: LoginViewForm(),
                  ),
                ),

                // CustomElevatedContainer(
                //   containerChild: const Padding(
                //     padding: EdgeInsets.only(top: 30),
                //     child: LoginViewForm(),
                //   ),
                //   // containerHeight: SizeConfig.screenHeight! * 0.65,
                //   containerWidth: SizeConfig.screenWidth! * 0.85,
                // ),
                const SizedBox(
                  height: 20,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 40, left: 40),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Text(
                //         locale.translate('you_do_not_have_an_account')!,
                //         style:
                //             const TextStyle(color: kPrimaryColor, fontSize: 15),
                //       ),
                //       TextButton(
                //         onPressed: () {
                //           Navigator.pushReplacementNamed(
                //               context, kRegisterScreen);
                //         },
                //         child: Column(
                //           children: [
                //             Text(
                //               locale.translate('create_account')!,
                //               style: const TextStyle(
                //                   color: kSecondaryColor,
                //                   fontSize: 15,
                //                   decorationThickness: 2,
                //                   decoration: TextDecoration.underline),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 28.0),
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
