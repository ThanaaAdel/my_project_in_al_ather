import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:HrmsVersions/Features/auth/register/presentation/manager/cubit/count_down_timer_cubit.dart';
import 'package:HrmsVersions/Features/auth/register/presentation/manager/cubit/phone_auth_cubit.dart';
import 'package:HrmsVersions/core/utils/commons.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/media_query_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_line/dotted_line.dart';

import '../../../../../../core/locale/app_localizations.dart';
import '../../../../login/domain/entities/login_entity.dart';
import '../../../../login/presentation/manger/login_cubit.dart';
import '../../../../register/presentation/manager/cubit/phone_auth_state.dart';

class VerificationViewForm extends StatelessWidget {
  const VerificationViewForm({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('phoneNumber');
    var phoneNumber = box.get('phoneNumber');
    bool isFirstCounter = true;
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    SizeConfig().init(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<PhoneAuthCubit, PhoneAuthState>(
          listener: (context, state) {
            if (state is PhoneAuthVerified) {

              BlocProvider.of<LoginCubit>(context).getUserData("0501707329",
                  "{BlocProvider.of<PhoneAuthCubit>(context).password}");
            } else if (state is PhoneAuthFailed) {
              Commons.showToast(context, message: state.failMessage);
              // Navigator.pushReplacementNamed(context, kLoginScreenRoute);
            } else if (state is PhoneAuthSubmitted) {}
          },
        ),
        BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessful) {
              var box = Hive.box<LoginEntity>(kEmployeeDataBox);
              box.put(kEmployeeDataBox, state.user);
              Navigator.pushReplacementNamed(context, kBottomNavRoute);
              Commons.showToast(context, message: "تم التسجيل بنجاح");
            } else if (state is LoginFailed) {
              Commons.showToast(context,
                  message: "عفوا !... الرقم الذي ادخلته غير مسجل");
            }
          },
        ),
      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.h, bottom: 5.h),
              child: Text(
                locale.translate('activation_code')!,
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50.w,
                  height: 3,
                  decoration: const BoxDecoration(color: kPrimaryColor),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Icon(
                    Icons.circle_outlined,
                    size: 12.sp,
                    color: kPrimaryColor,
                  ),
                ),
                Container(
                    width: 50.w,
                    height: 3,
                    decoration: const BoxDecoration(color: kPrimaryColor))
              ],
            ),
            SizedBox(height: 30.h),
            Text(
              locale.translate('please_enter_the_verification_code_sent_to')!,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              phoneNumber,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            BlocBuilder<PhoneAuthCubit, PhoneAuthState>(
              builder: (context, state) {
                return state is PhoneAuthVerified
                    ? const CircularProgressIndicator(
                        color: kPrimaryColor,
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: PinCodeTextField(
                            autoUnfocus: true,
                            appContext: context,
                            autoFocus: true,
                            cursorColor: kPrimaryColor,
                            keyboardType: TextInputType.number,
                            length: 6,
                            obscureText: false,
                            animationType: AnimationType.scale,
                            dialogConfig: DialogConfig(),
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(0),
                              fieldHeight:
                                  MediaQuery.of(context).size.height * .06,
                              fieldWidth:
                                  MediaQuery.of(context).size.height * .05,
                              borderWidth: 1,
                              inActiveBoxShadow: const [
                                BoxShadow(color: kPinCodeTextFieldColor)
                              ],
                              activeFillColor: kPinCodeTextFieldColor,
                              activeColor: kPinCodeTextFieldColor,
                              inactiveColor: kPinCodeTextFieldColor,
                              inactiveFillColor: kPinCodeTextFieldColor,
                              selectedColor: kPinCodeTextFieldColor,
                              selectedFillColor: kPinCodeTextFieldColor,
                            ),
                            animationDuration:
                                const Duration(milliseconds: 300),
                            enableActiveFill: true,
                            onCompleted: (submitedCode) {
                              BlocProvider.of<PhoneAuthCubit>(context)
                                  .submitOTP(submitedCode);
                              if (state is PhoneAuthVerified) {
                                BlocProvider.of<CountDownTimerCubit>(context)
                                    .timer!
                                    .cancel();
                              }
                            },
                          ),
                        ),
                      );
              },
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 10, bottom: 40, left: 10, right: 10),
              child: DottedLine(
                dashColor: kPinCodeTextFieldColor,
                dashGapLength: 4,
                dashLength: 8,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 0, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<CountDownTimerCubit, CountDownTimerState>(
                    builder: (context, state) {
                      if (state is CountDownTimerProgress) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width * .7,
                          child: Text(
                            "${(locale.translate('code_will_be_sent_after')!)} ${state.elapsed} ${(locale.translate('sec')!)}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        );
                      } else if (state is CountDownTimerInitial) {
                        if (isFirstCounter) {
                          BlocProvider.of<CountDownTimerCubit>(context)
                              .startTimer(20);
                          isFirstCounter = false;

                          return SizedBox(
                            width: MediaQuery.of(context).size.width * .7,
                            child: Text(
                              "${(locale.translate('code_will_be_sent_after')!)} ${state.elapsed} ${(locale.translate('sec')!)}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          );
                        } else {
                          return InkWell(
                              onTap: () {
                                BlocProvider.of<CountDownTimerCubit>(context)
                                    .startTimer(20);
                                BlocProvider.of<PhoneAuthCubit>(context)
                                    .verifyPhone(phoneNumber);
                              },
                              child:
                                  Text(locale.translate('resend_the_code')!));
                        }
                      } else {
                        return const SizedBox();
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
