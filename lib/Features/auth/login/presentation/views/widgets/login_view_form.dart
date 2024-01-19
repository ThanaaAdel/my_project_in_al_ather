import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:HrmsVersions/Features/auth/register/presentation/manager/cubit/phone_auth_cubit.dart';
import 'package:HrmsVersions/Features/auth/register/presentation/manager/cubit/phone_auth_state.dart';

import '../../../../../../core/locale/app_localizations.dart';
import '../../../../../../core/utils/commons.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/functions/validation_mixin.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_login_text_field.dart';

class LoginViewForm extends StatefulWidget {
  const LoginViewForm({super.key});

  @override
  State<LoginViewForm> createState() => _LoginViewFormState();
}

class _LoginViewFormState extends State<LoginViewForm> with ValidationMixin {
  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) async {
        if (state is PhoneAuthSubmitted) {
          await Hive.openBox("phoneNumber");
          var box = Hive.box('phoneNumber');
          box.put('phoneNumber', phoneController.text);
          // BlocProvider.of<LoginCubit>(context)
          //     .getPhoneNumber(phoneController.text,);
          // print("${BlocProvider.of<PhoneAuthCubit>(context).phoneNumber}");
          // BlocProvider.of<PhoneAuthCubit>(context).password =
          //     phoneController.text;
          Navigator.pushNamed(context, kVerificationScreen);
          // Commons.showToast(context, message: "تم التسجيل بنجاح");
          // var box = Hive.box<LoginEntity>(kEmployeeDataBox);
          //  box.put(kEmployeeDataBox, state.user);
          //box.values.toList();
          // print("idEmployee ${box.get(kEmployeeDataBox)!.id}");
        } else if (state is PhoneAuthFailed) {
          Commons.showToast(context, message: state.failMessage);
        }
        //else if (state is LoginFailed) {
        //   Commons.showToast(context,
        //       message: "عفوا !... الرقم الذي ادخلته غير مسجل");
        // }
        // else if (state is PhoneAuthVerified) {
        //   BlocProvider.of<LoginCubit>(context)
        //       .getUserData(phoneController.text, passwordController.text);

        //   Commons.showToast(context, message: "تم التسجيل بنجاح");
        // }
      },
      child: Column(
        children: [
          Text(
            locale.translate("login")!,
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 17.sp,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 25,
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(right: 0.0, left: 0),
              child: Column(
                children: [
                  CustomLoginTextField(
                    key: const Key('phone'),
                    imagePath: "assets/icons/mobile_icon.png",
                    controller: phoneController,
                    stringInTextField: locale.translate('phone_num')!,
                    obscureText: false,
                    textInputType: TextInputType.number,
                    validator: validateUserPhone,
                  ),
                  CustomLoginTextField(
                    key: const Key('password'),
                    imagePath: "assets/icons/lock_icon.png",
                    controller: passwordController,
                    stringInTextField: locale.translate('password')!,
                    obscureText: true,
                    textInputType: TextInputType.text,
                    validator: validatePassWord,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          BlocBuilder<PhoneAuthCubit, PhoneAuthState>(
            builder: (context, state) {
              return state is PhoneAuthLoading
                  ? const CircularProgressIndicator(
                      color: kPrimaryColor,
                    )
                  : CustomButton(
                      onTapAvailable: true,
                      buttonText: locale.translate('login')!,
                      buttonTapHandler: () async {
                        if (formKey.currentState!.validate()) {
                          //Perform OTP check
                          BlocProvider.of<PhoneAuthCubit>(context)
                              .verifyPhone(phoneController.text);
                        }
                      },
                      screenWidth: MediaQuery.of(context).size.width * .50,
                    );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              // top: 20,
              bottom: 10,
              right: 20,
            ),
            child: Align(
              alignment: locale.isEnLocale
                  ? Alignment.bottomLeft
                  : Alignment.bottomRight,
              child: TextButton(
                child: Text(
                  locale.translate('forgot_password')!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, kChangePasswordScreenRoute);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              // top: 20,
              bottom: 10,
              right: 20,
            ),
            child: Align(
              alignment: locale.isEnLocale
                  ? Alignment.bottomRight
                  : Alignment.bottomLeft,
              child: TextButton(
                child: Text(
                  locale.translate('skip')!,
                  style: const TextStyle(
                    fontSize: 15,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, kBottomNavRoute);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
