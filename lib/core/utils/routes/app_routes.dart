import 'package:HrmsVersions/Features/auth/change_password/presentation/manager/cubit/change_password_cubit.dart';
import 'package:HrmsVersions/Features/auth/register/presentation/manager/cubit/count_down_timer_cubit.dart';
import 'package:HrmsVersions/Features/auth/register/presentation/manager/cubit/phone_auth_cubit.dart';
import 'package:HrmsVersions/Features/auth/register/presentation/manager/cubit/register_cubit.dart';
import 'package:HrmsVersions/Features/auth/change_password/presentation/views/change_password_view.dart';
import 'package:HrmsVersions/core/utils/functions/setup_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Features/language/presentation/screens/language_screen.dart';
import '../../../Features/messages/my_messages/presentation/views/all_messages_view/messages_view.dart';
import '../../../Features/messages/send_message/presentation/send_message_view.dart';
import '../../../Features/splash/presentation/views/connection_page.dart';
import '../../../Features/splash/presentation/views/splash_view.dart';
import '../../../Features/app_home/presentation/views/home_views.dart';
import '../../../Features/auth/login/presentation/manger/login_cubit.dart';
import '../../../Features/auth/login/presentation/views/login_view.dart';
import '../../../Features/auth/register/presentation/views/register_view.dart';
import '../../../Features/auth/verification/presentation/views/verification_view.dart';
import '../../../Features/bottom_nav/presentation/views/bottom_nav.dart';
import '../../../Features/change_bank_account/presentation/views/change_bank_account_view_step2.dart';
import '../../../Features/contact_us/presentation/screens/contact_us_screen.dart';
import '../../../Features/edit_profile/presentation/screens/edit_profile_screen.dart';
import '../../../Features/employee_profile_form/presentation/screens/employee_profile_form_screen_step2.dart';
import '../../../Features/following_request/following_request_screen.dart';
import '../../../Features/introduction/presentation/intro_screen.dart';
import '../../../Features/my_orders/presentation/views/my_orders_view.dart';
import '../../../Features/notification_view/presentation/notification_view.dart';
import '../../../Features/personal_account/personal_account_screen.dart';
import '../../../Features/request_dept/presentation/screens/request_dept_screen.dart';
import '../../../Features/request_permission/presentation/screens/request_permission_screen.dart';
import '../../../Features/request_vacation/presentation/screens/request_vacation_screen.dart';
import '../../../Features/status_request/status_request_screen.dart';
import '../../../Features/status_request/widgets/accepted_tap.dart';
import '../../../Features/status_request/widgets/current_tap.dart';
import '../../../Features/status_request/widgets/rejected_tap.dart';
import '../../../Features/table/presentation/screens/table_screen.dart';
import '../constants.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    // final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());

      case kBottomNavRoute:
        return MaterialPageRoute(builder: (_) => const BottomNav());
      case kHomeScreen:
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      // case kBookDetailsScreen:
      //   return MaterialPageRoute(builder: (_) => const BookDetailsView());
      case kIntroScreen:
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      case kLanguageScreenRoute:
        return MaterialPageRoute(builder: (_) => const LanguageScreen());
      case kRegisterScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (_) => getIt<RegisterCubit>(),
            ),
            BlocProvider(
              create: (_) => getIt<PhoneAuthCubit>(),
            ),
          ], child: const RegisterView()),
        );
      case kVerificationScreen:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (_) => getIt<PhoneAuthCubit>(),
                    ),
                    BlocProvider(
                      create: (_) => getIt<LoginCubit>(),
                    ),
                    BlocProvider(
                      create: (_) => getIt<CountDownTimerCubit>(),
                    ),
                  ],
                  child: const VerificationView(),
                ));
      case kTapBarScreen:
        return MaterialPageRoute(builder: (_) => const StatusRequest());
      case kCurrentTapScreen:
        return MaterialPageRoute(builder: (_) => const CurrentTap());
      case kUpComingTapScreen:
        return MaterialPageRoute(builder: (_) => const AcceptedTap());
      case kRejectedTapScreen:
        return MaterialPageRoute(builder: (_) => const RejectedTap());
      case kNotificationScreenRoute:
        return MaterialPageRoute(builder: (_) => const NotificationView());

      case kLoginScreenRoute:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<PhoneAuthCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<LoginCubit>(),
              ),
            ],
            child: const LoginView(),
          ),
        );
      // case kAttendanceScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const HomeScreen(),
      //   );
      case kMyOrdersScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const MyOrdersView(),
        );
      case kContactUsScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const ContactUsScreen(),
        );
      case kEditProfileScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const EditProfileScreen(),
        );
      case kVacationRequestScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const RequestVacationScreen(),
        );
      case kPermissionRequestScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const RequestPermissionScreen(),
        );
      case kDataTableScreen:
        return MaterialPageRoute(
          builder: (_) => const DataTableView(),
        );
      case kPersonalAccountScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const PersonalAccountScreen(),
        );
      case kRequestStatusScreen:
        return MaterialPageRoute(
          builder: (_) => const StatusRequest(),
        );

      case kDeptRequestScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const RequestDeptScreen(),
        );

      case kAppHomeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeViews(),
        );

      case kFollowingRequestScreen:
        return MaterialPageRoute(
          builder: (_) => const FollowingRequestScreen(),
        );

      case kMessagesScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const MessagesView(),
        );
      case kNewMessageScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const SendMessageView(),
        );
      case kEmployeeProfileFormScreenStep2Route:
        return MaterialPageRoute(
          builder: (_) => const EmployeeProfileFormScreenStep2(),
        );
      case kChangeBankAccountScreenStep2Route:
        return MaterialPageRoute(
          builder: (_) => const ChangeBankAccountViewStep2(),
        );
      case kChangePasswordScreenRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<ChangePasswordCubit>(),
            child: const ChangePasswordView(),
          ),
        );
      default:
        return null;
    }
  }
}
