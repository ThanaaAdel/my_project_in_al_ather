import 'package:animate_do/animate_do.dart';
import 'widgets/change_bank_account_view_step2_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_app_bar.dart';

import '../../../request_vacation/presentation/cubit/request_vacation_cubit.dart';

class ChangeBankAccountViewStep2 extends StatelessWidget {
  const ChangeBankAccountViewStep2({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BlocProvider<RequestVacationCubit>(
      create: (context) => RequestVacationCubit(),
      child: BlocConsumer<RequestVacationCubit, RequestVacationState>(
        builder: (context, state) {
          return FadeInUp(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: PreferredSize(
                  preferredSize: screenSize * .07, child: const CustomAppBar()),
              body: ChangeBankAccountViewStep2Body(screenSize: screenSize),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
