// ignore_for_file: depend_on_referenced_packages

import 'package:HrmsVersions/Features/app_home/presentation/manger/toggle_cubit.dart';
import 'package:HrmsVersions/Features/privacy_and_policy/data/data_sources/privacy_and_policy_remote_data_sources.dart';
import 'package:HrmsVersions/Features/privacy_and_policy/data/repositories/privacy_and_policy_repo_impl.dart';
import 'package:HrmsVersions/Features/privacy_and_policy/domain/repositories/privacy_and_policy_repo.dart';
import 'package:HrmsVersions/Features/privacy_and_policy/domain/use_cases/privacy_and_policy_use_case.dart';
import 'package:HrmsVersions/Features/privacy_and_policy/presentation/manager/cubit/privacy_and_policy_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:HrmsVersions/Features/auth/register/presentation/manager/cubit/count_down_timer_cubit.dart';
import 'package:HrmsVersions/Features/auth/register/presentation/manager/cubit/phone_auth_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Features/about_app/data/data_sources/about_app_remote_data_sources.dart';
import '../../../Features/about_app/data/repositories/about_app_repo_impl.dart';
import '../../../Features/about_app/domain/repositories/about_app_repo.dart';
import '../../../Features/about_app/domain/use_cases/about_app_use_case.dart';
import '../../../Features/about_app/presentation/manager/cubit/about_app_cubit.dart';
import '../../../Features/app_home/data/dat_source/finger_print/_remote_data_source/finger_print_remote_data_source.dart';
import '../../../Features/app_home/data/repository/finger_print_repository_implementation.dart';
import '../../../Features/app_home/domain/repository/finger_print_repo.dart';
import '../../../Features/app_home/domain/use_cases/finger_print_use_case.dart';
import '../../../Features/app_home/presentation/manger/finger_print_cubit.dart';
import '../../../Features/auth/change_password/data/data_sources/change_password_remote_data_source.dart';
import '../../../Features/auth/change_password/data/repositories/change_password_repo_impl.dart';
import '../../../Features/auth/change_password/domain/repositories/change_password_repo.dart';
import '../../../Features/auth/change_password/domain/use_cases/change_password_use_case.dart';
import '../../../Features/auth/change_password/presentation/manager/cubit/change_password_cubit.dart';
import '../../../Features/auth/fire_base_token/data/dat_source/token_data_source.dart';
import '../../../Features/auth/fire_base_token/data/repository/token_repository_implementation.dart';
import '../../../Features/auth/fire_base_token/domain/repository/token_repo.dart';
import '../../../Features/auth/fire_base_token/domain/use_cases/token_use_case.dart';
import '../../../Features/auth/fire_base_token/presentation/manger/token_cubit.dart';
import '../../../Features/auth/register/data/data_sources/register_remote_data_source/register_remote_data_source.dart';
import '../../../Features/auth/register/data/repository/register_repo_impl.dart';
import '../../../Features/auth/register/domain/repositories/register_repo.dart';
import '../../../Features/auth/register/domain/use_cases/register_use_case.dart';
import '../../../Features/auth/register/presentation/manager/cubit/register_cubit.dart';
import '../../../Features/calender/data/repository/table_repo_implementation.dart';
import '../../../Features/calender/domain/repositories/calender_repository.dart';
import '../../../Features/calender/domain/use_case/calender_use_case.dart';
import '../../../Features/messages/employees/data/data_sources/employees_data_source.dart';
import '../../../Features/messages/employees/data/repositories/employees_rop_impl.dart';
import '../../../Features/messages/my_messages/data/data_sources/remote_data_source/all_messages_remote_data_source.dart';
import '../../../Features/messages/my_messages/data/data_sources/remote_data_source/delete_messages_remote_data_Source.dart';
import '../../../Features/messages/my_messages/data/data_sources/remote_data_source/message_details_remote_data_source.dart';
import '../../../Features/messages/my_messages/data/data_sources/remote_data_source/seen_message_remote_data_source.dart';
import '../../../Features/messages/my_messages/data/data_sources/remote_data_source/sent_messages_remote_data_source.dart';
import '../../../Features/messages/employees/domain/repositories/employees_repo.dart';
import '../../../Features/messages/employees/domain/use_cases/employees_use_case.dart';
import '../../../Features/messages/employees/presentation/manager/cubit/employees_cubit.dart';
import '../../../Features/messages/my_messages/data/repositories/messages_repo_impl.dart';
import '../../../Features/messages/my_messages/domain/repositories/my_messages_repo.dart';
import '../../../Features/messages/my_messages/domain/use_cases/my_messages_use_case.dart';
import '../../../Features/messages/my_messages/presentation/manager/cubit/delete_message_cubit.dart';
import '../../../Features/messages/my_messages/presentation/manager/cubit/message_details_cubit.dart';
import '../../../Features/messages/my_messages/presentation/manager/cubit/my_messages_cubit.dart';
import '../../../Features/messages/my_messages/presentation/manager/cubit/seen_message_cubit.dart';
import '../../../Features/messages/my_messages/presentation/manager/cubit/sent_messages_cubit.dart';
import '../../../Features/messages/send_message/data/data_sources/send_message_remote_data_source.dart';
import '../../../Features/messages/send_message/data/repositories/send_message_repo_imp.dart';
import '../../../Features/messages/send_message/domain/repositories/send_message_repo.dart';
import '../../../Features/messages/send_message/domain/use_cases/send_message_use_case.dart';
import '../../../Features/messages/send_message/presentation/manger/send_message_cubit.dart';
import '../../../Features/splash/data/datasources/language_local_data_source.dart';
import '../../../Features/splash/data/datasources/language_local_data_source_impl.dart';
import '../../../Features/splash/data/repositories/language_repository_impl.dart';
import '../../../Features/splash/domain/repositories/language_repository.dart';
import '../../../Features/splash/domain/use_case/change_locale_use_case.dart';
import '../../../Features/splash/domain/use_case/get_saved_lang_use_case.dart';
import '../../../Features/splash/presentation/manger/locale_cubit/locale_cubit.dart';
import '../../../Features/auth/login/data/dat_source/login_remote_data_source/login_remote_data_source.dart';
import '../../../Features/auth/login/data/repository/login_repository_implementation.dart';
import '../../../Features/auth/login/domain/repository/login_repo.dart';
import '../../../Features/auth/login/domain/use_cases/login_use_case.dart';
import '../../../Features/auth/login/presentation/manger/login_cubit.dart';
import '../../../Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import '../../../Features/calender/data/data_sources/calender_remote_data_source/calender_remote_data_source.dart';
import '../../../Features/calender/presentation/manager/cubit/calender_table_cubit.dart';
import '../../../Features/request_vacation/presentation/cubit/request_vacation_cubit.dart';
import '../../../Features/table/data/data_sources/table_remote_data_source/table_remote_data_source.dart';
import '../../../Features/table/data/repository/table_repo_implementation.dart';
import '../../../Features/table/domain/repositories/table_repository.dart';
import '../../../Features/table/domain/use_case/table_use_case.dart';
import '../../../Features/table/presentation/manager/cubit/attendance_table_cubit.dart';
import '../../../Features/table/presentation/manager/cubit/pick_date_cubit.dart';
import '../network/network_request.dart';

final getIt = GetIt.instance;
Future<void> init() async {
  getIt.registerFactory<LocaleCubit>(() => LocaleCubit(
      changeLocaleUseCase: getIt.call(), getSavedLangUseCase: getIt.call()));

  getIt.registerLazySingleton<GetSavedLangUseCase>(
      () => GetSavedLangUseCase(languageRepository: getIt.call()));
  getIt.registerLazySingleton<ChangeLocaleUseCase>(
      () => ChangeLocaleUseCase(languageRepository: getIt.call()));

  getIt.registerLazySingleton<LanguageRepository>(
      () => LanguageRepositoryImpl(languageLocalDataSource: getIt.call()));

  ///datePicker
  getIt.registerFactory<PickDateCubit>(() => PickDateCubit());

  ///  Login
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt.call()));

  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt.call()));

  getIt.registerLazySingleton<LoginRepository>(
      () => LoginRepoImpl(getIt.call()));

  getIt.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl());

  getIt.registerLazySingleton<NetworkRequest>(() => NetworkRequestImp());

///////////////////
  ///
  ///
  ///  token
  getIt.registerFactory<TokenCubit>(() => TokenCubit(getIt.call()));

  getIt.registerLazySingleton<TokenUseCase>(() => TokenUseCase(getIt.call()));

  getIt.registerLazySingleton<TokenRepository>(
      () => TokenRepoImpl(getIt.call()));

  getIt.registerLazySingleton<TokenRemoteDataSource>(
      () => TokenRemoteDataSourceImpl());

///////////////////
  ///
  /// FingerPrint
  getIt.registerFactory<FingerPrintCubit>(() => FingerPrintCubit(getIt.call()));

  getIt.registerLazySingleton<FingerPrintUseCase>(
      () => FingerPrintUseCase(getIt.call()));

  getIt.registerLazySingleton<FingerPrintRepository>(
      () => FingerPrintRepoImpl(getIt.call()));

  getIt.registerLazySingleton<FingerPrintRemoteDataSource>(
      () => FingerPrintRemoteDataSourceImpl());
///////////////////
// Table Data
  getIt.registerFactory<AttendanceTableCubit>(
      () => AttendanceTableCubit(getIt.call()));

  getIt.registerLazySingleton<TableUseCase>(() => TableUseCase(getIt.call()));

  getIt.registerLazySingleton<TableRepository>(
      () => TableRepositoryImp(getIt.call()));

  getIt.registerLazySingleton<TableRemoteDataSource>(
      () => TableRemoteDataSourceImpl());

  // Calender Data
  getIt.registerFactory<CalenderCubit>(() => CalenderCubit(getIt.call()));

  getIt.registerLazySingleton<CalenderUseCase>(
      () => CalenderUseCase(getIt.call()));

  getIt.registerLazySingleton<CalenderRepository>(
      () => CalenderRepositoryImp(getIt.call()));

  getIt.registerLazySingleton<CalenderRemoteDataSource>(
      () => CalenderRemoteDataSourceImpl());

  ///// New Messege

  getIt.registerFactory<SendMessageCubit>(() => SendMessageCubit(getIt.call()));

  getIt.registerLazySingleton<SendMessageUseCase>(
      () => SendMessageUseCase(getIt.call()));

  getIt.registerLazySingleton<SendMessageRepo>(
      () => SendMessageRepoImpl(getIt.call()));

  getIt.registerLazySingleton<SendMessageRemoteDataSource>(
      () => SendMessageRemoteDataSourceImpl());

  /////
  ///ALLMESSAGES
  getIt.registerFactory<MyMessagesCubit>(() => MyMessagesCubit(getIt.call()));
  getIt.registerFactory<SentMessagesCubit>(
      () => SentMessagesCubit(getIt.call()));
  getIt.registerFactory<MessageDetailsCubit>(
      () => MessageDetailsCubit(getIt.call()));
  getIt.registerFactory<SeenMessageCubit>(() => SeenMessageCubit(getIt.call()));
  getIt.registerFactory<DeleteMessageCubit>(
      () => DeleteMessageCubit(getIt.call()));
  getIt.registerLazySingleton<MyMessagesUseCase>(
      () => MyMessagesUseCase(getIt.call()));

  getIt.registerLazySingleton<MessagesRepo>(() => MessagesRepositoryImp(
        getIt.call(),
        getIt.call(),
        getIt.call(),
        getIt.call(),
        getIt.call(),
      ));
////AllMessages
  getIt.registerLazySingleton<AllMessagesRemoteDataSource>(
      () => AllMessagesRemoteDataSourceImpl());
  ////sentMessages
//seenMessage
  getIt.registerLazySingleton<SeenMessageRemoteDataSource>(
      () => SeenMessageRemoteDataSourceImpl());

  ///
  getIt.registerLazySingleton<SentMessagesRemoteDataSource>(
      () => SentMessagesRemoteDataSourceImpl());
  ////MessageDetails
  getIt.registerLazySingleton<MessageDetailsRemoteDataSource>(
      () => MessageDetailsRemoteDataSourceImpl());
  ////DeleteMessage
  getIt.registerLazySingleton<DeleteMessageRemoteDataSource>(
      () => DeleteMessageRemoteDataSourceImpl());
  /////
  () => MessagesRepositoryImp(
        getIt.call(),
        (getIt.call()),
        (getIt.call()),
        getIt.call(),
        getIt.call(),
      );

  ////
  ///
  ///AllEmployees
  getIt.registerFactory<EmployeesCubit>(() => EmployeesCubit(getIt.call()));

  getIt.registerLazySingleton<EmployeesUseCase>(
      () => EmployeesUseCase(getIt.call()));

  getIt.registerLazySingleton<EmployeesRepo>(
      () => EmployeesRepositoryImp(getIt.call()));

  getIt.registerLazySingleton<EmployeesRemoteDataSource>(
      () => EmployeesRemoteDataSourceImpl());

  ////
  ///OTP PHONE AUTH
  getIt.registerFactory<PhoneAuthCubit>(() => PhoneAuthCubit());
  ////Count down Timer
  getIt.registerFactory<CountDownTimerCubit>(() => CountDownTimerCubit());

  ///REGISTER
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt.call()));

  getIt.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(getIt.call()));

  getIt.registerLazySingleton<RegisterRepository>(
      () => RegisterRepoImpl(getIt.call()));

  getIt.registerLazySingleton<RegisterRemoteDataSource>(
      () => RegisterRemoteDataSourceImpl());
////////////
  ///CHANGEPASSWORD
  getIt.registerFactory<ChangePasswordCubit>(
      () => ChangePasswordCubit(getIt.call()));

  getIt.registerLazySingleton<ChangePasswordUseCase>(
      () => ChangePasswordUseCase(getIt.call()));

  getIt.registerLazySingleton<ChangePasswordRepository>(
      () => ChangePasswordRepoImpl(getIt.call()));

  getIt.registerLazySingleton<ChangePasswordRemoteDataSource>(
      () => ChangePasswordRemoteDataSourceImpl());
//////////////
  getIt.registerLazySingleton<LanguageLocalDataSource>(
    () => LanguageLocalDataSourceImpl(sharedPreferences: getIt()),
  );
  getIt.registerFactory<BottomNavCubit>(() => BottomNavCubit());
  getIt.registerFactory<RequestVacationCubit>(() => RequestVacationCubit());
  getIt.registerFactory<ToggleCubit>(() => ToggleCubit(0));

//////////
  ///About App
  getIt.registerFactory<AboutAppCubit>(() => AboutAppCubit(getIt.call()));

  getIt.registerLazySingleton<AboutAppUseCase>(
      () => AboutAppUseCase(getIt.call()));

  getIt.registerLazySingleton<AboutAppRepo>(
      () => AboutAppRepositoryImpl(getIt.call()));

  getIt.registerLazySingleton<AboutAppRemoteDataSource>(
      () => AboutAppRemoteDataSourceImpl());

  ///
  ///Privacy And Policy
  getIt.registerFactory<PrivacyAndPolicyCubit>(
      () => PrivacyAndPolicyCubit(getIt.call()));

  getIt.registerLazySingleton<PrivacyAndPolicyUseCase>(
      () => PrivacyAndPolicyUseCase(getIt.call()));

  getIt.registerLazySingleton<PrivacyAndPolicyRepo>(
      () => PrivacyAndPolicyImpl(getIt.call()));

  getIt.registerLazySingleton<PrivacyAndPolicyRemoteDataSource>(
      () => PrivacyAndPolicyRemoteDataSourceImpl());

  ///
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
}
