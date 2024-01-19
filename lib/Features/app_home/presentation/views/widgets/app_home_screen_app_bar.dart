import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../auth/fire_base_token/presentation/manger/token_cubit.dart';
import '../../../../auth/login/domain/entities/login_entity.dart';
import '../../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({super.key});

  void updateToken(context) async {
    String? token = await FirebaseMessaging.instance.getToken();

    BlocProvider.of<TokenCubit>(context).getTokenData(token!);
  }

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<LoginEntity>(kEmployeeDataBox);
    box.isEmpty ? null : updateToken(context);
    // print("idEmployee ${box.get(kEmployeeDataBox)!.id}");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 35,
          ),
          Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: CustomCashedNetworkImage(
                    imageUrl: box.get(kEmployeeDataBox) != null
                        ? box.get(kEmployeeDataBox)!.image
                        : "",
                  )),
              Text(
                box.get(kEmployeeDataBox) != null
                    ? box.get(kEmployeeDataBox)!.employeeName
                    : "",
                style: TextStyle(
                    color: const Color(0xff1d1d1d),
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,
                    fontSize: 12.sp),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              // BlocProvider.of<BottomNavCubit>(context).navigationQueue.addLast(
              //     BlocProvider.of<BottomNavCubit>(context).bottomNavIndex);
              BlocProvider.of<BottomNavCubit>(context)
                  .updateBottomNavIndex(kNotificationView);
            },
            child: Image.asset(
              'assets/icons/notification_icon.png',
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
