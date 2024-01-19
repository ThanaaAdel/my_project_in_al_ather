import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/media_query_sizes.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'widgets/tap_bar_view_body.dart';

class StatusRequest extends StatelessWidget {
  const StatusRequest({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: screenSize * .1, child: const CustomAppBar()),
      backgroundColor: Colors.white,
      body: FadeIn(child: const TapBarViewBody()),
      floatingActionButton: MaterialButton(
        onPressed: () {
          // BlocProvider.of<BottomNavCubit>(context)
          //     .navigationQueue
          //     .addLast(BlocProvider.of<BottomNavCubit>(context).bottomNavIndex);
          BlocProvider.of<BottomNavCubit>(context)
              .updateBottomNavIndex(kRequestVacationScreen);
        },
        color: kPrimaryColor,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 27,
        ),
      ),
    );
  }
}
