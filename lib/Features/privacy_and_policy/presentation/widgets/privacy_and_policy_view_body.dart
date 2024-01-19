import 'package:HrmsVersions/Features/privacy_and_policy/presentation/manager/cubit/privacy_and_policy_cubit.dart';
import 'package:HrmsVersions/core/widgets/custom_error_widget.dart';
import 'package:HrmsVersions/core/widgets/custom_loading_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/locale/app_localizations.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/media_query_sizes.dart';

class PrivacyAndPolicyViewBody extends StatelessWidget {
  const PrivacyAndPolicyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PrivacyAndPolicyCubit>(context).getPrivacyAndPolicyData();
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    SizeConfig().init(context);
    return Column(
      children: [
        const CustomAppBar(
          icon: Icon(Icons.arrow_forward),
        ),
        BlocBuilder<PrivacyAndPolicyCubit, PrivacyAndPolicyState>(
          builder: (context, state) {
            if (state is PrivacyAndPolicySuccessful) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 13.h, bottom: SizeConfig.screenHeight! * 0.05),
                        child: Text(locale.translate("privacy_policy")!,
                            textAlign: TextAlign.right),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          state.data!.responseData,
                          textAlign: TextAlign.right,
                        )
                      ],
                    ),
                  )
                ],
              );
            } else if (state is PrivacyAndPolicyLoading) {
              return const CustomLoadingWidget();
            } else {
              return const CustomErrorWidget();
            }
          },
        )
      ],
    );
  }
}
