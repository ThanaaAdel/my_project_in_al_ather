import 'package:HrmsVersions/Features/app_home/presentation/manger/finger_print_cubit.dart';
import 'package:HrmsVersions/Features/calender/presentation/manager/cubit/calender_table_cubit.dart';
import 'package:HrmsVersions/Features/calender/presentation/views/calender.dart';
import 'package:HrmsVersions/Features/messages/my_messages/presentation/manager/cubit/delete_message_cubit.dart';
import 'package:HrmsVersions/Features/messages/my_messages/presentation/manager/cubit/message_details_cubit.dart';
import 'package:HrmsVersions/Features/messages/my_messages/presentation/manager/cubit/seen_message_cubit.dart';
import 'package:HrmsVersions/Features/messages/my_messages/presentation/manager/cubit/sent_messages_cubit.dart';
import 'package:HrmsVersions/Features/messages/employees/presentation/manager/cubit/employees_cubit.dart';
import 'package:HrmsVersions/Features/messages/my_messages/presentation/views/message_details_view/message_details_view.dart';
import 'package:HrmsVersions/Features/privacy_and_policy/presentation/manager/cubit/privacy_and_policy_cubit.dart';
import 'package:HrmsVersions/Features/privacy_and_policy/presentation/privacy_and_policy_view.dart';
import 'package:HrmsVersions/core/utils/functions/setup_service_locator.dart';

import '../../../../about_app/presentation/about_app_view.dart';
import '../../../../about_app/presentation/manager/cubit/about_app_cubit.dart';
import '../../../../app_home/presentation/manger/toggle_cubit.dart';
import '../../../../change_bank_account/presentation/views/change_bank_account_view_step1.dart';
import '../../../../change_bank_account/presentation/views/change_bank_account_view_step2.dart';
import '../../../../contact_us/presentation/screens/contact_us_screen.dart';
import '../../../../edit_profile/presentation/screens/edit_profile_screen.dart';
import '../../../../employee_profile_form/presentation/screens/employee_profile_form_screen_step1.dart';
import '../../../../employee_profile_form/presentation/screens/employee_profile_form_screen_step2.dart';
import '../../../../following_request/following_request_screen.dart';
import '../../../../messages/my_messages/presentation/manager/cubit/my_messages_cubit.dart';
import '../../../../messages/my_messages/presentation/views/all_messages_view/messages_view.dart';
import '../../../../app_home/presentation/views/home_views.dart';
import '../../../../messages/send_message/presentation/manger/send_message_cubit.dart';
import '../../../../messages/send_message/presentation/send_message_view.dart';
import '../../../../notification_view/presentation/notification_view.dart';
import '../../../../payment_permission/presentation/screens/payment_permission_screen.dart';
import '../../../../order_details/presentation/views/order_details_screen.dart';
import '../../../../personal_account/personal_account_screen.dart';
import '../../../../request_dept/presentation/screens/request_dept_screen.dart';
import '../../../../request_permission/presentation/screens/request_permission_screen.dart';
import '../../../../request_vacation/presentation/cubit/request_vacation_cubit.dart';
import '../../../../status_request/status_request_screen.dart';
import '../../../../table/presentation/manager/cubit/attendance_table_cubit.dart';
import '../../../../table/presentation/screens/table_screen.dart';
import '../../../../request_vacation/presentation/screens/request_vacation_screen.dart';
import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavInitial());
  int bottomNavIndex = 4;
  bool drawerIsOpen = false;
  late String? messageId;
  List<Widget> bottomNavScreens = [
    //FIVE BOTTOM NAV ITEMS
    //0
    const PersonalAccountScreen(),

    //1
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<MyMessagesCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<SentMessagesCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<SeenMessageCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<DeleteMessageCubit>(),
        ),
      ],
      child: const MessagesView(),
    ),
    //2
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<MyMessagesCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<DeleteMessageCubit>(),
        ),
      ],
      child: const NotificationView(),
    ),
    //3
    BlocProvider(
      create: (context) => getIt<AttendanceTableCubit>(),
      child: const DataTableView(),
    ),
    //4
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<FingerPrintCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ToggleCubit>(),
        ),
      ],
      child: const HomeViews(),
    ),
    //5
    BlocProvider(
      create: (context) => RequestVacationCubit(),
      child: const RequestVacationScreen(),
    ),
    //6
    const RequestDeptScreen(),
    //7
    const RequestPermissionScreen(),
    //8
    const StatusRequest(),
    //9
    const EmployeeProfileFormScreenStep1(),

    //10
    const PaymentPermissionScreen(),
    //11
    const EmployeeProfileFormScreenStep2(),

    //12
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<RequestVacationCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<SendMessageCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<EmployeesCubit>(),
        )
      ],
      child: const SendMessageView(),
    ),
    //13
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<AttendanceTableCubit>(),
        ),
      ],
      child: const DataTableView(),
    ),
    //14

    const OrderDetailsScreen(),

    //15

    const FollowingRequestScreen(),
    //16
    const ChangeBankAccountViewStep1(),
    //17
    const ChangeBankAccountViewStep2(),

    //18
    const EditProfileScreen(),

    //19

    const ContactUsScreen(),

    //20

    const NotificationView(),

    //21

    BlocProvider(
      create: (context) => getIt<AboutAppCubit>(),
      child: const AboutAppView(),
    ),
//22
    BlocProvider(
      create: (context) => getIt<CalenderCubit>(),
      child: const CalenderView(),
    ),
    //23
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<MessageDetailsCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<EmployeesCubit>(),
        )
      ],
      child: const MessageDetailsView(),
    ),
    //24
    BlocProvider(
      create: (context) => getIt<PrivacyAndPolicyCubit>(),
      child: const PrivacyAndPolicyView(),
    )
  ];

  Widget get selectedBottomNavScreen => bottomNavScreens[bottomNavIndex];

  ListQueue<int> navigationQueue = ListQueue();

  void updateBottomNavIndex(int value) {
    emit(BottomNavInitial());
    bottomNavIndex = value;
    emit(BottomNavIsChanging());
  }

  void changeDrawerState(bool value) {
    emit(BottomNavInitial());
    drawerIsOpen = value;
    emit(DrawerState());
  }

  void getMessageId(String value) {
    emit(BottomNavInitial());
    messageId = value;
    emit(BottomNavIsChanging());
  }
}
